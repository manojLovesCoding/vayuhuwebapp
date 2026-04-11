<?php
// ------------------------------------
// Load Environment & Centralized CORS
// ------------------------------------
require_once __DIR__ . '/config/env.php';
require_once __DIR__ . '/config/cors.php';

// ------------------------------------
// Enable Error Reporting (DEBUG MODE)
// ------------------------------------
error_reporting(E_ALL);
ini_set('display_errors', 1);

// ------------------------------------
// Include Database Connection
// ------------------------------------
require_once 'db.php';
if (!$conn) {
    die(json_encode([
        "success" => false,
        "message" => "Database connection failed"
    ]));
}

// ------------------------------------
// JWT Verification
// ------------------------------------
require_once __DIR__ . '/vendor/autoload.php';
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

$secret_key = $_ENV['JWT_SECRET'] ?? die("JWT_SECRET not set");

// ------------------------------------
// Get JSON Input
// ------------------------------------
$rawInput = file_get_contents("php://input");
$data = json_decode($rawInput, true);

error_log("RAW INPUT: " . $rawInput);
error_log("DECODED DATA: " . print_r($data, true));

if (!$data) {
    die(json_encode([
        "success" => false,
        "message" => "Invalid request data"
    ]));
}

// ------------------------------------
// JWT from Cookie
// ------------------------------------
$token = $_COOKIE['auth_token'] ?? null;

if (!$token) {
    http_response_code(401);
    die(json_encode([
        "success" => false,
        "message" => "Authorization token missing"
    ]));
}

try {
    $decoded = JWT::decode($token, new Key($secret_key, 'HS256'));
    $decoded_user_id = $decoded->data->id;
} catch (Exception $e) {
    http_response_code(401);
    die(json_encode([
        "success" => false,
        "message" => "Invalid or expired token"
    ]));
}

// ------------------------------------
// Validate User
// ------------------------------------
$user_id = $data['user_id'] ?? null;

if (!$user_id) {
    die(json_encode([
        "success" => false,
        "message" => "User ID required"
    ]));
}

if ((int)$decoded_user_id !== (int)$user_id) {
    http_response_code(403);
    die(json_encode([
        "success" => false,
        "message" => "Unauthorized access"
    ]));
}

// ------------------------------------
// Fetch Company Profile
// ------------------------------------
$company_id = null;
$company_name = null;

$getCompany = $conn->prepare("SELECT id, company_name FROM company_profile WHERE user_id = ?");
if (!$getCompany) {
    die("Prepare failed (company fetch): " . $conn->error);
}

$getCompany->bind_param("i", $user_id);
$getCompany->execute();
$getCompany->bind_result($company_id, $company_name);
$getCompany->fetch();
$getCompany->close();

if (!$company_id) {
    die(json_encode([
        "success" => false,
        "message" => "No company profile found"
    ]));
}

// ------------------------------------
// Collect Data
// ------------------------------------
$booking_id    = $data['booking_id'] ?? "";
$name          = trim($data['name'] ?? "");
$contact       = trim($data['contact'] ?? "");
$email         = trim($data['email'] ?? "");
$visitingDate  = trim($data['visitingDate'] ?? "");
$checkInTime   = trim($data['checkInTime'] ?? "");
$checkOutTime  = trim($data['checkOutTime'] ?? "");
$reason        = trim($data['reason'] ?? "");
$attendees     = (int)($data['attendees'] ?? 1);
$payment_id    = trim($data['payment_id'] ?? "");
$amount_paid   = (float)($data['amount_paid'] ?? 0);

// ------------------------------------
// Validation
// ------------------------------------
if (empty($name) || empty($contact)) {
    die(json_encode([
        "success" => false,
        "message" => "Name and Contact required"
    ]));
}

if (empty($payment_id)) {
    die(json_encode([
        "success" => false,
        "message" => "Payment ID missing"
    ]));
}

// ------------------------------------
// Insert Visitor
// ------------------------------------
$sql = "INSERT INTO visitors (
    user_id, company_id, booking_id, name, contact_no, email, company_name, 
    visiting_date, check_in_time, check_out_time, reason, attendees, 
    payment_id, amount_paid, added_on
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";

$stmt = $conn->prepare($sql);

if (!$stmt) {
    die("Prepare failed: " . $conn->error);
}

// ✅ CORRECT TYPES (IMPORTANT FIX)
$stmt->bind_param(
    "iisssssssssisd",
    $user_id,
    $company_id,
    $booking_id,   // string (varchar)
    $name,
    $contact,
    $email,
    $company_name,
    $visitingDate,
    $checkInTime,
    $checkOutTime,
    $reason,
    $attendees,    // int
    $payment_id,
    $amount_paid   // decimal → double
);

// ------------------------------------
// Execute
// ------------------------------------
if (!$stmt->execute()) {
    die(json_encode([
        "success" => false,
        "message" => "Execute failed: " . $stmt->error
    ]));
}

// ------------------------------------
// Success Response
// ------------------------------------
echo json_encode([
    "success" => true,
    "message" => "Visitor added successfully",
    "visitorId" => $stmt->insert_id
]);

$stmt->close();
$conn->close();
?>