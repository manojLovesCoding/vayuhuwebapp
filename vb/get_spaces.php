<?php
// ------------------------------------
// Load Environment & Centralized CORS
// ------------------------------------
require_once __DIR__ . '/config/env.php';
require_once __DIR__ . '/config/cors.php';

// ------------------------------------
// Response Type
// ------------------------------------
header("Content-Type: application/json");

// ------------------------------------
// Database
// ------------------------------------
require_once "db.php";

if (!$conn) {
    echo json_encode(["success" => false, "message" => "Database connection failed"]);
    exit;
}

$baseURL = "http://localhost/vayuhuwebapp/vb";
$today = date("Y-m-d");

$sql = "SELECT 
            id,
            space_code,
            space,
            per_hour,
            per_day,
            one_week,
            two_weeks,
            three_weeks,
            per_month,
            min_duration,
            min_duration_desc,
            max_duration,
            max_duration_desc,
            image,
            status,
            created_at
        FROM spaces
        ORDER BY id DESC";

$result = $conn->query($sql);
$spaces = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {

        foreach ($row as $k => $v) {
            $row[$k] = $v ?? "";
        }

        // Image URL
        if (!empty($row["image"])) {
            $row["image_url"] = $baseURL . "/" . $row["image"];
        } else {
            $row["image_url"] = "";
        }

        $spaceId = (int)$row["id"];
        $currentSpaceCode = $row["space_code"];

        // ------------------------------------
        // ✅ FIXED: REMOVE HOURLY BLOCKING
        // Only DAILY + MONTHLY block full day
        // ------------------------------------
        $checkSql = "
            SELECT start_date, end_date, plan_type
            FROM workspace_bookings
            WHERE (space_id = ? OR seat_codes LIKE ?)
              AND status IN ('confirmed', 'pending')
              AND (
                    (plan_type = 'daily'   AND start_date = ?)
                 OR (plan_type = 'monthly' AND ? BETWEEN start_date AND end_date)
              )
            LIMIT 1
        ";

        $codeSearch = "%" . $currentSpaceCode . "%";
        $stmt = $conn->prepare($checkSql);

        $isAvailable = true;

        if ($stmt) {
            $stmt->bind_param("isss", $spaceId, $codeSearch, $today, $today);
            $stmt->execute();
            $res2 = $stmt->get_result();

            if ($res2 && $res2->num_rows > 0) {
                // ❌ Block full day ONLY for daily/monthly
                $isAvailable = false;
            }

            $stmt->close();
        }

        // ------------------------------------
        // Final Availability Status
        // ------------------------------------
        if ($row["status"] !== "Active") {
            $row["is_available"] = false;
            $row["availability_reason"] = "Space inactive";
        } elseif (!$isAvailable) {
            $row["is_available"] = false;
            $row["availability_reason"] = "Booked";
        } else {
            // ✅ Hourly bookings DO NOT block full day anymore
            $row["is_available"] = true;
            $row["availability_reason"] = "Available for booking";
        }

        $spaces[] = $row;
    }

    echo json_encode(["success" => true, "spaces" => $spaces]);
} else {
    echo json_encode(["success" => false, "message" => "No spaces found"]);
}

$conn->close();
?>