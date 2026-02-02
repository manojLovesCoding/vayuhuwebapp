<?php
// ------------------------------------
// Load Environment & Centralized CORS
// ------------------------------------
require_once __DIR__ . '/config/env.php';   // Loads JWT_SECRET
require_once __DIR__ . '/config/cors.php';  // Handles CORS headers

include "db.php";

// ------------------------------------
// Include JWT Library
// ------------------------------------
require_once __DIR__ . '/vendor/autoload.php';
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

// Fetch Secret Key
$secret_key = $_ENV['JWT_SECRET'] ?? die(json_encode(["success" => false, "message" => "JWT_SECRET not set"]));

header('Content-Type: application/json');

// ------------------------------------
// JWT VERIFICATION (HttpOnly Cookie)
// ------------------------------------
if (!isset($_COOKIE['auth_token'])) {
    http_response_code(401);
    echo json_encode(["success" => false, "message" => "Authentication required"]);
    exit;
}

$token = $_COOKIE['auth_token'];

try {
    // Decode the token to extract user info
    $decoded = JWT::decode($token, new Key($secret_key, 'HS256'));
    
    // The 'data' object contains the user's ID, Name, and Email
    $userData = (array)$decoded->data;

    echo json_encode([
        "success" => true,
        "user" => $userData
    ]);

} catch (Exception $e) {
    http_response_code(401);
    echo json_encode(["success" => false, "message" => "Session expired"]);
    exit;
}

$conn->close();