import React, { useState } from "react";
import { NavLink } from "react-router-dom";
import {
  Home,
  Users,
  CalendarDays,
  FileText,
  ArrowLeft,
  X,
  LogOut,
  Building2,
  UserCircle,
  ChevronDown,
  ChevronRight,
  ClipboardList,
  PanelLeftClose,
  PanelLeftOpen,
} from "lucide-react";
import { assets } from "../assets/assets";
import { useAuth } from "../context/AuthContext";
import api from "../api/axios";

const Sidebar = ({ isOpen, setIsOpen, isCollapsed, setIsCollapsed }) => {
  const { logoutUser } = useAuth();

  const [isUsersOpen, setIsUsersOpen] = useState(false);
  const [isVisitorsOpen, setIsVisitorsOpen] = useState(false);

  const linkClasses = ({ isActive }) =>
    `flex items-center gap-3 px-4 py-2.5 rounded-xl font-medium text-sm transition-all duration-200
     ${isActive
      ? "bg-orange-500 text-white shadow-sm"
      : "text-gray-700 hover:bg-orange-100 hover:text-orange-600"
    }
     ${isCollapsed ? "lg:justify-center lg:px-2" : ""}`;

  const handleLogout = async () => {
    await api.post("/logout.php", {}, { withCredentials: true });
    logoutUser();
  };

  return (
    <aside
      className={`fixed top-0 left-0 z-40 h-screen bg-white border-r flex flex-col justify-between
      transform transition-all duration-300 ease-in-out
      ${isOpen ? "translate-x-0" : "-translate-x-full"}
      lg:translate-x-0 lg:static lg:shadow-none
      ${isCollapsed ? "lg:w-20" : "lg:w-64"} w-64`}
      aria-label="Sidebar"
    >
      {/* --- Desktop Collapse Toggle --- */}
      <button
        onClick={() => setIsCollapsed(!isCollapsed)}
        className="hidden lg:flex absolute -right-3 top-10 bg-orange-500 text-white rounded-full p-1 border-2 border-white z-50 hover:scale-110 shadow-md transition-transform"
      >
        {isCollapsed ? <PanelLeftOpen size={14} /> : <PanelLeftClose size={14} />}
      </button>

      {/* --- Mobile Close Button --- */}
      <button
        onClick={() => setIsOpen(false)}
        aria-label="Close sidebar"
        className="lg:hidden absolute top-4 right-4 text-gray-600 hover:text-orange-500"
      >
        <X size={22} />
      </button>

      {/* --- Header (Logo) --- */}
      <div className="flex items-center justify-center py-6 border-b bg-orange-50 lg:bg-white overflow-hidden">
        <img
          src={assets.brandLogo}
          alt="Vayuhu Logo"
          className={`transition-all duration-300 cursor-pointer ${isCollapsed ? "lg:w-8 w-32" : "w-32"}`}
          onClick={() => setIsOpen(false)}
        />
      </div>

      {/* --- Navigation --- */}
      <nav className="mt-6 space-y-1 px-2 flex-1 overflow-y-auto no-scrollbar">
        {/* Go Back */}
        <NavLink
          to="/"
          className={linkClasses}
          onClick={() => setIsOpen(false)}
        >
          <ArrowLeft size={18} />
          <span className={isCollapsed ? "lg:hidden block" : "block"}>Go Back To Website</span>
        </NavLink>

        {/* Dashboard */}
        <NavLink
          to="/dashboard"
          className={linkClasses}
          onClick={() => setIsOpen(false)}
        >
          <Home size={18} />
          <span className={isCollapsed ? "lg:hidden block" : "block"}>Dashboard</span>
        </NavLink>

        {/* --- Users with submenu --- */}
        <div>
          <button
            onClick={() => {
              if (isCollapsed) setIsCollapsed(false);
              setIsUsersOpen(!isUsersOpen);
            }}
            className={`flex items-center justify-between w-full px-4 py-2.5 rounded-xl font-medium text-sm text-gray-700 hover:bg-orange-100 hover:text-orange-600 transition-all duration-200
            ${isCollapsed ? "lg:justify-center lg:px-2" : ""}`}
          >
            <span className="flex items-center gap-3">
              <Users size={18} />
              <span className={isCollapsed ? "lg:hidden block" : "block"}>Users</span>
            </span>
            {!isCollapsed && (isUsersOpen ? <ChevronDown size={18} /> : <ChevronRight size={18} />)}
          </button>

          {isUsersOpen && !isCollapsed && (
            <div className="ml-8 mt-1 space-y-1">
              <NavLink to="/profile" className={linkClasses} onClick={() => setIsOpen(false)}>
                <UserCircle size={16} /> Profile
              </NavLink>
              <NavLink to="/company-profile" className={linkClasses} onClick={() => setIsOpen(false)}>
                <Building2 size={16} /> Company Profile
              </NavLink>
            </div>
          )}
        </div>

        {/* --- Reservations --- */}
        <NavLink to="/reservations" className={linkClasses} onClick={() => setIsOpen(false)}>
          <CalendarDays size={18} />
          <span className={isCollapsed ? "lg:hidden block" : "block"}>Reservations</span>
        </NavLink>

        {/* --- Visitors with submenu --- */}
        <div>
          <button
            onClick={() => {
              if (isCollapsed) setIsCollapsed(false);
              setIsVisitorsOpen(!isVisitorsOpen);
            }}
            className={`flex items-center justify-between w-full px-4 py-2.5 rounded-xl font-medium text-sm text-gray-700 hover:bg-orange-100 hover:text-orange-600 transition-all duration-200
            ${isCollapsed ? "lg:justify-center lg:px-2" : ""}`}
          >
            <span className="flex items-center gap-3">
              <FileText size={18} />
              <span className={isCollapsed ? "lg:hidden block" : "block"}>Visitors</span>
            </span>
            {!isCollapsed && (isVisitorsOpen ? <ChevronDown size={18} /> : <ChevronRight size={18} />)}
          </button>

          {isVisitorsOpen && !isCollapsed && (
            <div className="ml-8 mt-1 space-y-1">
              <NavLink to="/visitors" className={linkClasses} onClick={() => setIsOpen(false)}>
                <FileText size={16} /> Visitors
              </NavLink>
              <NavLink to="/visitors-details" className={linkClasses} onClick={() => setIsOpen(false)}>
                <ClipboardList size={16} /> Visitors Details
              </NavLink>
            </div>
          )}
        </div>
      </nav>

      {/* --- Footer --- */}
      <footer className="border-t bg-white">
        <button
          onClick={handleLogout}
          className={`w-full flex items-center justify-center gap-2 py-3 text-red-500 hover:bg-red-50 
          font-medium text-sm transition-all duration-200 ${isCollapsed ? "lg:px-0" : ""}`}
        >
          <LogOut size={18} />
          <span className={isCollapsed ? "lg:hidden block" : "block"}>Logout</span>
        </button>
      </footer>

      {!isCollapsed && (
        <div className="text-center text-xs text-gray-500 py-3">
          <p>Vayuhu © {new Date().getFullYear()}</p>
          <span className="text-orange-500">Built with passion for modern professionals.</span>
        </div>
      )}
    </aside>
  );
};

export default Sidebar;