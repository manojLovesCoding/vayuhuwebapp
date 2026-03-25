import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import api from "../api/axios";
import { useAuth } from "../context/AuthContext";
import { Eye, EyeOff } from "lucide-react";

const Auth = () => {
  // States to manage view: 'login', 'signup', or 'forgot'
  const [authState, setAuthState] = useState("login"); // "login" | "signup" | "forgot"

  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [message, setMessage] = useState("");
  const [loading, setLoading] = useState(false);
  const [showPassword, setShowPassword] = useState(false);

  const navigate = useNavigate();
  const { loginUser } = useAuth();

  // Handle Login and Signup
  const handleSubmit = async (e) => {
    e.preventDefault();
    setMessage("");
    setLoading(true);

    const isLogin = authState === "login";
    const url = isLogin ? "/login.php" : "/signup.php";
    const payload = { email, password, ...(isLogin ? {} : { name }) };

    try {
      const { data } = await api.post(url, payload);
      setMessage(data.message);

      if (data.status === "success" && data.user) {
        loginUser(data.user);
        setTimeout(() => {
          navigate("/", { state: { scrollTo: "Header" } });
        }, 500);
      }
    } catch (error) {
      setMessage(error.response?.data?.message || "Something went wrong.");
    } finally {
      setLoading(false);
    }
  };

  // Handle Forgot Password Request (Sends Email)
  const handleForgotPassword = async (e) => {
    e.preventDefault();
    setMessage("");
    setLoading(true);

    try {
      const { data } = await api.post("/forgot-password.php", { email });
      setMessage(data.message);
    } catch (error) {
      setMessage(error.response?.data?.message || "Could not send reset link.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    window.scrollTo({ top: 700, behavior: "smooth" });
  }, []);

  // Helper to switch modes and clear messages
  const switchMode = (mode) => {
    setAuthState(mode);
    setMessage("");
  };

  return (
    <div className="relative min-h-screen flex items-center justify-center bg-gradient-to-br from-orange-50 to-orange-100 overflow-hidden">

      {/* DECORATIVE BACKGROUND SHAPES */}
      <div className="absolute top-[-150px] right-[-120px] w-[350px] h-[350px] bg-orange-300 rounded-full blur-3xl opacity-40 animate-pulse"></div>
      <div className="absolute bottom-[-130px] left-[-80px] w-[300px] h-[140px] bg-orange-400 opacity-20 blur-xl rotate-anim rounded-2xl"></div>

      {/* AUTH CARD */}
      <div className="relative bg-white/80 backdrop-blur-xl p-8 rounded-3xl shadow-xl w-96 z-10 border border-orange-100">
        <h2 className="text-2xl font-semibold text-center mb-6 text-gray-800">
          {authState === "forgot" ? "Reset Password 🔑" : authState === "login" ? "Welcome Back 👋" : "Create Your Account ✨"}
        </h2>

        <form onSubmit={authState === "forgot" ? handleForgotPassword : handleSubmit}>

          {/* Name Field (Signup Only) */}
          {authState === "signup" && (
            <input
              type="text"
              placeholder="Full Name"
              value={name}
              onChange={(e) => setName(e.target.value)}
              className="w-full border p-3 mb-3 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-400"
              required
            />
          )}

          {/* Email Field (Always) */}
          <input
            type="email"
            placeholder="Email Address"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            className="w-full border p-3 mb-3 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-400"
            required
          />

          {/* Password Field (Login/Signup Only) */}
          {authState !== "forgot" && (
            <div className="relative mb-1">
              <input
                type={showPassword ? "text" : "password"}
                placeholder="Password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="w-full border p-3 pr-10 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-400"
                required
              />

              <button
                type="button"
                onClick={() => setShowPassword(!showPassword)}
                className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-500 hover:text-gray-700"
              >
                {showPassword ? (
                  <Eye />
                ) : (
                  <EyeOff />
                )}
              </button>
            </div>
          )}

          {/* Forgot Password Link (Login Only) */}
          {authState === "login" && (
            <p
              onClick={() => switchMode("forgot")}
              className="text-right text-sm mb-4 text-orange-500 cursor-pointer hover:underline"
            >
              Forgot Password?
            </p>
          )}

          {/* Action Button */}
          <button
            type="submit"
            disabled={loading}
            className="w-full bg-orange-500 shadow-lg text-white font-semibold py-3 rounded-lg hover:bg-orange-600 hover:shadow-xl transition-all disabled:bg-orange-300"
          >
            {loading ? "Processing..." : authState === "forgot" ? "Send Reset Link" : authState === "login" ? "Login" : "Sign Up"}
          </button>

          {message && (
            <p className={`mt-4 text-center text-sm font-medium ${message.includes("error") ? "text-red-500" : "text-gray-700"}`}>
              {message}
            </p>
          )}
        </form>

        {/* Footer Navigation */}
        <div className="text-center text-sm mt-6 text-gray-700">
          {authState === "forgot" ? (
            <p onClick={() => switchMode("login")} className="text-orange-500 font-medium cursor-pointer hover:underline">
              ← Back to Login
            </p>
          ) : (
            <p>
              {authState === "login" ? "Don’t have an account?" : "Already have an account?"}{" "}
              <span
                onClick={() => switchMode(authState === "login" ? "signup" : "login")}
                className="text-orange-500 font-medium cursor-pointer hover:underline"
              >
                {authState === "login" ? "Sign Up" : "Login"}
              </span>
            </p>
          )}
        </div>
      </div>

      <style>{`
        .rotate-anim { animation: rotate 12s linear infinite; }
        @keyframes rotate { 0% { transform: rotate(0deg); } 100% { transform: rotate(360deg); } }
      `}</style>
    </div>
  );
};

export default Auth;