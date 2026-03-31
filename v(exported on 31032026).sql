-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2026 at 08:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `v`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin') DEFAULT 'admin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(7, 'Admin Name', 'admin@vayuhu.com', '$2y$10$tD0kCnmjhxblortaS4mM.ubRyY.YBZa8j9SP30FxFVlD3hjxeFQ2C', 'admin', '2026-01-17 08:57:03');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `added_by` varchar(255) NOT NULL,
  `blog_heading` varchar(255) NOT NULL,
  `blog_description` text NOT NULL,
  `blog_image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `added_by`, `blog_heading`, `blog_description`, `blog_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Vayuhu', 'What Is a Co-Working Space and Why Is It So Popular?', '<p>A co-working space is a shared work environment where freelancers, startups, remote workers, and even large companies work under one roof. Unlike traditional offices, co-working spaces offer flexibility, community, and cost-effective solutions.</p><p><br></p><p>The popularity of co-working spaces has grown rapidly due to the rise of remote work and entrepreneurship. Professionals no longer want to be tied to long leases or isolated home offices. Co-working spaces provide fully equipped offices with high-speed internet, meeting rooms, and modern amenities—without the hassle of managing an office.</p><p><br></p><p>One of the biggest advantages is flexibility. Members can choose daily passes, monthly memberships, or private offices depending on their needs. This makes co-working ideal for startups and freelancers who want to scale without major financial risk.</p><p><br></p><p>Beyond infrastructure, co-working spaces foster collaboration. Being surrounded by professionals from different industries encourages networking, idea sharing, and partnerships. Many co-working spaces also host events, workshops, and social meetups to build a strong professional community.</p><p><br></p><p>In today’s fast-changing work culture, co-working spaces offer the perfect balance between productivity, flexibility, and connection.</p>', 'uploads/blogs/blog_6970aa4aea8c9_b.jpg', 'active', '2026-01-21 10:28:26', '2026-01-21 10:34:07'),
