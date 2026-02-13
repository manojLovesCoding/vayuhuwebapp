import React, { useEffect, useRef, useState } from "react";
import { motion, AnimatePresence } from "framer-motion";
import { Star, X } from "lucide-react";

const reviews = [
  {
    name: "Amith K",
    time: "1 month ago",
    review:
      "Good workspaces with peaceful and productive environment. The ambience is very calm and perfect for focused work.",
    ownerReply:
      "Thank you Amith for your kind words! We're happy to know you enjoy the peaceful and productive atmosphere. We look forward to supporting your continued success at Vayuhu.",
  },
  {
    name: "Santhosh Kumar",
    time: "2 months ago",
    review:
      "After looking at around 6 co-working spaces in Bangalore North we zeroed down on Vayuhu because of its Ambience and Work Environment which comes at a meager price when compared to the Market! I would definitely recommend this Working Space!",
    ownerReply:
      "Thank you so much Santhosh! We're glad you chose us after exploring multiple options. Providing great value with a positive work environment is always our priority.",
  },
  {
    name: "Vinod K S",
    time: "5 months ago",
    review:
      "Good work environment and supportive staff. Highly recommended.",
    ownerReply:
      "We truly appreciate your recommendation, Vinod! Our team is always here to ensure you have a smooth and comfortable experience.",
  },
  {
    name: "Sachin S",
    time: "3 months ago",
    review:
      "Nice co-working place with good amenities. Internet speed and meeting rooms are well maintained.",
    ownerReply:
      "Thank you Sachin! We're happy that you liked our amenities and infrastructure. We continuously work to maintain high standards for our members.",
  },
  {
    name: "Rashnee Chawla",
    time: "6 months ago",
    review:
      "A clean and organized co-working space with a very supportive team. The staff is responsive and helpful.",
    ownerReply:
      "Thank you Rashnee! Cleanliness and member support are extremely important to us. We appreciate your feedback and support.",
  },
  {
    name: "Dheemanth Adiga",
    time: "5 months ago",
    review:
      "I've had a good experience working at Vayuhu Co-working Space. The atmosphere is motivating and professional.",
    ownerReply:
      "We’re delighted to hear that Dheemanth! Creating a motivating and professional environment is exactly what we aim for.",
  },
  {
    name: "Jaya Kumar",
    time: "4 months ago",
    review:
      "Good atmosphere and comfortable seating. The location is very convenient.",
    ownerReply:
      "Thank you Jaya! We're glad you find the location convenient and the seating comfortable. We strive to provide both comfort and accessibility.",
  },
  {
    name: "Riti Srivastava",
    time: "11 months ago",
    review:
      "This place is amazing. The team literally helps you with everything you need to grow your business.",
    ownerReply:
      "Thank you Riti! Supporting entrepreneurs and growing businesses is at the heart of what we do. We’re always here to help.",
  },
  {
    name: "Victor Gerald",
    time: "1 year ago",
    review:
      "Awesome place for working professionals and startup teams. Very professional management.",
    ownerReply:
      "Thank you Victor! We truly appreciate your trust in us. We’re committed to maintaining a professional and growth-oriented workspace.",
  },
  {
    name: "Manjunath LR",
    time: "1 year ago",
    review:
      "We are a startup digital marketing agency and always wanted our own working space. Vayuhu gave us the perfect environment.",
    ownerReply:
      "Thank you Manjunath! We're proud to be a part of your startup journey and wish your team continued growth and success.",
  },
];


