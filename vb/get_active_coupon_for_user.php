<?php
require_once __DIR__ . '/config/env.php';
require_once __DIR__ . '/config/cors.php';
require_once __DIR__ . '/vendor/autoload.php';
require_once "db.php";

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

$secret_key = $_ENV['JWT_SECRET'];

if (!isset($_COOKIE['auth_token'])) {
    echo json_encode(["success" => false]);
    exit;
}

try {
    $decoded = JWT::decode($_COOKIE['auth_token'], new Key($secret_key, 'HS256'));
    $userEmail = $decoded->data->email ?? null;
} catch (Exception $e) {
    echo json_encode(["success" => false]);
    exit;
}

$today = date("Y-m-d");

$sql = "
SELECT coupon_code, discount
FROM coupons
WHERE valid_from <= ?
  AND valid_to >= ?
  AND (
        user_type = 'ALL Users'
        OR (
            user_type = 'Particular User (Email)'
            AND FIND_IN_SET(?, email)
        )
      )
LIMIT 1
";

$stmt = $conn->prepare($sql);
$stmt->bind_param("sss", $today, $today, $userEmail);
$stmt->execute();
$result = $stmt->get_result();

if ($row = $result->fetch_assoc()) {
    echo json_encode([
        "success" => true,
        "coupon" => $row
    ]);
} else {
    echo json_encode(["success" => false]);
}

$stmt->close();
$conn->close();
