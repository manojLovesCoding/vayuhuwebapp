import React, { useEffect } from "react";
import { motion } from "framer-motion";

const Testimonials = () => {
  useEffect(() => {
    const script = document.createElement("script");
    script.src = "https://elfsightcdn.com/platform.js";
    script.async = true;
    document.body.appendChild(script);

    return () => {
      document.body.removeChild(script);
    };
  }, []);

  return (
    <motion.section
      id="Testimonials"
      initial={{ opacity: 0, y: 60 }}
      whileInView={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.8 }}
      viewport={{ once: true }}
      className="bg-gradient-to-b from-orange-50 to-white py-20 px-6 md:px-20 lg:px-32"
    >
      {/* Section Header */}
      <div className="text-center mb-16">
        <h6 className="uppercase text-orange-500 tracking-widest font-semibold">
          Voices of Our Community
        </h6>
        <h2 className="text-3xl sm:text-5xl font-bold text-gray-800 mt-3">
          What Our Members Say
        </h2>
      </div>

      {/* Elfsight Google Reviews Widget */}
      <div className="relative overflow-hidden">
        <div
          className="elfsight-app-1c1cbd27-a8cc-4922-a749-1ee7748fe275"
          data-elfsight-app-lazy
        ></div>

        {/* Overlay to hide "Free Google Reviews Widget" */}
        <div className="absolute bottom-0 left-0 w-full h-10 bg-white z-50"></div>
      </div>
    </motion.section>
  );
};

export default Testimonials;
