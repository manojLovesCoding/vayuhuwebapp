import React, { useState, useEffect } from "react";
import { NavLink, useNavigate } from "react-router-dom";
import {
  LayoutDashboard,
  Users,
  FileText,
  X,
  LogOut,
  ChevronDown,
  ChevronRight,
  Building2,
  ArrowLeft,
  PlusCircle,
  List,
  Calendar,
  Users2,
  Gift,
  Mail,
  FilePlus,
  FileText as BlogText,
  CreditCard,
  Settings,
  BarChart3,
  PanelLeftClose,
  PanelLeftOpen,
} from "lucide-react";
import { assets } from "../assets/assets";
import { useAuth } from "../context/AuthContext";
import api from "../api/axios";

const AdminSidebar = ({ isOpen, setIsOpen, isCollapsed, setIsCollapsed }) => {
  const navigate = useNavigate();
  const { admin, logoutAdmin } = useAuth();

  const [submenus, setSubmenus] = useState(() => {
    return (
      JSON.parse(localStorage.getItem("adminSidebarState")) || {
        userMgmt: false,
        coupon: false,
        spaceMaster: false,
        contact: false,
        blog: false,
        virtualOffice: false,
      }
    );
  });

  useEffect(() => {
    localStorage.setItem("adminSidebarState", JSON.stringify(submenus));
  }, [submenus]);

  const toggleSubmenu = (key) => {
    if (isCollapsed) setIsCollapsed(false); // Expand if collapsed
    setSubmenus((prev) => ({ ...prev, [key]: !prev[key] }));
  };

  const linkClasses = ({ isActive }) =>
    `flex items-center gap-3 px-4 py-2.5 rounded-xl font-medium text-sm transition-all duration-200
     ${
       isActive
         ? "bg-orange-500 text-white shadow-sm"
         : "text-gray-700 hover:bg-orange-100 hover:text-orange-600"
     }
     ${isCollapsed ? "lg:justify-center lg:px-2" : ""}`;

  const handleLogout = async () => {
    await api.post("/logout.php", {}, { withCredentials: true });
    logoutAdmin();
  };

  const renderSubMenuButton = (label, Icon, key, children) => (
    <div>
      <button
        onClick={() => toggleSubmenu(key)}
        aria-expanded={submenus[key]}
        className={`flex items-center justify-between w-full px-4 py-2.5 rounded-xl font-medium text-sm text-gray-700 hover:bg-orange-100 hover:text-orange-600 transition-all duration-200
        ${isCollapsed ? "lg:justify-center lg:px-2" : ""}`}
      >
        <span className="flex items-center gap-3">
          <Icon size={18} /> 
          <span className={isCollapsed ? "lg:hidden block" : "block"}>{label}</span>
        </span>
        {!isCollapsed && (submenus[key] ? <ChevronDown size={18} /> : <ChevronRight size={18} />)}
      </button>
      {!isCollapsed && submenus[key] && <div className="ml-8 mt-1 space-y-1">{children}</div>}
    </div>
  );

  const handleLinkClick = () => {
    if (window.innerWidth < 1024) setIsOpen(false);
  };

  return (
    <aside
      className={`fixed top-0 left-0 z-40 h-screen bg-white border-r flex flex-col justify-between
      transform transition-all duration-300 ease-in-out
      ${isOpen ? "translate-x-0" : "-translate-x-full"}
      lg:translate-x-0 lg:static lg:shadow-none
      ${isCollapsed ? "lg:w-20" : "lg:w-64"} w-64`}
      aria-label="Admin Sidebar"
    >
      {/* Desktop Collapse Toggle */}
      <button
        onClick={() => setIsCollapsed(!isCollapsed)}
        className="hidden lg:flex absolute -right-3 top-10 bg-orange-500 text-white rounded-full p-1 border-2 border-white z-50 hover:scale-110 shadow-md"
      >
        {isCollapsed ? <PanelLeftOpen size={14} /> : <PanelLeftClose size={14} />}
      </button>

      <button
        onClick={() => setIsOpen(false)}
        aria-label="Close sidebar"
        className="lg:hidden absolute top-4 right-4 text-gray-600 hover:text-orange-500"
      >
        <X size={22} />
      </button>

      <div className="flex items-center justify-center py-6 border-b bg-orange-50 lg:bg-white overflow-hidden">
        <img
          src={assets.brandLogo}
          alt="Admin Logo"
          className={`transition-all duration-300 cursor-pointer ${isCollapsed ? "lg:w-8 w-32" : "w-32"}`}
          onClick={() => navigate("/admin")}
        />
      </div>

      <nav className="mt-6 space-y-1 px-2 flex-1 overflow-y-auto no-scrollbar">
        <NavLink to="/" className={linkClasses} onClick={handleLinkClick}>
          <ArrowLeft size={18} /> 
          <span className={isCollapsed ? "lg:hidden block" : "block"}>Back to Website</span>
        </NavLink>

        <NavLink to="/admin" end className={linkClasses} onClick={handleLinkClick}>
          <LayoutDashboard size={18} /> 
          <span className={isCollapsed ? "lg:hidden block" : "block"}>Dashboard</span>
        </NavLink>

        {renderSubMenuButton(
          "User Management",
          Users,
          "userMgmt",
          <>
            <NavLink to="/admin/add-user" className={linkClasses} onClick={handleLinkClick}>
              <PlusCircle size={16} /> Add User
            </NavLink>
            <NavLink to="/admin/user-list" className={linkClasses} onClick={handleLinkClick}>
              <List size={16} /> User List
            </NavLink>
          </>
        )}

        <NavLink to="/admin/reservations" className={linkClasses} onClick={handleLinkClick}>
          <Calendar size={18} /> 
          <span className={isCollapsed ? "lg:hidden block" : "block"}>Reservations</span>
        </NavLink>

        <NavLink to="/admin/occupancy" className={linkClasses} onClick={handleLinkClick}>
          <BarChart3 size={18} /> 
          <span className={isCollapsed ? "lg:hidden block" : "block"}>Occupancy</span>
        </NavLink>

        <NavLink to="/admin/visitorsOverview" className={linkClasses} onClick={handleLinkClick}>
          <Users2 size={18} /> 
          <span className={isCollapsed ? "lg:hidden block" : "block"}>Visitors</span>
        </NavLink>

        {renderSubMenuButton(
          "Coupon Codes",
          Gift,
          "coupon",
          <>
            <NavLink to="/admin/add-coupon" className={linkClasses} onClick={handleLinkClick}>
              <PlusCircle size={16} /> Add Coupon
            </NavLink>
            <NavLink to="/admin/coupon-list" className={linkClasses} onClick={handleLinkClick}>
              <List size={16} /> Coupon List
            </NavLink>
          </>
        )}

        {renderSubMenuButton(
          "Space Master",
          Building2,
          "spaceMaster",
          <>
            <NavLink to="/admin/add-space-master" className={linkClasses} onClick={handleLinkClick}>
              <PlusCircle size={16} /> Add Space Master
            </NavLink>
            <NavLink to="/admin/space-master-list" className={linkClasses} onClick={handleLinkClick}>
              <List size={16} /> Space Master List
            </NavLink>
          </>
        )}

        {renderSubMenuButton(
          "Contact Request",
          Mail,
          "contact",
          <>
            <NavLink to="/admin/add-contact" className={linkClasses} onClick={handleLinkClick}>
              <PlusCircle size={16} /> Add Contact
            </NavLink>
            <NavLink to="/admin/contact-list" className={linkClasses} onClick={handleLinkClick}>
              <List size={16} /> Contact Request List
            </NavLink>
          </>
        )}

        {renderSubMenuButton(
          "Blog",
          BlogText,
          "blog",
          <>
            <NavLink to="/admin/add-blog" className={linkClasses} onClick={handleLinkClick}>
              <FilePlus size={16} /> Add New Blog
            </NavLink>
            <NavLink to="/admin/blog-list" className={linkClasses} onClick={handleLinkClick}>
              <List size={16} /> View Blog List
            </NavLink>
          </>
        )}

        {renderSubMenuButton(
          "Virtual Office",
          CreditCard,
          "virtualOffice",
          <>
            <NavLink to="/admin/virtual-office-price" className={linkClasses} onClick={handleLinkClick}>
              <FileText size={16} /> Price
            </NavLink>
            <NavLink to="/admin/virtual-office-bookings" className={linkClasses} onClick={handleLinkClick}>
              <Calendar size={16} /> Bookings
            </NavLink>
            <NavLink to="/admin/virtual-office-enquiries" className={linkClasses} onClick={handleLinkClick}>
              <Mail size={16} /> Enquiries
            </NavLink>
          </>
        )}

        <NavLink to="/admin/settings" className={linkClasses} onClick={handleLinkClick}>
          <Settings size={18} /> 
          <span className={isCollapsed ? "lg:hidden block" : "block"}>Settings</span>
        </NavLink>
      </nav>

      <footer className="border-t bg-white">
        <button
          onClick={handleLogout}
          className={`w-full flex items-center justify-center gap-2 py-3 text-red-500 hover:bg-red-50 font-medium text-sm transition-all duration-200 
          ${isCollapsed ? "lg:px-0" : ""}`}
        >
          <LogOut size={18} /> 
          <span className={isCollapsed ? "lg:hidden block" : "block"}>Logout</span>
        </button>
      </footer>

      {!isCollapsed && (
        <div className="text-center text-xs text-gray-500 py-3">
          <p>Vayuhu Admin © {new Date().getFullYear()}</p>
          <span className="text-orange-500">Managing with clarity and control.</span>
        </div>
      )}
    </aside>
  );
};

export default AdminSidebar;