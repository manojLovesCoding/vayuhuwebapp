import React, { useEffect, useState } from "react";
import Layout from "../components/Layout";
import axios from "axios";

const Reservations = () => {
  const [bookings, setBookings] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  const user = JSON.parse(localStorage.getItem("user"));
  const userId = user?.id;

  useEffect(() => {
    if (!userId) {
      setError("No user logged in.");
      setLoading(false);
      return;
    }

    const fetchBookings = async () => {
      try {
        const API_BASE = import.meta.env.VITE_API_URL;

        const response = await axios.post(
          `${API_BASE}/get_workspace_bookings.php`,
          { user_id: userId },
          { withCredentials: true }
        );

        if (!response.data.success) {
          throw new Error(response.data.message);
        }

        setBookings(response.data.bookings || []);
      } catch (err) {
        if (err.response?.status === 401) {
          window.dispatchEvent(new Event("logout"));
        }

        setError(
          err.response?.data?.message ||
          err.message ||
          "Something went wrong"
        );
      } finally {
        setLoading(false);
      }
    };

    fetchBookings();
  }, [userId]);

  return (
    <Layout>
      <h1 className="text-xl md:text-2xl font-semibold mb-4 text-gray-800">
        All Reservations
      </h1>

      <div className="bg-white p-4 md:p-6 rounded-2xl shadow text-sm">
        {loading && (
          <p className="text-center p-4">Loading reservations...</p>
        )}

        {error && (
          <p className="text-center p-4 text-red-500">{error}</p>
        )}

        {/* ===== MOBILE VIEW (CARDS) ===== */}
        {!loading && !error && (
          <div className="space-y-4 md:hidden">
            {bookings.length === 0 ? (
              <p className="text-center text-gray-500">
                No reservations found
              </p>
            ) : (
              bookings.map((booking, index) => (
                <div
                  key={booking.booking_id}
                  className="border rounded-xl p-4 shadow-sm"
                >
                  <div className="flex justify-between items-start mb-2">
                    <h3 className="font-semibold text-gray-800">
                      {booking.workspace_title}
                    </h3>
                    <span
                      className={`text-xs px-2 py-1 rounded ${
                        booking.status === "confirmed"
                          ? "bg-green-100 text-green-700"
                          : booking.status === "cancelled"
                          ? "bg-red-100 text-red-700"
                          : "bg-yellow-100 text-yellow-700"
                      }`}
                    >
                      {booking.status}
                    </span>
                  </div>

                  <p className="text-gray-600 text-xs mb-1">
                    <strong>Space:</strong>{" "}
                    {booking.seat_codes || booking.space_code}
                  </p>

                  <p className="text-gray-600 text-xs mb-1">
                    <strong>Pack:</strong> {booking.plan_type}
                  </p>

                  <p className="text-gray-600 text-xs mb-1">
                    <strong>Date:</strong>{" "}
                    {booking.start_date} - {booking.end_date}
                  </p>

                  <p className="text-gray-600 text-xs mb-1">
                    <strong>Time:</strong>{" "}
                    {booking.start_time || "--"} -{" "}
                    {booking.end_time || "--"}
                  </p>

                  <div className="flex justify-between mt-3 text-sm font-medium">
                    <span>Total</span>
                    <span className="text-orange-600">
                      ₹{booking.final_amount}
                    </span>
                  </div>
                </div>
              ))
            )}
          </div>
        )}

        {/* ===== DESKTOP VIEW (TABLE) ===== */}
        {!loading && !error && (
          <div className="hidden md:block overflow-x-auto">
            <table className="w-full border-collapse text-sm">
              <thead className="bg-orange-100 text-gray-700">
                <tr>
                  {[
                    "S.No.",
                    "Space",
                    "Space Code",
                    "Pack",
                    "Date",
                    "Timings",
                    "Amount",
                    "Discount",
                    "Final Total",
                    "Status",
                  ].map((col) => (
                    <th key={col} className="p-2 border text-left">
                      {col}
                    </th>
                  ))}
                </tr>
              </thead>

              <tbody>
                {bookings.length === 0 ? (
                  <tr>
                    <td colSpan="10" className="text-center p-4 text-gray-500">
                      No reservations found
                    </td>
                  </tr>
                ) : (
                  bookings.map((booking, index) => (
                    <tr
                      key={booking.booking_id}
                      className="hover:bg-gray-50"
                    >
                      <td className="p-2 border">{index + 1}</td>
                      <td className="p-2 border">
                        {booking.workspace_title}
                      </td>

                      <td className="p-2 border">
                        {booking.seat_codes ? (
                          <span className="bg-orange-50 text-orange-700 px-2 py-0.5 rounded border border-orange-100 font-medium">
                            {booking.seat_codes}
                          </span>
                        ) : (
                          booking.space_code
                        )}
                      </td>

                      <td className="p-2 border">
                        {booking.plan_type}
                      </td>

                      <td className="p-2 border">
                        {booking.start_date} - {booking.end_date}
                      </td>

                      <td className="p-2 border">
                        {booking.start_time || "--"} -{" "}
                        {booking.end_time || "--"}
                      </td>

                      <td className="p-2 border">
                        ₹{booking.base_amount}
                      </td>

                      <td className="p-2 border">
                        ₹{booking.discount_amount}
                      </td>

                      <td className="p-2 border font-semibold">
                        ₹{booking.final_amount}
                      </td>

                      <td className="p-2 border">
                        <span
                          className={`px-2 py-1 rounded text-xs ${
                            booking.status === "confirmed"
                              ? "bg-green-100 text-green-700"
                              : booking.status === "cancelled"
                              ? "bg-red-100 text-red-700"
                              : "bg-yellow-100 text-yellow-700"
                          }`}
                        >
                          {booking.status}
                        </span>
                      </td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </Layout>
  );
};

export default Reservations;