const Testimonials = () => {
  const scrollRef = useRef(null);
  const [selectedReview, setSelectedReview] = useState(null);

  // Auto Scroll (UNCHANGED)
  useEffect(() => {
    const container = scrollRef.current;
    let scrollAmount = 0;

    const scroll = () => {
      if (!container) return;
      scrollAmount += 0.5;
      if (scrollAmount >= container.scrollWidth / 2) {
        scrollAmount = 0;
      }
      container.scrollLeft = scrollAmount;
    };

    const interval = setInterval(scroll, 20);
    return () => clearInterval(interval);
  }, []);

  // Lock scroll when modal open
  useEffect(() => {
    document.body.style.overflow = selectedReview ? "hidden" : "auto";
  }, [selectedReview]);

  return (
    <>
      <motion.section
        id="Testimonials"
        initial={{ opacity: 0, y: 60 }}
        whileInView={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.8 }}
        viewport={{ once: true }}
        className="bg-gray-100 py-20 px-6 md:px-16 lg:px-28"
      >
        {/* GOOGLE HEADER STYLE — UNCHANGED */}
        <div className="bg-white rounded-2xl shadow-md p-6 mb-12 flex flex-col md:flex-row justify-between items-start md:items-center gap-6">
          <div>
            <div className="flex items-center gap-3">
              <img
                src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Google_2015_logo.svg"
                alt="Google"
                className="h-6"
              />
              <span className="font-semibold text-gray-700">
                Excellent on Google
              </span>
            </div>

            <div className="flex items-center mt-3 gap-3">
              <span className="text-3xl font-bold text-gray-800">4.8</span>
              <div className="flex">
                {[...Array(5)].map((_, i) => (
                  <Star
                    key={i}
                    size={18}
                    className="text-yellow-400 fill-yellow-400"
                  />
                ))}
              </div>
              <span className="text-gray-500 text-sm">(240 reviews)</span>
            </div>
          </div>

          <a
            href="https://share.google/FjatCrcqOjCUXnJdC"
            className="bg-blue-600 text-white text-sm px-5 py-2 rounded-full hover:bg-blue-700 transition"
          >
            Review us on Google
          </a>
        </div>

        {/* CAROUSEL — UNCHANGED DESIGN */}
        <div
          ref={scrollRef}
          className="flex gap-6 overflow-hidden whitespace-nowrap"
        >
          {[...reviews, ...reviews].map((review, index) => (
            <div
              key={index}
              className="min-w-[320px] max-w-sm bg-white rounded-xl shadow-sm p-6 hover:shadow-md transition whitespace-normal"
            >
              <div className="flex items-center gap-3 mb-3">
                <div className="w-10 h-10 rounded-full bg-gray-200 flex items-center justify-center font-semibold text-gray-700">
                  {review.name.charAt(0)}
                </div>

                <div>
                  <div className="flex items-center gap-1">
                    <p className="font-medium text-gray-800 text-sm">
                      {review.name}
                    </p>
                    <span className="text-blue-500 text-xs">✔</span>
                  </div>
                  <p className="text-xs text-gray-500">{review.time}</p>
                </div>
              </div>

              <div className="flex mb-2">
                {[...Array(5)].map((_, i) => (
                  <Star
                    key={i}
                    size={14}
                    className="text-yellow-400 fill-yellow-400"
                  />
                ))}
              </div>

              <p className="text-sm text-gray-600 leading-relaxed line-clamp-4">
                {review.review}
              </p>

              {/* ONLY CHANGE — Click handler */}
              <button
                onClick={() => setSelectedReview(review)}
                className="text-blue-600 text-xs mt-2 hover:underline"
              >
                Read more
              </button>
            </div>
          ))}
        </div>
      </motion.section>

      {/* GOOGLE STYLE MODAL */}
      <AnimatePresence>
        {selectedReview && (
          <motion.div
            className="fixed inset-0 bg-black/40 backdrop-blur-sm flex items-center justify-center z-50 p-4"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
          >
            <motion.div
              className="bg-white max-w-2xl w-full rounded-lg p-8 relative"
              initial={{ scale: 0.9 }}
              animate={{ scale: 1 }}
              exit={{ scale: 0.9 }}
            >
              <button
                onClick={() => setSelectedReview(null)}
                className="absolute top-4 right-4 text-gray-500 hover:text-gray-700"
              >
                <X size={20} />
              </button>

              <div className="flex items-center gap-3 mb-4">
                <div className="w-12 h-12 rounded-full bg-gray-200 flex items-center justify-center font-semibold">
                  {selectedReview.name.charAt(0)}
                </div>

                <div>
                  <div className="flex items-center gap-1">
                    <p className="font-semibold">
                      {selectedReview.name}
                    </p>
                    <span className="text-blue-500 text-sm">✔</span>
                  </div>
                  <p className="text-sm text-gray-500">
                    {selectedReview.time} on Google
                  </p>
                </div>
              </div>

              <div className="flex mb-4">
                {[...Array(5)].map((_, i) => (
                  <Star
                    key={i}
                    size={18}
                    className="text-yellow-400 fill-yellow-400"
                  />
                ))}
              </div>

              <p className="text-gray-700 leading-relaxed whitespace-pre-line">
                {selectedReview.review}
              </p>

              {selectedReview.ownerReply && (
                <div className="mt-6 border-l-4 border-gray-200 pl-4">
                  <p className="font-semibold text-sm">
                    Vayuhu{" "}
                    <span className="text-xs bg-gray-200 px-2 py-0.5 rounded">
                      OWNER REPLY
                    </span>
                  </p>
                  <p className="text-sm text-gray-600 mt-1">
                    {selectedReview.ownerReply}
                  </p>
                </div>
              )}
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>
    </>
  );
};

export default Testimonials;
