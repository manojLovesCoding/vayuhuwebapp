import React, { useState, useEffect } from 'react';
import { assets } from '../assets/assets';
import { motion } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import { Users, Ruler, Cog, Briefcase } from 'lucide-react';

const About = () => {
    const navigate = useNavigate();

    const handleLearnMore = () => {
        navigate('/about');
        window.scrollTo({ top: 700, behavior: 'smooth' });
    };

    const stats = [
        { num: '100+', label: 'Happy Customers', desc: '100% Satisfaction Guaranteed and Counting', icon: Users },
        { num: '2500', label: 'SQFT of Area', desc: 'Global Reach, Exceptional Space', icon: Ruler },
        { num: '20+', label: 'Amenities', desc: 'Globally Accessible, Premium Features', icon: Cog },
        { num: '60+', label: 'Workspaces', desc: 'Essentials and More at Your Fingertips', icon: Briefcase },
    ];

    const carouselImages = [
        assets.brand_img,
        assets.aboutImg,
        // add more images here if needed
    ];
    const [currentImage, setCurrentImage] = useState(0);

    // Auto slide every 4s
    useEffect(() => {
        const interval = setInterval(() => {
            setCurrentImage(prev => (prev + 1) % carouselImages.length);
        }, 4000);
        return () => clearInterval(interval);
    }, []);

    const handlePrev = () => setCurrentImage(prev => (prev - 1 + carouselImages.length) % carouselImages.length);
    const handleNext = () => setCurrentImage(prev => (prev + 1) % carouselImages.length);

    return (
        <motion.section
            id='About'
            initial={{ opacity: 0, y: 50 }}
            whileInView={{ opacity: 1, y: 0 }}
            transition={{ duration: 1, ease: 'easeOut' }}
            viewport={{ once: true }}
            className='flex flex-col items-center justify-center container mx-auto py-20 px-6 md:px-20 lg:px-32 overflow-hidden'
        >
            {/* ===== Heading ===== */}
            <motion.h1
                initial={{ opacity: 0, y: -30 }}
                whileInView={{ opacity: 1, y: 0 }}
                transition={{ duration: 0.8 }}
                className='text-3xl sm:text-5xl font-bold text-center mb-3'
            >
                About <span className='text-orange-500'>Vayuhu</span>
            </motion.h1>

            <motion.p
                initial={{ opacity: 0 }}
                whileInView={{ opacity: 1 }}
                transition={{ delay: 0.3, duration: 0.8 }}
                className='text-gray-500 text-center max-w-2xl mb-12'
            >
                Redefining the modern workspace with flexibility, creativity, and community.
                Vayuhu brings professionals, freelancers, and startups together under one inspiring roof.
            </motion.p>

            {/* ===== Three Columns ===== */}
            <div className='flex flex-col md:flex-row items-start gap-8 md:gap-16 w-full'>
                
                {/* ===== Left Column: Carousel with Dots ===== */}
                <div className='relative w-full md:w-1/3 h-96 rounded-2xl shadow-lg overflow-hidden'>
                    <img
                        src={carouselImages[currentImage]}
                        alt='Vayuhu Coworking Space'
                        className='w-full h-full object-cover rounded-2xl'
                    />

                    {/* Carousel Controls */}
                    <button onClick={handlePrev} className='absolute top-1/2 left-3 transform -translate-y-1/2 bg-white/70 hover:bg-white px-3 py-2 rounded-full'>‹</button>
                    <button onClick={handleNext} className='absolute top-1/2 right-3 transform -translate-y-1/2 bg-white/70 hover:bg-white px-3 py-2 rounded-full'>›</button>

                    {/* Dots Navigation */}
                    <div className='absolute bottom-4 left-1/2 transform -translate-x-1/2 flex gap-2'>
                        {carouselImages.map((_, index) => (
                            <span
                                key={index}
                                onClick={() => setCurrentImage(index)}
                                className={`w-3 h-3 rounded-full cursor-pointer transition-all duration-300 ${
                                    currentImage === index ? 'bg-orange-500' : 'bg-white/70'
                                }`}
                            />
                        ))}
                    </div>
                </div>

                {/* ===== Middle Column: About Text + Button ===== */}
                <motion.div
                    className='flex flex-col text-gray-700 md:w-1/3'
                    initial={{ opacity: 0, x: 50 }}
                    whileInView={{ opacity: 1, x: 0 }}
                    transition={{ duration: 1 }}
                    viewport={{ once: true }}
                >
                    <motion.p
                        initial={{ opacity: 0, y: 20 }}
                        whileInView={{ opacity: 1, y: 0 }}
                        transition={{ delay: 0.2, duration: 0.8 }}
                        className='text-base leading-relaxed mb-8'
                    >
                        At <span className='font-semibold text-orange-500'>Vayuhu</span>, we go beyond providing desks — we create experiences.
                        From modern workspaces to community-driven initiatives, every detail is designed to empower innovation, comfort, and growth.
                    </motion.p>

                    <motion.button
                        onClick={handleLearnMore}
                        whileHover={{ scale: 1.05 }}
                        whileTap={{ scale: 0.95 }}
                        className='bg-orange-500 hover:bg-orange-600 text-white font-medium px-8 py-3 rounded-full transition-all duration-300'
                    >
                        Learn More
                    </motion.button>
                </motion.div>

                {/* ===== Right Column: Stats (2x2 Grid) with Framer Motion ===== */}
                <motion.div
                    className='grid grid-cols-2 gap-6 md:w-1/3'
                    variants={{
                        hidden: {},
                        visible: { transition: { staggerChildren: 0.2 } }
                    }}
                    initial="hidden"
                    whileInView="visible"
                    viewport={{ once: true }}
                >
                    {stats.map(({ num, label, desc, icon: Icon }, i) => (
                        <motion.div
                            key={i}
                            className='flex flex-col items-start space-y-1 bg-white/80 backdrop-blur-md shadow-md rounded-xl p-4 hover:shadow-lg cursor-pointer'
                            variants={{
                                hidden: { opacity: 0, y: 30 },
                                visible: { opacity: 1, y: 0, transition: { type: 'spring', stiffness: 200, damping: 20 } }
                            }}
                            whileHover={{ scale: 1.05, transition: { type: 'spring', stiffness: 300 } }}
                        >
                            <motion.div
                                className='flex items-center justify-center w-10 h-10 rounded-full bg-orange-100 mb-1'
                                animate={{ y: [0, -5, 0], scale: [1, 1.1, 1] }}
                                transition={{ duration: 2, repeat: Infinity, ease: 'easeInOut', delay: i * 0.3 }}
                            >
                                <Icon className='text-orange-500' size={22} />
                            </motion.div>

                            <motion.p
                                className='text-3xl font-bold text-orange-500'
                                initial={{ scale: 0.8, opacity: 0 }}
                                animate={{ scale: 1, opacity: 1 }}
                                transition={{ delay: 0.3 + i * 0.2, type: 'spring', stiffness: 300 }}
                            >
                                {num}
                            </motion.p>

                            <motion.p
                                className='text-sm font-medium'
                                initial={{ opacity: 0, y: 10 }}
                                animate={{ opacity: 1, y: 0 }}
                                transition={{ delay: 0.4 + i * 0.2 }}
                            >
                                {label}
                            </motion.p>

                            <motion.p
                                className='text-sm text-gray-500'
                                initial={{ opacity: 0, y: 10 }}
                                animate={{ opacity: 1, y: 0 }}
                                transition={{ delay: 0.5 + i * 0.2 }}
                            >
                                {desc}
                            </motion.p>
                        </motion.div>
                    ))}
                </motion.div>
            </div>
        </motion.section>
    );
};

export default About;