import React, { useState, useEffect, useRef } from "react";
import axios from "axios";
import { toast } from "react-toastify";

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

  const [employees, setEmployees] = useState([]);
  const [newEmp, setNewEmp] = useState({
    employee_name: "",
    designation: "",
    email: "",
    phone: "",
  });
  const [isAddingEmployee, setIsAddingEmployee] = useState(false);
  const [editingEmp, setEditingEmp] = useState(null);

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
      fetchEmployees();
    }
  }, [user]);

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
      let res;

      if (editingEmp) {
        res = await axios.post(
          `${API_BASE}/update_employee.php`,
          { ...newEmp, id: editingEmp.id },
          { withCredentials: true }
        );
      } else {
        res = await axios.post(
          `${API_BASE}/add_employee.php`,
          { ...newEmp, user_id: user.id },
          { withCredentials: true }
        );
      }

      if (res.data.success) {
        toast.success(editingEmp ? "Employee updated!" : "Employee added!");
        setNewEmp({ employee_name: "", designation: "", email: "", phone: "" });
        setEditingEmp(null);
        setIsAddingEmployee(false);
        fetchEmployees();
      }
    } catch (err) {
      toast.error("Operation failed");
    }
  };

  const handleEditEmployee = (emp) => {
    setEditingEmp(emp);
    setNewEmp(emp);
    setIsAddingEmployee(true);
  };

  const handleDeleteEmployee = async (id) => {
    if (!window.confirm("Delete this employee?")) return;

    try {
      const res = await axios.post(
        `${API_BASE}/delete_employee.php`,
        { id },
        { withCredentials: true }
      );
      if (res.data.success) {
        toast.success("Employee deleted");
        fetchEmployees();
      }
    } catch (err) {
      toast.error("Delete failed");
    }
  };

  const handleEmpChange = (e) => {
    const { name, value } = e.target;
    setNewEmp((prev) => ({ ...prev, [name]: value }));
  };

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
      reader.onloadend = () => setPreview(reader.result);
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
          <button onClick={onClose} className="text-gray-500 hover:text-orange-500 text-2xl leading-none">×</button>
        </div>

        <div className="overflow-y-auto">

          {/* User Form */}
          <form onSubmit={handleSubmit} className="p-6 grid grid-cols-1 md:grid-cols-2 gap-4">

            {/* Profile Picture */}
            <div className="col-span-1 flex flex-col items-center justify-center mb-4 md:mb-0">
              <div
                onClick={handleProfileClick}
                className="relative w-28 h-28 rounded-full border-2 border-orange-400 flex items-center justify-center bg-gray-50 text-gray-400 text-5xl cursor-pointer hover:bg-orange-50 transition"
              >
                {preview ? (
                  <img src={preview} className="w-full h-full rounded-full object-cover" />
                ) : "👤"}
              </div>
              <input type="file" ref={fileInputRef} onChange={handleFileChange} className="hidden" />
            </div>

            {/* Form Inputs */}
            <input
              name="name"
              value={formData.name}
              onChange={handleChange}
              placeholder="Full Name"
              className="border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-400"
            />
            <input
              name="email"
              value={formData.email}
              onChange={handleChange}
              placeholder="Email"
              className="border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-400"
            />
            <input
              name="phone"
              value={formData.phone}
              onChange={handleChange}
              placeholder="Phone"
              className="border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-400"
            />
            <input
              name="dob"
              value={formData.dob}
              onChange={handleChange}
              type="date"
              className="border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-400"
            />
            <textarea
              name="address"
              value={formData.address}
              onChange={handleChange}
              placeholder="Address"
              className="border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-400 col-span-1 md:col-span-2"
            />
            <input
              name="password"
              value={formData.password}
              onChange={handleChange}
              type="password"
              placeholder="Password"
              className="border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-400"
            />

            <button
              type="submit"
              className="bg-orange-400 text-white rounded px-4 py-2 hover:bg-orange-500 transition col-span-1 md:col-span-2"
            >
              Update Profile
            </button>
          </form>

          {/* Employees Section */}
          <div className="p-6 bg-gray-50">

            <div className="flex justify-between items-center mb-4">
              <h3 className="text-lg font-semibold text-gray-700">Team Members</h3>
              <button
                onClick={() => {
                  setIsAddingEmployee(!isAddingEmployee);
                  setEditingEmp(null);
                }}
                className="text-white bg-blue-500 px-3 py-1 rounded hover:bg-blue-600 transition"
              >
                {isAddingEmployee ? "Cancel" : "+ Add Employee"}
              </button>
            </div>

            {isAddingEmployee && (
              <div className="bg-white p-4 rounded mb-4 shadow-sm">
                <div className="grid grid-cols-2 gap-2 mb-2">
                  <input
                    name="employee_name"
                    value={newEmp.employee_name}
                    onChange={handleEmpChange}
                    placeholder="Name"
                    className="border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400"
                  />
                  <input
                    name="designation"
                    value={newEmp.designation}
                    onChange={handleEmpChange}
                    placeholder="Designation"
                    className="border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400"
                  />
                  <input
                    name="email"
                    value={newEmp.email}
                    onChange={handleEmpChange}
                    placeholder="Email"
                    className="border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400"
                  />
                  <input
                    name="phone"
                    value={newEmp.phone}
                    onChange={handleEmpChange}
                    placeholder="Phone"
                    className="border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400"
                  />
                </div>
                <button
                  onClick={handleAddEmployee}
                  className="bg-green-500 text-white rounded px-4 py-2 hover:bg-green-600 transition"
                >
                  {editingEmp ? "Update Employee" : "Save Employee"}
                </button>
              </div>
            )}

            {/* Employee List */}
            <div className="space-y-3">
              {employees.length > 0 ? (
                employees.map((emp) => (
                  <div
                    key={emp.id}
                    className="flex justify-between items-center bg-white p-3 rounded shadow-sm hover:bg-gray-50 transition"
                  >
                    <div>
                      <p className="font-semibold">{emp.employee_name}</p>
                      <p className="text-xs text-gray-500">{emp.designation} • {emp.phone || "No Phone"}</p>
                    </div>
                    <div className="flex gap-3">
                      <button
                        onClick={() => handleEditEmployee(emp)}
                        className="text-blue-500 text-sm hover:underline"
                      >
                        Edit
                      </button>
                      <button
                        onClick={() => handleDeleteEmployee(emp.id)}
                        className="text-red-500 text-sm hover:underline"
                      >
                        Delete
                      </button>
                    </div>
                  </div>
                ))
              ) : (
                <p className="text-center text-gray-400 text-sm py-4">No employees found.</p>
              )}
            </div>
          </div>
        </div>

        {/* Footer */}
        <div className="p-4 border-t flex justify-end">
          <button
            onClick={onClose}
            className="bg-gray-200 hover:bg-gray-300 text-gray-700 rounded px-4 py-2 transition"
          >
            Close
          </button>
        </div>
      </div>
    </div>
  );
};

export default UserProfileModal;