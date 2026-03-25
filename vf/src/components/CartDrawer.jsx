import React, { useState, useEffect, useMemo, useCallback } from "react";
import { motion, AnimatePresence } from "framer-motion";
import { useNavigate } from "react-router-dom";
import { useCart } from "../context/CartContext";
import { toast } from "react-toastify";
import axios from "axios";
import { Trash2, X, Calendar, MapPin, Clock, ChevronDown, ChevronUp } from "lucide-react";

const API_URL = import.meta.env.VITE_API_URL || "http://localhost/vayuhu_backend";


/* ---------- DATE FORMATTER ---------- */
const formatDateDMY = (dateStr) => {
  if (!dateStr) return "";

  const date = new Date(dateStr);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const year = date.getFullYear();

  return `${day}-${month}-${year}`;
};


/* ---------- TIME FORMATTER ---------- */
const formatTime12Hour = (time) => {
  if (!time) return "";

  const [hour, minute] = time.split(":");
  let h = parseInt(hour);
  const ampm = h >= 12 ? "PM" : "AM";

  h = h % 12;
  if (h === 0) h = 12;

  return `${h.toString().padStart(2, "0")}:${minute} ${ampm}`;
};


const CartDrawer = ({ open, onClose }) => {
  const { cart, removeFromCart, clearCart, totalAmount } = useCart();
  const navigate = useNavigate();

  const { subtotal, gst } = useMemo(() => {
    const sub = totalAmount / 1.18;
    const gstVal = totalAmount - sub;

    return {
      subtotal: sub.toFixed(2),
      gst: gstVal.toFixed(2)
    };
  }, [totalAmount]);

  const [breakdowns, setBreakdowns] = useState({});


  useEffect(() => {
    if (open) {
      setBreakdowns(prev => {
        const next = {};

        cart.forEach(item => {
          next[item.cartId || item.id] = prev[item.cartId || item.id] || false;
        });

        return next;
      });
    }
  }, [cart, open]);


  const toggleBreakdown = useCallback((cartId) => {
    setBreakdowns(prev => ({
      ...prev,
      [cartId]: !prev[cartId]
    }));
  }, []);



  const loadRazorpayScript = useCallback(() => {
    return new Promise((resolve) => {

      if (window.Razorpay) return resolve(true);

      const script = document.createElement("script");
      script.src = "https://checkout.razorpay.com/v1/checkout.js";
      script.async = true;

      script.onload = () => resolve(true);
      script.onerror = () => resolve(false);

      document.body.appendChild(script);
    });
  }, []);



  const handleCheckout = async () => {

    if (cart.length === 0)
      return toast.error("Your cart is empty!");

    const toastId = toast.loading("Verifying availability...");

    try {

      const availabilityChecks = cart.map(item =>
        axios.post(`${API_URL}/check_workspace_availability.php`, {
          space_id: item.id,
          plan_type: item.plan_type.toLowerCase(),
          start_date: item.start_date,
          end_date: item.end_date,
          start_time: item.start_time,
          end_time: item.end_time,
        }, { withCredentials: true })
      );

      const results = await Promise.all(availabilityChecks);

      const failedCheck = results.find(res => !res.data.success);

      if (failedCheck) {

        toast.dismiss(toastId);

        toast.error(
          <div>
            <p className="font-bold">Booking Conflict:</p>
            <p>{failedCheck.data.message}</p>
          </div>,
          { autoClose: 6000 }
        );

        return;
      }

      toast.dismiss(toastId);


      const loaded = await loadRazorpayScript();

      if (!loaded)
        throw new Error("Razorpay SDK failed to load.");


      const createOrderRes = await axios.post(
        `${API_URL}/create_razorpay_order.php`,
        { amount: totalAmount },
        { withCredentials: true }
      );


      if (!createOrderRes.data.success)
        throw new Error(createOrderRes.data.message || "Failed to create order.");


      const { key, order_id } = createOrderRes.data;


      const options = {

        key,

        amount: Math.round(totalAmount * 100),

        currency: "INR",

        name: "Vayuhu Workspaces",

        description: "Cart Checkout",

        order_id,

        theme: { color: "#F97316" },


        handler: async function (response) {

          try {

            await axios.post(
              `${API_URL}/verify_payment.php`,
              response,
              { withCredentials: true }
            );


            const user = JSON.parse(localStorage.getItem("user"));


            const bulkBookingData = cart.map((item) => {
              // Ensure we don't send 0.00 by checking if the value exists
              const finalAmt = Number(item.final_amount) || 0;
              const itemSubtotal = finalAmt / 1.18;
              const itemGst = finalAmt - itemSubtotal;

              return {
                user_id: user?.id,
                space_id: item.id,
                workspace_title: item.title,
                plan_type: item.plan_type, // Ensure this matches 'Hourly', 'Daily', etc.
                start_date: item.start_date,
                end_date: item.end_date,
                start_time: item.start_time,
                end_time: item.end_time,
                total_days: item.total_days,
                total_hours: item.total_hours,
                num_attendees: item.num_attendees,

                // FIX: Ensure these names match what add_bulk_bookings.php expects
                price_per_unit: Number(item.price_per_unit || 0),
                base_amount: itemSubtotal,
                gst_amount: itemGst,
                final_amount: finalAmt,

                coupon_code: item.coupon_code || null,
                referral_source: item.referral || null,
                terms_accepted: 1,
                payment_id: response.razorpay_payment_id, // This MUST be passed here
                seat_codes: item.seat_codes || "",
              };
            });


            const bookingRes = await axios.post(
              `${API_URL}/add_bulk_bookings.php`,
              { bookings: bulkBookingData },
              { withCredentials: true }
            );


            if (!bookingRes.data.success)
              throw new Error(bookingRes.data.message);


            await axios.post(
              `${API_URL}/send_booking_email.php`,
              {
                user_id: user?.id,
                user_email: user?.email,
                user_name: user?.name || "Customer", // Added name
                total_amount: Number(totalAmount).toFixed(2),
                // Map the cart to ensure keys match exactly what PHP expects
                bookings: cart.map(item => ({
                  workspace_title: item.title,
                  plan_type: item.plan_type,
                  start_date: item.start_date,
                  end_date: item.end_date,
                  start_time: item.start_time,
                  end_time: item.end_time,
                  num_attendees: item.num_attendees, // Now correctly passed from cart state
                  seat_codes: item.seat_codes || "",
                  final_amount: Number(item.final_amount).toFixed(2),
                  // If your bulk booking response returns IDs, you can map them here
                  booking_id: item.booking_id || ""
                })),
              },
              { withCredentials: true }
            );


            toast.success("🎉 All bookings confirmed!");

            clearCart();

            onClose();

            navigate("/dashboard");

          }

          catch (err) {

            toast.error(
              err.response?.data?.message ||
              "Internal error during finalization."
            );

          }

        }

      };


      new window.Razorpay(options).open();

    }

    catch (error) {

      toast.dismiss(toastId);

      toast.error(
        error.message ||
        "Failed to initialize checkout."
      );

    }

  };



  return (

    <AnimatePresence>

      {open && (

        <motion.div
          className="fixed inset-0 z-50 flex justify-end bg-black/40 backdrop-blur-sm"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          onClick={onClose}
        >

          <motion.div
            className="bg-white w-full max-w-md h-full shadow-2xl rounded-l-3xl flex flex-col overflow-hidden"
            initial={{ x: "100%" }}
            animate={{ x: 0 }}
            exit={{ x: "100%" }}
            transition={{ type: "spring", stiffness: 200, damping: 25 }}
            onClick={(e) => e.stopPropagation()}
          >

            <div className="flex justify-between items-center p-6 border-b border-gray-100">

              <div>

                <h3 className="text-2xl font-semibold text-gray-900">
                  Review Booking
                </h3>

                <p className="text-sm text-gray-500 mt-1">
                  {cart.length} {cart.length === 1 ? "Item" : "Items"} in Cart
                </p>

              </div>

              <button
                onClick={onClose}
                className="p-2 rounded-full hover:bg-gray-100 transition-colors"
              >
                <X size={24} className="text-gray-400" />
              </button>

            </div>


            <div className="flex-1 overflow-y-auto p-6 space-y-4">

              {cart.length === 0 ? (

                <div className="flex flex-col items-center justify-center text-center mt-10 space-y-3">

                  <div className="w-24 h-24 bg-gray-100 rounded-full flex items-center justify-center">
                    <Trash2 size={36} className="text-gray-300" />
                  </div>

                  <h4 className="text-lg font-semibold text-gray-900">
                    Your cart is empty
                  </h4>

                </div>

              ) : (

                cart.map((item) => (

                  <CartItem
                    key={item.cartId || item.id}
                    item={item}
                    removeFromCart={removeFromCart}
                    isOpen={breakdowns[item.cartId || item.id]}
                    toggle={() => toggleBreakdown(item.cartId || item.id)}
                  />

                ))

              )}

            </div>



            {cart.length > 0 && (

              <div className="p-6 border-t border-gray-100 bg-gradient-to-t from-white to-gray-50 shadow-inner">

                <div className="space-y-2 mb-4">

                  <SummaryLine label="Base Amount" value={subtotal} />

                  <SummaryLine label="GST (18%)" value={gst} />

                  <div className="flex justify-between items-center pt-3 border-t border-gray-200 mt-2">

                    <span className="font-bold text-gray-900 text-lg">
                      Grand Total
                    </span>

                    <span className="font-black text-2xl text-orange-600">
                      ₹{Number(totalAmount).toFixed(2)}
                    </span>

                  </div>

                </div>

                <div className="grid grid-cols-2 gap-3">

                  <button
                    onClick={clearCart}
                    className="py-3 px-4 border border-gray-300 text-gray-600 font-semibold rounded-xl hover:bg-gray-50 transition-all text-sm"
                  >
                    Clear All
                  </button>

                  <button
                    onClick={handleCheckout}
                    className="py-3 px-4 bg-orange-500 text-white font-bold rounded-xl shadow-lg shadow-orange-200 hover:bg-orange-600 transition-all text-sm"
                  >
                    Pay & Confirm
                  </button>

                </div>

              </div>

            )}

          </motion.div>

        </motion.div>

      )}

    </AnimatePresence>

  );

};



