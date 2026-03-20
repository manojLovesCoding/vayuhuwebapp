<?php
// send_booking_email.php

// -----------------------------
// Load Environment & Centralized CORS
// -----------------------------
require_once __DIR__ . '/config/env.php';   // loads $_ENV['JWT_SECRET']
require_once __DIR__ . '/config/cors.php';  // centralized CORS headers & OPTIONS handling

// -----------------------------
// Include JWT Library
// -----------------------------
require_once __DIR__ . '/vendor/autoload.php';

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

// -----------------------------
// JWT Secret
// -----------------------------
$secret_key = $_ENV['JWT_SECRET'] ?? die("JWT_SECRET not set in .env");

// -----------------------------
// Include DB & PHPMailer
// -----------------------------
require_once 'db.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

try {
    // -----------------------------
    // JWT Verification (Updated Fallback)
    // -----------------------------
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
        throw new Exception("No session found. Please log in.");
    }

    try {
        $decoded = JWT::decode($token, new Key($secret_key, 'HS256'));
    } catch (Exception $e) {
        http_response_code(401);
        throw new Exception("Invalid or expired token");
    }

    // -----------------------------
    // Read JSON Input
    // -----------------------------
    $input = json_decode(file_get_contents("php://input"), true);
    if (!$input) throw new Exception("Invalid input data");

    $user_id      = $input["user_id"] ?? null;
    $user_email   = trim($input["user_email"] ?? "");
    $user_name    = trim($input["user_name"] ?? "Customer");
    $total_amount = trim($input["total_amount"] ?? "");

    // Normalize bookings array
    $bookings = [];
    if (isset($input["bookings"]) && is_array($input["bookings"])) {
        $bookings = $input["bookings"];
    } elseif (isset($input["workspace_title"])) {
        $bookings[] = $input;
        if (empty($total_amount)) {
            $total_amount = $input['final_amount'] ?? $input['total_amount'] ?? 0;
        }
    }

    if (empty($user_email)) throw new Exception("Missing user email address");
    if (empty($bookings)) throw new Exception("No booking details found");

    // -----------------------------
    // Compose Email Content
    // -----------------------------
    $subject = "Your Booking Confirmation - Vayuhu Workspaces";

    $body = "
    <html>
    <head><style>
    body { font-family: Arial, sans-serif; color: #333; line-height: 1.6; }
    .table { border-collapse: collapse; width: 100%; margin-top: 10px; margin-bottom: 20px; }
    .table td, .table th { border: 1px solid #ddd; padding: 10px; }
    .table th { background-color: #f97316; color: white; text-align: left; width: 35%; }
    .total-block { background: #eee; padding: 15px; text-align: right; font-weight: bold; font-size: 1.2em; border-radius: 5px; }
    .highlight { color: #f97316; font-weight: bold; }
    </style></head>
    <body>
      <h2>Booking Confirmation</h2>
      <p>Dear $user_name,</p>
      <p>Thank you for choosing <strong>Vayuhu Workspaces</strong>. Your booking has been successfully confirmed. Details are provided below:</p>
    ";

    foreach ($bookings as $index => $booking) {
        $workspace_title = $booking['workspace_title'] ?? 'Workspace';
        $plan_type       = ucfirst($booking['plan_type'] ?? 'Standard');
        $start_date      = $booking['start_date'] ?? '';
        $end_date        = $booking['end_date'] ?? '';
        $start_time      = isset($booking['start_time']) ? substr($booking['start_time'], 0, 5) : '';
        $end_time        = isset($booking['end_time']) ? substr($booking['end_time'], 0, 5) : '';
        $item_amount     = $booking['final_amount'] ?? $booking['total_amount'] ?? 0;
        $seat_codes_raw  = $booking['selected_codes'] ?? $booking['seat_codes'] ?? '';
        $seat_codes      = is_array($seat_codes_raw) ? implode(", ", $seat_codes_raw) : $seat_codes_raw;
        $item_coupon     = $booking['coupon_code'] ?? '';
        $booking_ref     = $booking['booking_id'] ?? '';

        // --- Handle Attendee Logic ---
        $num_attendees   = (int)($booking['num_attendees'] ?? 1);

        $body .= "
        <table class='table'>
          <tr><th colspan='2'>Item #" . ($index + 1) . ": $workspace_title</th></tr>
          " . (!empty($booking_ref) ? "<tr><th>Booking ID</th><td>{$booking_ref}</td></tr>" : "") . "
          <tr><th>Plan Type</th><td>{$plan_type}</td></tr>
          " . (!empty($seat_codes) ? "<tr><th>Seat / Room Code</th><td><strong>{$seat_codes}</strong></td></tr>" : "") . "
          " . ($workspace_title === "Video Conferencing" ? "<tr><th>Total Attendees</th><td><span class='highlight'>{$num_attendees} Person(s)</span></td></tr>" : "") . "
          <tr><th>Start Date</th><td>{$start_date}</td></tr>
          <tr><th>End Date</th><td>{$end_date}</td></tr>
          " . (!empty($start_time) ? "<tr><th>Scheduled Time</th><td>{$start_time} - {$end_time}</td></tr>" : "") . "
          <tr><th>Amount</th><td>₹{$item_amount}</td></tr>
          " . (!empty($item_coupon) ? "<tr><th>Coupon Applied</th><td>{$item_coupon}</td></tr>" : "") . "
        </table>";
    }

    $body .= "
      <div class='total-block'>
          Grand Total Paid: ₹" . number_format((float)$total_amount, 2) . "
      </div>
      <p>We look forward to hosting you soon!</p>
      <p>Best regards,<br><strong>Team Vayuhu</strong></p>
      <hr style='border:none; border-top:1px solid #eee;'>
      <p style='font-size: 0.8em; color: #777;'>Need help? Contact us at support@vayuhu.com</p>
    </body>
    </html>
    ";

    // -----------------------------
    // Send Email using PHPMailer
    // -----------------------------
    $mail = new PHPMailer(true);
    $mail->isSMTP();
    $mail->Host       = 'smtp.gmail.com';
    $mail->SMTPAuth   = true;
    //$mail->Username   = 'k24517165@gmail.com';
    //$mail->Password   = 'ojnp mnka xorh mdch';
    $mail->Username   = 'support@vayuhu.com';
    $mail->Password   = 'qoxb ogyg lkpu rkul';
    $mail->SMTPSecure = 'tls';
    $mail->Port       = 587;

    $mail->setFrom('support@vayuhu.com', 'Vayuhu Workspaces');
    //$mail->setFrom('k24517165@gmail.com', 'Vayuhu Workspaces');
    $mail->addAddress($user_email);
    $mail->addBCC('support@vayuhu.com');
    //$mail->addBCC('k24517165@gmail.com');

    $mail->isHTML(true);
    $mail->Subject = $subject;
    $mail->Body    = $body;

    $mail->send();
    echo json_encode(["success" => true, "message" => "Email sent successfully"]);
} catch (Exception $e) {
    error_log("Mailer/JWT Error: " . $e->getMessage());
    echo json_encode(["success" => false, "message" => $e->getMessage()]);
}
