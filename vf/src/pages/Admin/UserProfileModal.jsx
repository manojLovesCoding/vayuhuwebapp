import React, { useState, useEffect, useRef } from "react";
import axios from "axios"; // Added for employee-specific calls
import { toast } from "react-toastify"; // Added for feedback

const API_BASE = import.meta.env.VITE_API_URL || "http://localhost/vayuhu_backend";

const UserProfileModal = ({ user, onClose, onSave }) => {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    phone: "",
    dob: "",
    address: "",
    password: "",
  });
  const [profilePic, setProfilePic] = useState(null);
  const [preview, setPreview] = useState(null);
  const fileInputRef = useRef(null);

  // --- New Employee States ---
  const [employees, setEmployees] = useState([]);
  const [newEmp, setNewEmp] = useState({
    employee_name: "",
    designation: "",
    email: "",
    phone: "",
  });
  const [isAddingEmployee, setIsAddingEmployee] = useState(false);

  useEffect(() => {
    if (user) {
      setFormData({
        name: user.name || "",
        email: user.email || "",
        phone: user.phone || "",
        dob: user.dob || "",
        address: user.address || "",
        password: "",
      });
      setPreview(user.profile_pic || null);
      fetchEmployees(); // Fetch linked employees on load
    }
  }, [user]);

  // --- New Employee Logic ---
  const fetchEmployees = async () => {
    try {
      const res = await axios.get(`${API_BASE}/get_employees.php?user_id=${user.id}`, {
        withCredentials: true,
      });
      setEmployees(res.data.employees || []);
    } catch (err) {
      console.error("Error fetching employees:", err);
    }
  };

  const handleAddEmployee = async (e) => {
    e.preventDefault();
    if (!newEmp.employee_name) return toast.warn("Employee name is required");

    try {
      const res = await axios.post(
        `${API_BASE}/add_employee.php`,
        { ...newEmp, user_id: user.id },
        { withCredentials: true }
      );
      if (res.data.success) {
        toast.success("Employee added successfully!");
        setNewEmp({ employee_name: "", designation: "", email: "", phone: "" });
        setIsAddingEmployee(false);
        fetchEmployees(); // Refresh the list
      }
    } catch (err) {
      toast.error("Failed to add employee");
    }
  };

  const handleEmpChange = (e) => {
    const { name, value } = e.target;
    setNewEmp((prev) => ({ ...prev, [name]: value }));
  };

  // --- Existing Logic ---
  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prev) => ({ ...prev, [name]: value }));
  };

  const handleProfileClick = () => {
    fileInputRef.current.click();
  };

  const handleFileChange = (e) => {
    const file = e.target.files[0];
    if (file) {
      setProfilePic(file);
      const reader = new FileReader();
      reader.onloadend = () => {
        setPreview(reader.result);
      };
      reader.readAsDataURL(file);
    }
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const updatedData = { ...formData };
    if (profilePic) updatedData.profilePic = profilePic;
    onSave(updatedData);
  };

  if (!user) return null;

  return (
    <div className="fixed inset-0 bg-black bg-opacity-40 flex items-center justify-center z-50 p-4">
      <div className="bg-white w-full max-w-2xl rounded-lg shadow-lg overflow-hidden animate-fadeIn max-h-[90vh] flex flex-col">
        {/* Header */}
        <div className="flex justify-between items-center border-b px-6 py-3 bg-orange-50 sticky top-0 z-10">
          <h2 className="text-lg font-semibold text-gray-700">User Details & Team</h2>
          <button
            onClick={onClose}
            className="text-gray-500 hover:text-orange-500 text-2xl leading-none"
          >
            ×
          </button>
        </div>

        {/* Scrollable Content Container */}
        <div className="overflow-y-auto">
          {/* Main User Form */}
          <form onSubmit={handleSubmit} className="p-6 grid grid-cols-1 md:grid-cols-2 gap-4">
            {/* Profile Picture Section */}
            <div className="col-span-1 flex flex-col items-center justify-center mb-4 md:mb-0">
              <div
                onClick={handleProfileClick}
                className="relative w-28 h-28 rounded-full border-2 border-orange-400 flex items-center justify-center bg-gray-50 text-gray-400 text-5xl cursor-pointer hover:opacity-80 transition"
              >
                {preview ? (
                  <img
                    src={preview}
                    alt="Profile Preview"
                    className="w-full h-full rounded-full object-cover"
                  />
                ) : (
                  "👤"
                )}
                <div className="absolute bottom-0 right-0 bg-orange-500 text-white text-xs rounded-full px-1.5 py-0.5 shadow-md">
                  Edit
                </div>
              </div>
              <input
                type="file"
                accept="image/*"
                ref={fileInputRef}
                onChange={handleFileChange}
                className="hidden"
              />
              <p className="text-xs text-gray-500 mt-1">Click to change photo</p>
            </div>

            <div className="flex flex-col col-span-1 md:col-span-2">
              <label className="text-sm font-medium text-gray-600 mb-1">
                Name <span className="text-red-500">*</span>
              </label>
              <input
                type="text"
                name="name"
                value={formData.name}
                onChange={handleChange}
                className="border border-orange-400 rounded px-3 py-2 focus:outline-none focus:ring-1 focus:ring-orange-400"
                required
              />
            </div>

            <div className="flex flex-col">
              <label className="text-sm font-medium text-gray-600 mb-1">Email</label>
              <input
                type="email"
                name="email"
                value={formData.email}
                onChange={handleChange}
                className="border border-orange-400 rounded px-3 py-2 focus:outline-none focus:ring-1 focus:ring-orange-400"
              />
            </div>

            <div className="flex flex-col">
              <label className="text-sm font-medium text-gray-600 mb-1">
                Phone (IND) <span className="text-red-500">*</span>
              </label>
              <input
                type="tel"
                name="phone"
                value={formData.phone}
                onChange={handleChange}
                className="border border-orange-400 rounded px-3 py-2 focus:outline-none focus:ring-1 focus:ring-orange-400"
                required
              />
            </div>

            <div className="flex flex-col">
              <label className="text-sm font-medium text-gray-600 mb-1">
                Date of Birth <span className="text-red-500">*</span>
              </label>
              <input
                type="date"
                name="dob"
                value={formData.dob}
                onChange={handleChange}
                className="border border-orange-400 rounded px-3 py-2 focus:outline-none focus:ring-1 focus:ring-orange-400"
                required
              />
            </div>

            <div className="flex flex-col">
              <label className="text-sm font-medium text-gray-600 mb-1">
                Address <span className="text-red-500">*</span>
              </label>
              <textarea
                name="address"
                value={formData.address}
                onChange={handleChange}
                placeholder="Enter Address"
                className="border border-orange-400 rounded px-3 py-2 focus:outline-none focus:ring-1 focus:ring-orange-400 resize-none"
                rows="2"
                required
              />
            </div>

            <div className="flex flex-col col-span-1 md:col-span-2">
              <label className="text-sm font-medium text-gray-600 mb-1">Password</label>
              <input
                type="password"
                name="password"
                value={formData.password}
                onChange={handleChange}
                placeholder="Enter password to change"
                className="border border-orange-400 rounded px-3 py-2 focus:outline-none focus:ring-1 focus:ring-orange-400"
              />
            </div>

            <div className="col-span-1 md:col-span-2 flex justify-end gap-3 border-b pb-6">
              <button
                type="submit"
                className="px-4 py-2 bg-orange-500 text-white rounded hover:bg-orange-600"
              >
                Update Profile
              </button>
            </div>
          </form>

          {/* --- Employee Management Section --- */}
          <div className="p-6 bg-gray-50">
            <div className="flex justify-between items-center mb-4">
              <h3 className="text-lg font-semibold text-gray-700">Team Members</h3>
              <button
                type="button"
                onClick={() => setIsAddingEmployee(!isAddingEmployee)}
                className="text-sm bg-orange-100 text-orange-600 px-3 py-1 rounded-full font-medium hover:bg-orange-200 transition"
              >
                {isAddingEmployee ? "Cancel" : "+ Add Employee"}
              </button>
            </div>

            {isAddingEmployee && (
              <div className="bg-white p-4 rounded border border-orange-200 shadow-sm mb-4 animate-fadeIn">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                  <input
                    name="employee_name"
                    placeholder="Name"
                    value={newEmp.employee_name}
                    onChange={handleEmpChange}
                    className="border p-2 rounded text-sm focus:ring-1 focus:ring-orange-400 outline-none"
                  />
                  <input
                    name="designation"
                    placeholder="Designation"
                    value={newEmp.designation}
                    onChange={handleEmpChange}
                    className="border p-2 rounded text-sm focus:ring-1 focus:ring-orange-400 outline-none"
                  />
                  <input
                    name="email"
                    placeholder="Email"
                    value={newEmp.email}
                    onChange={handleEmpChange}
                    className="border p-2 rounded text-sm focus:ring-1 focus:ring-orange-400 outline-none"
                  />
                  <input
                    name="phone"
                    placeholder="Phone"
                    value={newEmp.phone}
                    onChange={handleEmpChange}
                    className="border p-2 rounded text-sm focus:ring-1 focus:ring-orange-400 outline-none"
                  />
                </div>
                <button
                  onClick={handleAddEmployee}
                  className="mt-3 w-full bg-green-500 text-white py-2 rounded text-sm font-semibold hover:bg-green-600 transition"
                >
                  Save Team Member
                </button>
              </div>
            )}

            <div className="space-y-3">
              {employees.length > 0 ? (
                employees.map((emp) => (
                  <div
                    key={emp.id}
                    className="flex justify-between items-center bg-white p-3 rounded border border-gray-200 shadow-sm hover:border-orange-300 transition"
                  >
                    <div>
                      <p className="font-semibold text-gray-800">{emp.employee_name}</p>
                      <p className="text-xs text-gray-500">
                        {emp.designation} • {emp.phone || "No Phone"}
                      </p>
                    </div>
                  </div>
                ))
              ) : (
                <p className="text-center text-gray-400 text-sm py-4">
                  No employees found for this user.
                </p>
              )}
            </div>
          </div>
        </div>

        {/* Footer */}
        <div className="p-4 border-t bg-gray-100 flex justify-end">
          <button
            type="button"
            onClick={onClose}
            className="px-6 py-2 rounded border border-gray-300 bg-white hover:bg-gray-100 transition"
          >
            Close
          </button>
        </div>
      </div>
    </div>
  );
};

export default UserProfileModal;