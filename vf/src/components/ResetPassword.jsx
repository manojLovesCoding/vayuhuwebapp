import { useState } from "react";
import { useSearchParams, useNavigate } from "react-router-dom";
import api from "../api/axios";

const ResetPassword = () => {
    const [searchParams] = useSearchParams();
    const token = searchParams.get("token");
    const [newPassword, setNewPassword] = useState("");
    const [confirmPassword, setConfirmPassword] = useState("");
    const [message, setMessage] = useState("");
    const [loading, setLoading] = useState(false);
    const navigate = useNavigate();

    const handleReset = async (e) => {
        e.preventDefault();

        if (!token) {
            return setMessage("Invalid session. No reset token found in URL.");
        }

        if (newPassword !== confirmPassword) {
            return setMessage("Passwords do not match.");
        }

        setLoading(true);
        try {
            // Log for debugging - check your browser console!
            console.log("Sending token:", token);

            const { data } = await api.post("/reset-password.php", {
                token: token,
                password: newPassword,
            });

            setMessage(data.message);
            if (data.status === "success") {
                setTimeout(() => navigate("/auth"), 3000);
            }
        } catch (error) {
            console.error("Error response:", error.response?.data);
            setMessage(error.response?.data?.message || "Link expired or invalid.");
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="min-h-screen flex items-center justify-center bg-orange-50">
            <div className="bg-white p-8 rounded-3xl shadow-xl w-96 border border-orange-100">
                <h2 className="text-2xl font-semibold text-center mb-6">Create New Password 🔒</h2>
                <form onSubmit={handleReset}>
                    <input
                        type="password"
                        placeholder="New Password"
                        className="w-full border p-3 mb-3 rounded-lg focus:ring-2 focus:ring-orange-400 outline-none"
                        value={newPassword}
                        onChange={(e) => setNewPassword(e.target.value)}
                        required
                    />
                    <input
                        type="password"
                        placeholder="Confirm New Password"
                        className="w-full border p-3 mb-4 rounded-lg focus:ring-2 focus:ring-orange-400 outline-none"
                        value={confirmPassword}
                        onChange={(e) => setConfirmPassword(e.target.value)}
                        required
                    />
                    <button
                        disabled={loading}
                        className="w-full bg-orange-500 text-white font-semibold py-3 rounded-lg hover:bg-orange-600 transition-all disabled:bg-gray-400"
                    >
                        {loading ? "Updating..." : "Update Password"}
                    </button>
                </form>
                {message && (
                    <p className={`mt-4 text-center text-sm font-medium ${message.includes('success') ? 'text-green-600' : 'text-red-600'}`}>
                        {message}
                    </p>
                )}
            </div>
        </div>
    );
};

export default ResetPassword;