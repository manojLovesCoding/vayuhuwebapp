<?php
// ------------------------------------
// Load Environment & CORS
// ------------------------------------
require_once __DIR__ . '/config/env.php';
require_once __DIR__ . '/config/cors.php';

// ------------------------------------
// DB CONNECTION
// ------------------------------------
require_once 'db.php';

// ------------------------------------
// JWT
// ------------------------------------
require_once __DIR__ . '/vendor/autoload.php';

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

$secret_key = $_ENV['JWT_SECRET'] ?? die("JWT_SECRET not set in .env");

// ------------------------------------
// VERIFY JWT
// ------------------------------------
$token = $_COOKIE['auth_token'] ?? null;

if (!$token) {
    http_response_code(401);
    echo json_encode(["success" => false, "message" => "Unauthorized: No token found."]);
    exit;
}

try {
    $decoded = JWT::decode($token, new Key($secret_key, 'HS256'));
    $decoded_user_id = $decoded->data->id;
} catch (Exception $e) {
    http_response_code(401);
    echo json_encode(["success" => false, "message" => "Unauthorized: Invalid or expired token."]);
    exit;
}

// ------------------------------------
// VALIDATE INPUT
// ------------------------------------
$user_id = $_POST['user_id'] ?? null;

if (!$user_id) {
    echo json_encode(["success" => false, "message" => "User ID required"]);
    exit;
}

// SECURITY CHECK
if ((int)$decoded_user_id !== (int)$user_id) {
    http_response_code(403);
    echo json_encode(["success" => false, "message" => "Unauthorized: User ID mismatch."]);
    exit;
}

// ------------------------------------
// GET FIELDS
// ------------------------------------
$companyName = trim($_POST['companyName'] ?? "");
$gstNo       = trim($_POST['gstNo'] ?? "");
$contact     = trim($_POST['contact'] ?? "");
$address     = trim($_POST['address'] ?? "");
$email       = trim($_POST['email'] ?? "");

// ------------------------------------
// ✅ VALIDATION
// ------------------------------------
if (empty($companyName) || empty($gstNo) || empty($contact) || empty($email) || empty($address)) {
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
$checkEmail = $conn->prepare("SELECT id FROM company_profile WHERE email=? AND user_id!=?");
$checkEmail->bind_param("si", $email, $user_id);
$checkEmail->execute();
$result = $checkEmail->get_result();

if ($result->num_rows > 0) {
    echo json_encode(["success" => false, "message" => "Email already in use"]);
    exit;
}
$checkEmail->close();

// ------------------------------------
// HANDLE LOGO UPLOAD
// ------------------------------------
$logoPath = null;
if (isset($_FILES['logo']) && $_FILES['logo']['error'] === UPLOAD_ERR_OK) {
    $uploadDir = __DIR__ . "/uploads/company_logos/";
    if (!file_exists($uploadDir)) mkdir($uploadDir, 0777, true);

    $fileTmp  = $_FILES['logo']['tmp_name'];
    $fileName = uniqid("logo_") . "_" . basename($_FILES['logo']['name']);
    $targetPath = $uploadDir . $fileName;

    $allowedTypes = ['image/jpeg', 'image/png', 'image/jpg'];

    if (in_array($_FILES['logo']['type'], $allowedTypes) && move_uploaded_file($fileTmp, $targetPath)) {
        $logoPath = "uploads/company_logos/" . $fileName;
    }
}

// ------------------------------------
// BUILD SQL (UPDATED WITH EMAIL)
// ------------------------------------
$sql = "UPDATE company_profile 
        SET company_name=?, gst_no=?, email=?, contact=?, address=?";
$params = [$companyName, $gstNo, $email, $contact, $address];
$types = "sssss";

if ($logoPath) {
    $sql .= ", logo=?";
    $params[] = $logoPath;
    $types .= "s";
}

$sql .= " WHERE user_id=?";
$params[] = $user_id;
$types .= "i";

// ------------------------------------
// EXECUTE
// ------------------------------------
$stmt = $conn->prepare($sql);
$stmt->bind_param($types, ...$params);

if ($stmt->execute()) {

    // ------------------------------------
    // ✅ OPTIONAL: Refresh JWT (if needed)
    // ------------------------------------
    // Only needed if your JWT stores company email (usually not required)

    echo json_encode([
        "success" => true,
        "message" => "Company profile updated successfully"
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => "Database error: " . $stmt->error
    ]);
}

$stmt->close();
$conn->close();
