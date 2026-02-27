import React, { useState, useEffect } from "react";
import { motion, AnimatePresence } from "framer-motion";
import { X, Calendar, ShieldCheck, IndianRupee, Info, ArrowRight } from "lucide-react";
import { toast, ToastContainer } from "react-toastify";
import axios from "axios";
import "react-toastify/dist/ReactToastify.css";

const API_URL = import.meta.env.VITE_API_URL;

const VirtualOfficeBookingModal = ({ isOpen, onClose }) => {
  const [startDate, setStartDate] = useState("");
  const [endDate, setEndDate] = useState("");
  const [price, setPrice] = useState(0);
  const [gst, setGst] = useState(0);
  const [totalPrice, setTotalPrice] = useState(0);
  const [plan, setPlan] = useState("");
  const [loading, setLoading] = useState(false);
  const [errors, setErrors] = useState({});
  const [userId, setUserId] = useState(null);
  const [userEmail, setUserEmail] = useState("");
  const [userName, setUserName] = useState("");

  const token = localStorage.getItem("userToken");
  const today = new Date().toISOString().split("T")[0];

  const loadRazorpayScript = () => {
    return new Promise((resolve) => {
      if (window.Razorpay) { resolve(true); return; }
      const script = document.createElement("script");
      script.src = "https://checkout.razorpay.com/v1/checkout.js";
      script.onload = () => resolve(true);
      script.onerror = () => resolve(false);
      document.body.appendChild(script);
    });
  };

  useEffect(() => {
    const storedUser = localStorage.getItem("user");
    if (storedUser) {
      try {
        const parsedUser = JSON.parse(storedUser);
        if (parsedUser?.id) {
          setUserId(parsedUser.id);
          setUserEmail(parsedUser.email || "");
          setUserName(parsedUser.name || "");
        } else {
          toast.warning("⚠️ Please log in to continue.");
          setUserId(null);
        }
      } catch {
        setUserId(null);
        toast.warning("⚠️ Invalid user session. Please log in again.");
      }
    } else { setUserId(null); }
  }, [isOpen]);

  useEffect(() => {
    const fetchPlan = async () => {
      try {
        const response = await axios.get(`${API_URL}/get_virtual_office_price_list.php`, { withCredentials: true });
        const data = response.data;
        if (data.status === "success" && data.data.length > 0) {
          const planData = data.data[0];
          const basePrice = Number(planData.price);
          const gstPercent = Number(planData.gst);
          const gstAmount = (basePrice * gstPercent) / 100;
          const finalPrice = basePrice + gstAmount;
          setPlan(planData.min_duration);
          setPrice(basePrice);
          setGst(gstPercent);
          setTotalPrice(finalPrice);
        } else { toast.error("❌ No active plan found."); }
      } catch (error) {
        console.error("Error fetching plan:", error);
        toast.error("⚠️ Failed to load plan details.");
      }
    };
    if (isOpen) fetchPlan();
  }, [isOpen, token]);

  useEffect(() => {
    if (startDate) {
      const newEnd = new Date(startDate);
      newEnd.setMonth(newEnd.getMonth() + 11);
      setEndDate(newEnd.toISOString().split("T")[0]);
    } else { setEndDate(""); }
  }, [startDate]);

  const validateForm = () => {
    const newErrors = {};
    const selectedDate = new Date(startDate);
    const now = new Date();
    now.setHours(0, 0, 0, 0);
    if (!userId) { toast.warning("🔒 You must be logged in."); return false; }
    if (!startDate) { newErrors.startDate = "Start date is required."; }
    else if (selectedDate < now) { newErrors.startDate = "Start date cannot be in the past."; }
    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!validateForm()) return;
    setLoading(true);
    try {
      const checkResponse = await axios.post(`${API_URL}/virtualoffice_booking.php`, { user_id: userId, check_only: true }, { withCredentials: true });
      const checkData = checkResponse.data;
      if (!checkData.success) { toast.info(`ℹ️ ${checkData.message}`); setLoading(false); return; }
      const isScriptLoaded = await loadRazorpayScript();
      if (!isScriptLoaded) { toast.error("Failed to load payment gateway."); setLoading(false); return; }
      const orderResponse = await axios.post(`${API_URL}/create_razorpay_order.php`, { amount: totalPrice }, { withCredentials: true });
      const orderData = orderResponse.data;
      if (!orderData.success) throw new Error(orderData.message);
      const options = {
        key: orderData.key,
        amount: orderData.amount,
        currency: "INR",
        name: "Vayuhu Workspace",
        description: "Virtual Office - 1 Year",
        order_id: orderData.order_id,
        handler: async function (response) {
          try {
            const verifyResponse = await axios.post(`${API_URL}/verify_payment.php`, response, { withCredentials: true });
            if (verifyResponse.data.success) { await saveBooking(response.razorpay_payment_id); }
            else { toast.error("❌ Payment verification failed."); }
          } catch (err) { toast.error("⚠️ Error verifying payment."); }
        },
        prefill: { name: userName, email: userEmail },
        theme: { color: "#F97316" },
      };
      const rzp = new window.Razorpay(options);
      rzp.open();
      rzp.on("payment.failed", function (response) { toast.error("Payment Failed"); });
    } catch (error) {
      const msg = error.response?.data?.message || "Something went wrong.";
      toast.error(msg);
    } finally {
      if (!document.getElementsByClassName("razorpay-container").length) { setLoading(false); }
    }
  };

  const saveBooking = async (paymentId) => {
    try {
      const response = await axios.post(`${API_URL}/virtualoffice_booking.php`, {
        user_id: userId, start_date: startDate, end_date: endDate,
        price: totalPrice, total_years: 1, payment_id: paymentId, payment_status: "Paid",
      }, { withCredentials: true });
      const data = response.data;
      if (data.message && data.message.toLowerCase().includes("already booked")) {
        toast.info("ℹ️ Booking exists. Please contact support.");
        onClose(); return;
      }
      if (data.success) {
        toast.success("🎉 Virtual Office booked successfully!");
        setTimeout(() => { setStartDate(""); setEndDate(""); onClose(); }, 2000);
      } else { toast.error(`❌ Booking failed: ${data.message}`); }
    } catch (error) { toast.error("⚠️ Payment succeeded but booking failed to save."); }
  };

  if (!isOpen) return null;

  return (
    <AnimatePresence>
      <div className="fixed inset-0 flex items-center justify-center z-[100] px-4">
        <motion.div className="absolute inset-0 bg-slate-900/60 backdrop-blur-sm" initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }} onClick={onClose} />

        <motion.div className="bg-white rounded-3xl shadow-2xl w-full max-w-2xl overflow-hidden relative z-10 flex flex-col md:flex-row" initial={{ scale: 0.9, opacity: 0 }} animate={{ scale: 1, opacity: 1 }} exit={{ scale: 0.9, opacity: 0 }}>

          {/* Left Panel: Feature Highlight */}
          <div className="md:w-5/12 bg-orange-500 p-8 text-white flex flex-col justify-between">
            <div>
              <div className="bg-white/20 w-fit p-3 rounded-2xl mb-6">
                <ShieldCheck size={32} />
              </div>
              <h2 className="text-3xl font-bold leading-tight">Vayuhu <br />Virtual Office</h2>
              <p className="text-orange-100 mt-4 text-sm leading-relaxed">Prime business address, mail handling, and professional presence in one plan.</p>
            </div>
            <div className="space-y-4 pt-6 border-t border-white/20">
              <div className="flex items-center gap-3 text-sm font-medium">
                <Calendar size={18} className="text-orange-200" />
                <span>Plan: {plan || "Annual"}</span>
              </div>
            </div>
          </div>

          {/* Right Panel: Content */}
          <div className="md:w-7/12 p-8 relative bg-white">
            <button onClick={onClose} className="absolute top-4 right-4 text-slate-400 hover:text-slate-600 transition">
              <X size={20} />
            </button>

            {!userId ? (
              <div className="h-full flex flex-col items-center justify-center text-center space-y-4 py-10">
                <div className="bg-slate-100 p-4 rounded-full text-slate-400"><Info size={32} /></div>
                <h3 className="text-xl font-bold text-slate-800">Login Required</h3>
                <button onClick={() => { onClose(); window.location.href = "/auth"; }} className="w-full bg-orange-500 text-white py-3 rounded-xl font-bold">Go to Login</button>
              </div>
            ) : (
              <form className="space-y-6" onSubmit={handleSubmit}>
                <h3 className="text-lg font-bold text-slate-800 flex items-center gap-2">
                  Booking Details <ArrowRight size={16} className="text-orange-500" />
                </h3>

                <div className="space-y-4">
                  <div className="relative">
                    <label className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-1 block">Registration Date</label>
                    <div className="relative">
                      <Calendar className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400" size={16} />
                      <input type="date" min={today} value={startDate} onChange={(e) => setStartDate(e.target.value)}
                        className={`w-full pl-10 pr-4 py-3 bg-slate-50 border ${errors.startDate ? 'border-red-400' : 'border-slate-200'} rounded-xl focus:ring-2 focus:ring-orange-500/20 outline-none transition-all text-sm font-medium text-slate-700`} />
                    </div>
                    {errors.startDate && <p className="text-red-500 text-[10px] mt-1 font-bold uppercase">{errors.startDate}</p>}
                  </div>

                  {endDate && (
                    <motion.div initial={{ opacity: 0, y: 10 }} animate={{ opacity: 1, y: 0 }} className="bg-orange-50 p-4 rounded-2xl flex items-center justify-between border border-orange-100">
                      <div>
                        <p className="text-[10px] text-orange-600 font-bold uppercase">Contract Valid Until</p>
                        <p className="text-sm font-bold text-slate-800">{new Date(endDate).toLocaleDateString('en-GB', { day: 'numeric', month: 'long', year: 'numeric' })}</p>
                      </div>
                      <span className="text-[10px] bg-white text-orange-600 px-2 py-1 rounded-lg font-bold shadow-sm border border-orange-100">11 MONTHS</span>
                    </motion.div>
                  )}
                </div>

                {/* Pricing Summary Box */}
                <div className="bg-slate-50 rounded-2xl p-5 space-y-3 border border-slate-100">
                  <div className="flex justify-between text-xs text-slate-500 font-medium uppercase tracking-tighter">
                    <span>Base Amount</span>
                    <span>₹{price.toLocaleString()}</span>
                  </div>
                  <div className="flex justify-between text-xs text-slate-500 font-medium uppercase tracking-tighter border-b border-slate-200 pb-3">
                    <span>GST ({gst}%)</span>
                    <span>₹{((price * gst) / 100).toLocaleString()}</span>
                  </div>
                  <div className="flex justify-between items-center pt-1">
                    <span className="font-bold text-slate-700 text-sm">Total Payable</span>
                    <span className="text-xl font-extrabold text-orange-600 tracking-tight">₹{totalPrice.toLocaleString()}</span>
                  </div>
                </div>

                <button type="submit" disabled={loading} className={`w-full bg-slate-900 hover:bg-slate-800 text-white py-4 rounded-2xl font-bold shadow-lg shadow-slate-200 transition-all flex items-center justify-center gap-2 ${loading ? 'opacity-70' : ''}`}>
                  {loading ? "Processing..." : <>Confirm & Pay <IndianRupee size={18} /></>}
                </button>
              </form>
            )}
          </div>
        </motion.div>
      </div>
      <ToastContainer position="top-right" autoClose={3000} />
    </AnimatePresence>
  );
};

export default VirtualOfficeBookingModal;