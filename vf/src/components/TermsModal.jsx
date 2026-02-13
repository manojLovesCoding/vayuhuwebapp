import React from "react";
import { motion, AnimatePresence } from "framer-motion";

const TermsModal = ({ isOpen, onClose }) => {
  return (
    <AnimatePresence>
      {isOpen && (
        <motion.div
          className="fixed inset-0 bg-black/60 flex items-center justify-center z-[60] p-4"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
        >
          <motion.div
            className="bg-white rounded-2xl shadow-2xl max-w-2xl w-full max-h-[80vh] flex flex-col relative"
            initial={{ scale: 0.9, y: 20 }}
            animate={{ scale: 1, y: 0 }}
            exit={{ scale: 0.9, y: 20 }}
          >
            {/* Header */}
            <div className="p-6 border-b sticky top-0 bg-white rounded-t-2xl flex justify-between items-center">
              <h3 className="text-xl font-bold text-gray-800">Terms & Conditions</h3>
              <button 
                onClick={onClose}
                className="text-gray-400 hover:text-gray-600 text-2xl"
              >
                &times;
              </button>
            </div>

            {/* Content */}
            <div className="p-6 overflow-y-auto text-gray-600 text-sm leading-relaxed space-y-4">
              <section>
                <h4 className="font-bold text-gray-800">Contact Information</h4>
                <p>If you have any questions, complaints, or claims regarding the Site, you may contact us at Attn: Website Feedback, 25 Kalpana Chawla Road, Sanjaynagar Bangalore 560094, or support@vayuhu.com.</p>
              </section>

              <section>
                <h4 className="font-bold text-gray-800">Effective Date</h4>
                <p>These Website Terms are effective as of 20 December 2024.</p>
              </section>

              <section>
                <h4 className="font-bold text-gray-800">Limitation of Liability and Disclaimer of Warranties</h4>
                <p>To the extent permitted by law, Vayuhu Inc. and its affiliates, successors, and each of their employees, assignees, officers, agents, and directors (collectively, the “Vayuhu Parties”) disclaim all warranties and terms, express or implied, regarding the Site, Content, or services (including third-party services) on or accessible through the Site. This includes any warranties or terms of merchantability, fitness for a particular purpose, title, non-infringement, and any implied warranties arising from course of dealing, course of performance, or usage in trade. The Vayuhu Parties disclaim all liability to the maximum extent permitted by law for claims, damages, expenses, or any other losses arising out of or in connection with products or services availed through partners, service providers, or any other third party.</p>
              </section>

              <section>
                <h4 className="font-bold text-gray-800">Rules of Conduct</h4>
                <p>Users are expected to adhere to the rules of conduct while using the Site. Any violations may result in termination of access to the Site.</p>
              </section>

              <section>
                <h4 className="font-bold text-gray-800">User Restrictions</h4>
                <p>The Site and the services it describes are available only to individuals who are at least 18 years old. Individuals under this age may not access or use the Site or provide any personal information through the Site.</p>
              </section>

              <section>
                <h4 className="font-bold text-gray-800">Miscellaneous</h4>
                <p>These Website Terms shall be governed by and construed in accordance with the laws of the State of Karnataka, excluding its conflicts of law rules, and the United States of America. These Website Terms constitute the entire agreement between us regarding the Site and supersede any prior proposals, understandings, and contemporaneous communications. If any provision of these Website Terms is held to be invalid or unenforceable, that provision shall be limited or eliminated to the minimum extent necessary for these Website Terms to otherwise remain in full force and effect and enforceable. Any waiver of compliance with these Website Terms by Vayuhu must be provided to you in writing to be binding. The failure of either party to enforce its rights under these Website Terms at any time for any period will not be construed as a waiver of such rights.</p>
              </section>
            </div>

            {/* Footer */}
            <div className="p-4 border-t bg-gray-50 rounded-b-2xl text-right">
              <button 
                onClick={onClose}
                className="px-6 py-2 bg-orange-500 text-white font-semibold rounded-lg hover:bg-orange-600 transition"
              >
                Close
              </button>
            </div>
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  );
};

export default TermsModal;