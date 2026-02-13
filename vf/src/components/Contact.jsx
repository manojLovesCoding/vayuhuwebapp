import React, { useState } from "react";
import { toast } from "react-toastify";
import { motion } from "framer-motion";

const Contact = () => {
  const [result, setResult] = useState("");
  const [errors, setErrors] = useState({}); // Track field errors

  const API_URL =
    import.meta.env.VITE_CONTACT_API_URL || "https://api.web3forms.com/submit";
  const ACCESS_KEY =
    import.meta.env.VITE_CONTACT_ACCESS_KEY || "your-default-access-key";

  // Validation logic
  const validateForm = (formData) => {
    const newErrors = {};

    const name = formData.get("Name").trim();
    if (name.length < 2) newErrors.Name = "Name must be at least 2 characters";

    const email = formData.get("Email").trim();
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) newErrors.Email = "Invalid email address";

    const phone = formData.get("Phone").trim();
    const phoneRegex = /^[0-9+\s()-]{7,15}$/;
    if (!phoneRegex.test(phone)) newErrors.Phone = "Invalid phone number";

    // Removed message validation
    // const message = formData.get("Message").trim();
    // if (message.length < 10) newErrors.Message = "Message must be at least 10 characters";

    return newErrors;
  };


  const onSubmit = async (event) => {
    event.preventDefault();
    setResult("Sending...");

    const formData = new FormData(event.target);

    // Run validation
    const newErrors = validateForm(formData);
    setErrors(newErrors); // Update state for red border highlighting

    if (Object.keys(newErrors).length > 0) {
      Object.values(newErrors).forEach((err) => toast.error(err));
      setResult("");
      return;
    }

    formData.append("access_key", ACCESS_KEY);

    try {
      const response = await fetch(API_URL, {
        method: "POST",
        body: formData,
      });

      const data = await response.json();

      if (data.success) {
        setResult("");
        toast.success("Message sent successfully!");
        setErrors({});
        event.target.reset();
      } else {
        toast.error(data.message || "Failed to send. Please try again.");
        setResult("");
      }
    } catch (error) {
      console.error("Contact form error:", error);
      toast.error("⚠️ Network error. Please try again later.");
      setResult("");
    }
  };

  // Dynamic class for invalid fields
  const getInputClass = (field) =>
    `w-full border rounded-xl py-3 px-4 outline-none transition focus:ring-1 ${errors[field]
      ? "border-red-500 focus:border-red-500 focus:ring-red-500"
      : "border-gray-300 focus:border-orange-500 focus:ring-orange-500"
    }`;

  return (
    <motion.div
      id="Contact"
      initial={{ opacity: 0, y: 80 }}
      whileInView={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.8, ease: "easeOut" }}
      viewport={{ once: true }}
      className="text-center px-6 py-20 lg:px-32 bg-white overflow-hidden"
    >
      <h1 className="text-3xl sm:text-4xl font-bold mb-3">
        Get in <span className="text-orange-500">Touch</span>
      </h1>
      <p className="text-gray-500 mb-12 max-w-md mx-auto">
        Have questions or want to book your workspace? Let’s connect and make
        something amazing together.
      </p>

      <form
        onSubmit={onSubmit}
        className="max-w-2xl mx-auto text-gray-700 pt-4"
      >
        {/* Name */}
        <div className="text-left mb-6">
          <label className="block font-medium mb-2">Your Name</label>
          <input
            className={getInputClass("Name")}
            type="text"
            name="Name"
            placeholder="Enter your full name"
            required
          />
        </div>

        {/* Email & Phone */}
        <div className="flex flex-wrap gap-6">
          <div className="w-full md:flex-1 text-left">
            <label className="block font-medium mb-2">Your Email</label>
            <input
              className={getInputClass("Email")}
              type="email"
              name="Email"
              placeholder="example@domain.com"
              required
            />
          </div>

          <div className="w-full md:flex-1 text-left">
            <label className="block font-medium mb-2">Phone Number</label>
            <input
              className={getInputClass("Phone")}
              type="tel"
              name="Phone"
              placeholder="+91 91111 11111"
              required
            />
          </div>
        </div>

        {/* Message */}
        <div className="my-6 text-left">
          <label className="block font-medium mb-2">Message</label>
          <textarea
            className={getInputClass("Message") + " h-40 resize-none"}
            name="Message"
            placeholder="Write your message here..."
            required
          ></textarea>
        </div>

        {/* Submit Button */}
        <button
          type="submit"
          className="bg-orange-500 hover:bg-orange-600 text-white font-medium py-3 px-10 rounded-xl shadow-md transition-all duration-200"
        >
          {result ? result : "Send Message"}
        </button>
      </form>

      <div className="mt-10 text-sm text-gray-500">
        📍 25 Kalpana Chawla Road, Bangalore 560094 <br />
        📧 support@vayuhu.com | ☎️ +91 73488 57574
      </div>
    </motion.div>
  );
};

export default Contact;
