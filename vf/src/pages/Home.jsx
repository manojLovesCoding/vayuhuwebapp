import React, { useEffect } from "react";
import { useLocation } from "react-router-dom";
import About from "../components/About";
import Projects from "../components/Projects";
import Testimonials from "../components/Testimonails";
import Team from "../components/Team";
import Contact from "../components/Contact";
import Footer from "../components/Footer";
import WorkspacePricing from "../components/WorkspacePricing";
import Amenities from "../components/Amenities";

const Home = () => {
  const location = useLocation();

  useEffect(() => {
    const sectionId = location.state?.scrollTo;
    if (sectionId) {
      const el = document.getElementById(sectionId);
      if (el) el.scrollIntoView({ behavior: "smooth" });
    }
  }, [location]);

  return (
    <>
      <section className="bg-white">
        <About />
      </section>

      <section className="bg-gray-50">
        <Amenities />
      </section>

      <section className="bg-gradient-to-b from-orange-50 via-white to-orange-50">
        <WorkspacePricing />
      </section>

      <section className="bg-gray-900 text-white">
        <Testimonials />
      </section>

      <section className="bg-white">
        <Contact />
      </section>

      <Footer />
    </>
  );
};

export default Home;