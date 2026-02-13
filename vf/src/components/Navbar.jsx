import React, { useEffect, useState } from "react";
import { motion } from "framer-motion";
import { Rotate3D } from "lucide-react";
import { assets } from "../assets/assets";
import { useNavigate, useLocation } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import FloatingCartButton from "./FloatingCartButton";
import CartDrawer from "./CartDrawer";
import { useCart } from "../context/CartContext";

const Navbar = () => {
  const [showMobileMenu, setShowMobileMenu] = useState(false);
  const [isScrolled, setIsScrolled] = useState(false);
  const [showCoupon, setShowCoupon] = useState(true);
  const [coupon, setCoupon] = useState(null);
  const [cartOpen, setCartOpen] = useState(false);
  const [activeSection, setActiveSection] = useState("Header"); // Track active section

  const { cart } = useCart();
  const { user } = useAuth();
  const navigate = useNavigate();
  const location = useLocation();

  const isBannerVisible = coupon && showCoupon;

  /* ---------------- Scroll Background ---------------- */
  useEffect(() => {
    const handleScroll = () => setIsScrolled(window.scrollY > 40);
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  /* ---------------- Fetch Coupon ---------------- */
  useEffect(() => {
    const fetchCoupon = async () => {
      try {
        const res = await fetch(
          `${import.meta.env.VITE_API_URL}/get_active_coupon_for_user.php`,
          { credentials: "include" }
        );
        const data = await res.json();
        if (data.success) setCoupon(data.coupon);
      } catch (err) {
        console.error("Coupon fetch failed");
      }
    };
    fetchCoupon();
  }, []);

  /* ---------------- Scroll Helpers ---------------- */
  const scrollToSection = (id) => {
    const el = document.getElementById(id);
    if (el) {
      setActiveSection(id); // Set active state immediately on click
      el.scrollIntoView({ behavior: "smooth" });
    }
  };

  const handleNavClick = (id) => {
    setShowMobileMenu(false);

    // 1. Manually set the active section immediately for instant UI feedback
    setActiveSection(id);

    if (location.pathname !== "/") {
      navigate("/");
      setTimeout(() => {
        const el = document.getElementById(id);
        if (el) el.scrollIntoView({ behavior: "smooth" });
      }, 400);
    } else {
      const el = document.getElementById(id);
      if (el) el.scrollIntoView({ behavior: "smooth" });
    }
  };

  const handleVirtualOffice = () => {
    setShowMobileMenu(false);
    if (location.pathname !== "/virtual") {
      navigate("/virtual");
      setTimeout(() => scrollToSection("VirtualOfficeServices"), 400);
    } else {
      scrollToSection("VirtualOfficeServices");
    }
  };

  /* ---------------- IntersectionObserver for active section ---------------- */
  useEffect(() => {
    const sectionIds = ["Header", "About", "WorkSpaces", "Testimonials", "VirtualOfficeServices"];

    const observerOptions = {
      // rootMargin: Top Right Bottom Left
      // This tells the observer: "Only trigger when a section enters the top 30% of the viewport"
      rootMargin: "-20% 0px -70% 0px",
      threshold: 0
    };

    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          setActiveSection(entry.target.id);
        }
      });
    }, observerOptions);

    sectionIds.forEach((id) => {
      const el = document.getElementById(id);
      if (el) observer.observe(el);
    });

    return () => observer.disconnect();
  }, [location.pathname]);

  /* ---------------- Nav Items ---------------- */
  const navItems = [
    { label: "Home", action: () => handleNavClick("Header"), id: "Header" },
    { label: "About", action: () => handleNavClick("About"), id: "About" },
    { label: "WorkSpaces", action: () => handleNavClick("WorkSpaces"), id: "WorkSpaces" },
    { label: "Testimonials", action: () => handleNavClick("Testimonials"), id: "Testimonials" },
    { label: "Virtual Office", action: handleVirtualOffice, id: "VirtualOfficeServices" },
    {
      label: (
        <div className="flex items-center gap-2">
          <motion.div
            animate={{ rotate: 360 }}
            transition={{ duration: 4, ease: "linear", repeat: Infinity }}
          >
            <Rotate3D className="w-4 h-4" />
          </motion.div>
          <span>Virtual Tour</span>
        </div>
      ),
      action: () => {
        const baseUrl = import.meta.env.VITE_API_URL.replace("/api", "");
        window.open(`${baseUrl}/vtour/index.html`, "_blank");
      },
      isCTA: true,
    },
  ];

  return (
    <>
      {/* ---------------- Coupon Banner ---------------- */}
      {coupon && showCoupon && (
        <div className="fixed top-0 left-0 w-full z-[60] bg-gradient-to-r from-orange-500 to-orange-600 text-white px-4 py-2 text-sm font-semibold flex items-center justify-center text-center">
          🎉 Apply coupon{" "}
          <span className="underline mx-1">{coupon.coupon_code}</span>
          and get{" "}
          <span className="font-bold mx-1">{coupon.discount}% OFF</span>
          + ₹100 for Video Conferencing!
          <button
            onClick={() => setShowCoupon(false)}
            className="ml-4 text-white/80 hover:text-white text-lg"
          >
            ×
          </button>
        </div>
      )}

      {/* ---------------- Navbar ---------------- */}
      <div
        className={`fixed left-0 w-full z-50 transition-all duration-300 ${isBannerVisible ? "top-10" : "top-0"
          } ${isScrolled ? "bg-white/70 backdrop-blur-lg shadow-md" : "bg-transparent"
          }`}
      >
        <div className="max-w-7xl mx-auto flex items-center justify-between py-4 px-6 lg:px-12">
          {/* Logo */}
          <img
            src={assets.brandLogo}
            alt="Vayuhu Logo"
            className="w-32 cursor-pointer"
            onClick={() => {
              navigate("/");
              window.scrollTo({ top: 0, behavior: "smooth" });
            }}
          />

          {/* Desktop Nav */}
          <div className="hidden md:flex items-center gap-6">
            {/* Grouped nav items with border */}
            <div className="flex border border-orange-600 rounded-full overflow-hidden text-[15px] font-medium">
              {navItems.slice(0, 5).map((item, i) => (
                <button
                  key={i}
                  onClick={item.action}
                  className={`px-4 py-2 transition-colors duration-300 hover:bg-orange-600 hover:text-white ${i === 0 ? "rounded-l-full" : ""
                    } ${i === 4 ? "rounded-r-full" : ""} ${activeSection === item.id ? "bg-orange-600 text-white" : "text-orange-600"
                    }`}
                >
                  {item.label}
                </button>
              ))}
            </div>

            {/* Virtual Tour CTA */}
            {navItems[5] && (
              <motion.button
                onClick={navItems[5].action}
                whileHover={{ scale: 1.05 }}
                whileTap={{ scale: 0.95 }}
                className="ml-6 bg-gradient-to-r from-orange-500 to-orange-600 text-white font-semibold px-6 py-2.5 rounded-full shadow-md hover:shadow-lg transition-all duration-300 flex items-center gap-2"
              >
                {navItems[5].label}
              </motion.button>
            )}

            {/* Sign Up / Login CTA */}
            <motion.button
              onClick={() => navigate(user ? "/dashboard" : "/auth")}
              whileHover={{ scale: 1.05 }}
              whileTap={{ scale: 0.95 }}
              className="ml-6 bg-gradient-to-r from-orange-500 to-orange-600 text-white font-semibold px-6 py-2.5 rounded-full shadow-md hover:shadow-lg transition-all duration-300"
            >
              {user ? "My Account" : "Sign up / Login"}
            </motion.button>
          </div>

          {/* Mobile Menu Button */}
          <div className="md:hidden">
            <img
              src={assets.menu_icon}
              alt="menu"
              className="w-6 cursor-pointer"
              onClick={() => setShowMobileMenu(true)}
            />
          </div>
        </div>
      </div>

      {/* ---------------- Mobile Menu ---------------- */}
      <div
        className={`md:hidden fixed inset-0 z-[9999] bg-black/70 backdrop-blur-lg flex flex-col items-center justify-center transition-all duration-500 ${showMobileMenu ? "opacity-100 visible" : "opacity-0 invisible"
          }`}
      >
        <img
          src={assets.cross_icon}
          alt="close"
          className="absolute top-6 right-6 w-6 cursor-pointer"
          onClick={() => setShowMobileMenu(false)}
        />

        <ul className="flex flex-col gap-4 text-white text-lg font-medium">
          {/* Mobile grouped nav items */}
          {navItems.slice(0, 5).map((item, i) => (
            <button
              key={i}
              onClick={() => {
                setShowMobileMenu(false);
                item.action();
              }}
              className={`px-6 py-2 w-64 text-center border border-orange-600 rounded-full transition-colors duration-300 ${activeSection === item.id ? "bg-orange-600 text-white" : ""
                } hover:bg-orange-600 hover:text-white`}
            >
              {item.label}
            </button>
          ))}

          {/* Virtual Tour CTA */}
          {navItems[5] && (
            <motion.button
              onClick={() => {
                setShowMobileMenu(false);
                navItems[5].action();
              }}
              className="mt-4 bg-gradient-to-r from-orange-500 to-orange-600 text-white px-8 py-3 rounded-full font-semibold flex items-center justify-center gap-2"
            >
              {navItems[5].label}
            </motion.button>
          )}

          {/* Sign Up / Login CTA */}
          <motion.button
            onClick={() => {
              setShowMobileMenu(false);
              navigate(user ? "/dashboard" : "/auth");
            }}
            className="mt-4 bg-gradient-to-r from-orange-500 to-orange-600 text-white px-8 py-3 rounded-full font-semibold"
          >
            {user ? "My Account" : "Sign up / Login"}
          </motion.button>
        </ul>
      </div>

      {/* ---------------- Floating Cart ---------------- */}
      <div className="fixed bottom-10 right-6 z-[55]">
        <FloatingCartButton onClick={() => setCartOpen(true)} />
      </div>

      <CartDrawer open={cartOpen} onClose={() => setCartOpen(false)} />
    </>
  );
};

export default Navbar;
