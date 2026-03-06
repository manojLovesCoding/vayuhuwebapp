<?php
require_once __DIR__ . '/config/env.php';
require_once __DIR__ . '/config/cors.php';
require_once 'db.php';

header("Content-Type: application/json; charset=UTF-8");

// Force UTC or your local timezone if needed
date_default_timezone_set('Asia/Kolkata');

$input = json_decode(file_get_contents("php://input"), true);

$token = $input["token"] ?? "";
$new_password = $input["password"] ?? "";

if (empty($token) || empty($new_password)) {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "Required fields are missing."]);
    exit;
}

// 1. Check if token exists and is not expired
// We use a safe comparison to ensure the link hasn't expired.
$sql = "SELECT email FROM password_resets WHERE token = ? AND expires_at > NOW()";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $token);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "Invalid or expired reset link."]);
    exit;
}

$row = $result->fetch_assoc();
$email = $row['email'];

// 2. Hash new password
$hashed_password = password_hash($new_password, PASSWORD_BCRYPT);

// 3. Update User table
$update_user = $conn->prepare("UPDATE users SET password = ? WHERE email = ?");
$update_user->bind_param("ss", $hashed_password, $email);

if ($update_user->execute()) {
    // 4. Clean up token
    $delete_token = $conn->prepare("DELETE FROM password_resets WHERE email = ?");
    $delete_token->bind_param("s", $email);
    $delete_token->execute();

    echo json_encode(["status" => "success", "message" => "Password updated successfully. You can now login."]);
} else {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Database update failed."]);
}

$stmt->close();
$conn->close();
