-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- PHP Version: 5.6.19

-- ---------------------------------------------------------------------------------------
-- DATABASE: `main`
-- ---------------------------------------------------------------------------------------

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- ---------------------------------------------------------------------------------------
-- SUBJECT TABLE
-- ---------------------------------------------------------------------------------------

CREATE TABLE `subject` (
	`id` int(11) NOT NULL,
	`name` varchar(100) NOT NULL,
	`date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`creator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Image: http://lh4.ggpht.com/yZN1C7dh-Zals1OuI-gAiR83j7TifnwIgJTJdhfF1alm7rZVj5k9xe892ViKG5bVjk0=w300
-- Image: https://lh6.ggpht.com/2DB3_6zp4-GNRQC0JuIDm5ZhOc2u6rt1oASPG5j100VjQW6i3iYSIyu_6Fj4D3r3YUB9=w300
-- Image: https://lh6.ggpht.com/laWKKJUzgrXR9it2rhA-pRkahVjYRsHbmnoLTnltL16RSOaY4X6vTFRo0tOB4xgHmyI=w300
-- Image: https://lh3.googleusercontent.com/E63TAHSDOSOSdgtS3c4C9Vy_SVz1GKDcaBInpoWLZTloNhHzChv3KKVMi7fvm5dH7Q=w300
-- Image: http://lh3.googleusercontent.com/720cI4FKNK8Ezog1kyBAuYFakXHzTEXNAAWf9uGrNefYrfU4FHUX3fecVdEgdNudeA=w300
-- Image: http://store-images.s-microsoft.com/image/apps.58841.13510798883180958.3809fdfe-2451-4754-ba4f-35710c6872e1.be3f8bef-d286-42be-b287-ae92f8295aa6
-- Image: https://lh6.ggpht.com/T63N_fytgIFdVOA9maL6X2osq3Ri5fRwoSU2ZzIU2-P7t-DRr1BiKHl2b2CYa4tr2eo=w300
-- Image: https://cbsdenver.files.wordpress.com/2010/12/colorado-state-university.gif
-- Image: http://www.downloadfreeapk.com/developer/tcu-enterprise-application-services
-- Image: https://lh5.ggpht.com/bcWAIAdYWCPaAN93PkDoAlZYxVEqiu_3VwC8lkqKrtofyzcY1VXb4R1RcvZpaL9m-34=w300
-- Image: https://lh3.ggpht.com/8iOkIpsMomwxJiPPEfeTF-6KhBdQQR4ZL2np2uvc4oXJ3U8HxZEf42hfObCjKmIdxIMD=w300
-- Image: http://cdn.marketplaceimages.windowsphone.com/v8/images/e6bba629-22e3-45fa-9ee6-31fd7c71c161?imageType=ws_icon_medium
-- Image: https://lh4.ggpht.com/eL0dXz94cF0aQ12APHI6mWDQssx3aC12QeKk046zxGy3UUMyxX3aiwE-UjMY6u-dRLY=w300
-- Image: https://lh5.ggpht.com/o1fZnZ_olGK0DqIwGoJic8l8G9HFUz9Xd_rem9lerD-jeaD-l15ARilJ0YGRylP0yQ4=w300
-- Image: https://lh3.googleusercontent.com/jie65NLDvDyhfSnXl0O1LfaYXViXxiqwz7QiydCWYCZHhuPJzW0pZW6QxfbwslCxl98=w300
INSERT INTO `subject` (`id`, `name`) VALUES
	(1, 'Physics'),
	(2, 'Math'),
	(3, 'Chemistry'),
	(4, 'Statistics'),
	(5, 'Biology'),
	(6, 'Computer Science'),
	(7, 'Economics');

-- ---------------------------------------------------------------------------------------
-- POST TABLE
-- ---------------------------------------------------------------------------------------

CREATE TABLE `post` (
	`id` int(11) NOT NULL,
	`subject` int(11) NOT NULL,
	`title` varchar(100) NOT NULL,
	`description` varchar(100) NOT NULL,
	`author` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `post` (`id`, `subject`, `title`, `description`, `author`) VALUES
	(1, 1, 'Force Equation', 'What does f=ma mean?', 'Alec Masterson'),
	(2, 1, 'Kinetic Energy', 'What is the equation for kinetic energy?', 'Joey Watts'),
	(3, 2, 'Integral Help', 'Can someone please explain how to do integration by parts?', 'Joey Watts'),
	(4, 2, 'Completing the Square', 'How do you complete the square?', 'Alec Masterson'),
	(5, 2, 'FOIL', 'Can someone provide an example of how to FOIL an expression.', 'James Wilson'),
	(6, 3, 'Atomic Mass', 'Where does an elements atomic mass come from?', 'Haiyu Zhao'),
	(7, 4, 'Standard Normal Distribution', 'How does someone convert from a normal distribution to a standard normal distribution?', 'Alec Masterson'),
	(8, 5, 'General Biology', "In 3 sentences or less, can someone provide a definition of Biology.", 'Joey Watts'),
	(9, 6, 'Favorite Language', 'What is your favorite programming language and why?', 'Haiyu Zhao'),
	(10, 6, 'Binary Search Tree', 'What is the process in traversing a binary search tree?', 'Alec Masterson'),
	(11, 6, 'C to Assembly Help', 'Does anyone have any good resources for converting C code into Assembly?', 'Joey Watts'),
	(12, 6, 'Big O Calculation', "Can someone give me a crash course on Big O efficiency?", 'James Wilson');

-- Set the primart_key and auto-increment properties to the item table.
ALTER TABLE `post` ADD PRIMARY KEY (`id`);
ALTER TABLE `post` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

-- ---------------------------------------------------------------------------------------
-- COMMENT TABLE
-- ---------------------------------------------------------------------------------------

CREATE TABLE `comment` (
	`id` int(11) NOT NULL,
	`post` int(11) NOT NULL,
	`description` varchar(100) NOT NULL,
	`author` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ---------------------------------------------------------------------------------------
-- USER TABLE
-- ---------------------------------------------------------------------------------------

CREATE TABLE `user` (
	`id` int(11) NOT NULL,
	`email` varchar(100) NOT NULL,
	`password` varchar(100) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Add the one admin login information to the user table.
INSERT INTO 'user' ('id', 'email', 'password') VALUES (1, 'admin@admin.com', 'admin');

-- Set the primart_key and auto-increment properties to the user table.
ALTER TABLE `user` ADD PRIMARY KEY (`id`);
ALTER TABLE `user` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;