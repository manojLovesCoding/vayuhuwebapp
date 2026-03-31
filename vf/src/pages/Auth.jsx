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
    <div className="min-h-screen flex bg-gray-100">

      {/* LEFT SIDE - FORM */}
      <div className="w-full md:w-1/2 flex items-center justify-center p-6">
        <div className="w-full max-w-md bg-white p-8 rounded-xl shadow-md">

          <h2 className="text-2xl font-semibold mb-2 text-gray-800">
            {authState === "login"
              ? "Welcome Back"
              : authState === "signup"
                ? "Create your Account"
                : "Reset Password"}
          </h2>

          <p className="text-sm text-gray-500 mb-6">
            {authState === "login"
              ? "Login to continue"
              : "Start your journey with us"}
          </p>

          <form onSubmit={authState === "forgot" ? handleForgotPassword : handleSubmit}>

            {authState === "signup" && (
              <input
                type="text"
                placeholder="Full Name"
                className="w-full border p-3 mb-3 rounded-lg"
                value={name}
                onChange={(e) => setName(e.target.value)}
                required
              />
            )}

            <input
              type="email"
              placeholder="Email"
              className="w-full border p-3 mb-3 rounded-lg"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />

            {authState !== "forgot" && (
              <div className="relative mb-3">
                <input
                  type={showPassword ? "text" : "password"}
                  placeholder="Password"
                  className="w-full border p-3 pr-10 rounded-lg"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  required
                />
                <button
                  type="button"
                  className="absolute right-3 top-3 text-gray-500"
                  onClick={() => setShowPassword(!showPassword)}
                >
                  {showPassword ? <Eye /> : <EyeOff />}
                </button>
              </div>
            )}

            {authState === "login" && (
              <p
                onClick={() => switchMode("forgot")}
                className="text-right text-sm text-orange-500 cursor-pointer mb-4"
              >
                Forgot password?
              </p>
            )}

            <button
              type="submit"
              className="w-full bg-orange-600 text-white py-3 rounded-lg hover:bg-orange-700"
            >
              {authState === "login"
                ? "Login"
                : authState === "signup"
                  ? "Sign Up"
                  : "Send Reset Link"}
            </button>

            {message && (
              <p className="mt-4 text-center text-sm text-gray-600">
                {message}
              </p>
            )}
          </form>

          {/* Footer */}
          <div className="text-center text-sm mt-6">
            {authState === "login" ? (
              <>
                Don’t have an account?{" "}
                <span
                  onClick={() => switchMode("signup")}
                  className="text-orange-600 cursor-pointer"
                >
                  Sign Up
                </span>
              </>
            ) : (
              <>
                Already have an account?{" "}
                <span
                  onClick={() => switchMode("login")}
                  className="text-orange-600 cursor-pointer"
                >
                  Login
                </span>
              </>
            )}
          </div>
        </div>
      </div>

      {/* RIGHT SIDE - ILLUSTRATION */}
      <div className="hidden md:flex w-1/2 items-center justify-center bg-orange-50">
        <img
          src="illustration.svg" // replace with your asset
          alt="Illustration"
          className="w-3/4"
        />
      </div>

    </div>
  );
};

export default Auth;