const CartItem = ({ item, removeFromCart, isOpen, toggle }) => {
  const itemSubtotal = item.final_amount / 1.18;
  const itemGst = item.final_amount - itemSubtotal;

  return (
    <motion.div layout className="bg-white p-4 rounded-2xl shadow-sm border border-gray-200 relative group">
      <div className="flex justify-between items-start mb-2">
        <span className="px-2 py-1 bg-orange-50 text-orange-600 text-[10px] font-bold uppercase rounded tracking-wide">
          {item.plan_type}
        </span>

        <button
          onClick={() => removeFromCart(item.cartId || item.id)}
          className="text-gray-300 hover:text-red-500 transition-colors"
        >
          <Trash2 size={16} />
        </button>
      </div>

      <div className="flex justify-between items-center mb-2">
        <h4 className="font-bold text-gray-900 text-base">
          {item.title}
        </h4>
        {/* ✅ ADDED: Unit Price Badge */}
        <span className="text-xs font-semibold text-gray-500 bg-gray-100 px-2 py-1 rounded-lg">
          ₹{Number(item.price_per_unit || 0).toFixed(2)} / Unit
        </span>
      </div>

      <div className="grid grid-cols-1 gap-1 text-gray-500 text-sm">
        <div className="flex items-center">
          <Calendar size={14} className="mr-2" />
          {formatDateDMY(item.start_date)}
          {item.end_date !== item.start_date &&
            ` → ${formatDateDMY(item.end_date)}`}
        </div>

        {item.seat_codes && (
          <div className="flex items-center text-blue-600 font-medium">
            <MapPin size={14} className="mr-2" />
            Seats: {item.seat_codes}
          </div>
        )}

        {item.plan_type?.toLowerCase() === "hourly" && (
          <div className="flex items-center">
            <Clock size={14} className="mr-2" />
            {formatTime12Hour(item.start_time)} - {formatTime12Hour(item.end_time)}
          </div>
        )}
      </div>

      <div
        className="mt-4 pt-3 border-t border-gray-100 flex justify-between items-center cursor-pointer"
        onClick={toggle}
      >
        <p className="text-sm text-gray-500">Price Breakdown</p>
        {isOpen ? <ChevronUp size={16} /> : <ChevronDown size={16} />}
      </div>

      {isOpen && (
        <div className="mt-2 text-gray-600 text-sm space-y-1 pl-2">

          <div className="flex justify-between">
            <span>Base</span>
            <span>₹{itemSubtotal.toFixed(2)}</span>
          </div>

          <div className="flex justify-between">
            <span>GST</span>
            <span>₹{itemGst.toFixed(2)}</span>
          </div>

          <div className="flex justify-between font-bold text-gray-900 pt-1 border-t border-gray-50">
            <span>Total</span>
            <span>₹{Number(item.final_amount).toFixed(2)}</span>
          </div>
        </div>
      )}
    </motion.div>
  );
};

const SummaryLine = ({ label, value }) => (

  <div className="flex justify-between text-sm text-gray-500">

    <span>{label}</span>

    <span>₹{value}</span>

  </div>

);



export default CartDrawer;