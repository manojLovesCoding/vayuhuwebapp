<?php
require('razorpay-php/Razorpay.php');
require('config.php');

require_once __DIR__ . '/config/env.php'; 
require_once __DIR__ . '/config/cors.php'; 

require_once __DIR__ . '/vendor/autoload.php';
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use Razorpay\Api\Api;

$secret_key = $_ENV['JWT_SECRET'] ?? die("JWT_SECRET not set in .env");

// ---------------- JWT CHECK ----------------
$token = $_COOKIE['auth_token'] ?? null;

if (!$token) {
    $headers = getallheaders();
    $authHeader = $headers['Authorization'] ?? $headers['authorization'] ?? null;
    if ($authHeader) {
        $token = str_replace('Bearer ', '', $authHeader);
    }
}

if (!$token) {
    http_response_code(401);
    echo json_encode(["success" => false, "message" => "Authorization missing"]);
    exit;
}

try {
    $decoded = JWT::decode($token, new Key($secret_key, 'HS256'));
} catch (Exception $e) {
    http_response_code(401);
    echo json_encode(["success" => false, "message" => "Invalid or expired token"]);
    exit;
}

// ---------------- Order Creation ----------------
$api = new Api($razorpay_config['api_key'], $razorpay_config['api_secret']);
$data = json_decode(file_get_contents("php://input"), true);
$amount = isset($data['amount']) ? (float)$data['amount'] : 0;

if ($amount <= 0) {
    echo json_encode(["success" => false, "message" => "Invalid amount"]);
    exit;
}

$amount_in_paise = (int) round($amount * 100);

$order = $api->order->create([
    'amount' => $amount_in_paise,
    'currency' => 'INR',
    'receipt' => 'order_' . time(),
]);

echo json_encode([
    "success" => true,
    "order_id" => $order['id'],
    "key" => $razorpay_config['api_key']
]);
?>