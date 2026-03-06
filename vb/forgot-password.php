<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require_once __DIR__ . '/config/env.php';
require_once __DIR__ . '/config/cors.php';
require_once __DIR__ . '/vendor/autoload.php';
require_once 'db.php';

// Ensure the timezone matches your reset-password.php script
date_default_timezone_set('Asia/Kolkata'); 

header("Content-Type: application/json; charset=UTF-8");

$input = json_decode(file_get_contents("php://input"), true);

if (!$input || empty($input["email"])) {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "Email is required."]);
    exit;
}

$email = trim($input["email"]);

// 1. Check if user exists
$sql = "SELECT id FROM users WHERE email = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    echo json_encode(["status" => "success", "message" => "If this email is registered, a reset link has been sent."]);
    exit;
}

// 2. Generate Token
$token = bin2hex(random_bytes(32));
// Using current time + 1 hour based on the timezone set above
$expires_at = date("Y-m-d H:i:s", strtotime("+1 hour"));

// 3. Database Updates
// Delete any existing tokens for this email to prevent multiple valid links
$delete_old = $conn->prepare("DELETE FROM password_resets WHERE email = ?");
$delete_old->bind_param("s", $email);
$delete_old->execute();

$insert = $conn->prepare("INSERT INTO password_resets (email, token, expires_at) VALUES (?, ?, ?)");
$insert->bind_param("sss", $email, $token, $expires_at);
$insert->execute();

// 4. Send Email via PHPMailer
$reset_link = "http://localhost:5173/reset-password?token=" . $token;
$mail = new PHPMailer(true);

try {
    $mail->isSMTP();
    $mail->Host       = 'smtp.gmail.com';
    $mail->SMTPAuth   = true;
    $mail->Username   = 'k24517165@gmail.com';
    $mail->Password   = 'ojnp mnka xorh mdch'; 
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
    $mail->Port       = 587;

    $mail->setFrom('k24517165@gmail.com', 'Vayuhu Workspaces');
    $mail->addAddress($email);

    $mail->isHTML(true);
    $mail->Subject = 'Password Reset Request - Vayuhu';
    $mail->Body    = "
        <div style='font-family: Arial, sans-serif; line-height: 1.6;'>
            <h3>Hello,</h3>
            <p>You requested a password reset for your Vayuhu account. Click the button below to set a new password:</p>
            <p style='margin: 20px 0;'>
                <a href='{$reset_link}' style='background-color: #f97316; color: white; padding: 12px 20px; text-decoration: none; border-radius: 8px; font-weight: bold;'>Reset My Password</a>
            </p>
            <p>This link will expire in 1 hour.</p>
            <p style='color: #666; font-size: 12px;'>If you didn't request this, you can safely ignore this email.</p>
        </div>
    ";
    $mail->AltBody = "Hello, click the following link to reset your password: " . $reset_link;

    $mail->send();
    echo json_encode(["status" => "success", "message" => "Reset link has been sent to your email."]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        "status" => "error",
        "message" => "Message could not be sent. Mailer Error: {$mail->ErrorInfo}"
    ]);
}

$stmt->close();
$conn->close();