<?php
require_once __DIR__ . '/config/env.php';
require_once __DIR__ . '/config/cors.php';
include "db.php";

$user_id = $_GET['user_id'] ?? null;

if (!$user_id) {
    echo json_encode(["success" => false, "message" => "User ID required"]);
    exit;
}

$sql = "SELECT * FROM employees WHERE user_id = ? ORDER BY created_at DESC";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$employees = [];
while ($row = $result->fetch_assoc()) {
    $employees[] = $row;
}

echo json_encode(["success" => true, "employees" => $employees]);
?>