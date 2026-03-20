<?php
// ------------------------------------
// Load Environment & Centralized CORS
// ------------------------------------
require_once __DIR__ . '/config/env.php';
require_once __DIR__ . '/config/cors.php';

// ------------------------------------
// Database connection
// ------------------------------------
include "db.php";
if (!$conn) {
    echo json_encode(["success" => false, "message" => "Database connection failed"]);
    exit;
}

// ------------------------------------
// JWT
// ------------------------------------
require_once __DIR__ . '/vendor/autoload.php';

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

$secret_key = $_ENV['JWT_SECRET'] ?? die("JWT_SECRET not set in .env");

// ------------------------------------
// JWT Verification
// ------------------------------------
if (!isset($_COOKIE['auth_token'])) {
    http_response_code(401);
    echo json_encode(["success" => false, "message" => "Authentication token missing"]);
    exit;
}

$token = $_COOKIE['auth_token'];

try {
    $decoded = JWT::decode($token, new Key($secret_key, 'HS256'));
    $decoded_user_id = $decoded->data->id;
} catch (Exception $e) {
    http_response_code(401);
    echo json_encode(["success" => false, "message" => "Invalid or expired token"]);
    exit;
}

// ------------------------------------
// Validate POST
// ------------------------------------
if (!isset($_POST['id'])) {
    echo json_encode(["success" => false, "message" => "User ID missing"]);
    exit;
}

$id = intval($_POST['id']);

// ✅ SECURITY CHECK
if ((int)$decoded_user_id !== $id) {
    http_response_code(403);
    echo json_encode(["success" => false, "message" => "Unauthorized"]);
    exit;
}

// ------------------------------------
// Get fields
// ------------------------------------
$name    = $_POST['name'] ?? '';
$phone   = $_POST['phone'] ?? '';
$email   = $_POST['email'] ?? '';
$dob     = $_POST['dob'] ?? '';
$address = $_POST['address'] ?? '';

// ------------------------------------
// VALIDATION
// ------------------------------------
if (empty($id) || empty($name) || empty($phone) || empty($email) || empty($address)) {
    echo json_encode(["success" => false, "message" => "All required fields must be filled"]);
    exit;
}

// Email format
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(["success" => false, "message" => "Invalid email format"]);
    exit;
}

// ------------------------------------
// ✅ CHECK DUPLICATE EMAIL
// ------------------------------------
$checkEmail = $conn->prepare("SELECT id FROM users WHERE email=? AND id!=?");
$checkEmail->bind_param("si", $email, $id);
$checkEmail->execute();
$result = $checkEmail->get_result();

if ($result->num_rows > 0) {
    echo json_encode(["success" => false, "message" => "Email already in use"]);
    exit;
}
$checkEmail->close();

// ------------------------------------
// Handle profile picture upload
// ------------------------------------
$profile_pic_path = null;
if (isset($_FILES['profilePic']) && $_FILES['profilePic']['error'] === UPLOAD_ERR_OK) {
    $upload_dir = __DIR__ . "/uploads/profile_pics/";
    if (!file_exists($upload_dir)) mkdir($upload_dir, 0777, true);

    $file_tmp = $_FILES['profilePic']['tmp_name'];
    $file_name = uniqid("user_") . "_" . basename($_FILES['profilePic']['name']);
    $target_path = $upload_dir . $file_name;

    if (move_uploaded_file($file_tmp, $target_path)) {
        $profile_pic_path = "uploads/profile_pics/" . $file_name;
    }
}

// ------------------------------------
// UPDATE QUERY
// ------------------------------------
if ($profile_pic_path) {
    $sql = "UPDATE users 
            SET name=?, phone=?, email=?, dob=?, address=?, profile_pic=? 
            WHERE id=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssssi", $name, $phone, $email, $dob, $address, $profile_pic_path, $id);
} else {
    $sql = "UPDATE users 
            SET name=?, phone=?, email=?, dob=?, address=? 
            WHERE id=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssssi", $name, $phone, $email, $dob, $address, $id);
}

// ------------------------------------
// EXECUTE + REFRESH JWT
// ------------------------------------
if ($stmt->execute()) {

    // ✅ Generate NEW JWT
    $issuedAt = time();
    $expire = $issuedAt + (60 * 60 * 24 * 7); // 7 days

    $payload = [
        "iat" => $issuedAt,
        "exp" => $expire,
        "data" => [
            "id" => $id,
            "email" => $email
        ]
    ];

    $new_jwt = JWT::encode($payload, $secret_key, 'HS256');

    // ✅ Set new cookie
    setcookie(
        "auth_token",
        $new_jwt,
        [
            'expires' => $expire,
            'path' => '/',
            'secure' => false,     // ⚠️ set false in localhost
            'httponly' => true,
            'samesite' => 'None'
        ]
    );

    echo json_encode([
        "success" => true,
        "message" => "Profile updated successfully",
        "token_refreshed" => true
    ]);
} else {
    echo json_encode(["success" => false, "message" => "Failed to update profile"]);
}

$stmt->close();
$conn->close();
