<?php
// ------------------------------------
// Load Environment & Centralized CORS
// ------------------------------------
require_once __DIR__ . '/config/env.php';   // Loads $_ENV['JWT_SECRET']
require_once __DIR__ . '/config/cors.php';  // Handles CORS and OPTIONS preflight

// ------------------------------------
// Database Connection
// ------------------------------------
include "db.php";

if (!$conn) {
    header('Content-Type: application/json');
    echo json_encode(["success" => false, "message" => "Database connection failed"]);
    exit;
}

// ------------------------------------
// JWT Library & Setup
// ------------------------------------
require_once __DIR__ . '/vendor/autoload.php';
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

$secret_key = $_ENV['JWT_SECRET'] ?? null;
if (!$secret_key) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server configuration error: JWT_SECRET missing"]);
    exit;
}

// ------------------------------------
// 1. Authenticate Admin (JWT via Cookie)
// ------------------------------------
try {
    $token = $_COOKIE['auth_token'] ?? null;
    if (!$token) {
        throw new Exception("Unauthorized: No token provided.");
    }

    // Decode and verify the token
    $decoded = JWT::decode($token, new Key($secret_key, 'HS256'));
    // Admin verified, proceed...
} catch (Exception $e) {
    http_response_code(401);
    echo json_encode(["success" => false, "message" => $e->getMessage()]);
    exit;
}

// ------------------------------------
// 2. Handle JSON Input
// ------------------------------------
$data = json_decode(file_get_contents("php://input"), true);

if (!$data) {
    echo json_encode(["success" => false, "message" => "Invalid JSON input"]);
    exit;
}

// Extract fields
$user_id       = $data['user_id'] ?? null;       // The ID of the parent user
$employee_name = $data['employee_name'] ?? '';
$designation   = $data['designation'] ?? '';
$email         = $data['email'] ?? '';
$phone         = $data['phone'] ?? '';

// ------------------------------------
// 3. Validation
// ------------------------------------
if (empty($user_id) || empty($employee_name)) {
    echo json_encode(["success" => false, "message" => "User ID and Employee Name are required."]);
    exit;
}

// ------------------------------------
// 4. Insert into Database
// ------------------------------------
try {
    // Prepare the SQL to link the employee to the user
    $sql = "INSERT INTO employees (user_id, employee_name, designation, email, phone) 
            VALUES (?, ?, ?, ?, ?)";
    
    $stmt = $conn->prepare($sql);
    
    if (!$stmt) {
        throw new Exception("Prepare failed: " . $conn->error);
    }

    // Bind parameters: i = integer, s = string
    $stmt->bind_param("issss", $user_id, $employee_name, $designation, $email, $phone);

    if ($stmt->execute()) {
        echo json_encode([
            "success" => true, 
            "message" => "Employee added successfully!",
            "employee_id" => $stmt->insert_id
        ]);
    } else {
        throw new Exception("Execution failed: " . $stmt->error);
    }

    $stmt->close();
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => $e->getMessage()]);
}

$conn->close();
?>