(2, 'Vayuhu', 'Benefits of Co-Working Spaces for Startups and Freelancers', '<p>Co-working spaces have become a game-changer for startups and freelancers. One of the biggest benefits is cost savings. Instead of investing in office furniture, utilities, and maintenance, members pay a single fee for everything.</p><p><br></p><p>Another key benefit is flexibility. Startups often grow quickly, and co-working spaces allow them to expand or downsize without long-term commitments. Freelancers also benefit by choosing plans that match their workload.</p><p><br></p><p>Co-working spaces help improve productivity. A professional work environment reduces distractions compared to working from home. High-speed internet, ergonomic furniture, and quiet zones support focused work.</p><p><br></p><p>Networking is another major advantage. Working alongside designers, developers, marketers, and founders opens doors to collaboration and new business opportunities. Many freelancers find clients directly through their co-working community.</p><p><br></p><p>Lastly, co-working spaces promote work-life balance. Separate workspaces help professionals disconnect after work hours, improving mental health and overall well-being.</p>', 'uploads/blogs/blog_6970ac53a559f_b2.png', 'active', '2026-01-21 10:37:07', '2026-01-21 10:37:07'),
(3, 'Vayuhu', 'Top Benefits of Coworking Spaces for Startups and Entrepreneurs', '<p>Startups and entrepreneurs face unique challenges—limited budgets, small teams, and the need to scale quickly. Coworking spaces have emerged as a powerful solution that supports growth while keeping costs under control.</p><p><br></p><p>One of the biggest advantages of coworking spaces is <strong>affordability</strong>. Instead of investing heavily in office rent, furniture, and utilities, startups can move into a ready-to-use workspace. This allows founders to focus their resources on business growth rather than office management.</p><p><br></p><p>Coworking spaces also provide <strong>scalability</strong>. As a startup grows, it can easily upgrade from a single desk to a private office without relocating. This flexibility is especially valuable for fast-growing companies.</p><p><br></p><p>Another key benefit is <strong>access to a professional ecosystem</strong>. Entrepreneurs often work alongside designers, developers, marketers, and investors. This environment encourages idea-sharing and collaboration, which can lead to new opportunities and faster problem-solving.</p><p>Mentorship and learning are also major perks. Many coworking spaces organize pitch events, networking sessions, and workshops that help startups gain exposure and industry knowledge.</p><p><br></p><p>Finally, coworking spaces boost <strong>brand credibility</strong>. Meeting clients in a professional office rather than a café or home office creates a stronger impression and builds trust.</p><p><br></p><p>For startups and entrepreneurs, coworking spaces are more than just offices—they are growth enablers that combine flexibility, community, and opportunity.</p>', 'uploads/blogs/blog_6970ad67826a5_b3.png', 'active', '2026-01-21 10:41:43', '2026-01-21 10:41:43'),
(4, 'Vayuhu', 'Coworking Spaces vs Traditional Offices: Which Is Right for You?', '<p>Choosing the right workspace is an important decision for any professional or business. The debate between coworking spaces and traditional offices depends on your work style, budget, and long-term goals.</p><p><br></p><p>Traditional offices offer privacy and full control over branding and layout. They work well for established companies with stable teams and predictable growth. However, they often come with long leases, high setup costs, and ongoing maintenance expenses.</p><p><br></p><p>Coworking spaces, on the other hand, are designed for <strong>flexibility and convenience</strong>. They allow individuals and businesses to move in quickly without worrying about furniture, utilities, or internet setup. This makes them ideal for freelancers, remote workers, and growing teams.</p><p><br></p><p>In terms of cost, coworking spaces are usually more economical, especially for small teams. You pay only for the space you use, with no hidden expenses.</p><p><br></p><p>Collaboration is another key difference. Traditional offices can be isolating, while coworking spaces promote interaction and networking. This can lead to creativity, partnerships, and professional growth.</p><p><br></p><p>However, coworking spaces may not suit everyone. Companies that require strict confidentiality or highly customized workspaces may prefer traditional offices.</p><p><br></p><p>Ultimately, the right choice depends on your needs. If flexibility, affordability, and community matter most, a coworking space is likely the better option.</p>', 'uploads/blogs/blog_6970addc06061_b4.png', 'active', '2026-01-21 10:43:40', '2026-01-21 10:43:40'),
(5, 'Vayuhu', 'The Future of Work: How Coworking Spaces Are Shaping It', '<p>The way we work is changing rapidly, and coworking spaces are at the center of this transformation. With the rise of remote work, freelancing, and digital businesses, the traditional office model is no longer the default choice.</p><p><br></p><p>Coworking spaces support <strong>hybrid work models</strong>, allowing employees to work closer to home while staying connected to a professional environment. This reduces commute time and improves work-life balance.</p><p><br></p><p>Technology plays a major role in the evolution of coworking spaces. High-speed internet, smart meeting rooms, and digital collaboration tools make it easy for teams to work seamlessly from anywhere.</p><p><br></p><p>Sustainability is another growing focus. Many coworking spaces are adopting eco-friendly designs, shared resources, and energy-efficient systems to reduce environmental impact.</p><p><br></p><p>Coworking spaces are also expanding beyond major cities into suburban and smaller urban areas. This makes professional workspaces accessible to a wider population.</p><p><br></p><p>As businesses continue to prioritize flexibility and employee well-being, coworking spaces will remain a key driver of the future of work. They are not just a trend—they are a long-term solution for a modern workforce.</p>', 'uploads/blogs/blog_6970ae4cbe230_b5.png', 'active', '2026-01-21 10:45:32', '2026-01-21 10:45:32'),
(6, 'Vayuhu', 'How Coworking Spaces Boost Productivity and Creativity', '<p>In today’s fast-paced work culture, staying productive and creative can be a challenge—especially when working from home or in rigid office environments. This is where coworking spaces make a powerful difference.</p><p><br></p><p>Coworking spaces are thoughtfully designed to enhance focus and motivation. With ergonomic furniture, natural lighting, and quiet work zones, they create an environment that helps professionals stay energized throughout the day. Unlike home offices, coworking spaces reduce distractions and establish a clear boundary between work and personal life.</p><p><br></p><p>One of the most overlooked advantages of coworking spaces is <strong>creative stimulation</strong>. Working alongside professionals from diverse industries exposes members to new ideas, perspectives, and problem-solving approaches. Casual conversations over coffee often spark inspiration and innovation.</p><p><br></p><p>Coworking spaces also encourage <strong>structured routines</strong>. Having a dedicated place to work helps individuals develop discipline and consistency, which directly impacts productivity. Many spaces offer private booths, meeting rooms, and collaborative areas to suit different working styles.</p><p><br></p><p>Another key factor is <strong>community support</strong>. Feeling connected to a professional community reduces burnout and loneliness, common challenges for freelancers and remote workers. Networking events, wellness sessions, and knowledge-sharing meetups help members grow both personally and professionally.</p><p><br></p><p>Technology and amenities further enhance efficiency. High-speed internet, printing services, conference rooms, and on-site support ensure that work continues smoothly without interruptions.</p><p><br></p><p>Ultimately, coworking spaces provide more than just a desk—they offer an ecosystem designed to help professionals do their best work. By combining comfort, collaboration, and creativity, coworking spaces are redefining what a productive workplace looks like.</p>', 'uploads/blogs/blog_6970aea26f27d_b6.png', 'active', '2026-01-21 10:46:58', '2026-01-21 10:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `booking_attendees`
--

CREATE TABLE `booking_attendees` (
  `id` int(11) NOT NULL,
  `booking_id` varchar(50) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `attendee_name` varchar(255) DEFAULT NULL,
  `is_host` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_attendees`
--

INSERT INTO `booking_attendees` (`id`, `booking_id`, `employee_id`, `attendee_name`, `is_host`, `created_at`) VALUES
(1, 'BKG-20260331-003', 216, 'Manoj', 1, '2026-03-31 04:34:02'),
(2, 'BKG-20260331-003', 7, 'Anjana Rao', 0, '2026-03-31 04:34:02');

-- --------------------------------------------------------

--
-- Table structure for table `company_profile`
--

CREATE TABLE `company_profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `gst_no` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `address` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_profile`
--

INSERT INTO `company_profile` (`id`, `user_id`, `company_name`, `gst_no`, `email`, `contact`, `address`, `logo`, `created_at`, `updated_at`) VALUES
(2, 190, 'cena company', 'GST1234567899', 'cena@company.com', '9876789871', '', 'uploads/company_logos/logo_6970a10028302_logo_6960a8d1de155_wwe.png', '2026-01-21 09:48:48', '2026-01-21 09:48:48'),
(3, 214, 'wwe', 'gst1134367893', 'wwev@company.com', '6767676767', 'usa', 'uploads/company_logos/logo_69bd1a1a02a53_wwe.png', '2026-03-20 09:52:07', '2026-03-20 09:58:50'),
(4, 216, 'Self-employed', 'gst1134367890', 'mkum9417@gmail.com', '7878787878', 'sdsd', NULL, '2026-03-23 11:17:32', '2026-03-23 11:17:32'),
(5, 198, 'stellar companyyy', 'gst1134367890', 'stellar@company.com', '9999999999', '#3, 9th Main,11th cross, Mariyampalaya\r\nBangalore-560024', NULL, '2026-03-24 05:42:22', '2026-03-24 05:42:22'),
(6, 217, 'cm punk company', 'gst1134367893', 'cartoon@gmail.com', '6767676767', 's', NULL, '2026-03-24 06:14:25', '2026-03-24 06:14:25');

-- --------------------------------------------------------

--
-- Table structure for table `contact_comments`
--

CREATE TABLE `contact_comments` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `comment` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_requests`
--

CREATE TABLE `contact_requests` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `comments` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_requests`
--

INSERT INTO `contact_requests` (`id`, `name`, `email`, `phone`, `status`, `comments`, `created_at`, `updated_at`) VALUES
(3, 'Michaelcrymn', 'normandlutes7745@icloud.com', '86673386426', 'Closed', NULL, '2024-06-16 07:40:29', '2024-08-03 02:51:11'),
(4, 'Stevon Akin', 'stevon+ae05@gmail.com', '5553406826', 'Closed', NULL, '2024-06-21 10:43:39', '2024-07-29 10:34:54'),
(5, 'Michaelcrymn', 'adolfowooden985@icloud.com', '85229517456', 'Closed', NULL, '2024-06-28 16:08:22', '2024-08-03 02:51:42'),
(6, 'Julian Decker', 'moveyou938+o4p@gmail.com', '368838553', 'Closed', NULL, '2024-07-09 02:13:59', '2024-07-29 10:34:26'),
(7, 'Thomasunics', 'yasen.krasen.13+84989@mail.ru', '83384138514', 'Closed', NULL, '2024-07-24 19:09:21', '2024-08-02 15:54:54'),
(8, 'Bhavya Shetty', '', '8197092257', 'Closed', NULL, '2024-08-01 16:07:54', '2024-08-13 10:42:15'),
(9, 'Tanuja', 'tanujatanu012000@gmail.com', '8105638171', 'Closed', NULL, '2024-08-02 09:08:06', '2024-08-02 15:55:08'),
(10, 'Omprakash', '', '9620603200', 'Closed', NULL, '2024-08-13 11:27:31', '2024-08-22 10:56:59'),
(11, 'Vishesh', '', '8105517435', 'Follow-Up', NULL, '2024-08-17 07:32:35', '2024-08-17 07:37:34'),
(12, 'victor Gerald', '', '9148708959', 'Ongoing', NULL, '2024-08-17 07:33:36', '2024-08-22 10:58:26'),
(13, 'lakshmi kanth shetty', '', '7259226358', 'Pending', NULL, '2024-08-19 08:15:44', '2024-08-19 08:15:44'),
(14, 'Reshma', 'reshmaa2527@gmail.com', '6361186583', 'Closed', NULL, '2024-08-21 11:14:38', '2024-08-22 10:58:37'),
(15, 'Alwin', '', '8073046272', 'Follow-Up', NULL, '2024-08-22 08:56:34', '2024-08-22 10:58:11'),
(16, 'sachin George', '', '8078 237 368', 'Follow-Up', NULL, '2024-08-22 10:00:29', '2024-08-22 10:02:47'),
(17, 'Harsh Bafna', '', '99670 25895', 'Closed', NULL, '2024-08-22 10:07:05', '2024-08-22 10:07:46'),
(18, 'Monika', '', '99456 10865', 'Follow-Up', NULL, '2024-08-22 10:10:07', '2024-08-22 10:14:54'),
(19, 'Kishor A', '', '63602 62629', 'Follow-Up', NULL, '2024-08-22 10:16:38', '2024-08-22 10:17:58'),
(20, 'J Stephen raj', '', '90253 80812', 'Follow-Up', NULL, '2024-08-22 10:19:16', '2024-08-22 10:20:24'),
(21, 'Satyam Dokania', '', '78080 05330', 'Closed', NULL, '2024-08-22 10:21:24', '2024-08-26 10:46:20'),
(22, 'Taya kumar', '', '90350 64498', 'Closed', NULL, '2024-08-22 10:32:49', '2024-08-22 10:33:41'),
(23, 'Karthik', '', '866 052 8244', 'Follow-Up', NULL, '2024-08-22 10:34:44', '2024-08-22 10:35:38'),
(24, 'Taya Kumar', '', '94834 30077', 'Closed', NULL, '2024-08-22 10:37:16', '2024-08-22 10:37:54'),
(25, 'Sai Builders B\'lore', '', '93914 82567', 'Follow-Up', NULL, '2024-08-22 10:40:39', '2024-08-22 10:41:39'),
(26, 'Roja V', '', '95431 44330', 'Closed', NULL, '2024-08-22 10:54:59', '2024-08-22 10:56:45'),
(27, 'Lalith', '', '91334 41605', 'Follow-Up', NULL, '2024-08-23 04:13:42', '2024-08-23 04:24:20'),
(28, 'Joshi Sk', '', '93531 16593', 'Follow-Up', NULL, '2024-08-23 05:44:20', '2024-08-24 10:17:16'),
(29, 'Bhero Yadha', '', '98354 23589', 'Follow-Up', NULL, '2024-08-23 05:45:14', '2024-08-23 09:25:52'),
(30, 'Jyothi', '', '70190 53466', 'Closed', NULL, '2024-08-23 09:23:07', '2024-08-23 09:23:54'),
(31, 'Ram kumar', '', '92387 08382', 'Closed', NULL, '2024-08-23 09:28:36', '2024-08-23 09:29:05'),
(32, 'C D N REDDY', '', '7989519889', 'Closed', NULL, '2024-08-23 11:51:35', '2024-08-24 10:11:38'),
(33, 'Sowmiya', '', '63799 37947', 'Closed', NULL, '2024-08-24 04:17:32', '2024-08-24 04:17:57'),
(34, 'Hemanth Kumar', '', '63000 65898', 'Closed', NULL, '2024-08-24 04:21:00', '2024-08-24 10:16:13'),
(35, 'Vinodh', '', '98451 88522', 'Closed', NULL, '2024-08-24 10:17:58', '2024-08-24 10:18:24'),
(36, 'Navin Kumar', '', '96795 03320', 'Closed', NULL, '2024-08-24 10:19:39', '2024-08-26 10:57:44'),
(37, 'Josephcease', 'sramacharran@yahoo.com', '89222447517', 'Closed', NULL, '2024-08-24 23:43:02', '2024-08-26 10:55:52'),
(38, '1', '1', '1', 'Closed', NULL, '2024-08-25 08:05:35', '2024-08-26 10:53:19'),
(39, 'Mubeen Taj', '', '99452 84161', 'Closed', NULL, '2024-08-26 06:05:00', '2024-08-26 06:05:26'),
(40, 'Altaf', '', '79802 40824', 'Closed', NULL, '2024-08-26 06:06:57', '2024-08-26 06:07:16'),
(41, 'Puneeth Kumar D', '', '96328 68097', 'Follow-Up', NULL, '2024-08-26 06:07:38', '2024-08-26 10:53:56'),
(42, 'Dr Anandamaya Dasa', '', '94480 23368', 'Follow-Up', NULL, '2024-08-26 06:18:19', '2024-08-26 06:19:44'),
(43, 'Nanda Kumar', '', '9980759925', 'Follow-Up', NULL, '2024-08-26 10:38:03', '2024-08-26 10:39:02'),
(44, 'Abhishek', '', '63616 43661', 'Pending', NULL, '2024-08-28 07:57:38', '2024-08-28 07:57:38'),
(45, 'umang', '', '99000 24823', 'Follow-Up', NULL, '2024-08-28 10:27:29', '2024-08-28 10:28:07'),
(46, 'Lakshmi madav', '', '97399 19347', 'Pending', NULL, '2024-08-28 10:29:04', '2024-08-28 10:29:04'),
(47, 'Harsh', '', '70169 82013', 'Follow-Up', NULL, '2024-08-28 10:29:50', '2024-08-30 10:57:57'),
(48, 'no name', '', '75759 99977', 'Pending', NULL, '2024-08-28 10:37:20', '2024-08-28 10:37:20'),
(49, 'Jaina', '', '92061 79260', 'Closed', NULL, '2024-08-28 10:48:12', '2024-08-28 10:48:32'),
(50, 'Sanjay B', '', '97401 93052', 'Closed', NULL, '2024-08-30 05:38:28', '2024-08-30 05:42:01'),
(51, 'k p manu kumar', '', '7899180783', 'Pending', NULL, '2024-08-30 07:23:38', '2024-08-30 07:23:38'),
(52, 'Yashaswini', '', '7338183613', 'Closed', NULL, '2024-08-30 09:49:42', '2024-08-30 09:50:03'),
(53, 'Mathangi', '', '9152929097', 'Follow-Up', NULL, '2024-08-30 10:08:28', '2024-08-30 10:10:27'),
(54, 'aman', '', '95213 84647', 'Pending', NULL, '2024-08-30 10:48:29', '2024-08-30 10:48:29'),
(55, 'M. Rithul. Nithin', '', '96777 06291', 'Closed', NULL, '2024-08-30 10:50:03', '2024-08-30 10:50:41'),
(56, 'Diwakar Reddy', '', '91820 31523', 'Pending', NULL, '2024-08-30 10:51:10', '2024-08-30 10:51:10'),
(57, 'vinoda', '', '94839 51282', 'Follow-Up', NULL, '2024-08-30 10:52:20', '2024-08-30 10:53:09'),
(58, 'Affan', '', '78199 14608', 'Pending', NULL, '2024-08-30 10:53:32', '2024-08-30 10:53:32'),
(59, 'moula', '', '63615 57352', 'Closed', NULL, '2024-08-30 10:59:28', '2024-08-30 10:59:45'),
(60, 'Meenu', '', '96862 69685', 'Closed', NULL, '2024-08-30 11:02:04', '2024-08-30 11:02:21'),
(61, 'Natadruro', 'woodthighgire1988@gmail.com', '88976672157', 'Pending', NULL, '2024-08-31 23:40:07', '2024-08-31 23:40:07'),
(62, 'sapna', '', '72591 46622', 'Closed', NULL, '2024-09-02 05:33:33', '2024-09-02 05:34:12'),
(63, 'Shivakumar T', '', '97429 41271', 'Pending', NULL, '2024-09-02 06:40:52', '2024-09-02 06:40:52'),
(64, 'Puneeth Kumar D', '', '99160 02200', 'Pending', NULL, '2024-09-02 06:41:48', '2024-09-02 06:41:48'),
(65, 'David Jonathan', '', '90000 18494', 'Closed', NULL, '2024-09-02 06:44:18', '2024-09-02 06:46:38'),
(66, 'HII HII', '', '97401 94091', 'Pending', NULL, '2024-09-02 06:49:27', '2024-09-02 06:49:27'),
(67, 'Kotresh Sangam', '', '95383 82622', 'Pending', NULL, '2024-09-02 06:51:35', '2024-09-02 06:51:35'),
(68, 'Naveen Teja Y', '', '70195 00615', 'Pending', NULL, '2024-09-02 06:57:54', '2024-09-02 06:57:54'),
(69, 'Dip Sir', '', '891 078 5737', 'Pending', NULL, '2024-09-02 06:58:46', '2024-09-02 06:58:46'),
(70, 'Madan', '', '99456 39606', 'Follow-Up', NULL, '2024-09-02 07:03:05', '2024-09-02 07:05:12'),
(71, 'no name', '', '84958 83041', 'Closed', NULL, '2024-09-02 07:09:40', '2024-09-02 07:10:11'),
(72, '1', '1', '1', 'Pending', NULL, '2024-09-02 20:15:55', '2024-09-02 20:15:55'),
(73, 'Valeron83hic', 'menhos7@rambler.ru', '85439668344', 'Pending', NULL, '2024-09-06 16:50:57', '2024-09-06 16:50:57'),
(74, 'Ivory Mccaffrey', 'mccaffrey.ivory@gmail.com', '02684 87 48 52', 'Pending', NULL, '2024-09-29 03:59:15', '2024-09-29 03:59:15'),
(75, 'Raymondexhix', 'raymondhoisecig@gmail.com', '87291614341', 'Pending', NULL, '2024-10-15 19:19:17', '2024-10-15 19:19:17'),
(76, 'Pravin', 'pravinpraba@gmail.com', '9880091323', 'Pending', NULL, '2024-10-19 14:19:34', '2024-10-19 14:19:34'),
(77, 'Cucumber12', '', '87497599866', 'Pending', NULL, '2024-10-24 10:44:02', '2024-10-24 10:44:02'),
(78, 'Kelmor', 'info@greenwaveglamp.com', '87234335176', 'Pending', NULL, '2024-10-25 09:42:54', '2024-10-25 09:42:54'),
(79, 'Xrhic', 'xrumer23Hic@gmail.com', '87849594794', 'Pending', NULL, '2024-10-27 19:35:09', '2024-10-27 19:35:09'),
(80, 'Homerenovationtam', 'l.enag.o.p.k.a.lo.7.3.@gmail.com', '85168562543', 'Pending', NULL, '2024-10-29 07:05:38', '2024-10-29 07:05:38'),
(81, 'Bitcoin_freedom_team', 'bitcoin_freedom_team@gmail.com', '82369364327', 'Pending', NULL, '2024-10-29 08:40:03', '2024-10-29 08:40:03'),
(82, 'Jamesgal', 'yasen.krasen.13+80809@mail.ru', '88747821195', 'Pending', NULL, '2024-11-04 22:33:55', '2024-11-04 22:33:55'),
(83, 'Ananda Sr', 'NIRMALSPACES@YAHOO.COM', '07829910097', 'Pending', NULL, '2024-11-05 11:01:36', '2024-11-05 11:01:36'),
(84, 'Ameliabob', 'yawiviseya67@gmail.com', '89487389951', 'Pending', NULL, '2024-11-08 06:32:49', '2024-11-08 06:32:49'),
(85, 'Harrybob', 'ibucezevuda439@gmail.com', '87422346848', 'Pending', NULL, '2024-11-11 14:20:02', '2024-11-11 14:20:02'),
(86, 'Davidreowl', 'alex.kayenda@yahoo.com', '87622328667', 'Pending', NULL, '2024-11-15 23:07:06', '2024-11-15 23:07:06'),
(87, 'C.settu', 'settu.cs@pftec.com', '9384029077', 'Pending', NULL, '2024-11-21 05:15:40', '2024-11-21 05:15:40'),
(88, 'Arun Kumar', 'jobsyyjoverseas@gmail.com', '9110659980', 'Pending', NULL, '2024-11-23 11:41:00', '2024-11-23 11:41:00'),
(89, 'Royal Sequeira', 'royalnithinsequeira12@gmail.com', '9113859781', 'Pending', NULL, '2024-11-24 15:14:35', '2024-11-24 15:14:35'),
(90, 'Xrhic', 'xrumer23Hic@gmail.com', '89168548467', 'Pending', NULL, '2024-11-24 21:14:47', '2024-11-24 21:14:47'),
(91, 'Sharath.b', 'sharathmurthy04@gmail.com', '9945120982', 'Pending', NULL, '2024-11-27 03:41:22', '2024-11-27 03:41:22'),
(92, 'Mike Cooper', 'mikexxxx@gmail.com', '85255343358', 'Pending', NULL, '2024-11-30 19:06:14', '2024-11-30 19:06:14'),
(93, 'Per-erik Meyer', 'info@professionalseocleanup.com', '84391776916', 'Pending', NULL, '2024-12-01 02:00:53', '2024-12-01 02:00:53');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `space_type` varchar(50) NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `min_price` decimal(10,2) DEFAULT NULL,
  `max_price` decimal(10,2) DEFAULT NULL,
  `pack_type` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `valid_from`, `valid_to`, `user_type`, `space_type`, `discount`, `min_price`, `max_price`, `pack_type`, `email`, `mobile`, `created_at`) VALUES
(1, 'VC01', '2026-01-31', '2027-01-28', 'Particular User (Email)', 'Video Conferencing', 60.00, 100.00, 2000.00, 'Per Hour', 'manoj@gmail.com,cena@gmail.com,vincemcmohan@gmail.com', NULL, '2026-01-31 12:48:20'),
(2, 'VC01_niriksha', '2026-03-07', '2026-03-31', 'Particular User (Email)', 'Video Conferencing', 70.80, 100.00, 500.00, 'Per Hour', 'niriksha@gmail.com', NULL, '2026-03-07 04:44:14');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `user_id`, `employee_name`, `designation`, `email`, `phone`, `created_at`) VALUES
(1, 214, 'triple h', '', '', '', '2026-02-02 10:57:16'),
(2, 214, 'stephine', '', '', '', '2026-02-02 11:21:09'),
(3, 214, 'nandha', '', '', '', '2026-02-02 12:17:58'),
(4, 189, 'miz', 'wwe champion', 'miz@gmail.com', '6767678978', '2026-02-19 06:31:19'),
(7, 216, 'Anjana Rao', '', '', '', '2026-03-23 08:32:47'),
(8, 219, 'rahul kumar', '', '', '', '2026-03-23 12:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `expires_at`) VALUES
(18, 'mkum9417@gmail.com', '5493632e6780e448d0e20050ae211166d78724977c150db675e7b20860b851ac', '2026-03-26 13:11:04');

-- --------------------------------------------------------

--
-- Table structure for table `spaces`
--

CREATE TABLE `spaces` (
  `id` int(11) NOT NULL,
  `space_code` varchar(100) NOT NULL,
  `space` varchar(255) NOT NULL,
  `per_hour` decimal(10,2) DEFAULT NULL,
  `per_day` decimal(10,2) DEFAULT NULL,
  `one_week` decimal(10,2) DEFAULT NULL,
  `two_weeks` decimal(10,2) DEFAULT NULL,
  `three_weeks` decimal(10,2) DEFAULT NULL,
  `per_month` decimal(10,2) DEFAULT NULL,
  `min_duration` int(11) DEFAULT NULL,
  `min_duration_desc` varchar(255) DEFAULT NULL,
  `max_duration` int(11) DEFAULT NULL,
  `max_duration_desc` varchar(255) DEFAULT NULL,
  `image` varchar(500) NOT NULL,
  `status` varchar(50) DEFAULT 'Active',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spaces`
--

INSERT INTO `spaces` (`id`, `space_code`, `space`, `per_hour`, `per_day`, `one_week`, `two_weeks`, `three_weeks`, `per_month`, `min_duration`, `min_duration_desc`, `max_duration`, `max_duration_desc`, `image`, `status`, `created_at`) VALUES
(60, 'WS01', 'Workspace', 1.00, 1.00, 4800.00, 5760.00, 7200.00, 1.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(61, 'WS02', 'Workspace', 1.00, 1.00, 4800.00, 5760.00, 7200.00, 1.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(62, 'WS03', 'Workspace', 1.00, 1.00, 4800.00, 5760.00, 7200.00, 1.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(63, 'WS04', 'Workspace', 1.00, 1.00, 4800.00, 5760.00, 7200.00, 1.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(64, 'WS05', 'Workspace', 1.00, 1.00, 4800.00, 5760.00, 7200.00, 1.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(65, 'WS06', 'Workspace', 1.00, 1.00, 4800.00, 5760.00, 7200.00, 1.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(66, 'WS07', 'Workspace', 1.00, 1.00, 4800.00, 5760.00, 7200.00, 1.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(67, 'WS08', 'Workspace', 1.00, 1.00, 4800.00, 5760.00, 7200.00, 1.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(68, 'WS09', 'Workspace', 1.00, 1.00, 4800.00, 5760.00, 7200.00, 1.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(69, 'WS10', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(70, 'WS11', 'Workspace', 1.00, 1.00, 4800.00, 5760.00, 7200.00, 1.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(71, 'WS12', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(72, 'WS13', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(73, 'WS14', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(74, 'WS15', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(75, 'WS16', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(76, 'WS17', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(77, 'WS18', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(78, 'WS19', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(79, 'WS20', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(80, 'WS21', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(81, 'WS22', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(82, 'WS23', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(83, 'WS24', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(84, 'WS25', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(85, 'WS26', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(86, 'WS27', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(87, 'WS28', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(88, 'WS29', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(89, 'WS30', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(90, 'WS31', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(91, 'WS32', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(92, 'WS33', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(93, 'WS34', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(94, 'WS35', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(95, 'WS36', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(96, 'WS37', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(97, 'WS38', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(98, 'WS39', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(99, 'WS40', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(100, 'WS41', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(101, 'WS42', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(102, 'WS43', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(103, 'WS44', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(104, 'WS45', 'Workspace', 100.00, 500.00, 4800.00, 5760.00, 7200.00, 4000.00, 1, '1 Day', 30, '30 Day', 'uploads/WS_1771576713.jpg', 'Active', '2026-02-20 14:08:33'),
(105, 'MC01', 'Manager Cubicle', 120.00, 750.00, 7200.00, 8640.00, 10800.00, 6000.00, 1, '1 Day', 30, '30 Day', 'uploads/MC_1771579376.jpg', 'Active', '2026-02-20 14:52:56'),
(106, 'MC02', 'Manager Cubicle', 120.00, 750.00, 7200.00, 8640.00, 10800.00, 6000.00, 1, '1 Day', 30, '30 Day', 'uploads/MC_1771579376.jpg', 'Active', '2026-02-20 14:52:56'),
(107, 'TLC01', 'Team Leads Cubicle', 1.00, 1.00, 5760.00, 6912.00, 8640.00, 1.00, 1, '1 Day', 30, '30 Day', 'uploads/TLC_1771581190.jpg', 'Active', '2026-02-20 15:23:10'),
(108, 'TLC02', 'Team Leads Cubicle', 1.00, 1.00, 5760.00, 6912.00, 8640.00, 1.00, 1, '1 Day', 30, '30 Day', 'uploads/TLC_1771581190.jpg', 'Active', '2026-02-20 15:23:10'),
(109, 'TLC03', 'Team Leads Cubicle', 1.00, 1.00, 5760.00, 6912.00, 8640.00, 1.00, 1, '1 Day', 30, '30 Day', 'uploads/spaces/space_69a167da181ef_team_lead.jpeg', 'Active', '2026-02-20 15:23:10'),
(110, 'TLC04', 'Team Leads Cubicle', 1.00, 1.00, 5760.00, 6912.00, 8640.00, 1.00, 1, '1 Day', 30, '30 Day', 'uploads/spaces/space_69a167d2663bc_team_lead.jpeg', 'Active', '2026-02-20 15:23:10'),
(111, 'VC01', 'Video Conferencing', 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '1 Hour', 8, '8 Hour', 'uploads/spaces/space_69a1636963c16_video_conference.jpg', 'Active', '2026-02-20 15:36:03'),
(112, 'CD01', 'CEO Cabin', 500.00, 4000.00, 0.00, 0.00, 0.00, 50000.00, 1, '1 Hour', 8, '8 Hour', 'uploads/spaces/space_69a163c4e2b06_ceo.jpg', 'Active', '2026-02-27 14:58:14'),
(113, 'EC01', 'Executive Cabin', 1.00, 1.00, 0.00, 0.00, 0.00, 1.00, 1, '1 Hour', 8, '8 Hour', 'uploads/EC_1772692598.jpg', 'Active', '2026-03-05 12:06:38'),
(114, 'EC02', 'Executive Cabin', 1.00, 1.00, 0.00, 0.00, 0.00, 1.00, 1, '1 Hour', 8, '8 Hour', 'uploads/EC_1772692598.jpg', 'Active', '2026-03-05 12:06:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `details` text DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `dob`, `address`, `profile_pic`, `status`, `details`, `company`, `password`, `created_at`, `reset_token`, `reset_expiry`) VALUES
(1, 'Admin', 'admin@vayuhu.com', '7348857574', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$wMsWKlOdbIGGOftyNYa98uV7tvX5jSETrciO0MWcwh0dtJ/twYKLi', '2024-06-12 10:39:39', NULL, NULL),
(2, 'Ram', 'ram@vayuhu.com', '9538824365', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$ch/HiMZkZDgxtjvSjLTa2u7TO3S4nUIJrQIUsYnV8dT8ce9opjS8m', '2024-06-12 10:39:39', NULL, NULL),
(3, 'Sudarshana', '', '9866151201', NULL, NULL, NULL, 'Pending', NULL, NULL, 'cowork2024', '2024-06-12 10:49:18', NULL, NULL),
(6, 'Anitha Bandi', 'anithabandi@gmail.com', '9866151201', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$cyy0/Skx5QZLbij54SrC4.2IbsRsj5ontzWR8V.xCZJgwYWfsmn7e', '2024-06-13 14:29:27', NULL, NULL),
(7, 'Tanuja Tanu', 'tanuja.suresh@vayuhu.com', '7348857574', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$ROcvF6x.DSufU/ONmf/yQecuRi9Z.Zu6GexM6DSNbHSGRaxHoXZkC', '2024-06-13 23:23:52', NULL, NULL),
(8, 'Deepthi', 'deepthi.pra.18@gmail.com', '7760619151', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$M2NpM2eUmPYOBqOufN7nzu21nvRcVMpFCWDHgjuKYmFs.HPOaEvge', '2024-06-14 10:07:16', NULL, NULL),
(9, 'Sanjeev Basapur', 'bsanjeev124@gmail.com', '8105647301', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$ZHRQUkIVrXt1KWv/lgMjruTsjYYROeX.hyvCt.mQBr88efzKipgiK', '2024-06-26 03:18:39', NULL, NULL),
(10, 'AKSHAY G', 'akshaysnb@yahoo.com', '8197148969', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$kSPA/jS3Bl2qg9I22YfaEeW7pGzKH70ZDMou69jimqeB6f6eqcKbS', '2024-06-26 03:52:47', NULL, NULL),
(11, 'Thejopaharini P', 'thejopahaarini.217@gmail.com', '7022190742', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$7aimv5p6Ug.SwOHxLTw2CerMovZpAh4PChncPB1vPCw1fBnDGykRy', '2024-07-01 07:14:42', NULL, NULL),
(12, 'Ram Kumar', 'info@thisisnotvalid.com', '7676981712', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$YtAuuMlAuwwaezMcdxPNG.nxrR7SsPe7GSzOvVbAxJFVUc2RnF1D.', '2024-07-01 16:40:25', NULL, NULL),
(13, 'Yashas', 'info@thisisnotvalid2.com', '9900519693', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$ix7lInscsuAq8vcPFZzgj.mR1mKtvv62m15Y7W84/mY7wD6PJsSGa', '2024-07-01 16:44:50', NULL, NULL),
(14, 'Venky', 'venky@thisisnotvalid.com', '9845583486', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$IUmTkFVHivkxvYBc9eQGGOT2JlNAK4gMWxKbjJQOFP.1jYMAnIX5W', '2024-07-01 16:45:59', NULL, NULL),
(15, 'Ramesh Baliga', 'ramesh@thiisnotvalid.com', '9900003827', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$DUPKmBBAaWElP4P0ocDGzePBedJv2GeU65vyVNOR1PIPj1a1tb4eO', '2024-07-01 16:48:57', NULL, NULL),
(16, 'Ranjith', 'ranjith@thisisnotvalid.com', '7411033113', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$KRhaHevvb1dDXBx8zU/r4uHJ4GaNAiifF4sNH0GAQLQm0d11PSxHi', '2024-07-01 16:49:45', NULL, NULL),
(18, 'Rohini', 'ramanedirohini@gmail.com', '7829646999', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$LnEHNxXQm3KbCnQExaLZhu2B/zaOu4r3J8Nltc3xojK8rE.0taGKq', '2024-07-07 22:51:24', NULL, NULL),
(19, 'Tanuja', 'tanujanandu2000@gmail.com', '8197479547', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$KDkk.aXbKjx.lcb98FESA.1XRrcIaykjQEvtOfnAtkz1ZWs33cvDu', '2024-07-07 23:12:49', NULL, NULL),
(20, 'Vikas', 'Varun@scopycode.com', '6364862111', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$C4Iw2QTAbLeWhtq9fCeFC.JfYkbKFl7AVGBWptwJjaazsfmhb0z5q', '2024-07-13 19:04:30', NULL, NULL),
(21, 'sharadha', 'sharadhamh3@gmail.com', '7349756286', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$UrCGcAJpmqPsNq3m3mrflO7igDmoRLQyWeXUiV0djZGxTD5FWLi/y', '2024-07-13 20:44:47', NULL, NULL),
(22, 'Vikas', 'vikas@scopycode.com', '9680561366', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$wc0bHOVIVj6IgZ1ekHiE.OMTF71gA3iL5gnRzcsd5uVX/AHPooxiS', '2024-07-16 00:19:52', NULL, NULL),
(23, 'Jasvanth kumar g', 'jash.jk@gmail.com', '9591600441', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$Uoe2D8ZRD4h8epFyUO.U5OakRxAk82EhvPTkzQjOtPr3rUT6tWDKO', '2024-07-19 06:07:46', NULL, NULL),
(24, 'Tanuja', 'tanujatanu012000@gmail.com', '8197479547', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$KSJgl0fJEcBGRhcbOK6C3uXmxM7GQHsSJFHdBnl3dS.vcVfEYwb4.', '2024-07-24 00:32:18', NULL, NULL),
(25, 'kiran', 'kiranraov14@gmail.com', '9538000077', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$HTSBm7Y17ZlkhNPTWa1L6ew2ba46TCgUdctsloGZlWegs57rKNKUm', '2024-07-25 00:43:49', NULL, NULL),
(26, 'Shreyas', 'shreyas9705@gmail.com', '9972211910', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$mp31J5h.tBnJJXfcUsCehuZFvKMq09waoVQsXFj1JXaO1xK/BU7JW', '2024-07-25 08:08:07', NULL, NULL),
(27, 'Shreyas', 'shreyasram18@gmail.com', '9972211910', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$Uvg6Wu/lTpXK5Twm4Cxj8.euRdkg8FgSlxAl9PqXM5E2LeAdvdNqm', '2024-07-25 08:45:44', NULL, NULL),
(28, 'Manjunath LR', 'manjulr1999@gmail.com', '9741178041', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$L7Uz4VbReQEl7Dx0mXio/.IMLISLZpoTPdfGF/0fcs8bTGRGklKH6', '2024-07-25 09:31:07', NULL, NULL),
(33, 'Megha Vishwanath', 'meghavishwanath07@gmail.com', '7899969588', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$4i4L6uSHbkSYGjyVLwri7ePutS0k3sWlVcDKifc8se4LdjXzjzlUW', '2024-08-02 05:00:26', NULL, NULL),
(34, 'Amit K L', 'amitkl200860@gmail.com', '+919880628553', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$iCJjqTmmREG5KZToVD9txOZsp/jvZcVmhWwFcodYuM2zLar40iOxC', '2024-08-12 00:09:47', NULL, NULL),
(35, 'Reshma E G', 'reshmaa2527@gmail.com', '6361186583', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$dP/sEUdosg.IUnyx.zPRp.7lvwCDRRIsPAmY1aws0Dc8ZRUIGLNea', '2024-08-12 02:45:36', NULL, NULL),
(36, 'Sanjay kumar', 'sanjay@selectorshub.com', '9663877336', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$FUbHoes00QJXbMKJ69KsC.zICu9IAsNZZY7jGnjCpeNJemYFS0U1m', '2024-08-13 00:27:10', NULL, NULL),
(37, 'sameer', 'sameer.p.mirji@gmail.com', '9880169088', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$wcaIQ.RPaa1hERQ0BOoeqe6.foCwrPB0Bq1hP/WEPLwtSaFr6Kmy2', '2024-08-21 01:54:48', NULL, NULL),
(38, 'Karthik', 'misterdigitalbangalore@gmail.com', '8660528244', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$un37aqgFeSKWUVShHn2LCO7wa8E08v5WgAFoISGtcysjwR5g6LVey', '2024-08-21 20:39:24', NULL, NULL),
(39, 'Bishwajeet Kumar Singh', 'sales.vishwodaya@gmail.com', '8789958231', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$0VbPwmBcHD/7FllhxqzeQO/iM3iSP1lS43EbgDRfCJykSyV48pyBK', '2024-08-22 00:36:37', NULL, NULL),
(40, 'Aravind Chowdary', 'g.acpvt@gmail.com', '7661095506', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$9bilxcWQRm8bNz7DoJMiTuweRtxeFZ/DwjPkczZ9T.D80iCKyMiLq', '2024-08-28 01:12:11', NULL, NULL),
(41, 'P A ASHIF', 'asifmohmad811@gmail.com', '+917306429892', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$S6OoBXluzOJIL2z0A1yteeQeFki4H0SfewBmsBGTyWiO7ZTotIp3y', '2024-08-29 04:22:49', NULL, NULL),
(42, 'Unibourne Food Ingredients LLP', 'arwa@unibourne.in', '09004598579', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$iXU3yvV5Mf8MkAjgJ.rFl.JpL7aV7LqYPpHAE.B3g1XpG1aRA9urC', '2024-09-02 04:11:35', NULL, NULL),
(43, 'ravi', 'ravichandra.nalam@gmail.com', '9916704900', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$0CAdihEv8xOYGKzeoNm1i.1MSC.uDounzqvI5.ur3HJIyWbXawmFu', '2024-09-02 22:10:54', NULL, NULL),
(45, 'Test', 'test@gmail.com', '123456789', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$8mjYo1XMr1F9K7LlbTPOE.7JuaM3a48jHrczfymqauO8hO4GejV96', '2024-09-03 00:13:37', NULL, NULL),
(46, 'Test2', 'test2@gmail.com', '1234567893673', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$NkunHTg0YOYYN/oXLFzdpOUsEWTMZIbka0PmycHFLmqkwU5NVGZOm', '2024-09-03 00:27:37', NULL, NULL),
(47, 'Test3', 'test3@gmail.com', '1234567893673', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$ho9E6.vqApzGpC/oLVWwJewcAMB6ANWlh8q53HFel7cG04JWJrn4W', '2024-09-03 00:30:10', NULL, NULL),
(48, 'Test4', 'test@gail.com', '1234567893454', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$b/1wJJCtnB2VkYN8Y.o33Odf5j11arXP8D1Am1NUCjSxlE2d4MWAe', '2024-09-03 00:42:49', NULL, NULL),
(49, 'Naveen Kumar', 'navewnjr0026@gmail.com', '9611264211', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$Vy4lh7AwaGcTBf8Z4MP0rOvhMbqYjN6VHYwuDeqy8B.HKuSwdyT1G', '2024-09-03 05:13:03', NULL, NULL),
(50, 'Rohini', 'rramaneedi@gmail.com', '7829646999', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$Tf6MMDAx3WaWwIOfBY8egeIjOkCOFOPqh58Ab0nwORx/Jv3CWTu16', '2024-09-03 22:18:59', NULL, NULL),
(51, '🏆CLAIM 20K Lira - Your Key is One Tap Away https://bit.ly/3KpOr1D 🏆', 'salavat@ya.ru', '9093429282', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$qymGRp0Iru8CGAejnD/upuU3OOAPnV2r/RJRlW7E9GwLdGjqMp2jW', '2024-09-04 09:33:40', NULL, NULL),
(52, '🏆CLAIM 20K Lira - Your Key is One Tap Away https://bit.ly/3KpOr1D 🏆', 'bropand39@gmail.com', '9092345678', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$J6GXsTif.NHX61WjZeeDh.jeG/yaVIu4FzRtzq.a4M9N6opaQyCXW', '2024-09-04 09:33:57', NULL, NULL),
(53, '🏆CLAIM 20K Lira - Your Key is One Tap Away https://bit.ly/3KpOr1D 🏆', 'sifyisirzo@gufum.com', '9092345681', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$2VXn9WM1fg9qnB2QdAtNhuv28WqxT4rZVofa.4Hs4BW35Rz9W4/ym', '2024-09-04 09:33:57', NULL, NULL),
(54, 'Srinwaynti Samaddar', 'srinwaynti88@gmail.com', '8880186046', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$cHi5ctelcg6d9d9Ylg97r.5RYW4Pg5oTKKWT5vLzY5UoZjDNOS44q', '2024-09-04 22:41:40', NULL, NULL),
(55, 'Harshini A L', 'harshiachu1996@gmail.com', '7483675516', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$iNSehvrUiNJ6o0WpFs7xuu9BatShJwhfeD/7hx3gmGM4udG4OriWu', '2024-09-24 01:12:58', NULL, NULL),
(56, 'palaksha', 'palaksha@acquiscompliance.com', '9886377752', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$7AyoYQL5gl1eOTFKNt4W8.B4PtveCtX2AazqcT1aJIrSr882QddZu', '2024-09-25 04:47:42', NULL, NULL),
(57, 'shashi', 'shashik@acquiscompliance.com', '7349568298', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$L2x1HjqC7cbSrnhxy1lq/.1rTO97xuYLfMndFxb2WY7Yup08NI1N2', '2024-09-25 04:51:15', NULL, NULL),
(58, 'Nadeem Momin', 'nadeem.momin@gmail.com', '9035922315', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$xy9BbUt9y5NZMaO3JfDIxecQ8ORvwO.MpRaNGpj.oUUD7lkRivVya', '2024-09-25 06:49:59', NULL, NULL),
(59, 'naveen kumar', 'naveenkumarms2516@gmail.com', '8310047180', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$2eQ8fiWebcKInj921G9gme87tk2QxT.t1khvPGP52IW2KrmYCfBK.', '2024-09-26 06:27:07', NULL, NULL),
(60, 'ramesh k', 'roevivek@gmail.com', '9945560932', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$9cFz4MHtYnkFmlPXQVu2XuYkdrzFO2oJXIZqDjSHzKP9Aeq.kqmD.', '2024-09-26 06:32:23', NULL, NULL),
(61, 'Shinas ks', 'anakhakl8@gmail.com', '6282696981', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$xJ7c7w0FdlcI7HGS0qJcMexLwasq2tnBWFZ2lvtyXNR6aML67wd3i', '2024-09-27 00:55:16', NULL, NULL),
(62, 'Vamsi', 'pixelstories4@gmail.com', '9555998105', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$6APB9QP10kv87//SWbT9ceSxkvSuaCfdsFruLE9yVErLzhPseUyPa', '2024-10-05 22:48:28', NULL, NULL),
(63, 'aravindha raj', 'aravindvr.official@gmail.com', '900877712', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$l8TsLFr4taCn51jptTyAFuUN6Cq3PD1/GnN3UEzV896uJFkbgh.12', '2024-10-07 01:02:21', NULL, NULL),
(64, 'flbgqvwd', 'crackllc373@gmail.com', '0154790874', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$6NqpNEndR.Df/M0AFnaKn.zYeomNBepKYuDmt42JQoPTo8Sp.sXv2', '2024-10-08 18:43:15', NULL, NULL),
(65, 'Pravinsagar Prabakaran', 'pravinpraba@gmail.com', '9880091323', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$gdXGiX7sZQE2cc.RSnlSTuwXowYVEyiD6WDXH0dcgkuS1WxA7pstO', '2024-10-19 08:30:57', NULL, NULL),
(66, 'Iliyas', 'eshwardkt@gmail.com', '9080388379', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$fytylYxJJE0n5NAazHVdre9g2ahfm4f.Sn10B3/lyzDV8JpFEFxg.', '2024-10-22 05:42:08', NULL, NULL),
(67, 'Iliyas', 'mdiliyas.org@gmail.com', '9080388379', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$H7JOXoWXt7KR5i3nuphsJeUdYDp2lnQj3UwrTf.FzjhG47XDTzJHu', '2024-10-22 23:30:52', NULL, NULL),
(68, 'Manoj', 'manoj.manina@gmail.com', '7259787316', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$rBMKa4PS5W9s3k5RFMR/luizQ42IVi2Dr0v/bxGLfzaFV8wVXLS5u', '2024-10-23 09:20:52', NULL, NULL),
(69, 'Ravi Teja Meruva', 'raviiteja.meruva@hotmail.com', '7386908448', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$wXVbbVwBs86ECCcA6MV9uenrpC1ckoHAX18lCoYbEHi8L3xm5nKeu', '2024-10-24 01:28:07', NULL, NULL),
(70, 'Iliyas Basha K', 'mdilyas.org@gmail.com', '9080388379', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$baYNKmUpCNX3IGo.NOv77ukqmezh50B2DumCJ.Ilw7SZ82NTxAhAe', '2024-10-24 03:18:10', NULL, NULL),
(71, 'Prabhuashishms', 'prabhuashishms@gmail.com', '08296364551', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$BWhAj2ndOnmLVvdvaiNF1O8b8ejxI.aRsOl.P4s6VmgioXRxAyqa6', '2024-10-24 10:26:37', NULL, NULL),
(72, 'Sai Sanjay', 'saisanjay589@gmail.com', '7019096391', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$eS2JxeQVLFg1GTDitPZhwu9LHC0yxb.bw9LMICXd1nWa/rDPPgv9i', '2024-10-24 21:06:56', NULL, NULL),
(73, 'Farhan Shoaib', 'farhanshoaib95@gmail.com', '8095839587', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$TlnQlujo1smNil980Qk8FuWIHv7bpxpJ1SRoodhzINZS7cgWi5nDy', '2024-10-26 03:54:19', NULL, NULL),
(74, 'AlexLenMayday', 'vayuhu.com-k@volokadm.store', '88423128741', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$7hm/8q0M4OuGxqAr/FSa4OSQ26ezWeXzuuMBf6xCIuk5sj9et/6sG', '2024-10-29 03:34:47', NULL, NULL),
(75, 'Prajwal Shetty', 'shettyp453@gmail.com', '7892218476', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$AYsUmn4Ox39hQKp0dB1x2O.ACysO9l3L7zXdTmU..4mxWfyb4PKAi', '2024-11-02 11:43:27', NULL, NULL),
(76, 'Ananda SR', 'nirmalspaces@yahoo.com', '07829910097', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$rJ9t5wInK4mZRrL.BYWKrem.CP5R1Ed7ZnT3dVrF25eM44xGy6tFq', '2024-11-05 05:17:30', NULL, NULL),
(77, 'kushagra', 'kush.726@gmail.com', '9351359088', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$Pmkf/nfeGqCVnshfPOPDleQTg1pyXR5QS8KoBvwkwozm1Mtrym3gW', '2024-11-12 07:01:39', NULL, NULL),
(78, 'Harsh Siwach', 'siwachh.h5@gmail.com', '08217058862', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$jIuSsmPwei7CmWftkwpmpO8fmvP1BztFvWwFeQdArdcqLAg7k03ou', '2024-11-18 21:15:38', NULL, NULL),
(79, 'Premchand', 'prem@zestcover.in', '9845234584', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$8zNp4VcjiRO42UJFDQxjjO.oybTKzX4lrk0VtH8DzLAQQmJvhga3u', '2024-11-18 23:06:09', NULL, NULL),
(80, 'girish', 'evgirish@gmail.com', '9448308686', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$wWzyALJr2GqrKiwWoEW0vuYFcTZnAOlq1LoOesd5ZrDuoIKm2AFnO', '2024-11-23 01:12:17', NULL, NULL),
(81, 'YYJ OVERSEAS', 'jobsyyjoverseas@gmail.com', '9110659980', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$taGtGzUo7iu2r9oxryQzROi8i.RWi2MFPdi36DKULcaJodepoMytG', '2024-11-23 06:08:55', NULL, NULL),
(82, 'Akshay', 'aksbeerala@gmail.com', '9845400437', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$qYE1n9dEmqwwiPQNQomiiO5UwNceZFqNxXw8wx29xkEtke0Z.d/wi', '2024-11-24 20:37:20', NULL, NULL),
(83, 'Madhur angi', 'angimadhur@gmail.com', '07877896390', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$D/SY.1nDUhEXYBrM50wdNObfQiiMo88sr6WsT3xc4/.S6812ggtBC', '2024-11-25 01:52:29', NULL, NULL),
(84, 'gaurav', 'support@timeboard.me', '9591385551', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$xVevPgmijfFRcHsmuoVU1uo2dvMiMiDfQJbwDpZhV4VaGACPg4f/a', '2024-11-28 22:03:05', NULL, NULL),
(85, 'Shrikanth M', 'shrikanthmohan@gmail.com', '9916927220', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$GyJLl0QuQjTR5z3UNQ.Vme/T7grmvohYkB5oNbrTFKsJHj.5Nu7Bm', '2024-11-29 23:27:51', NULL, NULL),
(86, 'illiyas', 'ae.illiyas.k@gmail.com', '9080388379', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$h3dvk.7wU6ulKWI1SypL9OEtwWiOgdYOz.Q7Bn6kV7S5XoSTxBxDS', '2024-12-02 00:27:22', NULL, NULL),
(87, 'Sachin george', 'hreurosummer@gmail.com', '8078237368', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$mVEBZ/EdDNARcMC1lYdhC.Ty6AqxGNL5GbOmxn2dzNmS9MU3sbsYy', '2024-12-10 01:11:44', NULL, NULL),
(88, 'Saswat Swagat patra', 'saswatpatra60@gmail.com', '7077784386', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$/EXrMNP3xnl1MAHUMMuPw.21gckamuCo8JJ5aKZqnYsGMWxkxzL1e', '2024-12-13 03:21:02', NULL, NULL),
(89, 'Asmin Roy', 'asmindu94@gmail.com', '9937579830', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$veHrRP4FyMKaC6qTy9l95eLGLzcVYSnIPBQ55Lyn8Fzj61dHOkxqa', '2024-12-14 02:00:30', NULL, NULL),
(90, 'Hajeera nazeer', 'madsterofficial98@gmail.com', '6362649797', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$uWG9LEDSF.9rypqQ.Og1A.4BAflO.EKAqyOLh6Nl7.sHlQlg42LpG', '2024-12-15 01:06:36', NULL, NULL),
(91, 'Devank Gupta', 'gdevank22@gmail.com', '9024790731', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$C8BGKtgjhytm50ge7Ue7gOPXeaD.NczAMe2TlTETCmDdrkWU25MvS', '2024-12-16 02:20:37', NULL, NULL),
(92, 'Balaji B S', 'balajibs0708@gmail.com', '9513227608', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$3QBwlJpyXK8AYpQJTYvpzOBsd6ahbMFPUNo93.zSKmaWuSbYwTceW', '2024-12-17 01:20:10', NULL, NULL),
(93, 'vikram', 'vikram.gill@techlanz.com', '7717318119', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$BgWINVgRUS6P/ThmVHQCbeb6igK0wP1iUoc/myMjKTkE0BXLObFzi', '2024-12-20 02:10:20', NULL, NULL),
(94, 'Pravin', 'pravinpreba@gmail.com', '9880091323', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$IThNhEpGzOmxvnDoRWTvKORpKftEHgnJROjGwSE8JFQMN7pQHoTAa', '2024-12-22 22:54:49', NULL, NULL),
(95, 'anand raju', 'anand.raju535@gmail.com', '9966090651', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$KvhZxrgzz7/ERfHnWtpyZuYYZJMkIuWQGvMhyW5TCMQZymoyYaQCe', '2024-12-23 04:28:37', NULL, NULL),
(96, 'venkata krishna', 'venkata@yuyiii.com', '8978495010', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$RyCfwJoWyttigbDIR89YE.n/XTlKsf23Fbs.QLY.NnkixJgAm2bPa', '2024-12-25 23:38:18', NULL, NULL),
(97, 'Karthik N Bhat', 'karthikbhat01@gmail.com', '9611868209', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$i.eqAeTBlJ9DmcuE.kgOtOifb950Vrtlt8fV.fhA8Mbe0Ay/sO6Ii', '2024-12-31 00:53:55', NULL, NULL),
(98, 'Rahool Ram', 'rahoolram153@gmail.com', '8951090315', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$xOYdtOvgwQ1J7GFBSOAsDOMGjEyFlEkEI4OtpX.ZHxg.P3eZ1S6Ye', '2024-12-31 03:17:21', NULL, NULL),
(99, 'vahid ali', 'vahidali416@gmail.com', '9620243786', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$h1NgdUtU99sKRJQI.C3u5OF1epAeefhAWmLeFLU7A8vvv3MwrK1Tu', '2025-01-01 23:34:09', NULL, NULL),
(100, 'ravichandra', 'ravichandra@yuyiii.com', '9740036880', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$IAZfvgGGuiw/pOwqWUJGTOrEAgzvprYD6jh3pLdcYSl8s6ggPxiN2', '2025-01-02 02:46:18', NULL, NULL),
(101, 'Deepesh shukla', 'ds.ashlar@gmail.com', '9654884425', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$7VIgifxdLlb1C//8WqNOeO9awnZ0gAlJeYJ23MhWYtSVME3eB1hsa', '2025-01-06 22:59:01', NULL, NULL),
(102, 'Sharath Gowda', 'mohangowdasharu@gmail.com', '6360093015', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$C12ym3OhcZVA0TI5S/MC9eqizPJTgBQCDL7y3wBBzCSpTrpXc36yS', '2025-01-07 23:34:50', NULL, NULL),
(103, 'Anthony arun m', 'arun.usedrive@gmail.com', '9731115126', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$o2cv3Gvt1P5zoj4O3eCEMu2wqruwQy5CaKaRJ4B4gqg5Zs/Dar8uC', '2025-01-09 05:54:46', NULL, NULL),
(104, 'Pradeepa A K', 'pradeepa.ak@heterohealthcare.com', '8660777100', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$mVQ/grp5YZ3Sj0zL38P./u0naueRLNBwICZlyfMStxV.Xbf/FLyTq', '2025-01-10 00:22:05', NULL, NULL),
(105, 'A K PRADEEPA', 'akpradeepa@gmail.com', '8660777100', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$OUCbo3igRlhq19nJ1MwtEeikzKG99wE5o5vk/7/H5I144JHiusFr.', '2025-01-10 01:10:01', NULL, NULL),
(106, 'Maneesh V Rajpurohit', 'mvrarchitect@gmail.com', '9886948393', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$33pweKTuDr0NXmQDcrO4EuCX5boTxvCpV0Fh3xbXIAfMmE6khpQK6', '2025-01-20 04:53:17', NULL, NULL),
(107, 'pooja', 'shreepooja301@gmail.com', '7338151565', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$.u1LHdMXxduSXHDuyJY7WOvFk8XiA1bNMMPrY4whigucKAhcQZTsq', '2025-01-20 06:01:06', NULL, NULL),
(108, 'karthick', 'glarehr@gmail.com', '9742929777', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$CU2QtQf7NqYP5oTuy3cHp.KNU5BmW5nL5nQ/O47VPgL/xJ/WKqRtK', '2025-01-29 00:27:47', NULL, NULL),
(109, 'Pooja', 'poojasri1103@gmail.com', '7338151565', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$8wbAbVamV3dgC7EVfQ6Xcup74vM6eJGmSKzlyNnfAScYgjHOvBwzy', '2025-02-01 05:22:55', NULL, NULL),
(110, 'John Peter', 'jpeter1710@gmil.com', '7899118227', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$DbckzIndryBhJRDjXhfTROB/AFkL3BF800OtTMLluUghE9yoyjGSy', '2025-02-03 06:04:47', NULL, NULL),
(111, 'Nikil', 'tropical690@gmail.com', '7620574336', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$o70V11GxrrC/sgGdeFFuAuX5CPo0qlC1865jkMs/MFr5I2zD24yAW', '2025-02-10 00:25:52', NULL, NULL),
(112, 'Eshwar', 'malireddy.eshwar@gmail.com', '7019681810', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$/ezWwk/g/kvveOqfDDPXFuwQw4mdjLTCAH0yyRJzcYJSVja1TsO3S', '2025-02-11 00:59:25', NULL, NULL),
(113, 'greeshma', 'srigreesh7@gmail.com', '7996044223', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$fpL8CXxNjMFAjQPKp4zRX.D4K9L6sizRE5nYnKU7WJvckkfd2EUEq', '2025-02-17 05:01:04', NULL, NULL),
(114, 'nikhita uday', 'niki_cloud9@yahoo.com', '9742535653', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$y/7SC272wxqcRIxeKvaTnO4Nl.jeN2BHkvtRRkD5oD9RxyjfZj/be', '2025-02-28 03:15:26', NULL, NULL),
(115, 'Adhya', 'adhyaspadmanabh1000@gmail.com', '9483477997', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$Y1y5k.yS1LhKneq6vGUBku/dephP3vSbTSlBLlnrAe5.M.4Wa5CMu', '2025-03-02 10:57:26', NULL, NULL),
(116, 'john', 'jpeter1710@gmail.com', '7899118227', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$Il.tF1ej7BOoaqDPytyoVeMNMhnlzcF25kVe1XYWGieufeMHstOCG', '2025-03-05 03:58:37', NULL, NULL),
(117, 'Hani', 'services.acuitey@gmail.com', '7996044223', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$UkimWo6TbTDN3pcGyuaq.u4G6Pk5riAlzMGnbG7ob66ZCjonTrm9S', '2025-03-10 04:42:40', NULL, NULL),
(118, 'sachin kumar', 'sachin4510@gmail.com', '8951820217', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$oz1oseDuLCUks.XXuQ1zMu9Byc5hAyITxCwrX3DeGMU469L00qgO.', '2025-03-17 00:27:53', NULL, NULL),
(119, 'Chetan', 'chetanrr10@gmail.com', '9902510666', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$8/KNSRvr6csEYosACNvIo.k2kAlAGriDauE36cbIlRruMdw1g8mnS', '2025-03-17 07:13:33', NULL, NULL),
(120, 'raghu', 'raghu_binb@yahoo.co.in', '9342640367', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$6VCsM71sFZT3dXdJGDbYqO/JA6NsFVr/rSrJeUfCnR3uopJ90tKJa', '2025-03-24 01:28:35', NULL, NULL),
(121, 'surendra', 'sonerdner@gmail.com', '8431557026', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$T.UPsyWIWPfDx7MNd8IUN.i4PtP1p.SX2ng41VkfwgHwLwGUTpZKa', '2025-03-31 23:30:18', NULL, NULL),
(122, 'Rakesh Pawar', 'pnrakesh84@gmail.com', '8971600816', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$On8t1zZpgfvbmsEnxT6SSusLRPUBvlBlnRDa6s3zC3ZCrWAt4gUPG', '2025-04-01 01:45:48', NULL, NULL),
(123, 'Veena', 'veenaraj@gmail.com', '8277317836', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$OufJd7BL2s3ytbJsdFnDluXkzNcqootIIuH8ySUT4njeFtvdoxLeu', '2025-04-10 23:07:06', NULL, NULL),
(124, 'Vidyadhar Reddy K', 'vidyadhar.reddy@vidpro.in', '8722400040', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$Eivv1TQAjLLGLtL6eZ5CpuE.V85/KV3LkbK37QmzNx5CZWS9U8Mc.', '2025-04-30 01:14:23', NULL, NULL),
(125, 'balaji', 'sales@buildarc.net', '9513227608', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$CP0mKzl194lVVR3MFhPL5O9GlckEksy6G1GEj.VdABo7L1yvP/cSK', '2025-05-05 23:01:02', NULL, NULL),
(126, 'shruthesh89@gmail.com', 'Shruthesh89@gmail.com', '9663715409', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$LMQmT8FtU.XcOcjwCiMubOXYSgtKiiMPYMTLrTg4CU57/WXtedt6C', '2025-05-06 02:57:38', NULL, NULL),
(127, 'Sai Srikanth', 'saisrikanth@collekto.in', '9606632306', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$HX1Jdc8wlIDgB/5N0JBPcuXNSAFG3teUpPPvUPT5HrJPMbTm9AHVW', '2025-05-11 21:25:14', NULL, NULL),
(128, 'Wasiullah Zaffari', 'wasi.zaffari@gmail.com', '9742291417', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$8eTKQ9OUTgs.JovTEjeSeu0bu4X2njw.epGNgyt3g51ANFa7W3Drq', '2025-05-27 07:17:28', NULL, NULL),
(129, 'S Venugopal', 'svenugopal407@gmail.com', '9440631401', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$6lhjv6kQhLZjiNBCWWPm8OGMh8BcwARRON2gPl4VGolCMtJAMYe8S', '2025-05-31 01:28:07', NULL, NULL),
(130, 'Pavan Cannonkadu', 'Pavancc@gmail.com', '9900032016', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$pR0hxth./qiv/uAmjygJoeq3L/NuHxrucwSO7c3brwjA8iUjU8IBi', '2025-06-01 12:20:09', NULL, NULL),
(131, 'Farha', 'farha.yusuf.memon@gmail.com', '9167925047', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$.piIrHN2YeE9GbTMTGlgXujOq77nbZcjliVVPirvC29uhCSQMbHX2', '2025-06-02 00:20:48', NULL, NULL),
(132, 'Tasnim', 'tasnimchaviwala9@gmail.com', '9727052142', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$/zGyxzhigH3nnTFexJGCvOoba6cUxqxIsld/O1i8vOnufwi6CG6Dy', '2025-06-02 00:23:08', NULL, NULL),
(133, 'Priyodob Kundu', 'priyodob@gmail.com', '9110482531', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$Mdg.HzPHLsCPHIJQHguoSuCPen0ZI4gA8RIhhOyeJbfrPrKdkthIe', '2025-06-02 07:28:06', NULL, NULL),
(134, 'TravelMingle.in', 'travelmingle.in@gmail.com', '9966101722', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$xlzEM01PK6b7UWSYN6AtnOevttg/y768OXANh6qMRIAfAezMIB3hW', '2025-06-05 00:17:16', NULL, NULL),
(135, 'Govind Gupta', 'ggcapitalmind@gmail.com', '7838978836', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$9QD8LIeB4MpisVg.n946Reh4p3dR.yOo/NJE409O4HQGg9dGAHLey', '2025-06-09 21:25:38', NULL, NULL),
(136, 'Nandini Prashant', 'nandiniprashant0217@gmail.com', '08884278869', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$m/5iAesMJV9TmJrYErGP2eHdXhE2epUpWoNoJlmjSHe9STUzODph.', '2025-06-11 11:30:16', NULL, NULL),
(137, 'Samantha', 'samantha.fernandes17@gmail.com', '7406979015', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$FppPYOcIS5RTJzXzt.nZ0uQXT8/6gyjwKl6LEmPALrzqPessWPytK', '2025-06-16 07:32:14', NULL, NULL),
(138, 'Vinay Nagaraj', 'reachout.imt@gmail.com', '9019678279', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$hFi6z0jq.aR5x7KdVo.Sv.WZ4VgFVC/bPgFP7Z3yrLMj0FpT7g8Wi', '2025-06-20 02:41:52', NULL, NULL),
(139, 'Mihir', 'reachmihir2003@gmail.com', '7349534113', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$zUnDMrT4C1rMQyl9zszeKuhs3Tqxn.pBONYbohkEeu4Z2fz3o9hKu', '2025-06-23 09:24:45', NULL, NULL),
(140, 'Greeshma', 'greeshsri@gmail.com', '7996044223', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$Oqy0XPl06D.9Dg2kMUQOAeHrecgMPOiOJvtAr9tiz8qdSR0/VrM3m', '2025-06-24 22:42:13', NULL, NULL),
(141, 'Guru charan V', 'gurucharanv@gmail.com', '9741190902', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$DH8oKsw55hkr2qIYDbPANuf/smsKtfOR0u3KcS6/7CIee3f5YOtk6', '2025-06-27 06:01:43', NULL, NULL),
(142, 'Akila Bhat', 'cakilabhat@gmail.com', '7022390473', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$Ne7dFNHWuv4EvfOUq.3beemFVEVdn9qPBxSRtNzTSZYbXMX53rA1u', '2025-06-27 06:06:21', NULL, NULL),
(143, 'Dheemanth', 'dheemanthadiga01@gmail.com', '8951347112', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$0Loo8wZV/4Nsdeax46KCjeHzuhYwYWkF9GeyzJRabtqOPKGiTleQm', '2025-06-27 06:12:29', NULL, NULL),
(144, 'Kaushik Krishnamorthy', 'adv.kaushik@outlook.com', '9995835963', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$0IYka8177WDbhX9VqDYIPumpgOPsOY1QvqiR5c3h06n48n66wb4D2', '2025-06-27 06:15:36', NULL, NULL),
(145, 'Preetham K', 'preetham.k@planmytripsblr.com', '6363418041', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$.3LHfZBtXp0Vwqt06vQxke.CannyEnz4WCXMp9tsLs788s5pNTQgm', '2025-06-28 00:23:13', NULL, NULL),
(146, 'Karthik Bhaskara', 'karthik.bhaskara@gmail.com', '8050566392', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$a6LrxWU113Z70c5UfV38R.yqyBRIwIQThOxSlr9NfiDmxEpwHKKtG', '2025-06-29 23:21:55', NULL, NULL),
(147, 'Krishna tiwari', 'kt31309@gmail.com', '7798646807', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$2FJzt8nHttObMZplNhwpXOG/JGDr7YhYcHxuzrHNSOsRvfiOy6pwW', '2025-06-30 03:21:43', NULL, NULL),
(148, 'Khaleel Ahmed', 'ahmed.khaleel9606@gmail.com', '7019496068', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$yWlcXwVEDJ/9p7eqgxc4rO19yvNoh/1OzYUd2TFhAUmEat1EJqo06', '2025-07-01 18:14:48', NULL, NULL),
(149, 'Handpicked Stays & Travels Private Limited', 'bookings@yuyiii.com', '8657519123', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$KBUaPVBVLuN2.fGVGeD2MuJvhnshE4LESVZo.dFL.9C/6sTMGHUfG', '2025-07-09 23:49:12', NULL, NULL),
(150, 'Shivakumar', 'meenakshielectricals18@gmail.com', '9380132649', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$GpaQILrne.1v6ElgVNw4AeCtb7/MJ5Iod9gfNbhdunM3.ilC6ZyqS', '2025-07-11 00:33:05', NULL, NULL),
(151, 'Joshua chhetri', 'sukudipak@gmail.com', '+91 99168-64104', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$6hnzqZ/v6KSPeXCDyPgt5u/c6sJiOOm5Z6FkfdBWMncCCifqdolHW', '2025-07-11 13:09:24', NULL, NULL),
(152, 'Tejas', 'tejasmn21@gmail.com', '6364711551', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$UMsdPk/2mbjA7uOwmA31QuFlvl95ucvEG51jJStGU8Lh8Z2pIAn6G', '2025-07-13 02:02:27', NULL, NULL),
(153, 'Gunpreet Sabharwall', 'gunpreetsabharwall@gmail.com', '9886876222', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$.V17WkoYsYlkk7X7Lo28HuYrrWkTcmqcDysLwa1NrDJOENsOkwop.', '2025-07-13 10:01:14', NULL, NULL),
(154, 'Jithuu', 'wecanbs@gmail.com', '9845175506', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$DHZTRIO7X5Dsj2kTXQJ9AOWxZOAJPpmsm25K32T/2fKWdIp3sXmpO', '2025-07-16 07:21:08', NULL, NULL),
(155, 'Srihari Mandalapu Sriramulu', 'mssrihari1@gmail.com', '9741979154', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$vaamOs.2BBq5mfyhlP3ECuM0MWPidn/d2RELVSkKx2WD6KDJmLQjO', '2025-07-17 03:54:46', NULL, NULL),
(156, 'girish badrinarayanan', 'girishbadri@gmail.com', '09739777255', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$bGy9S9y3.Vl2rENH9k90Eets91yxyl8ZhtlqQJOykoCTGVUmbF3I2', '2025-07-19 06:48:59', NULL, NULL),
(157, 'Bharath', 'bharath.g.bhat11@gmail.com', '9845807552', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$2Dro.BtP1jPygl0oByaPme7jF.GC7VYKlfJI0rKAib6J0Met1g6LG', '2025-07-30 05:56:17', NULL, NULL),
(158, 'sachidanand', 'sachishetty1512@gmail.com', '9380430163', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$0Dqawtd7IzRh0RlCIgkdD.5cNKOTwZiETLhsPm1FZc20wpdVjWi7K', '2025-07-31 00:22:57', NULL, NULL),
(159, 'Karthik Simha SL', 'karthiksimha24@gmail.com', '9886909335', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$Z4cnY.lzomCl1jxhVpOiQO1PfTfqyQ27gpagFe5B63FsLQMhlLRLe', '2025-07-31 23:42:58', NULL, NULL),
(160, 'Shreya K', 'shreyak1319@gmail.com', '8431825250', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$eFH9KwMz2uGfC5oNuqoehuxnP1VAmOk8pHkYenFxtHKbS20J846w6', '2025-08-11 02:45:47', NULL, NULL),
(161, 'Mithun', 'mithunyadav1319@gmail.com', '8197750121', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$VBWlZqyp.pvirOphca4nmuz0zRRq/yZ7hoWjzpnRt3D/Jn31F1oga', '2025-08-11 05:50:53', NULL, NULL),
(162, 'Arvind', 'adventbusinessconsulting@gmail.com', '8939389149', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$O8nV8CMnwrbAvlkkbkhM5OkyCdww3oXWttbTxyPf18qYaooFVipYS', '2025-08-12 13:37:47', NULL, NULL),
(163, 'Kartik Deshpande', 'kdcreationsservices@gmail.com', '7795857129', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$jNVlt3fD9W2KKqEbUFXBCeNfPO5wxYKrV0PgBPG7czjpN.9KHEnKK', '2025-08-12 14:01:50', NULL, NULL),
(164, 'Prajwal kumar R', 'prajwalkumar2019@gmail.com', '7483935733', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$72Dl.8r45fjhugFrIwM/pOp37uM4964HCqRE6cdM7w5DPOgcpF4A6', '2025-08-18 00:39:46', NULL, NULL),
(165, 'Naveen Kumar', 'unstoppable1183@gmail.com', '9743761183', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$Lr2r4dTKzl3lbpiah4/cne0IYaXBhR/.ITDeclJVpaRlDh9YFkyoq', '2025-08-18 00:48:14', NULL, NULL),
(166, 'Preetham K', 'Preetham4488@yahoo.in', '6363 418 041', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$TXHnhETlZHHNGOm391gIL.hH3fjgmPctQ9smR2pc9ZglYDBniViJy', '2025-08-19 23:45:26', NULL, NULL),
(167, 'Preetham K', 'Kteja301@gmail.com', '6363418041', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$77L5lRguc99R7yaXPA/XTOVkYKIrUuIASwSp372VanvEBOan/AQJq', '2025-08-20 00:48:33', NULL, NULL),
(168, 'Victor Gerald', 'victorgerald57@gmail.com', '9148708959', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$AdMZs0TSQWP4ApxA8eH5EeONW2vvD9jMWWUjrlo.pSmjJekkhsp06', '2025-08-25 21:56:11', NULL, NULL),
(169, 'Lakshmikanthsampath', 'ar.lakshmikanthsampath@gmail.com', '7676849384', NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$5mxzm9UV5P2c0cY.9iZtGO3mjvNIKqK/J6fnyFYAnqy9TN8vNGiDq', '2025-09-01 07:46:11', NULL, NULL),
(170, 'sai teja', 'tvhsaiteja@gmail.com', '$2y$10$5DDjPuYuQCDaG', '0000-00-00', 'User', NULL, NULL, NULL, 'Pending', '2025-09-02 05:31:47', '2025-09-02 00:01:47', NULL, NULL),
(171, 'sunil kumar', 'sunsunnysunil@gmail.com', '$2y$10$gHwjXDyii33WL', '0000-00-00', 'User', NULL, NULL, NULL, 'Pending', '2025-09-02 05:36:41', '2025-09-02 00:06:41', NULL, NULL),
(172, 'Mohsin Pasha', 'mohsinpasha566@gmail.com', '$2y$10$pRbAd2KwpgjSn', '0000-00-00', 'User', NULL, NULL, NULL, 'Pending', '2025-09-02 11:12:33', '2025-09-02 05:42:33', NULL, NULL),
(173, 'Beyonce shanmugham', 'Carterbeyonce11@gmail.com', '$2y$10$/zrqqTIDqdyKv', '0000-00-00', 'User', NULL, NULL, NULL, 'Pending', '2025-09-02 16:01:08', '2025-09-02 10:31:08', NULL, NULL),
(174, 'Divith H', 'divithsid@gmail.com', '$2y$10$k.E0dNkp2Vbtk', '0000-00-00', 'User', NULL, NULL, NULL, 'Pending', '2025-09-08 16:19:21', '2025-09-08 10:49:21', NULL, NULL),
(175, 'VINOD KUMAR', 'vinodprajapathi786@gmail.com', '$2y$10$Q8jfjbmEAxvcL', '0000-00-00', 'User', NULL, NULL, NULL, 'Pending', '2025-09-10 05:57:57', '2025-09-10 00:27:57', NULL, NULL),
(176, 'Sowmya R', 'sowmya.r045@gmail.com', '$2y$10$zAXXP7tgx5uO8', '0000-00-00', 'User', NULL, NULL, NULL, 'Pending', '2025-09-10 18:31:21', '2025-09-10 13:01:21', NULL, NULL),
(177, 'Devi', 'hiremath.deviprasad@gmail.com', '$2y$10$RdT.i0cwei.d/', '0000-00-00', 'User', NULL, NULL, NULL, 'Pending', '2025-10-06 02:07:58', '2025-10-05 20:37:58', NULL, NULL),
(178, 'Kejal Chajed', 'kejalvk@gmail.com', '$2y$10$c3Tbt7BIG9/H.', '0000-00-00', 'User', NULL, NULL, NULL, 'Pending', '2025-10-13 04:47:02', '2025-10-12 23:17:02', NULL, NULL),
(179, 'Gururaj M', 'gururajmanj@gmail.com', '$2y$10$htjC5B8JAEJa.', '0000-00-00', 'User', NULL, NULL, NULL, 'Pending', '2025-10-13 04:49:12', '2025-10-12 23:19:12', NULL, NULL),
(180, 'Sanjana Rao Karanam', 'sanjanashines@gmail.com', '$2y$10$/FqM9PmlypE1D', '0000-00-00', 'User', NULL, NULL, NULL, 'Pending', '2025-10-21 09:49:52', '2025-10-21 04:19:52', NULL, NULL),
(181, 'Louis', 'louis111222@gmail.com', '8406084060', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$mg3sdR8IuZlWMW1FP.DFPO8iKnDUfYpIajVDAlMLLmlSZnS7hgtIa', '2025-10-21 11:21:29', NULL, NULL),
(182, 'stephen pradeep', 'stephenpradeep.ed@insytelli.com', '9176444006', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$UZM/U7Yr8SbPd4S/DdnlX.P1HSKqDKZWvqhJo4HCAT/yWVM/Gil7i', '2025-10-22 00:37:22', NULL, NULL),
(183, 'Maithri R', 'wecanbs.is@gmail.com', '7760404242', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$h.G6BiCEYQ9QYr/7F.Y1R.9i63HBQjmzU0GApG2qS1SWoOABccifC', '2025-10-28 04:01:01', NULL, NULL),
(184, 'Amogh Mohite', 'amoghrmohite@gmail.com', '8105863065', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$O3O9QnzbXWErD5TolWRPL.VkSiSmqQdWpWOElh7WUHsne40u9sRam', '2025-10-30 05:13:22', NULL, NULL),
(185, 'sachidanand shetty', 'mailsachin0826@gmail.com', '9380430163', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$5HPOHJE/y6IDYUinNuwl2uvlPVsvmXPDKo4/HBklJ4CysDGtPYGvK', '2025-10-31 05:35:36', NULL, NULL),
(186, 'qwdqwd2', 'kissoyun1@gmail.com', '1231232222', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$76uhnGkGLai7y92jScDzn.YxHXtVh15HcLiFQXORapIeCDvzoDJja', '2025-11-01 20:41:20', NULL, NULL),
(187, 'Dummy User', 'dummy.user@testmail.com', '9999999999', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$6lioYc/8LsVZ80bftatm5eaJJh.MiOUh8t.1zUh0NJDDGfWSlS2pC', '2025-11-02 22:19:01', NULL, NULL),
(188, 'Yathiraj', 'qineossoftware@gmail.com', '9167055930', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$MCstLQrlof45n/Fd0U4yvORwWEIEqj5zeygEc.Exh4qJUdmBDmjwq', '2025-11-04 04:21:42', NULL, NULL),
(189, 'John Cena', 'John@gmail.com', '6767676767', '2026-01-21', 'usa', 'uploads/profile_pics/user_6970a1b489ef3_user_694a68d9bb888_roman.png', 'Pending', NULL, NULL, '$2y$10$th9IMsKtrVXrCCIXFKaNoOmgQE1wRfC.kwfeoN7CaAdWAlBJVbGYy', '2025-11-11 04:39:35', NULL, NULL),
(190, 'cena', 'cena@gmail.com', '9876789876', '2026-01-21', 'usa', 'uploads/profile_pics/user_6970a06775b9b_user_696b5030a96f0_s.jfif', 'Pending', NULL, NULL, '$2y$10$naQC/NrH9sWIyDZp3ivwK.2lIAG/318ueN5.NWj2rVDDNvtPnxvoC', '2025-11-12 04:57:30', NULL, NULL),
(191, 'Kiran ranganathan', 'kiranranganath87@gmail.com', '9535351635', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$z0sROs0PWKzUaSZTGUxX3.9XdHW3l70rc0TEAfsx/F2ZETqB7zqvW', '2025-11-14 04:18:33', NULL, NULL),
(192, 'Vidyasree Beerappa', 'macambrosia34@gmail.com', '+918105714679', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$ZQxHMfH97N2m/WOW9.wgl.y/edp2lebaMr5Cjb9v6D4TVlOxn5tpO', '2025-11-21 00:16:51', NULL, NULL),
(193, 'Vidyaranya', 'vijaypura@gmail.com', '99860-33010', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$eG6HcaoLwUU5inTO2jgcHu8R6eM.FCeHA2pizlB8p22J0BE7NvExG', '2025-11-22 02:16:24', NULL, NULL),
(194, 'Basavaraj', 'basavaraj.halasur@gmail.com', '7975153507', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$zPsGhw/3wx5yIYKadvXku.tgaa38ApwfCVEcFuYfblGWmNswkV63C', '2025-12-03 01:30:31', NULL, NULL),
(195, 'Tharun Royal', 'ceo@codingsaints.com', '+918331833255', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$3Zg7eHEGYO5n50gZcL0hmuDfnX0zrpxNvCU6K3B2zh11LGGv76VV6', '2025-12-04 04:29:22', NULL, NULL),
(196, 'Roopa', 'roopakk.2008@gmail.com', '09538890616', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$izHzeZ1icB6VKG00zTjBiuEfBFQgAHpLQRPfeltLqDdEBJoGy/a.e', '2025-12-08 01:29:30', NULL, NULL),
(198, 'aj lee', 'ajlee@gmail.com', '07878787878', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$vZLBda8K0677X5qO9yykAeHSqMmLsA4L38Ip9IhnBZDUcvm2Mwmrq', '2025-12-09 22:54:33', NULL, NULL),
(199, 'Lakshay Verma', 'lak.vrm9207@gmail.com', '09582544170', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$n6TcOWipeRsNLEWuxgMjguIQJhK0xZzSB/OF0lP7SCIgJgViJcO5q', '2025-12-10 02:43:42', NULL, NULL),
(200, 'Raman M', 'ramanpdf04@gmail.com', '9663630277', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$RggCwfNucBWF28zcmfiMjO/d9LWuHLnKd38fIeAq8Pq.tX0jaFdW6', '2025-12-11 01:32:02', NULL, NULL),
(201, 'Suresh Ramashary', 'sureshramashary@gmail.com', '9343567834', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$qLiG3aRBO4XPRRS2m.oEvOpo/hnDI6NFwK7qUccDP3DD552MBbfgS', '2025-12-12 23:48:39', NULL, NULL),
(202, 'gururaj m', 'gururaj.manjunath88@gmail.com', '9538320137', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$vCwSfY0jVfwOUZmH7Iw8n.IIuUP3Kxzo7A429L6f.hh2.OFKvZtvK', '2025-12-16 22:37:27', NULL, NULL),
(203, 'Roopa kk', 'roopa.k-k@cqpgemini.com', '9538890616', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$sGabn8cOHbgpBUN6/DltSu6IC4KW6FcvNnVSAdQBnGa6IQk8klW5u', '2025-12-19 00:02:49', NULL, NULL),
(204, 'Gurucharan V', 'vguru40@gmail.com', '9741190902', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$qbKViy3xLxSZozRDVzDwE.LBzMZTMNkMmvT2fgcoIiaN54u.bZ0O.', '2025-12-29 01:03:00', NULL, NULL),
(205, 'Raghavendra', 'rks@theturiya.com', '9980045034', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$qof580.3MhYqgOWWtykrHu2H3RIlNYZidyoBJsaRTmnC3aWWMv.ki', '2026-01-02 00:31:37', NULL, NULL),
(206, 'Ravi', 'talluri.raviteja@gmail.com', '8473994998', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$yGld8CxhzYrYoxSR0yCOuOU3Az.Cvj4fR3pxdMUc.hWQVb/s2tni6', '2026-01-02 02:50:43', NULL, NULL),
(207, 'DR SHARAPH VENTURES LLP', 'info@theturiya.com', '9980045034', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$btKgX/CJk4b3rm5LJv.pSuhfEC5d6Te4MjQ5ebffj7BhaPRcAj3hi', '2026-01-05 02:58:40', NULL, NULL),
(208, 'Hephzibah', 'salesoperations@builarc.net', '9513227608', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$qsjPSXAQfZbYTr6sxiFNneQ68Rqr5VjD.P9wUBFt6Gy53KlDtI06G', '2026-01-08 00:54:32', NULL, NULL),
(209, 'saleem', 'consultantbalaji07@gmail.com', '9008432220', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$3HOX02j44gpmIZ6nPucG/OtV6V1nUnc5cSe.wo5Qtu28g/gQ4GyT.', '2026-01-08 01:00:11', NULL, NULL),
(210, 'purshotam', 'support@buildarc.net', '9845725416', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$DuEXxsLpLGuOy8fIvJrw4OjF5m/MNEDHBZpG9XQMv3QgoituVwLtK', '2026-01-08 01:02:46', NULL, NULL),
(211, 'Shalini M.O', 'mo.shalini@gmail.com', '9916598725', '0000-00-00', NULL, NULL, 'Pending', NULL, NULL, '$2y$10$s/0Zt5kUy5RhrlD/JXEVt.oHWaX8sAPXEzokGj5Aqpch5VWv58yVG', '2026-01-13 23:52:06', NULL, NULL),
(212, 'fgfgfgfgfg', 'cmpunk@gmail.comfdfdfd', NULL, NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$SRbTsaoPWauqZqM5DMGcReniI4tgAFvbeH3iUKaBLr/mdhKlhUX66', '2026-01-28 11:57:38', NULL, NULL),
(213, 'Manoj', 'manoj@gmail.com', '7878787878', '2026-02-02', 'yelehanka', NULL, 'Pending', NULL, NULL, '$2y$10$M.btGjbvERNQ9fFUgEN40uVdHV90Ow6w5dJSkjiKCMBEDMZoY48HG', '2026-01-31 12:52:55', NULL, NULL),
(214, 'vince mcmohan', 'vincemcmohan@gmail.com', '6788765454', '2026-02-02', 'ynk', NULL, 'Pending', NULL, NULL, '$2y$10$Zoxj7194cKKtqWvmVcJxnuRsXHBqwIujnACnSCrdPJtGbt5O5mc6G', '2026-02-02 10:21:23', NULL, NULL),
(215, 'Anjana Rao', 'anjana@gmail.com', NULL, NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$nw5AMjtmo0GbGlebLjBzCe3bYOhdSxTZu6qUrrJQj5b9dOdMlkOUy', '2026-02-06 11:18:18', NULL, NULL),
(216, 'Manoj', 'mkum9417@gmail.com', '8431066805', '1990-01-01', 'sanjaynagara', NULL, 'Pending', NULL, NULL, '$2y$10$4WQqXwv1NJo/WUBUj6gz8.mm8Ycwud/OtS/.W4QUTCvl8DdrNkMOO', '2026-02-06 11:30:23', '311a47c3e6f6bf981f3cdb7e0d35329e8144408e80a0dba48a6f4acd2983bfc7', '2026-03-06 08:15:22'),
(217, 'amit', 'k24517165@gmail.com', NULL, NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$5/DGVUjdBa591LxWV5fTQuXjmGflXQqHC2ge1NPKrUgFLxRRgJNYy', '2026-02-11 04:59:47', NULL, NULL),
(218, 'rava', 'rva413630@gmail.com', NULL, NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$rae1ihiT33GLV1WorulWreGhlVDTvdPO519dKGJFC.O3yZ9PeoD7.', '2026-03-02 08:49:50', NULL, NULL),
(219, 'niriksha', 'niriksha@gmail.com', NULL, NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$xjQhqTrsAYBHGqri7dAVmuaTtwENhign9CqtwFD10BH7sLI/7m/.m', '2026-03-06 11:51:18', NULL, NULL),
(220, 'pavan m', 'pavan@gmail.com', NULL, NULL, NULL, NULL, 'Pending', NULL, NULL, '$2y$10$Bhk7FsU12/E4QFd6VRkgA.jYVZJE5Znb.Xz.uZ1f9WlnGdR/AXfdK', '2026-03-26 09:27:35', NULL, NULL),
(221, 'Renee', 'renee@gmail.com', '6767654325', '1990-01-01', 'sanjaynagar', NULL, 'Pending', NULL, NULL, '$2y$10$s4h1T76bvGPCYpMpvZgSFuUn.vYFSw.lq9JK8GBX9d8UpOn0pd2m.', '2026-03-27 04:11:34', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_comments`
--

CREATE TABLE `user_comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `comment` text NOT NULL,
  `follow_up_date` date DEFAULT NULL,
  `follow_up_time` time DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `virtualoffice_bookings`
--

CREATE TABLE `virtualoffice_bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_years` int(11) DEFAULT 1,
  `total_amount` decimal(10,2) DEFAULT 0.00,
  `status` enum('Active','Expired','Cancelled') DEFAULT 'Active',
  `created_at` datetime DEFAULT current_timestamp(),
  `payment_id` varchar(255) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `virtualoffice_bookings`
--

INSERT INTO `virtualoffice_bookings` (`id`, `user_id`, `price_id`, `start_date`, `end_date`, `total_years`, `total_amount`, `status`, `created_at`, `payment_id`, `payment_status`) VALUES
(1, 217, 1, '2026-02-27', '2027-01-27', 1, 1.18, 'Active', '2026-02-27 10:54:07', 'pay_SL3MqI4Fh8i6oe', 'Paid'),
(2, 214, 1, '2026-02-27', '2027-01-27', 1, 1.18, 'Active', '2026-02-27 11:07:11', 'pay_SL3acQJLIN506J', 'Paid'),
(3, 216, 1, '2026-02-28', '2027-01-28', 1, 1.18, 'Active', '2026-02-27 17:16:20', 'pay_SL9scHYrkVcLII', 'Paid'),
(4, 218, 1, '2026-03-02', '2027-02-02', 1, 1.18, 'Active', '2026-03-02 14:20:42', 'pay_SMIU6WTs70mTeN', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `virtualoffice_prices`
--

CREATE TABLE `virtualoffice_prices` (
  `id` int(11) NOT NULL,
  `min_duration` varchar(50) NOT NULL,
  `max_duration` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `gst` decimal(5,2) NOT NULL DEFAULT 0.00,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `virtualoffice_prices`
--

INSERT INTO `virtualoffice_prices` (`id`, `min_duration`, `max_duration`, `price`, `gst`, `status`, `created_at`) VALUES
(1, '1 Year', '11 month', 1.00, 18.00, 'Active', '2026-01-21 09:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `virtual_office_enquiries`
--

CREATE TABLE `virtual_office_enquiries` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `referral_source` varchar(100) DEFAULT NULL,
  `message` text NOT NULL,
  `status` varchar(50) DEFAULT 'New',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `booking_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  `visiting_date` date DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `payment_id` varchar(100) DEFAULT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `check_in_time` varchar(255) DEFAULT NULL,
  `check_out_time` varchar(255) DEFAULT NULL,
  `attendees` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `user_id`, `admin_id`, `company_id`, `booking_id`, `name`, `contact_no`, `email`, `company_name`, `visiting_date`, `reason`, `payment_id`, `amount_paid`, `added_on`, `check_in_time`, `check_out_time`, `attendees`) VALUES
(1, 216, NULL, 4, 'BKG-20260323-007', 'Manoj Kumar P Vishwakarma', '7878787878', 'mkum9417@gmail.com', 'Self-employed', '2026-03-23', 'm', '0', 1.18, '2026-03-23 11:18:55', '18:00', '19:00', 1),
(2, 216, NULL, 4, 'BKG-20260323-007', 'Manoj Kumar P Vishwakarma', '9999999999', 'manojkumarpvishwakarma709@gmail.com', 'Self-employed', '2026-03-23', 'm', '0', 1.18, '2026-03-23 11:20:25', '18:00', '19:00', 1),
(3, 216, NULL, 4, 'BKG-20260323-007', 'Manoj Kumar P Vishwakarma', '9999999999', 'mkum9417@gmail.com', 'Self-employed', '2026-03-24', 'sd', '0', 1.18, '2026-03-23 11:21:22', '16:50', '18:50', 1),
(4, 216, NULL, 4, 'BKG-20260324-007', 'raju', '7878787878', 'raju@gmail.com', 'Self-employed', '2026-03-24', 'sd', '0', 1.18, '2026-03-24 05:38:07', '11:07', '00:07', 1),
(5, 198, NULL, 5, 'BKG-20260324-008', 'Shreem Software', '9999999999', 'shreemsoftware@gmail.com', 'stellar companyyy', '2026-03-24', 'df', '0', 1.18, '2026-03-24 05:43:18', '00:12', '01:12', 1),
(6, 216, NULL, 4, 'BKG-20260305-006', 'ARUN SACHITHANANDAM', '9999999999', '', 'Self-employed', '2026-03-27', '', '0', 2.36, '2026-03-27 04:07:57', '09:37', '10:37', 2),
(7, 216, NULL, 4, 'BKG-20260306-001', 'Manoj Kumar P Vishwakarma', '7878787878', 'manojkumarpvishwakarma709@gmail.com', 'Self-employed', '2026-03-27', 'sdsd', '0', 1.18, '2026-03-27 04:19:42', '09:49', '10:49', 1),
(8, 216, NULL, 4, 'BKG-20260305-006', 'ARUN SACHITHANANDAM', '7878787878', 'mkum9417@gmail.com', 'Self-employed', '2026-03-28', 'm', '0', 1.18, '2026-03-28 05:15:41', '10:45', '11:45', 1),
(9, 216, NULL, 4, 'BKG-20260328-001', 'Manoj Kumar P Vishwakarma', '9740936259', 'manojkumarpvishwakarma709@gmail.com', 'Self-employed', '2026-03-28', 'meeting', '0', 4.72, '2026-03-28 08:36:38', '18:00', '20:00', 2),
(10, 216, NULL, 4, 'BKG-20260328-001', 'Manoj Kumar P Vishwakarma', '8431066809', 'mkum9417@gmail.com', 'Self-employed', '2026-03-28', '', '0', 2.36, '2026-03-28 08:51:34', '11:30', '13:30', 1),
(11, 216, NULL, 4, 'BKG-20260328-001', 'Manoj Kumar P Vishwakarma', '9999999999', 'mkum9417@gmail.com', 'Self-employed', '2026-03-28', '', '0', 1.18, '2026-03-28 08:57:05', '10:15', '11:15', 1),
(12, 216, NULL, 4, 'BKG-20260306-001', 'Manoj Kumar P Vishwakarma', '6767696789', 'manojkumarpvishwakarma709@gmail.com', 'Self-employed', '2026-03-28', '', '0', 1.18, '2026-03-28 09:02:07', '11:15', '12:15', 1),
(13, 216, NULL, 4, 'BKG-20260306-001', 'Manoj Kumar P Vishwakarma', '6767676767', 'manojkumarpvishwakarma709@gmail.com', 'Self-employed', '2026-03-28', '', '0', 1.18, '2026-03-28 09:08:54', '10:30', '11:30', 1),
(14, 216, NULL, 4, 'BKG-20260305-007', 'Prabhakar R', '9740936259', 'mkum9417@gmail.com', 'Self-employed', '2026-03-28', '', 'pay_SWanGDkbrQT2Nv', 1.18, '2026-03-28 09:14:58', '17:15', '18:15', 1),
(15, 216, NULL, 4, 'BKG-20260324-013', 'Shreem Software', '6767676767', 'mkum9417@gmail.com', 'Self-employed', '2026-03-28', '', 'pay_SWatIIG1Uuu1sv', 1.18, '2026-03-28 09:20:43', '11:30', '12:30', 1),
(16, 216, NULL, 4, 'BKG-20260328-001', 'Manoj Kumar P Vishwakarma', '9999999999', 'manojkumarpvishwakarma709@gmail.com', 'Self-employed', '2026-03-28', '', 'pay_SWaxCp4cYbYi9t', 1.18, '2026-03-28 09:24:24', '08:00', '09:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `workspace_bookings`
--

CREATE TABLE `workspace_bookings` (
  `id` int(11) NOT NULL,
  `booking_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `space_id` int(11) NOT NULL,
  `seat_codes` text DEFAULT NULL COMMENT 'Comma-separated list of selected seat codes',
  `workspace_title` varchar(255) NOT NULL,
  `plan_type` enum('Hourly','Daily','Monthly') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `total_days` int(11) DEFAULT 1,
  `total_hours` int(11) DEFAULT 0,
  `num_attendees` int(11) DEFAULT 1,
  `price_per_unit` decimal(10,2) DEFAULT 0.00,
  `base_amount` decimal(10,2) DEFAULT 0.00,
  `gst_amount` decimal(10,2) DEFAULT 0.00,
  `discount_amount` decimal(10,2) DEFAULT 0.00,
  `final_amount` decimal(10,2) DEFAULT 0.00,
  `coupon_code` varchar(50) DEFAULT NULL,
  `referral_source` varchar(255) DEFAULT NULL,
  `terms_accepted` tinyint(1) DEFAULT 0,
  `status` enum('pending','confirmed','cancelled','failed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `payment_id` varchar(255) DEFAULT NULL,
  `is_host_attending` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workspace_bookings`
--

INSERT INTO `workspace_bookings` (`id`, `booking_id`, `user_id`, `space_id`, `seat_codes`, `workspace_title`, `plan_type`, `start_date`, `end_date`, `start_time`, `end_time`, `total_days`, `total_hours`, `num_attendees`, `price_per_unit`, `base_amount`, `gst_amount`, `discount_amount`, `final_amount`, `coupon_code`, `referral_source`, `terms_accepted`, `status`, `created_at`, `updated_at`, `payment_id`, `is_host_attending`) VALUES
(487, 'BKG-20260220-001', 216, 60, 'WS01', 'Workspace', 'Hourly', '2026-02-20', '2026-02-20', '15:00:00', '16:00:00', 1, 1, 1, 100.00, 100.00, 18.00, 0.00, 118.00, '', '0', 1, 'confirmed', '2026-02-20 08:40:53', '2026-02-20 08:40:53', 'pay_SIKyv0Bs9HtFa1', 1),
(488, 'BKG-20260220-002', 216, 98, 'WS39', 'Workspace', 'Hourly', '2026-02-20', '2026-02-20', '15:00:00', '16:00:00', 1, 1, 1, 100.00, 100.00, 18.00, 0.00, 118.00, '', '0', 1, 'confirmed', '2026-02-20 09:00:17', '2026-02-20 09:00:17', 'pay_SILJOzLUHzJUAL', 1),
(489, 'BKG-20260220-003', 216, 94, 'WS35', 'Workspace', 'Hourly', '2026-02-20', '2026-02-20', '15:00:00', '16:00:00', 1, 1, 1, 100.00, 100.00, 18.00, 0.00, 118.00, '', '0', 1, 'confirmed', '2026-02-20 09:03:08', '2026-02-20 09:03:08', 'pay_SILMRVBqkagvgn', 1),
(490, 'BKG-20260220-004', 216, 105, 'MC01', 'Manager Cubicle', 'Hourly', '2026-02-20', '2026-02-20', '16:00:00', '17:00:00', 1, 1, 1, 120.00, 120.00, 21.60, 0.00, 141.60, '', '0', 1, 'confirmed', '2026-02-20 09:44:56', '2026-02-20 09:44:56', 'pay_SIM4a17AvBrY7K', 1),
(491, 'BKG-20260220-005', 216, 105, 'MC01', 'Manager Cubicle', 'Hourly', '2026-02-20', '2026-02-20', '18:00:00', '19:00:00', 1, 1, 1, 120.00, 120.00, 21.60, 0.00, 141.60, '', '0', 1, 'confirmed', '2026-02-20 09:47:15', '2026-02-20 09:47:15', 'pay_SIM71E7ifaFGPa', 1),
(492, 'BKG-20260220-006', 216, 107, 'TLC01', 'Team Leads Cubicle', 'Monthly', '2026-02-23', '2026-03-19', '08:00:00', '20:00:00', 25, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-02-20 10:15:43', '2026-02-20 10:15:43', 'pay_SIMb5kmgvvP0Vw', 1),
(493, 'BKG-20260221-001', 216, 110, 'TLC04', 'Team Leads Cubicle', 'Monthly', '2026-02-24', '2026-03-20', '08:00:00', '20:00:00', 25, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-02-21 03:59:43', '2026-02-21 03:59:43', 'pay_SIej3iZ3urbgZG', 1),
(494, 'BKG-20260221-002', 216, 110, 'TLC04', 'Team Leads Cubicle', 'Hourly', '2026-02-23', '2026-02-23', '10:00:00', '11:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-02-21 04:18:23', '2026-02-21 04:18:23', 'pay_SIf2lI0yo4UF3j', 1),
(495, 'BKG-20260223-001', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-02-23', '2026-02-23', '11:00:00', '12:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-02-23 05:06:32', '2026-02-23 05:06:32', 'pay_SJSvshgUjryCra', 1),
(496, 'BKG-20260226-001', 217, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-02-26', '2026-02-26', '11:00:00', '12:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-02-26 04:43:51', '2026-02-26 04:43:52', 'pay_SKe9E1EEe4Kd3J', 1),
(497, 'BKG-20260226-002', 217, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-02-26', '2026-02-26', '12:00:00', '13:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-02-26 05:24:23', '2026-02-26 05:24:23', NULL, 1),
(498, 'BKG-20260226-003', 217, 108, 'TLC02', 'Team Leads Cubicle', 'Daily', '2026-02-26', '2026-02-26', '08:00:00', '20:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-02-26 05:25:20', '2026-02-26 05:25:20', 'pay_SKer2jOceMfhvy', 1),
(499, 'BKG-20260226-004', 217, 109, 'TLC03', 'Team Leads Cubicle', 'Hourly', '2026-02-26', '2026-02-26', '11:00:00', '12:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-02-26 05:29:46', '2026-02-26 05:29:46', NULL, 1),
(500, 'BKG-20260226-005', 217, 109, 'TLC03', 'Team Leads Cubicle', 'Daily', '2026-02-27', '2026-02-27', '08:00:00', '20:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-02-26 05:34:42', '2026-02-26 05:34:42', NULL, 1),
(501, 'BKG-20260226-006', 217, 109, 'TLC03', 'Team Leads Cubicle', 'Daily', '2026-02-28', '2026-02-28', '08:00:00', '20:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-02-26 05:37:10', '2026-02-26 05:37:10', NULL, 1),
(502, 'BKG-20260226-007', 217, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-02-26', '2026-02-26', '18:30:00', '19:30:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-02-26 05:39:42', '2026-02-26 05:39:42', NULL, 1),
(503, 'BKG-20260226-008', 217, 109, 'TLC03', 'Team Leads Cubicle', 'Daily', '2026-03-02', '2026-03-02', '08:00:00', '20:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-02-26 05:39:42', '2026-02-26 05:39:42', NULL, 1),
(504, 'BKG-20260226-009', 217, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-02-26', '2026-02-26', '14:00:00', '15:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-02-26 06:08:31', '2026-02-26 06:08:31', NULL, 1),
(505, 'BKG-20260226-010', 217, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-02-26', '2026-02-26', '15:00:00', '16:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-02-26 06:28:04', '2026-02-26 06:28:04', 'pay_SKfvIbDYyNNOf8', 1),
(506, 'BKG-20260226-011', 217, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-02-26', '2026-02-26', '13:00:00', '14:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-02-26 06:32:35', '2026-02-26 06:32:35', 'pay_SKg05h7HQEYBR2', 1),
(507, 'BKG-20260227-001', 217, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-02-27', '2026-02-27', '11:00:00', '12:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-02-27 04:38:40', '2026-02-27 04:38:40', NULL, 1),
(508, 'BKG-20260227-002', 215, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-02-27', '2026-02-27', '15:00:00', '16:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-02-27 08:43:40', '2026-02-27 08:43:40', NULL, 1),
(509, 'BKG-20260227-003', 215, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-02-27', '2026-02-27', '18:15:00', '19:15:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-02-27 08:56:36', '2026-02-27 08:56:36', NULL, 1),
(510, 'BKG-20260227-004', 215, 108, 'TLC02', 'Team Leads Cubicle', 'Hourly', '2026-02-27', '2026-02-27', '15:00:00', '16:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-02-27 08:56:36', '2026-02-27 08:56:36', NULL, 1),
(511, 'BKG-20260227-005', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-02-28', '2026-02-28', '19:00:00', '20:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-02-27 11:44:45', '2026-02-27 11:44:45', NULL, 1),
(512, 'BKG-20260227-006', 216, 108, 'TLC02', 'Team Leads Cubicle', 'Hourly', '2026-02-27', '2026-02-27', '18:00:00', '19:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-02-27 11:45:31', '2026-02-27 11:45:31', 'pay_SL9rkoEkI7pJzL', 1),
(513, 'BKG-20260302-001', 218, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-02', '2026-03-02', '15:00:00', '16:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-02 08:54:38', '2026-03-02 08:54:38', 'pay_SMIYXC2Qtf6p6D', 1),
(514, 'BKG-20260302-002', 218, 108, 'TLC02', 'Team Leads Cubicle', 'Hourly', '2026-03-02', '2026-03-02', '15:00:00', '16:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-02 08:58:22', '2026-03-02 08:58:22', 'pay_SMIcTp4dbeSRxh', 1),
(515, 'BKG-20260304-001', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-04', '2026-03-04', '15:00:00', '16:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-04 08:50:19', '2026-03-04 08:50:19', 'pay_SN5YADNXBPj42c', 1),
(516, 'BKG-20260304-002', 216, 109, 'TLC03', 'Team Leads Cubicle', 'Daily', '2026-03-04', '2026-03-04', '08:00:00', '20:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-04 09:10:04', '2026-03-04 09:10:04', 'pay_SN5t1YQu1lKJLf', 1),
(517, 'BKG-20260304-003', 216, 108, 'TLC02', 'Team Leads Cubicle', 'Daily', '2026-03-04', '2026-03-04', '08:00:00', '20:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-04 09:24:48', '2026-03-04 09:24:48', 'pay_SN68c25OgiCIw8', 1),
(518, 'BKG-20260305-001', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-05', '2026-03-05', '12:00:00', '13:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-05 05:56:32', '2026-03-05 05:56:32', 'pay_SNR7rOAWNdV11g', 1),
(520, 'BKG-20260305-002', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-05', '2026-03-05', '13:00:00', '14:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-03-05 06:24:42', '2026-03-05 06:24:42', NULL, 1),
(521, 'BKG-20260305-003', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-05', '2026-03-05', '14:45:00', '15:45:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-03-05 06:24:42', '2026-03-05 06:24:42', NULL, 1),
(522, 'BKG-20260305-004', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-02', '2026-03-02', '17:00:00', '18:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-03-05 06:31:26', '2026-03-05 07:24:46', NULL, 1),
(523, 'BKG-20260305-005', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-05', '2026-03-05', '18:00:00', '19:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-03-05 06:31:26', '2026-03-05 06:31:26', NULL, 1),
(524, 'BKG-20260305-006', 216, 113, 'EC01', 'Executive Cabin', 'Monthly', '2026-03-05', '2026-04-04', '08:00:00', '20:00:00', 31, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-03-05 07:33:29', '2026-03-05 07:33:29', NULL, 1),
(525, 'BKG-20260305-007', 216, 66, 'WS07', 'Workspace', 'Monthly', '2026-03-16', '2026-04-15', '08:00:00', '20:00:00', 31, 1, 1, 0.00, 4000.00, 720.00, 0.00, 4720.00, '', '0', 1, 'confirmed', '2026-03-05 07:33:29', '2026-03-05 07:33:29', NULL, 1),
(526, 'BKG-20260305-008', 216, 69, 'WS10', 'Workspace', 'Monthly', '2026-03-18', '2026-04-17', '08:00:00', '20:00:00', 31, 1, 1, 0.00, 4000.00, 720.00, 0.00, 4720.00, '', '0', 1, 'confirmed', '2026-03-05 07:33:29', '2026-03-05 07:33:29', NULL, 1),
(531, 'BKG-20260306-001', 216, 109, 'TLC03', 'Team Leads Cubicle', 'Monthly', '2026-03-06', '2026-04-05', '08:00:00', '20:00:00', 26, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-03-06 10:32:11', '2026-03-06 10:32:11', NULL, 1),
(532, 'BKG-20260306-002', 219, 114, 'EC02', 'Executive Cabin', 'Hourly', '2026-03-06', '2026-03-06', '18:00:00', '19:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-03-06 11:57:11', '2026-03-06 11:57:11', NULL, 1),
(533, 'BKG-20260306-003', 219, 108, 'TLC02', 'Team Leads Cubicle', 'Monthly', '2026-03-06', '2026-04-05', '08:00:00', '20:00:00', 26, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-03-06 11:57:11', '2026-03-06 11:57:11', NULL, 1),
(534, 'BKG-20260306-004', 219, 114, 'EC02', 'Executive Cabin', 'Daily', '2026-03-07', '2026-03-07', '08:00:00', '20:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-06 12:01:13', '2026-03-06 12:01:13', 'pay_SNvsDJn7XS5mPZ', 1),
(535, 'BKG-20260307-001', 214, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-07', '2026-03-07', '12:00:00', '13:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-07 06:25:42', '2026-03-07 06:25:42', 'pay_SOEgtjOP412Jjj', 0),
(536, 'BKG-20260307-002', 214, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-07', '2026-03-07', '13:00:00', '14:00:00', 1, 1, 2, 0.00, 2.00, 0.00, 0.00, 2.00, '', '0', 1, 'confirmed', '2026-03-07 06:30:16', '2026-03-07 06:30:16', NULL, 1),
(537, 'BKG-20260307-003', 214, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-07', '2026-03-07', '14:00:00', '15:00:00', 1, 1, 2, 0.00, 2.00, 0.00, 0.00, 2.00, '', '0', 1, 'confirmed', '2026-03-07 06:31:59', '2026-03-07 06:31:59', NULL, 1),
(538, 'BKG-20260307-004', 214, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-07', '2026-03-07', '15:00:00', '16:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-07 06:33:59', '2026-03-07 06:33:59', 'pay_SOEpeDCkqj6CyH', 1),
(539, 'BKG-20260307-005', 214, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-07', '2026-03-07', '16:00:00', '17:00:00', 1, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-07 06:34:49', '2026-03-07 06:34:49', 'pay_SOEqVzTqTjUMSl', 1),
(540, 'BKG-20260307-006', 214, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-07', '2026-03-07', '18:15:00', '19:15:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-07 07:09:55', '2026-03-07 07:09:55', 'pay_SOFRYZ4MW4v9Fm', 0),
(541, 'BKG-20260307-007', 214, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-07', '2026-03-07', '17:00:00', '18:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-07 07:12:30', '2026-03-07 07:12:30', 'pay_SOFUIspWfSAKls', 1),
(542, 'BKG-20260309-001', 216, 114, 'EC02', 'Executive Cabin', 'Hourly', '2026-03-09', '2026-03-09', '11:00:00', '12:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-09 04:39:47', '2026-03-09 04:39:47', 'pay_SOzxCyqQux9Lip', 0),
(543, 'BKG-20260309-002', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-09', '2026-03-09', '16:00:00', '17:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-09 09:54:38', '2026-03-09 09:54:38', 'pay_SP5JpyhxQeJiYv', 0),
(544, 'BK-216-106-20260309', 216, 104, 'WS45', 'Workspace', 'Monthly', '2026-03-09', '2026-04-08', NULL, NULL, 1, 0, 1, 100.00, 100.00, 18.00, 0.00, 118.00, NULL, NULL, 0, 'confirmed', '2026-03-11 06:56:09', '2026-03-11 06:56:09', NULL, 0),
(545, 'BKG-20260311-001', 216, 106, 'MC02', 'Manager Cubicle', 'Monthly', '2026-03-11', '2026-04-10', '08:00:00', '20:00:00', 27, 1, 1, 6000.00, 6000.00, 1080.00, 0.00, 7080.00, '', '0', 1, 'confirmed', '2026-03-11 07:16:39', '2026-03-11 07:16:39', 'pay_SPphDNFPTTttWd', 0),
(546, 'BKG-20260320-001', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-20', '2026-03-20', '11:00:00', '12:00:00', 1, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-20 04:46:46', '2026-03-20 04:46:46', 'pay_STLwodSb8OoGKF', 0),
(547, 'BKG-20260320-002', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-20', '2026-03-20', '12:00:00', '13:00:00', 1, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-20 05:00:59', '2026-03-20 05:00:59', 'pay_STMBoRf2yIPDPq', 0),
(548, 'BKG-20260320-003', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-20', '2026-03-20', '13:00:00', '14:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-20 05:06:22', '2026-03-20 05:06:22', 'pay_STMHWVj3KHKltJ', 0),
(549, 'BKG-20260320-004', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-20', '2026-03-20', '14:00:00', '15:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-20 05:08:31', '2026-03-20 05:08:31', 'pay_STMJkQPDnrs9a7', 0),
(550, 'BKG-20260320-005', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-20', '2026-03-20', '15:00:00', '16:00:00', 1, 1, 3, 1.00, 3.00, 0.54, 0.00, 3.54, '', '0', 1, 'confirmed', '2026-03-20 05:09:50', '2026-03-20 05:09:50', 'pay_STMLC17ObjaCwa', 0),
(551, 'BKG-20260320-006', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-20', '2026-03-20', '16:00:00', '17:00:00', 1, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-20 05:24:01', '2026-03-20 05:24:01', 'pay_STMa9yoUEN4gVK', 0),
(552, 'BKG-20260320-007', 216, 114, 'EC02', 'Executive Cabin', 'Hourly', '2026-03-20', '2026-03-20', '11:00:00', '12:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-20 05:25:41', '2026-03-20 05:25:42', 'pay_STMbwBcQJDATK3', 0),
(553, 'BKG-20260320-008', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-20', '2026-03-20', '17:00:00', '18:00:00', 1, 1, 3, 0.00, 3.00, 1.00, 0.00, 4.00, '', '0', 1, 'confirmed', '2026-03-20 05:28:31', '2026-03-20 05:28:31', NULL, 0),
(554, 'BKG-20260320-009', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-20', '2026-03-20', '19:00:00', '20:00:00', 1, 1, 2, 0.00, 2.00, 0.00, 0.00, 2.00, '', '0', 1, 'confirmed', '2026-03-20 05:40:15', '2026-03-20 05:40:15', NULL, 0),
(555, 'BKG-20260320-010', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-21', '2026-03-21', '08:00:00', '09:00:00', 1, 1, 2, 0.00, 2.00, 0.00, 0.00, 2.00, '', '0', 1, 'confirmed', '2026-03-20 05:55:56', '2026-03-20 05:55:56', NULL, 0),
(556, 'BKG-20260320-011', 216, 114, 'EC02', 'Executive Cabin', 'Hourly', '2026-03-20', '2026-03-20', '12:00:00', '13:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-03-20 05:58:43', '2026-03-20 05:58:43', NULL, 0),
(557, 'BKG-20260320-012', 216, 107, 'TLC01', 'Team Leads Cubicle', 'Hourly', '2026-03-20', '2026-03-20', '12:00:00', '13:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-03-20 05:58:43', '2026-03-20 05:58:43', NULL, 0),
(558, 'BKG-20260320-013', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-21', '2026-03-21', '09:00:00', '10:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-20 07:11:52', '2026-03-20 07:11:52', 'pay_STOQ4EOiG7Ox7v', 0),
(559, 'BKG-20260320-014', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-21', '2026-03-21', '10:00:00', '11:00:00', 1, 1, 2, 0.00, 2.00, 0.00, 0.00, 2.00, '', '0', 1, 'confirmed', '2026-03-20 07:13:09', '2026-03-20 07:13:09', NULL, 0),
(560, 'BKG-20260320-015', 219, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-21', '2026-03-21', '15:00:00', '16:00:00', 1, 1, 1, 250.00, 250.00, 45.00, 177.00, 118.00, 'VC01_niriksha', '0', 1, 'confirmed', '2026-03-20 09:13:12', '2026-03-20 09:13:12', 'pay_STQUEApDWlf8kh', 0),
(561, 'BKG-20260321-001', 218, 107, 'TLC01', 'Team Leads Cubicle', 'Hourly', '2026-03-21', '2026-03-21', '10:00:00', '11:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-21 04:24:28', '2026-03-21 04:24:28', 'pay_STk6L1QRyKdfvN', 0),
(562, 'BKG-20260321-002', 218, 114, 'EC02', 'Executive Cabin', 'Monthly', '2026-03-21', '2026-04-20', '08:00:00', '20:00:00', 26, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-21 06:03:27', '2026-03-21 06:03:27', 'pay_STlmtcW3dmOI84', 0),
(563, 'BKG-20260321-003', 218, 110, 'TLC04', 'Team Leads Cubicle', 'Hourly', '2026-03-21', '2026-03-21', '12:00:00', '13:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-21 06:05:06', '2026-03-21 06:05:06', 'pay_STloeoZ92AZwgM', 0),
(564, 'BKG-20260323-001', 216, 103, 'WS44', 'Workspace', 'Monthly', '2026-03-30', '2026-04-29', '08:00:00', '20:00:00', 27, 1, 1, 4000.00, 4000.00, 720.00, 0.00, 4720.00, '', '0', 1, 'confirmed', '2026-03-23 08:40:31', '2026-03-23 08:40:31', 'pay_SUbX1CgIfx24wB', 0),
(565, 'BKG-20260323-002', 216, 103, 'WS44', 'Workspace', 'Monthly', '2026-03-24', '2026-04-23', '08:00:00', '20:00:00', 27, 1, 1, 4000.00, 4000.00, 720.00, 0.00, 4720.00, '', '0', 1, 'confirmed', '2026-03-23 08:41:32', '2026-03-23 08:41:32', 'pay_SUbY4lJ33134i2', 0),
(566, 'BKG-20260323-003', 216, 67, 'WS08', 'Workspace', 'Hourly', '2026-03-23', '2026-03-23', '15:00:00', '16:00:00', 1, 1, 1, 100.00, 100.00, 18.00, 0.00, 118.00, '', '0', 1, 'confirmed', '2026-03-23 09:00:09', '2026-03-23 09:00:09', 'pay_SUbrkHgqS8NHWZ', 0),
(567, 'BKG-20260323-004', 216, 60, 'WS01', 'Workspace', 'Hourly', '2026-03-23', '2026-03-23', '16:00:00', '17:00:00', 1, 1, 1, 100.00, 100.00, 18.00, 0.00, 118.00, '', '0', 1, 'confirmed', '2026-03-23 09:32:50', '2026-03-23 09:32:50', 'pay_SUcQH3gO7sz2Qb', 0),
(568, 'BKG-20260323-005', 216, 61, 'WS02', 'Workspace', 'Hourly', '2026-03-23', '2026-03-23', '17:00:00', '18:00:00', 1, 1, 1, 100.00, 100.00, 18.00, 0.00, 118.00, '', '0', 1, 'confirmed', '2026-03-23 09:34:34', '2026-03-23 09:34:34', 'pay_SUcS7Cpy6B40BM', 0),
(569, 'BKG-20260323-006', 216, 62, 'WS03', 'Workspace', 'Hourly', '2026-03-23', '2026-03-23', '18:00:00', '19:00:00', 1, 1, 1, 100.00, 100.00, 18.00, 0.00, 118.00, '', '0', 1, 'confirmed', '2026-03-23 09:39:19', '2026-03-23 09:39:19', 'pay_SUcX873wcuZb2G', 0),
(570, 'BKG-20260323-007', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-23', '2026-03-23', '19:00:00', '20:00:00', 1, 1, 1, 250.00, 250.00, 45.00, 0.00, 295.00, '', '0', 1, 'confirmed', '2026-03-23 10:01:21', '2026-03-23 10:01:21', 'pay_SUcuP6wFMbRoGZ', 0),
(571, 'BKG-20260323-008', 216, 107, 'TLC01', 'Team Leads Cubicle', 'Hourly', '2026-03-23', '2026-03-23', '19:00:00', '20:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-23 10:02:30', '2026-03-23 10:02:30', 'pay_SUcvcdrctu1JOU', 0),
(572, 'BKG-20260323-009', 216, 110, 'TLC04', 'Team Leads Cubicle', 'Hourly', '2026-03-25', '2026-03-25', '16:00:00', '17:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-23 10:15:18', '2026-03-23 10:15:18', 'pay_SUd99EYiEunNv8', 0),
(573, 'BKG-20260323-010', 216, 105, 'MC01', 'Manager Cubicle', 'Hourly', '2026-03-23', '2026-03-23', '19:00:00', '20:00:00', 1, 1, 1, 120.00, 120.00, 21.60, 0.00, 141.60, '', '0', 1, 'confirmed', '2026-03-23 10:43:28', '2026-03-23 10:43:28', 'pay_SUdct90iGSGyNs', 0),
(574, 'BKG-20260323-011', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-23', '2026-03-23', '17:00:00', '18:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-23 11:15:28', '2026-03-23 11:15:28', 'pay_SUeAgji2bAdN8J', 0),
(575, 'BKG-20260324-001', 216, 60, 'WS01', 'Workspace', 'Hourly', '2026-03-24', '2026-03-24', '12:00:00', '13:00:00', 1, 1, 1, 100.00, 100.00, 18.00, 0.00, 118.00, '', '0', 1, 'confirmed', '2026-03-24 03:40:46', '2026-03-24 03:43:04', 'pay_SUuxR8pSqRTJ6A', 0),
(576, 'BKG-20260324-002', 216, 61, 'WS02', 'Workspace', 'Hourly', '2026-03-24', '2026-03-24', '15:00:00', '16:00:00', 1, 1, 1, 100.00, 100.00, 18.00, 0.00, 118.00, '', '0', 1, 'confirmed', '2026-03-24 04:12:14', '2026-03-24 04:12:14', 'pay_SUvUjfoEmtcklW', 0),
(577, 'BKG-20260324-003', 216, 62, 'WS03', 'Workspace', 'Hourly', '2026-03-24', '2026-03-24', '15:00:00', '16:00:00', 1, 1, 1, 100.00, 100.00, 18.00, 0.00, 118.00, '', '0', 1, 'confirmed', '2026-03-24 04:29:46', '2026-03-24 04:29:46', 'pay_SUvnEO3WN7xRwE', 0),
(578, 'BKG-20260324-004', 216, 63, 'WS04', 'Workspace', 'Hourly', '2026-03-24', '2026-03-24', '15:00:00', '16:00:00', 1, 1, 1, 100.00, 100.00, 18.00, 0.00, 118.00, '', '0', 1, 'confirmed', '2026-03-24 04:42:28', '2026-03-24 04:42:28', 'pay_SUw0fNeJ10H9wK', 0),
(579, 'BKG-20260324-005', 216, 63, 'WS04', 'Workspace', 'Hourly', '2026-03-24', '2026-03-24', '14:00:00', '15:00:00', 1, 1, 1, 100.00, 100.00, 18.00, 0.00, 118.00, '', '0', 1, 'confirmed', '2026-03-24 05:12:30', '2026-03-24 05:12:30', 'pay_SUwWP1P3qdYgUl', 0),
(580, 'BKG-20260324-006', 216, 107, 'TLC01', 'Team Leads Cubicle', 'Hourly', '2026-03-24', '2026-03-24', '12:15:00', '13:15:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-24 05:19:12', '2026-03-24 05:19:12', 'pay_SUwdUhCmzBK69F', 0),
(581, 'BKG-20260324-007', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-24', '2026-03-24', '12:00:00', '13:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-24 05:35:36', '2026-03-24 05:35:36', 'pay_SUwunMFLjRurIR', 0),
(582, 'BKG-20260324-008', 198, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-24', '2026-03-24', '13:00:00', '14:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-24 05:39:23', '2026-03-24 05:39:23', 'pay_SUwynv9E5PfNcF', 0),
(583, 'BKG-20260324-009', 217, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-24', '2026-03-24', '17:00:00', '18:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-24 05:51:35', '2026-03-24 05:51:35', 'pay_SUxBfN8OzqSJZu', 0),
(584, 'BKG-20260324-010', 216, 107, 'TLC01', 'Team Leads Cubicle', 'Hourly', '2026-03-24', '2026-03-24', '17:00:00', '18:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-03-24 10:35:03', '2026-03-24 10:35:03', NULL, 0),
(585, 'BKG-20260324-011', 216, 107, 'TLC01', 'Team Leads Cubicle', 'Hourly', '2026-03-24', '2026-03-24', '18:00:00', '19:00:00', 1, 1, 1, 0.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-24 11:05:12', '2026-03-24 11:05:12', NULL, 0),
(586, 'BKG-20260324-012', 216, 110, 'TLC04, TLC01', 'Team Leads Cubicle', 'Hourly', '2026-03-24', '2026-03-24', '19:00:00', '20:00:00', 1, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-24 11:10:41', '2026-03-24 11:10:41', 'pay_SV2ck2Sxn3fyrh', 0),
(587, 'BKG-20260324-013', 216, 110, 'TLC04, TLC01', 'Team Leads Cubicle', 'Monthly', '2026-03-26', '2026-04-25', '08:00:00', '20:00:00', 27, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-24 11:13:15', '2026-03-24 11:13:15', 'pay_SV2fSI0KTGvR8k', 0),
(588, 'BKG-20260325-001', 216, 107, 'TLC01', 'Team Leads Cubicle', 'Hourly', '2026-03-25', '2026-03-25', '10:00:00', '11:00:00', 1, 1, 1, 0.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-25 03:50:39', '2026-03-25 03:50:39', NULL, 0),
(589, 'BKG-20260325-002', 218, 68, 'WS09, WS08', 'Workspace', 'Hourly', '2026-03-25', '2026-03-25', '10:00:00', '11:00:00', 1, 1, 2, 0.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-25 04:03:22', '2026-03-25 04:03:22', NULL, 0),
(590, 'BKG-20260325-003', 218, 68, 'WS09, WS08', 'Workspace', 'Hourly', '2026-03-25', '2026-03-25', '11:00:00', '12:00:00', 1, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-25 04:06:46', '2026-03-25 04:06:46', 'pay_SVJwKUEGUimPq0', 0),
(591, 'BKG-20260325-004', 218, 67, 'WS08', 'Workspace', 'Monthly', '2026-03-26', '2026-04-25', '08:00:00', '20:00:00', 27, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-25 05:21:19', '2026-03-25 05:21:19', 'pay_SVLD5cEkYjsHJJ', 0),
(592, 'BKG-20260325-005', 218, 67, 'WS08', 'Workspace', 'Daily', '2026-03-25', '2026-03-25', '08:00:00', '20:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-25 05:35:55', '2026-03-25 05:35:55', 'pay_SVLSTArYB4Pvrq', 0),
(593, 'BKG-20260325-006', 218, 68, 'WS09', 'Workspace', 'Monthly', '2026-03-26', '2026-04-25', '08:00:00', '20:00:00', 27, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-25 05:36:58', '2026-03-25 05:36:58', 'pay_SVLTdF1VvOeMDW', 0),
(594, 'BKG-20260325-007', 218, 110, 'TLC04, TLC01', 'Team Leads Cubicle', 'Hourly', '2026-03-25', '2026-03-25', '13:00:00', '14:00:00', 1, 1, 2, 0.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-25 06:37:53', '2026-03-25 06:37:53', NULL, 0),
(595, 'BKG-20260325-008', 218, 107, 'TLC01', 'Team Leads Cubicle', 'Hourly', '2026-03-25', '2026-03-25', '14:00:00', '15:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-25 06:42:42', '2026-03-25 06:42:42', 'pay_SVMb4DWuzvjYq6', 0),
(596, 'BKG-20260325-009', 218, 110, 'TLC04, TLC01', 'Team Leads Cubicle', 'Hourly', '2026-03-25', '2026-03-25', '15:00:00', '16:00:00', 1, 1, 2, 0.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-25 06:44:51', '2026-03-25 06:44:51', NULL, 0),
(597, 'BKG-20260325-010', 218, 110, 'TLC04, TLC01', 'Team Leads Cubicle', 'Hourly', '2026-03-25', '2026-03-25', '17:00:00', '18:00:00', 1, 1, 2, 0.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-25 06:54:54', '2026-03-25 06:54:54', NULL, 0),
(598, 'BKG-20260325-011', 218, 110, 'TLC04, TLC01', 'Team Leads Cubicle', 'Hourly', '2026-03-25', '2026-03-25', '18:00:00', '19:00:00', 1, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-25 07:25:23', '2026-03-25 07:25:23', 'pay_SVNK9iu0bEHqV1', 0),
(599, 'BKG-20260325-012', 216, 107, 'TLC01', 'Team Leads Cubicle', 'Hourly', '2026-03-25', '2026-03-25', '15:00:00', '16:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-03-25 08:46:19', '2026-03-25 08:46:19', NULL, 0),
(600, 'BKG-20260325-013', 216, 107, 'TLC01', 'Team Leads Cubicle', 'Hourly', '2026-03-25', '2026-03-25', '18:45:00', '19:45:00', 1, 1, 1, 0.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-25 08:55:22', '2026-03-25 08:55:22', NULL, 0),
(601, 'BKG-20260325-014', 216, 68, 'WS09', 'Workspace', 'Hourly', '2026-03-25', '2026-03-25', '15:00:00', '16:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-25 09:18:50', '2026-03-25 09:18:50', 'pay_SVPG0OjiwxBXHi', 0),
(602, 'BKG-20260325-015', 216, 68, 'WS09', 'Workspace', 'Hourly', '2026-03-25', '2026-03-25', '16:00:00', '17:00:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-03-25 09:55:42', '2026-03-25 09:55:42', NULL, 0),
(603, 'BKG-20260325-016', 216, 68, 'WS09', 'Workspace', 'Hourly', '2026-03-25', '2026-03-25', '17:00:00', '18:00:00', 1, 1, 1, 0.00, 0.00, 0.00, 0.00, 0.00, '', '0', 1, 'confirmed', '2026-03-25 10:29:07', '2026-03-25 10:29:07', NULL, 0),
(604, 'BKG-20260325-017', 216, 68, 'WS09', 'Workspace', 'Hourly', '2026-03-25', '2026-03-25', '18:30:00', '19:30:00', 1, 1, 1, 0.00, 1.00, 0.00, 0.00, 1.00, '', '0', 1, 'confirmed', '2026-03-25 10:43:26', '2026-03-25 10:43:26', 'pay_SVQhLktvsLKJmz', 0),
(605, 'BKG-20260325-018', 216, 110, 'TLC04', 'Team Leads Cubicle', 'Hourly', '2026-03-25', '2026-03-25', '19:00:00', '20:00:00', 1, 1, 1, 0.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-25 10:53:53', '2026-03-25 10:53:53', 'pay_SVQsONsDJwaCKD', 0),
(606, 'BKG-20260325-019', 216, 61, 'WS02, WS01', 'Workspace', 'Hourly', '2026-03-25', '2026-03-25', '17:00:00', '18:00:00', 1, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-25 11:27:10', '2026-03-25 11:27:10', 'pay_SVRRYmuY8NiRVv', 0),
(607, 'BKG-20260325-020', 216, 61, 'WS02, WS01', 'Workspace', 'Hourly', '2026-03-25', '2026-03-25', '19:00:00', '20:00:00', 1, 1, 2, 0.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-25 11:37:57', '2026-03-25 11:37:57', 'pay_SVRcwkY8Oro77H', 0),
(608, 'BKG-20260325-021', 216, 61, 'WS02, WS01', 'Workspace', 'Hourly', '2026-03-26', '2026-03-26', '15:30:00', '16:30:00', 1, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-25 11:50:17', '2026-03-25 11:50:17', 'pay_SVRpuv0igFH1wu', 0),
(609, 'BKG-20260325-022', 216, 61, 'WS02, WS01', 'Workspace', 'Hourly', '2026-03-26', '2026-03-26', '13:45:00', '14:45:00', 1, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-25 11:51:31', '2026-03-25 11:51:31', 'pay_SVRrGKwN2W2qTG', 0),
(610, 'BKG-20260326-001', 216, 61, 'WS02, WS01', 'Workspace', 'Hourly', '2026-03-28', '2026-03-28', '08:00:00', '09:00:00', 1, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-26 04:11:37', '2026-03-26 04:11:37', 'pay_SViYXSawBqjjuR', 0),
(611, 'BKG-20260326-002', 218, 62, 'WS03', 'Workspace', 'Monthly', '2026-03-30', '2026-04-29', '08:00:00', '20:00:00', 27, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 04:20:56', '2026-03-26 04:23:01', 'pay_SViiPWW7JAhcc8', 0),
(612, 'BKG-20260326-003', 219, 63, 'WS04', 'Workspace', 'Hourly', '2026-03-26', '2026-03-26', '10:15:00', '11:15:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 04:39:01', '2026-03-26 04:39:01', 'pay_SVj1VJrUMacUYs', 0),
(613, 'BKG-20260326-004', 219, 63, 'WS04', 'Workspace', 'Hourly', '2026-03-26', '2026-03-26', '11:30:00', '12:30:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 04:42:26', '2026-03-26 04:42:26', 'pay_SVj56saCR2mZTY', 0),
(614, 'BKG-20260326-005', 219, 63, 'WS04, WS03', 'Workspace', 'Hourly', '2026-03-27', '2026-03-27', '11:00:00', '12:00:00', 1, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-26 04:44:50', '2026-03-26 04:44:50', 'pay_SVj7ec2bEOFEyY', 0),
(615, 'BKG-20260326-006', 219, 63, 'WS04, WS03', 'Workspace', 'Hourly', '2026-03-26', '2026-03-26', '12:30:00', '13:30:00', 1, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-26 04:47:18', '2026-03-26 04:47:18', 'pay_SVjAGG35eEVrIo', 0),
(616, 'BKG-20260326-007', 218, 64, 'WS05', 'Workspace', 'Monthly', '2026-03-30', '2026-04-29', '08:00:00', '20:00:00', 27, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 05:05:16', '2026-03-26 05:05:16', 'pay_SVjTEbwIcXkACt', 0),
(617, 'BKG-20260326-008', 218, 65, 'WS06', 'Workspace', 'Monthly', '2026-03-26', '2026-04-25', '08:00:00', '20:00:00', 27, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 06:09:08', '2026-03-26 06:09:08', 'pay_SVkYgvB64xGHkX', 0),
(618, 'BKG-20260326-009', 219, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-26', '2026-03-26', '13:00:00', '14:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 07:07:33', '2026-03-26 07:07:33', 'pay_SVlYOUKP8ASaav', 0),
(619, 'BKG-20260326-010', 218, 64, 'WS05', 'Workspace', 'Hourly', '2026-03-26', '2026-03-26', '15:00:00', '16:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 09:17:01', '2026-03-26 09:17:01', 'pay_SVnlAxnek4wFT0', 0),
(620, 'BKG-20260326-011', 220, 64, 'WS05', 'Workspace', 'Hourly', '2026-03-26', '2026-03-26', '16:00:00', '17:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 09:31:42', '2026-03-26 09:31:42', 'pay_SVo0dyZ8pPKWPY', 0),
(621, 'BKG-20260326-012', 216, 63, 'WS04', 'Workspace', 'Hourly', '2026-03-26', '2026-03-26', '16:00:00', '17:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 10:03:14', '2026-03-26 10:03:14', 'pay_SVoXzN11yBcYEp', 0),
(622, 'BKG-20260326-013', 216, 62, 'WS03', 'Workspace', 'Hourly', '2026-03-26', '2026-03-26', '16:00:00', '17:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 10:08:18', '2026-03-26 10:08:18', 'pay_SVodKqepKyvAfz', 0),
(623, 'BKG-20260326-014', 216, 60, 'WS01', 'Workspace', 'Hourly', '2026-03-26', '2026-03-26', '16:00:00', '17:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 10:12:43', '2026-03-26 10:12:43', 'pay_SVohyzmHfznRqa', 0),
(624, 'BKG-20260326-015', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-26', '2026-03-26', '16:00:00', '17:00:00', 1, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-26 10:15:07', '2026-03-26 10:15:07', 'pay_SVokZTXaHo2PZm', 0),
(625, 'BKG-20260326-016', 216, 61, 'WS02', 'Workspace', 'Hourly', '2026-03-26', '2026-03-26', '18:30:00', '19:30:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 10:22:50', '2026-03-26 10:22:50', 'pay_SVoshZkZlHJHbC', 0),
(626, 'BKG-20260326-017', 216, 60, 'WS01', 'Workspace', 'Hourly', '2026-03-26', '2026-03-26', '18:30:00', '19:30:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 10:23:53', '2026-03-26 10:23:53', 'pay_SVotpKSKQfYiZ6', 0),
(627, 'BKG-20260326-018', 216, 61, 'WS02', 'Workspace', 'Hourly', '2026-03-26', '2026-03-26', '17:15:00', '18:15:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 10:24:47', '2026-03-26 10:24:47', 'pay_SVoukhkXY8mk1v', 0),
(628, 'BKG-20260326-019', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-26', '2026-03-26', '18:00:00', '19:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 10:35:30', '2026-03-26 10:35:30', 'pay_SVp65Yfj5cKQdP', 0),
(629, 'BKG-20260326-020', 216, 60, 'WS01', 'Workspace', 'Hourly', '2026-03-26', '2026-03-26', '17:00:00', '18:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 10:39:13', '2026-03-26 10:39:13', 'pay_SVp9zxV7F5C74E', 0),
(630, 'BKG-20260326-021', 216, 60, 'WS01', 'Workspace', 'Hourly', '2026-03-27', '2026-03-27', '08:00:00', '09:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 10:41:55', '2026-03-26 10:41:55', 'pay_SVpCr84yasSz7Z', 0),
(631, 'BKG-20260326-022', 216, 60, 'WS01', 'Workspace', 'Hourly', '2026-03-27', '2026-03-27', '09:00:00', '10:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 10:46:21', '2026-03-26 10:46:21', 'pay_SVpHYJ4mSsn8hQ', 0),
(632, 'BKG-20260326-023', 216, 60, 'WS01', 'Workspace', 'Hourly', '2026-03-27', '2026-03-27', '10:00:00', '11:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 10:49:50', '2026-03-26 10:49:50', 'pay_SVpLEMB0CP5Spe', 0),
(633, 'BKG-20260326-024', 216, 70, 'WS11', 'Workspace', 'Monthly', '2026-03-28', '2026-04-27', '08:00:00', '20:00:00', 26, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 10:57:25', '2026-03-26 10:57:25', 'pay_SVpTEs95Zf3PPL', 0),
(634, 'BKG-20260326-025', 216, 70, 'WS11', 'Workspace', 'Daily', '2026-03-27', '2026-03-27', '08:00:00', '20:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 10:59:42', '2026-03-26 10:59:42', 'pay_SVpVdwQO9Jre2w', 0),
(635, 'BKG-20260326-026', 216, 70, 'WS11', 'Workspace', 'Hourly', '2026-03-26', '2026-03-26', '17:00:00', '18:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-26 11:00:56', '2026-03-26 11:00:56', 'pay_SVpWtmq5nByESF', 0),
(636, 'BKG-20260328-001', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-28', '2026-03-28', '14:00:00', '15:00:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-28 08:16:02', '2026-03-28 08:16:02', 'pay_SWZmzgAZsYjmwH', 0),
(637, 'BKG-20260330-001', 216, 63, 'WS04', 'Workspace', 'Hourly', '2026-03-30', '2026-03-30', '12:15:00', '13:15:00', 1, 1, 1, 1.00, 1.00, 0.18, 0.00, 1.18, '', '0', 1, 'confirmed', '2026-03-30 06:45:20', '2026-03-30 06:45:20', 'pay_SXLJSDJ7SFvpwB', 0),
(638, 'BKG-20260331-001', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-31', '2026-03-31', '10:00:00', '11:00:00', 1, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-31 04:23:41', '2026-03-31 04:23:41', 'pay_SXhQvTxjRj6Hcu', 0),
(639, 'BKG-20260331-002', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-31', '2026-03-31', '11:00:00', '12:00:00', 1, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-31 04:28:03', '2026-03-31 04:28:03', 'pay_SXhVXRICny9aXs', 0),
(640, 'BKG-20260331-003', 216, 111, 'VC01', 'Video Conferencing', 'Hourly', '2026-03-31', '2026-03-31', '12:00:00', '13:00:00', 1, 1, 2, 1.00, 2.00, 0.36, 0.00, 2.36, '', '0', 1, 'confirmed', '2026-03-31 04:34:02', '2026-03-31 04:34:02', 'pay_SXhbpdKxdJnQ2x', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_attendees`
--
ALTER TABLE `booking_attendees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_profile`
--
ALTER TABLE `company_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_company` (`user_id`);

--
-- Indexes for table `contact_comments`
--
ALTER TABLE `contact_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Indexes for table `contact_requests`
--
ALTER TABLE `contact_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupon_code` (`coupon_code`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `token` (`token`);

--
-- Indexes for table `spaces`
--
ALTER TABLE `spaces`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `space_code` (`space_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_comments`
--
ALTER TABLE `user_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `virtualoffice_bookings`
--
ALTER TABLE `virtualoffice_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `price_id` (`price_id`);

--
-- Indexes for table `virtualoffice_prices`
--
ALTER TABLE `virtualoffice_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `virtual_office_enquiries`
--
ALTER TABLE `virtual_office_enquiries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_visitors_company` (`company_id`),
  ADD KEY `fk_visitor_admin` (`admin_id`),
  ADD KEY `fk_visitors_user` (`user_id`),
  ADD KEY `fk_visitor_booking` (`booking_id`);

--
-- Indexes for table `workspace_bookings`
--
ALTER TABLE `workspace_bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `booking_id` (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `space_id` (`space_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `booking_attendees`
--
ALTER TABLE `booking_attendees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company_profile`
--
ALTER TABLE `company_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact_comments`
--
ALTER TABLE `contact_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_requests`
--
ALTER TABLE `contact_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `spaces`
--
ALTER TABLE `spaces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `user_comments`
--
ALTER TABLE `user_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `virtualoffice_bookings`
--
ALTER TABLE `virtualoffice_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `virtualoffice_prices`
--
ALTER TABLE `virtualoffice_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `virtual_office_enquiries`
--
ALTER TABLE `virtual_office_enquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `workspace_bookings`
--
ALTER TABLE `workspace_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=641;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `company_profile`
--
ALTER TABLE `company_profile`
  ADD CONSTRAINT `fk_user_company` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contact_comments`
--
ALTER TABLE `contact_comments`
  ADD CONSTRAINT `contact_comments_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `contact_requests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_comments`
--
ALTER TABLE `user_comments`
  ADD CONSTRAINT `user_comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `virtualoffice_bookings`
--
ALTER TABLE `virtualoffice_bookings`
  ADD CONSTRAINT `virtualoffice_bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `virtualoffice_bookings_ibfk_2` FOREIGN KEY (`price_id`) REFERENCES `virtualoffice_prices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `visitors`
--
ALTER TABLE `visitors`
  ADD CONSTRAINT `fk_visitor_admin` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_visitor_booking` FOREIGN KEY (`booking_id`) REFERENCES `workspace_bookings` (`booking_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_visitors_company` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_visitors_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `workspace_bookings`
--
ALTER TABLE `workspace_bookings`
  ADD CONSTRAINT `workspace_bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `workspace_bookings_ibfk_2` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
