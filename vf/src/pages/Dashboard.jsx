import React, { useEffect, useState } from "react";
import Layout from "../components/Layout";
import axios from "axios";

const Dashboard = () => {
  const [bookings, setBookings] = useState([]);
  const [summary, setSummary] = useState({
    total: 0,
    ongoing: 0,
    completed: 0,
    upcoming: 0,
  });
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

    const fetchDashboardData = async () => {
      try {
        const API_BASE = import.meta.env.VITE_API_URL;

        const response = await axios.post(
          `${API_BASE}/get_booking_summary.php`,
          { user_id: userId },
          { withCredentials: true }
        );

        if (!response.data.success) {
          throw new Error(response.data.message);
        }

        setBookings(response.data.bookings || []);
        setSummary(response.data.summary || {});
      } catch (err) {
        if (
          err.response?.status === 401 ||
          err.response?.status === 403
        ) {
          localStorage.removeItem("user");
          window.location.href = "/";
          return;
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

    fetchDashboardData();
  }, [userId]);

  const today = new Date().toISOString().split("T")[0];
  const todaysReservations = bookings.filter(
    (b) => b.start_date === today
  );

  /* ========= MOBILE CARD ========= */
  const renderMobileCards = (data) => (
    <div className="space-y-4 md:hidden mt-4">
      {data.length === 0 ? (
        <p className="text-center text-gray-500 py-6">
          No data available
        </p>
      ) : (
        data.map((b) => (
          <div
            key={b.booking_id}
            className="bg-white rounded-xl shadow p-4"
          >
            <div className="flex justify-between items-start">
              <h3 className="font-semibold text-gray-800">
                {b.workspace_title}
              </h3>
              <span
                className={`text-xs px-2 py-1 rounded ${b.status === "confirmed"
                  ? "bg-green-100 text-green-700"
                  : b.status === "cancelled"
                    ? "bg-red-100 text-red-700"
                    : "bg-yellow-100 text-yellow-700"
                  }`}
              >
                {b.status}
              </span>
            </div>

            <p className="text-xs text-gray-600 mt-2">
              <strong>Space:</strong> {b.space_code || "--"}
            </p>
            <p className="text-xs text-gray-600">
              <strong>Pack:</strong> {b.plan_type}
            </p>
            <p className="text-xs text-gray-600">
              <strong>Date:</strong> {b.start_date} - {b.end_date}
            </p>
            <p className="text-xs text-gray-600">
              <strong>Time:</strong>{" "}
              {b.start_time || "--"} - {b.end_time || "--"}
            </p>

            <div className="flex justify-between mt-3 font-medium">
              <span>Total</span>
              <span className="text-orange-600">
                ₹{b.final_amount}
              </span>
            </div>
          </div>
        ))
      )}
    </div>
  );

  /* ========= DESKTOP TABLE ========= */
  const renderDesktopTable = (data) => (
    <div className="hidden md:block bg-white rounded-2xl shadow p-4 mt-6">
      <div className="overflow-x-auto">
        <table className="min-w-full text-left border-collapse text-sm">
          <thead>
            <tr className="border-b bg-gray-50 text-gray-700">
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
                <th key={col} className="p-3 font-semibold">
                  {col}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {data.length === 0 ? (
              <tr>
                <td colSpan="10" className="text-center py-6 text-gray-500">
                  No data available
                </td>
              </tr>
            ) : (
              data.map((b, i) => (
                <tr key={b.booking_id} className="border-b hover:bg-gray-50">
                  <td className="p-3">{i + 1}</td>
                  <td className="p-3">{b.workspace_title}</td>
                  <td className="p-3">{b.space_code || "--"}</td>
                  <td className="p-3">{b.plan_type}</td>
                  <td className="p-3">
                    {b.start_date} - {b.end_date}
                  </td>
                  <td className="p-3">
                    {b.start_time || "--"} - {b.end_time || "--"}
                  </td>
                  <td className="p-3">₹{b.base_amount}</td>
                  <td className="p-3">₹{b.discount_amount}</td>
                  <td className="p-3 font-semibold">
                    ₹{b.final_amount}
                  </td>
                  <td className="p-3">
                    <span
                      className={`px-2 py-1 rounded text-xs ${b.status === "confirmed"
                        ? "bg-green-100 text-green-700"
                        : b.status === "cancelled"
                          ? "bg-red-100 text-red-700"
                          : "bg-yellow-100 text-yellow-700"
                        }`}
                    >
                      {b.status}
                    </span>
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>
    </div>
  );

  return (
    <Layout>
      <h1 className="text-xl md:text-2xl font-semibold mb-4 text-gray-800">
        Dashboard Overview
      </h1>

      {loading ? (
        <p className="text-center text-gray-500 p-6">Loading...</p>
      ) : error ? (
        <p className="text-center text-red-500 p-6">{error}</p>
      ) : (
        <>
          {/* 🔢 Stats Cards */}
          <div className="grid grid-cols-2 sm:grid-cols-2 md:grid-cols-4 gap-3 sm:gap-4 md:gap-6">
            {[
              { label: "Total Reservations", value: summary.total },
              { label: "Ongoing", value: summary.ongoing },
              { label: "Completed", value: summary.completed },
              { label: "Upcoming", value: summary.upcoming },
            ].map((stat) => (
              <div
                key={stat.label}
                className="
        bg-white
        rounded-2xl
        shadow
        p-3 sm:p-4 md:p-6
        flex flex-col
        items-center sm:items-start
        text-center sm:text-left
        hover:shadow-md
        transition
      "
              >
                <span className="text-xs sm:text-sm text-gray-500">
                  {stat.label}
                </span>

                <span className="mt-1 sm:mt-2 text-xl sm:text-2xl md:text-3xl font-bold text-orange-500">
                  {stat.value}
                </span>
              </div>
            ))}
          </div>


          {/* ===== TODAY ===== */}
          <h2 className="text-lg md:text-xl font-semibold mt-8 text-gray-700">
            Today’s Reservations
          </h2>
          {renderMobileCards(todaysReservations)}
          {renderDesktopTable(todaysReservations)}

          {/* ===== ALL ===== */}
          <h2 className="text-lg md:text-xl font-semibold mt-8 text-gray-700">
            All Reservations
          </h2>
          {renderMobileCards(bookings)}
          {renderDesktopTable(bookings)}
        </>
      )}
    </Layout>
  );
};

export default Dashboard;
