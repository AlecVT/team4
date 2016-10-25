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

-- Set the primart_key and auto-increment properties to the post table.
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

-- Set the primart_key and auto-increment properties to the comment table.
ALTER TABLE `comment` ADD PRIMARY KEY (`id`);
ALTER TABLE `comment` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

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