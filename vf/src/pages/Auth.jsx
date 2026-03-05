import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { assets } from "../assets/assets";
import api from "../api/axios"; // ✅ Use Axios instance
import { useAuth } from "../context/AuthContext";

const Auth = () => {
  const [isLogin, setIsLogin] = useState(false);
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [message, setMessage] = useState("");
  const [toast, setToast] = useState(""); // Toast message
  const [showToast, setShowToast] = useState(false); // Control toast animation
  const navigate = useNavigate();
  const { loginUser } = useAuth();

  const handleSubmit = async (e) => {
    e.preventDefault();
    setMessage("");

    const url = isLogin ? "/login.php" : "/signup.php";
    const payload = { email, password, ...(isLogin ? {} : { name }) };

    try {
      const { data } = await api.post(url, payload);
      setMessage(data.message);

      if (data.status === "success" && data.user) {
        loginUser(data.user);

        setTimeout(() => {
          navigate("/", { state: { scrollTo: "Header" } });
        }, 300);
      }
    } catch (error) {
      console.error("Auth error:", error);
      setMessage(error.response?.data?.message || "Something went wrong.");
    }
  };

  const handleForgotPassword = () => {
    setToast("Please contact Front Desk");
    setShowToast(true);
    setTimeout(() => setShowToast(false), 4000); // Fade out after 4s
  };

  useEffect(() => {
    window.scrollTo({ top: 700, behavior: "smooth" });
  }, []);

  return (
    <div className="relative min-h-screen flex items-center justify-center bg-gradient-to-br from-orange-50 to-orange-100 overflow-hidden">
      {/* BACKGROUND SHAPES */}
      <div className="absolute top-[-150px] right-[-120px] w-[350px] h-[350px] bg-orange-300 rounded-full blur-3xl opacity-40 animate-pulse"></div>
      <div className="absolute bottom-[-130px] left-[-80px] w-[300px] h-[140px] bg-orange-400 opacity-20 blur-xl rotate-anim rounded-2xl"></div>
      <div className="absolute top-[180px] left-[80px] w-0 h-0 border-l-[70px] border-l-transparent border-r-[70px] border-r-transparent border-b-[120px] border-b-orange-400 opacity-30 float-anim"></div>
      <div className="absolute bottom-[100px] right-[60px] grid grid-cols-4 gap-3 opacity-40 float-anim">
        {[...Array(12)].map((_, i) => (
          <span key={i} className="w-3 h-3 bg-orange-300 rounded-full"></span>
        ))}
      </div>
      <div className="absolute top-[260px] right-[180px] w-16 h-16 bg-orange-300 rounded-full opacity-40 rotate-anim"></div>

      {/* BRAND LOGO */}
      {/* <div className="absolute top-14 flex flex-col items-center z-20 animate-fadein">
        <img src={assets.brandLogo} alt="Brand Logo" className="w-28 h-28 object-contain drop-shadow-xl animate-pop" />
      </div> */}

      {/* AUTH CARD */}
      <div className="relative bg-white/80 backdrop-blur-xl p-8 rounded-3xl shadow-xl w-96 z-10 border border-orange-100">
        <h2 className="text-2xl font-semibold text-center mb-6 text-gray-800">
          {isLogin ? "Welcome Back 👋" : "Create Your Account ✨"}
        </h2>

        <form onSubmit={handleSubmit}>
          {!isLogin && (
            <input
              type="text"
              placeholder="Full Name"
              value={name}
              onChange={(e) => setName(e.target.value)}
              className="w-full border p-3 mb-3 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-400"
              required
            />
          )}

          <input
            type="email"
            placeholder="Email Address"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            className="w-full border p-3 mb-3 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-400"
            required
          />

          <input
            type="password"
            placeholder="Password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            className="w-full border p-3 mb-1 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-400"
            required
          />

          {/* Forgot Password Link */}
          {isLogin && (
            <p
              onClick={handleForgotPassword}
              className="text-right text-sm mb-4 text-orange-500 cursor-pointer hover:underline"
            >
              Forgot Password?
            </p>
          )}

          <button
            type="submit"
            className="w-full bg-orange-500 shadow-lg text-white font-semibold py-3 rounded-lg hover:bg-orange-600 hover:shadow-xl transition-all"
          >
            {isLogin ? "Login" : "Sign Up"}
          </button>

          {message && (
            <p className="mt-4 text-center text-sm font-medium text-gray-700">{message}</p>
          )}
        </form>

        {/* Toast Notification with slide/fade animation */}
        {toast && (
          <div
            className={`fixed bottom-6 left-1/2 transform -translate-x-1/2 bg-orange-500 text-white px-4 py-2 rounded shadow-lg transition-all duration-500 ${
              showToast ? "translate-y-0 opacity-100" : "translate-y-6 opacity-0"
            }`}
          >
            {toast}
          </div>
        )}

        <p className="text-center text-sm mt-6 text-gray-700">
          {isLogin ? "Don’t have an account?" : "Already have an account?"}{" "}
          <span
            onClick={() => { setIsLogin(!isLogin); setMessage(""); }}
            className="text-orange-500 font-medium cursor-pointer hover:underline"
          >
            {isLogin ? "Sign Up" : "Login"}
          </span>
        </p>
      </div>

      <style>{`
        .float-anim { animation: float 6s ease-in-out infinite; }
        .rotate-anim { animation: rotate 12s linear infinite; }
        .animate-pop { animation: pop 0.6s ease-out; }
        .animate-fadein { animation: fadeIn 1s ease-out; }
        @keyframes float { 0%, 100% { transform: translateY(0px); } 50% { transform: translateY(-18px); } }
        @keyframes rotate { 0% { transform: rotate(0deg); } 100% { transform: rotate(360deg); } }
        @keyframes pop { 0% { transform: scale(0.7); opacity: 0; } 100% { transform: scale(1); opacity: 1; } }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
      `}</style>
    </div>
  );
};

export default Auth;