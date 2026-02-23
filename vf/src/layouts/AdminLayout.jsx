import React, { useState } from "react";
import { assets } from "../assets/assets";
import AdminSidebar from "./AdminSidebar";
import { Menu, Code, User } from "lucide-react";

const AdminLayout = ({ children }) => {
  const [sidebarOpen, setSidebarOpen] = useState(false);
  const [isCollapsed, setIsCollapsed] = useState(false); // New state for desktop collapse
  const [showDeveloper, setShowDeveloper] = useState(false);

  const toggleDeveloperCredit = () => {
    setShowDeveloper((prev) => !prev);
  };

  return (
    <div className="flex h-screen bg-gray-50 overflow-hidden">
      {/* Sidebar Container - Width changes only on Desktop via lg prefix */}
      <div
        className={`fixed inset-y-0 left-0 z-40 bg-white shadow-md
          transform transition-all duration-300 ease-in-out
          ${sidebarOpen ? "translate-x-0" : "-translate-x-full"}
          lg:translate-x-0 lg:static lg:shadow-none
          ${isCollapsed ? "lg:w-20" : "lg:w-64"} w-64`}
      >
        <AdminSidebar 
          isOpen={sidebarOpen} 
          setIsOpen={setSidebarOpen} 
          isCollapsed={isCollapsed} 
          setIsCollapsed={setIsCollapsed} 
        />
      </div>

      {sidebarOpen && (
        <div
          className="fixed inset-0 bg-black bg-opacity-40 z-30 lg:hidden"
          onClick={() => setSidebarOpen(false)}
        />
      )}

      <div className="flex flex-col flex-1 h-screen overflow-hidden">
        <header className="lg:hidden flex items-center justify-between px-4 py-3 border-b bg-white shadow-sm">
          <img src={assets.brandLogo} alt="Admin Logo" className="w-28 sm:w-32" />
          <button
            onClick={() => setSidebarOpen(true)}
            className="p-2 rounded-lg border border-gray-200 hover:bg-orange-50 text-gray-600 hover:text-orange-500"
          >
            <Menu className="w-6 h-6" />
          </button>
        </header>

        <main className="flex-1 overflow-y-auto p-6">
          <div className="max-w-[1400px] mx-auto">{children}</div>
        </main>

        <footer className="text-center py-3 text-xs text-orange-500 border-t border-gray-200 bg-white flex flex-col items-center gap-1">
          <div
            onClick={toggleDeveloperCredit}
            className="cursor-pointer select-none flex items-center gap-1 hover:text-orange-600 transition-all"
            title="Click to see personal developer credit"
          >
            <Code className="w-4 h-4 inline" />
            <span className="italic">Built by the Vayuhu Team</span>
          </div>

          {showDeveloper && (
            <span className="text-gray-500 italic mt-1 flex items-center gap-1">
              <User className="w-4 h-4 inline text-orange-500" />
              Design & Development by{" "}
              <span className="font-medium text-orange-500">
                Manoj Kumar P Vishwakarma
              </span>
            </span>
          )}
        </footer>
      </div>
    </div>
  );
};

export default AdminLayout;