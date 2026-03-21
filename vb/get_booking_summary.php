<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

// ------------------------------------
// ✅ Set Indian Standard Time
// ------------------------------------
date_default_timezone_set('Asia/Kolkata');

// ------------------------------------
// Load Environment & Centralized CORS
// ------------------------------------
require_once __DIR__ . '/config/env.php';
require_once __DIR__ . '/config/cors.php';

// ------------------------------------
// JWT Secret
// ------------------------------------
$secret_key = $_ENV['JWT_SECRET'] ?? die("JWT_SECRET not set in .env");

// ------------------------------------
// Load JWT Library
// ------------------------------------
require_once __DIR__ . '/vendor/autoload.php';

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

try {
    include "db.php";

    // ------------------------------------
    // JWT VERIFICATION from HttpOnly cookie
    // ------------------------------------
    if (!isset($_COOKIE['auth_token'])) {
        http_response_code(401);
        echo json_encode([
            "success" => false,
            "message" => "Authentication required."
        ]);
        exit;
    }

    $token = $_COOKIE['auth_token'];

    try {
        $decoded = JWT::decode($token, new Key($secret_key, 'HS256'));
        $decoded_user_id = $decoded->data->id;
    } catch (Exception $e) {
        http_response_code(401);
        throw new Exception("Invalid or expired token.");
    }

    // ------------------------------------
    // Read request body
    // ------------------------------------
    $raw = file_get_contents("php://input");
    $data = json_decode($raw, true);

    if (json_last_error() !== JSON_ERROR_NONE) {
        throw new Exception("Invalid JSON payload.");
    }

    $user_id = (int)($data['user_id'] ?? 0);
    if ($user_id <= 0) {
        throw new Exception("Invalid user_id.");
    }

    // ------------------------------------
    // SECURITY CHECK
    // ------------------------------------
    if ($decoded_user_id !== $user_id) {
        http_response_code(403);
        echo json_encode([
            "success" => false,
            "message" => "Unauthorized access."
        ]);
        exit;
    }

    // ------------------------------------
    // Fetch bookings
    // ------------------------------------
    $stmt = $conn->prepare("
        SELECT 
            wb.booking_id,
            wb.space_id,
            s.space_code,
            wb.seat_codes, 
            wb.workspace_title,
            wb.plan_type,
            wb.start_date,
            wb.end_date,
            wb.start_time,
            wb.end_time,
            wb.total_days,
            wb.total_hours,
            wb.num_attendees,
            wb.price_per_unit,
            wb.base_amount,
            wb.gst_amount,
            wb.discount_amount,
            wb.final_amount,
            wb.status,
            wb.created_at
        FROM workspace_bookings wb
        JOIN spaces s ON wb.space_id = s.id
        WHERE wb.user_id = ?
        ORDER BY wb.created_at DESC
    ");

    if (!$stmt) {
        throw new Exception("Database prepare() failed.");
    }

    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();

    $bookings = [];
    $today = date("Y-m-d"); // IST

    $summary = [
        "total" => 0,
        "ongoing" => 0,
        "completed" => 0,
        "upcoming" => 0
    ];

    while ($row = $result->fetch_assoc()) {

        // --- Keep raw date for logic ---
        $raw_start = $row['start_date'];
        $raw_end   = $row['end_date'];

        // --- Format time ---
        if (!empty($row['start_time'])) {
            $row['start_time'] = date("h:i A", strtotime($row['start_time']));
        }
        if (!empty($row['end_time'])) {
            $row['end_time'] = date("h:i A", strtotime($row['end_time']));
        }

        // --- Format date (UI format) ---
        $row['start_date'] = date("M d, Y", strtotime($raw_start));
        $row['end_date']   = date("M d, Y", strtotime($raw_end));

        $bookings[] = $row;
        $summary["total"]++;

        // --- Use RAW dates for logic ---
        if ($raw_start <= $today && $raw_end >= $today) {
            $summary["ongoing"]++;
        } elseif ($raw_end < $today) {
            $summary["completed"]++;
        } elseif ($raw_start > $today) {
            $summary["upcoming"]++;
        }
    }

    echo json_encode([
        "success" => true,
        "summary" => $summary,
        "bookings" => $bookings
    ]);

    $stmt->close();
    $conn->close();
} catch (Exception $e) {
    if (http_response_code() == 200) http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => $e->getMessage()
    ]);
}
