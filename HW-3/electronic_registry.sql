-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: std-mysql
-- Время создания: Июн 28 2020 г., 23:48
-- Версия сервера: 5.7.26-0ubuntu0.16.04.1
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `electronic_registry`
--
CREATE DATABASE IF NOT EXISTS electronic_registry DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE electronic_registry;

-- --------------------------------------------------------

--
-- Структура таблицы `ELREG_appointments`
--

CREATE TABLE `ELREG_appointments` (
  `id` int(11) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `specialization_id` int(11) NOT NULL,
  `date_id` int(11) NOT NULL,
  `time_id` int(11) NOT NULL,
  `customer_name` text NOT NULL,
  `customer_birthday` date NOT NULL,
  `customer_phone` text NOT NULL,
  `customer_e-mail` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ELREG_appointments`
--

INSERT INTO `ELREG_appointments` (`id`, `clinic_id`, `specialization_id`, `date_id`, `time_id`, `customer_name`, `customer_birthday`, `customer_phone`, `customer_e-mail`) VALUES
(1, 0, 3, 2, 239, 'Николай Огородников', '2001-01-17', '+79997600947', 'kolaqsq1707@gmail.com'),
(2, 0, 0, 79, 79, 'Рублев Елизарий Вениаминович', '1972-08-09', '+7 (922) 672-97-59', ''),
(3, 4, 8, 113, 350, 'Григорьев Владилин Петрович', '2001-05-07', '+7 (922) 053-76-15', 'MuhrizMinaev660@mail.ru'),
(4, 8, 1, 60, 297, 'Сысолятина Вайетта Егоровна', '1981-09-13', '+7 (922) 273-40-61', 'VayettaSysolyatina429@ya.ru'),
(5, 4, 11, 35, 509, 'Левченко Никей Кириллович', '1990-09-14', '+7 (922) 196-92-53', ''),
(6, 9, 6, 229, 229, 'Игнатов Зульфагар Анатольевич', '1969-07-07', '+7 (922) 914-69-41', 'ZulfagarIgnatov942@gmail.com'),
(7, 4, 12, 115, 115, 'Гулевич Аиша Богдановна', '1985-01-17', '+7 (922) 769-59-46', 'AishaGulevich986@mail.ru'),
(8, 6, 0, 203, 203, 'Алиев Вилмош Ермакович', '1993-06-01', '+7 (922) 823-32-47', ''),
(9, 6, 2, 47, 284, 'Ермолаева Зульхаят Станиславовна', '2000-06-01', '+7 (922) 541-80-63', ''),
(10, 6, 2, 205, 442, 'Баландина Ирика Васильевна', '1993-03-15', '+7 (922) 861-00-32', 'IrikaBalandina804@gmail.com');

-- --------------------------------------------------------

--
-- Структура таблицы `ELREG_available_dates`
--

CREATE TABLE `ELREG_available_dates` (
  `id` int(11) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `specialization_id` int(11) NOT NULL,
  `available_date` date NOT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ELREG_available_dates`
--

INSERT INTO `ELREG_available_dates` (`id`, `clinic_id`, `specialization_id`, `available_date`, `available`) VALUES
(0, 0, 0, '2020-07-10', 1),
(1, 0, 1, '2020-07-10', 1),
(2, 0, 3, '2020-07-10', 1),
(3, 0, 7, '2020-07-10', 1),
(4, 0, 9, '2020-07-10', 1),
(5, 0, 5, '2020-07-10', 1),
(6, 0, 13, '2020-07-10', 1),
(7, 1, 0, '2020-07-10', 1),
(8, 1, 1, '2020-07-10', 1),
(9, 1, 3, '2020-07-10', 1),
(10, 1, 5, '2020-07-10', 1),
(11, 1, 7, '2020-07-10', 1),
(12, 1, 9, '2020-07-10', 1),
(13, 1, 13, '2020-07-10', 1),
(14, 2, 0, '2020-07-10', 1),
(15, 2, 1, '2020-07-10', 1),
(16, 2, 3, '2020-07-10', 1),
(17, 2, 5, '2020-07-10', 1),
(18, 2, 7, '2020-07-10', 1),
(19, 2, 9, '2020-07-10', 1),
(20, 2, 11, '2020-07-10', 1),
(21, 2, 13, '2020-07-10', 1),
(22, 3, 0, '2020-07-10', 1),
(23, 3, 1, '2020-07-10', 1),
(24, 3, 3, '2020-07-10', 1),
(25, 3, 5, '2020-07-10', 1),
(26, 3, 7, '2020-07-10', 1),
(27, 3, 9, '2020-07-10', 1),
(28, 3, 13, '2020-07-10', 1),
(29, 4, 0, '2020-07-10', 1),
(30, 4, 1, '2020-07-10', 1),
(31, 4, 2, '2020-07-10', 1),
(32, 4, 4, '2020-07-10', 1),
(33, 4, 6, '2020-07-10', 1),
(34, 4, 8, '2020-07-10', 1),
(35, 4, 11, '2020-07-10', 1),
(36, 4, 12, '2020-07-10', 1),
(37, 5, 0, '2020-07-10', 1),
(38, 5, 1, '2020-07-10', 1),
(39, 5, 2, '2020-07-13', 1),
(40, 5, 4, '2020-07-13', 1),
(41, 5, 6, '2020-07-13', 1),
(42, 5, 8, '2020-07-13', 1),
(43, 5, 11, '2020-07-13', 1),
(44, 5, 12, '2020-07-13', 1),
(45, 6, 0, '2020-07-13', 1),
(46, 6, 1, '2020-07-13', 1),
(47, 6, 2, '2020-07-13', 1),
(48, 6, 4, '2020-07-13', 1),
(49, 6, 6, '2020-07-13', 1),
(50, 6, 8, '2020-07-13', 1),
(51, 6, 11, '2020-07-13', 1),
(52, 6, 12, '2020-07-13', 1),
(53, 7, 0, '2020-07-13', 1),
(54, 7, 1, '2020-07-13', 1),
(55, 7, 8, '2020-07-13', 1),
(56, 7, 10, '2020-07-13', 1),
(57, 7, 11, '2020-07-13', 1),
(58, 7, 12, '2020-07-13', 1),
(59, 8, 0, '2020-07-13', 1),
(60, 8, 1, '2020-07-13', 1),
(61, 8, 8, '2020-07-13', 1),
(62, 8, 10, '2020-07-13', 1),
(63, 8, 11, '2020-07-13', 1),
(64, 8, 12, '2020-07-13', 1),
(65, 9, 0, '2020-07-13', 1),
(66, 9, 1, '2020-07-13', 1),
(67, 9, 2, '2020-07-13', 1),
(68, 9, 3, '2020-07-13', 1),
(69, 9, 4, '2020-07-13', 1),
(70, 9, 5, '2020-07-13', 1),
(71, 9, 6, '2020-07-13', 1),
(72, 9, 7, '2020-07-13', 1),
(73, 9, 8, '2020-07-13', 1),
(74, 9, 9, '2020-07-13', 1),
(75, 9, 10, '2020-07-13', 1),
(76, 9, 11, '2020-07-13', 1),
(77, 9, 12, '2020-07-13', 1),
(78, 9, 13, '2020-07-13', 1),
(79, 0, 0, '2020-07-22', 1),
(80, 0, 1, '2020-07-22', 1),
(81, 0, 3, '2020-07-22', 1),
(82, 0, 7, '2020-07-22', 1),
(83, 0, 9, '2020-07-22', 1),
(84, 0, 5, '2020-07-22', 1),
(85, 0, 13, '2020-07-22', 1),
(86, 1, 0, '2020-07-22', 1),
(87, 1, 1, '2020-07-22', 1),
(88, 1, 3, '2020-07-22', 1),
(89, 1, 5, '2020-07-22', 1),
(90, 1, 7, '2020-07-22', 1),
(91, 1, 9, '2020-07-22', 1),
(92, 1, 13, '2020-07-22', 1),
(93, 2, 0, '2020-07-22', 1),
(94, 2, 1, '2020-07-22', 1),
(95, 2, 3, '2020-07-22', 1),
(96, 2, 5, '2020-07-22', 1),
(97, 2, 7, '2020-07-22', 1),
(98, 2, 9, '2020-07-22', 1),
(99, 2, 11, '2020-07-22', 1),
(100, 2, 13, '2020-07-22', 1),
(101, 3, 0, '2020-07-22', 1),
(102, 3, 1, '2020-07-22', 1),
(103, 3, 3, '2020-07-22', 1),
(104, 3, 5, '2020-07-22', 1),
(105, 3, 7, '2020-07-22', 1),
(106, 3, 9, '2020-07-22', 1),
(107, 3, 13, '2020-07-22', 1),
(108, 4, 0, '2020-07-22', 1),
(109, 4, 1, '2020-07-22', 1),
(110, 4, 2, '2020-07-22', 1),
(111, 4, 4, '2020-07-22', 1),
(112, 4, 6, '2020-07-22', 1),
(113, 4, 8, '2020-07-22', 1),
(114, 4, 11, '2020-07-22', 1),
(115, 4, 12, '2020-07-31', 1),
(116, 5, 0, '2020-07-31', 1),
(117, 5, 1, '2020-07-31', 1),
(118, 5, 2, '2020-07-31', 1),
(119, 5, 4, '2020-07-31', 1),
(120, 5, 6, '2020-07-31', 1),
(121, 5, 8, '2020-07-31', 1),
(122, 5, 11, '2020-07-31', 1),
(123, 5, 12, '2020-07-31', 1),
(124, 6, 0, '2020-07-31', 1),
(125, 6, 1, '2020-07-31', 1),
(126, 6, 2, '2020-07-31', 1),
(127, 6, 4, '2020-07-31', 1),
(128, 6, 6, '2020-07-31', 1),
(129, 6, 8, '2020-07-31', 1),
(130, 6, 11, '2020-07-31', 1),
(131, 6, 12, '2020-07-31', 1),
(132, 7, 0, '2020-07-31', 1),
(133, 7, 1, '2020-07-31', 1),
(134, 7, 8, '2020-07-31', 1),
(135, 7, 10, '2020-07-31', 1),
(136, 7, 11, '2020-07-31', 1),
(137, 7, 12, '2020-07-31', 1),
(138, 8, 0, '2020-07-31', 1),
(139, 8, 1, '2020-07-31', 1),
(140, 8, 8, '2020-07-31', 1),
(141, 8, 10, '2020-07-31', 1),
(142, 8, 11, '2020-07-31', 1),
(143, 8, 12, '2020-07-31', 1),
(144, 9, 0, '2020-07-31', 1),
(145, 9, 1, '2020-07-31', 1),
(146, 9, 2, '2020-07-31', 1),
(147, 9, 3, '2020-07-31', 1),
(148, 9, 4, '2020-07-31', 1),
(149, 9, 5, '2020-07-31', 1),
(150, 9, 6, '2020-07-31', 1),
(151, 9, 7, '2020-07-31', 1),
(152, 9, 8, '2020-07-31', 1),
(153, 9, 9, '2020-07-31', 1),
(154, 9, 10, '2020-07-31', 1),
(155, 9, 11, '2020-07-31', 1),
(156, 9, 12, '2020-07-31', 1),
(157, 9, 13, '2020-07-31', 1),
(158, 0, 0, '2020-08-05', 1),
(159, 0, 1, '2020-08-05', 1),
(160, 0, 3, '2020-08-05', 1),
(161, 0, 7, '2020-08-05', 1),
(162, 0, 9, '2020-08-05', 1),
(163, 0, 5, '2020-08-05', 1),
(164, 0, 13, '2020-08-05', 1),
(165, 1, 0, '2020-08-05', 1),
(166, 1, 1, '2020-08-05', 1),
(167, 1, 3, '2020-08-05', 1),
(168, 1, 5, '2020-08-05', 1),
(169, 1, 7, '2020-08-05', 1),
(170, 1, 9, '2020-08-05', 1),
(171, 1, 13, '2020-08-05', 1),
(172, 2, 0, '2020-08-05', 1),
(173, 2, 1, '2020-08-05', 1),
(174, 2, 3, '2020-08-05', 1),
(175, 2, 5, '2020-08-05', 1),
(176, 2, 7, '2020-08-05', 1),
(177, 2, 9, '2020-08-05', 1),
(178, 2, 11, '2020-08-05', 1),
(179, 2, 13, '2020-08-05', 1),
(180, 3, 0, '2020-08-05', 1),
(181, 3, 1, '2020-08-05', 1),
(182, 3, 3, '2020-08-05', 1),
(183, 3, 5, '2020-08-05', 1),
(184, 3, 7, '2020-08-05', 1),
(185, 3, 9, '2020-08-05', 1),
(186, 3, 13, '2020-08-05', 1),
(187, 4, 0, '2020-08-05', 1),
(188, 4, 1, '2020-08-05', 1),
(189, 4, 2, '2020-08-05', 1),
(190, 4, 4, '2020-08-05', 1),
(191, 4, 6, '2020-08-05', 1),
(192, 4, 8, '2020-08-05', 1),
(193, 4, 11, '2020-08-05', 1),
(194, 4, 12, '2020-08-05', 1),
(195, 5, 0, '2020-08-21', 1),
(196, 5, 1, '2020-08-21', 1),
(197, 5, 2, '2020-08-21', 1),
(198, 5, 4, '2020-08-21', 1),
(199, 5, 6, '2020-08-21', 1),
(200, 5, 8, '2020-08-21', 1),
(201, 5, 11, '2020-08-21', 1),
(202, 5, 12, '2020-08-21', 1),
(203, 6, 0, '2020-08-21', 1),
(204, 6, 1, '2020-08-21', 1),
(205, 6, 2, '2020-08-21', 1),
(206, 6, 4, '2020-08-21', 1),
(207, 6, 6, '2020-08-21', 1),
(208, 6, 8, '2020-08-21', 1),
(209, 6, 11, '2020-08-21', 1),
(210, 6, 12, '2020-08-21', 1),
(211, 7, 0, '2020-08-21', 1),
(212, 7, 1, '2020-08-21', 1),
(213, 7, 8, '2020-08-21', 1),
(214, 7, 10, '2020-08-21', 1),
(215, 7, 11, '2020-08-21', 1),
(216, 7, 12, '2020-08-21', 1),
(217, 8, 0, '2020-08-21', 1),
(218, 8, 1, '2020-08-21', 1),
(219, 8, 8, '2020-08-21', 1),
(220, 8, 10, '2020-08-21', 1),
(221, 8, 11, '2020-08-21', 1),
(222, 8, 12, '2020-08-21', 1),
(223, 9, 0, '2020-08-21', 1),
(224, 9, 1, '2020-08-21', 1),
(225, 9, 2, '2020-08-21', 1),
(226, 9, 3, '2020-08-21', 1),
(227, 9, 4, '2020-08-21', 1),
(228, 9, 5, '2020-08-21', 1),
(229, 9, 6, '2020-08-21', 1),
(230, 9, 7, '2020-08-21', 1),
(231, 9, 8, '2020-08-21', 1),
(232, 9, 9, '2020-08-21', 1),
(233, 9, 10, '2020-08-21', 1),
(234, 9, 11, '2020-08-21', 1),
(235, 9, 12, '2020-08-21', 1),
(236, 9, 13, '2020-08-21', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ELREG_available_times`
--

CREATE TABLE `ELREG_available_times` (
  `id` int(11) NOT NULL,
  `date_id` int(11) NOT NULL,
  `available_time` time NOT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ELREG_available_times`
--

INSERT INTO `ELREG_available_times` (`id`, `date_id`, `available_time`, `available`) VALUES
(0, 0, '09:45:00', 1),
(1, 1, '09:45:00', 1),
(2, 2, '09:45:00', 1),
(3, 3, '09:45:00', 1),
(4, 4, '09:45:00', 1),
(5, 5, '09:45:00', 1),
(6, 6, '09:45:00', 1),
(7, 7, '09:45:00', 1),
(8, 8, '09:45:00', 1),
(9, 9, '09:45:00', 1),
(10, 10, '09:45:00', 1),
(11, 11, '09:45:00', 1),
(12, 12, '09:45:00', 1),
(13, 13, '09:45:00', 1),
(14, 14, '09:45:00', 1),
(15, 15, '09:45:00', 1),
(16, 16, '09:45:00', 1),
(17, 17, '09:45:00', 1),
(18, 18, '09:45:00', 1),
(19, 19, '09:45:00', 1),
(20, 20, '09:45:00', 1),
(21, 21, '09:45:00', 1),
(22, 22, '09:45:00', 1),
(23, 23, '09:45:00', 1),
(24, 24, '09:45:00', 1),
(25, 25, '09:45:00', 1),
(26, 26, '09:45:00', 1),
(27, 27, '09:45:00', 1),
(28, 28, '09:45:00', 1),
(29, 29, '09:45:00', 1),
(30, 30, '09:45:00', 1),
(31, 31, '09:45:00', 1),
(32, 32, '09:45:00', 1),
(33, 33, '09:45:00', 1),
(34, 34, '09:45:00', 1),
(35, 35, '09:45:00', 1),
(36, 36, '09:45:00', 1),
(37, 37, '09:45:00', 1),
(38, 38, '09:45:00', 1),
(39, 39, '09:45:00', 1),
(40, 40, '09:45:00', 1),
(41, 41, '09:45:00', 1),
(42, 42, '09:45:00', 1),
(43, 43, '09:45:00', 1),
(44, 44, '09:45:00', 1),
(45, 45, '09:45:00', 1),
(46, 46, '09:45:00', 1),
(47, 47, '09:45:00', 1),
(48, 48, '09:45:00', 1),
(49, 49, '09:45:00', 1),
(50, 50, '09:45:00', 1),
(51, 51, '09:45:00', 1),
(52, 52, '09:45:00', 1),
(53, 53, '09:45:00', 1),
(54, 54, '09:45:00', 1),
(55, 55, '09:45:00', 1),
(56, 56, '09:45:00', 1),
(57, 57, '09:45:00', 1),
(58, 58, '09:45:00', 1),
(59, 59, '09:45:00', 1),
(60, 60, '09:45:00', 1),
(61, 61, '09:45:00', 1),
(62, 62, '09:45:00', 1),
(63, 63, '09:45:00', 1),
(64, 64, '09:45:00', 1),
(65, 65, '09:45:00', 1),
(66, 66, '09:45:00', 1),
(67, 67, '09:45:00', 1),
(68, 68, '09:45:00', 1),
(69, 69, '09:45:00', 1),
(70, 70, '09:45:00', 1),
(71, 71, '09:45:00', 1),
(72, 72, '09:45:00', 1),
(73, 73, '09:45:00', 1),
(74, 74, '09:45:00', 1),
(75, 75, '09:45:00', 1),
(76, 76, '09:45:00', 1),
(77, 77, '09:45:00', 1),
(78, 78, '09:45:00', 1),
(79, 79, '09:45:00', 0),
(80, 80, '09:45:00', 1),
(81, 81, '09:45:00', 1),
(82, 82, '09:45:00', 1),
(83, 83, '09:45:00', 1),
(84, 84, '09:45:00', 1),
(85, 85, '09:45:00', 1),
(86, 86, '09:45:00', 1),
(87, 87, '09:45:00', 1),
(88, 88, '09:45:00', 1),
(89, 89, '09:45:00', 1),
(90, 90, '09:45:00', 1),
(91, 91, '09:45:00', 1),
(92, 92, '09:45:00', 1),
(93, 93, '09:45:00', 1),
(94, 94, '09:45:00', 1),
(95, 95, '09:45:00', 1),
(96, 96, '09:45:00', 1),
(97, 97, '09:45:00', 1),
(98, 98, '09:45:00', 1),
(99, 99, '09:45:00', 1),
(100, 100, '09:45:00', 1),
(101, 101, '09:45:00', 1),
(102, 102, '09:45:00', 1),
(103, 103, '09:45:00', 1),
(104, 104, '09:45:00', 1),
(105, 105, '09:45:00', 1),
(106, 106, '09:45:00', 1),
(107, 107, '09:45:00', 1),
(108, 108, '09:45:00', 1),
(109, 109, '09:45:00', 1),
(110, 110, '09:45:00', 1),
(111, 111, '09:45:00', 1),
(112, 112, '09:45:00', 1),
(113, 113, '09:45:00', 1),
(114, 114, '09:45:00', 1),
(115, 115, '09:45:00', 0),
(116, 116, '09:45:00', 1),
(117, 117, '09:45:00', 1),
(118, 118, '09:45:00', 1),
(119, 119, '09:45:00', 1),
(120, 120, '09:45:00', 1),
(121, 121, '09:45:00', 1),
(122, 122, '09:45:00', 1),
(123, 123, '09:45:00', 1),
(124, 124, '09:45:00', 1),
(125, 125, '09:45:00', 1),
(126, 126, '09:45:00', 1),
(127, 127, '09:45:00', 1),
(128, 128, '09:45:00', 1),
(129, 129, '09:45:00', 1),
(130, 130, '09:45:00', 1),
(131, 131, '09:45:00', 1),
(132, 132, '09:45:00', 1),
(133, 133, '09:45:00', 1),
(134, 134, '09:45:00', 1),
(135, 135, '09:45:00', 1),
(136, 136, '09:45:00', 1),
(137, 137, '09:45:00', 1),
(138, 138, '09:45:00', 1),
(139, 139, '09:45:00', 1),
(140, 140, '09:45:00', 1),
(141, 141, '09:45:00', 1),
(142, 142, '09:45:00', 1),
(143, 143, '09:45:00', 1),
(144, 144, '09:45:00', 1),
(145, 145, '09:45:00', 1),
(146, 146, '09:45:00', 1),
(147, 147, '09:45:00', 1),
(148, 148, '09:45:00', 1),
(149, 149, '09:45:00', 1),
(150, 150, '09:45:00', 1),
(151, 151, '09:45:00', 1),
(152, 152, '10:15:00', 1),
(153, 153, '10:15:00', 1),
(154, 154, '10:15:00', 1),
(155, 155, '10:15:00', 1),
(156, 156, '10:15:00', 1),
(157, 157, '10:15:00', 1),
(158, 158, '10:15:00', 1),
(159, 159, '10:15:00', 1),
(160, 160, '10:15:00', 1),
(161, 161, '10:15:00', 1),
(162, 162, '10:15:00', 1),
(163, 163, '10:15:00', 1),
(164, 164, '10:15:00', 1),
(165, 165, '10:15:00', 1),
(166, 166, '10:15:00', 1),
(167, 167, '10:15:00', 1),
(168, 168, '10:15:00', 1),
(169, 169, '10:15:00', 1),
(170, 170, '10:15:00', 1),
(171, 171, '10:15:00', 1),
(172, 172, '10:15:00', 1),
(173, 173, '10:15:00', 1),
(174, 174, '10:15:00', 1),
(175, 175, '10:15:00', 1),
(176, 176, '10:15:00', 1),
(177, 177, '10:15:00', 1),
(178, 178, '10:15:00', 1),
(179, 179, '10:15:00', 1),
(180, 180, '10:15:00', 1),
(181, 181, '10:15:00', 1),
(182, 182, '10:15:00', 1),
(183, 183, '10:15:00', 1),
(184, 184, '10:15:00', 1),
(185, 185, '10:15:00', 1),
(186, 186, '10:15:00', 1),
(187, 187, '10:15:00', 1),
(188, 188, '10:15:00', 1),
(189, 189, '10:15:00', 1),
(190, 190, '10:15:00', 1),
(191, 191, '10:15:00', 1),
(192, 192, '10:15:00', 1),
(193, 193, '10:15:00', 1),
(194, 194, '10:15:00', 1),
(195, 195, '10:15:00', 1),
(196, 196, '10:15:00', 1),
(197, 197, '10:15:00', 1),
(198, 198, '10:15:00', 1),
(199, 199, '10:15:00', 1),
(200, 200, '10:15:00', 1),
(201, 201, '10:15:00', 1),
(202, 202, '10:15:00', 1),
(203, 203, '10:15:00', 0),
(204, 204, '10:15:00', 1),
(205, 205, '10:15:00', 1),
(206, 206, '10:15:00', 1),
(207, 207, '10:15:00', 1),
(208, 208, '10:15:00', 1),
(209, 209, '10:15:00', 1),
(210, 210, '10:15:00', 1),
(211, 211, '10:15:00', 1),
(212, 212, '10:15:00', 1),
(213, 213, '10:15:00', 1),
(214, 214, '10:15:00', 1),
(215, 215, '10:15:00', 1),
(216, 216, '10:15:00', 1),
(217, 217, '10:15:00', 1),
(218, 218, '10:15:00', 1),
(219, 219, '10:15:00', 1),
(220, 220, '10:15:00', 1),
(221, 221, '10:15:00', 1),
(222, 222, '10:15:00', 1),
(223, 223, '10:15:00', 1),
(224, 224, '10:15:00', 1),
(225, 225, '10:15:00', 1),
(226, 226, '10:15:00', 1),
(227, 227, '10:15:00', 1),
(228, 228, '10:15:00', 1),
(229, 229, '10:15:00', 0),
(230, 230, '10:15:00', 1),
(231, 231, '10:15:00', 1),
(232, 232, '10:15:00', 1),
(233, 233, '10:15:00', 1),
(234, 234, '10:15:00', 1),
(235, 235, '10:15:00', 1),
(236, 236, '10:15:00', 1),
(237, 0, '10:15:00', 1),
(238, 1, '10:15:00', 1),
(239, 2, '10:15:00', 0),
(240, 3, '10:15:00', 1),
(241, 4, '10:15:00', 1),
(242, 5, '10:15:00', 1),
(243, 6, '10:15:00', 1),
(244, 7, '10:15:00', 1),
(245, 8, '10:15:00', 1),
(246, 9, '10:15:00', 1),
(247, 10, '10:15:00', 1),
(248, 11, '10:15:00', 1),
(249, 12, '10:15:00', 1),
(250, 13, '10:15:00', 1),
(251, 14, '10:15:00', 1),
(252, 15, '10:15:00', 1),
(253, 16, '10:15:00', 1),
(254, 17, '10:15:00', 1),
(255, 18, '10:15:00', 1),
(256, 19, '10:15:00', 1),
(257, 20, '10:15:00', 1),
(258, 21, '10:15:00', 1),
(259, 22, '10:15:00', 1),
(260, 23, '10:15:00', 1),
(261, 24, '10:15:00', 1),
(262, 25, '10:15:00', 1),
(263, 26, '10:15:00', 1),
(264, 27, '10:15:00', 1),
(265, 28, '10:15:00', 1),
(266, 29, '10:15:00', 1),
(267, 30, '10:15:00', 1),
(268, 31, '10:15:00', 1),
(269, 32, '10:15:00', 1),
(270, 33, '10:15:00', 1),
(271, 34, '10:15:00', 1),
(272, 35, '10:15:00', 1),
(273, 36, '10:15:00', 1),
(274, 37, '10:15:00', 1),
(275, 38, '10:15:00', 1),
(276, 39, '10:15:00', 1),
(277, 40, '10:15:00', 1),
(278, 41, '10:15:00', 1),
(279, 42, '10:15:00', 1),
(280, 43, '10:15:00', 1),
(281, 44, '10:15:00', 1),
(282, 45, '10:15:00', 1),
(283, 46, '10:15:00', 1),
(284, 47, '10:15:00', 0),
(285, 48, '10:15:00', 1),
(286, 49, '10:15:00', 1),
(287, 50, '10:15:00', 1),
(288, 51, '10:15:00', 1),
(289, 52, '10:15:00', 1),
(290, 53, '10:15:00', 1),
(291, 54, '10:15:00', 1),
(292, 55, '10:15:00', 1),
(293, 56, '10:15:00', 1),
(294, 57, '10:15:00', 1),
(295, 58, '10:15:00', 1),
(296, 59, '10:15:00', 1),
(297, 60, '10:15:00', 0),
(298, 61, '10:15:00', 1),
(299, 62, '10:15:00', 1),
(300, 63, '10:15:00', 1),
(301, 64, '10:15:00', 1),
(302, 65, '10:15:00', 1),
(303, 66, '10:15:00', 1),
(304, 67, '10:15:00', 1),
(305, 68, '10:15:00', 1),
(306, 69, '10:15:00', 1),
(307, 70, '10:15:00', 1),
(308, 71, '10:15:00', 1),
(309, 72, '10:15:00', 1),
(310, 73, '10:15:00', 1),
(311, 74, '10:15:00', 1),
(312, 75, '10:15:00', 1),
(313, 76, '10:15:00', 1),
(314, 77, '10:15:00', 1),
(315, 78, '10:15:00', 1),
(316, 79, '10:15:00', 1),
(317, 80, '10:15:00', 1),
(318, 81, '10:15:00', 1),
(319, 82, '10:15:00', 1),
(320, 83, '10:15:00', 1),
(321, 84, '10:15:00', 1),
(322, 85, '10:15:00', 1),
(323, 86, '10:15:00', 1),
(324, 87, '10:15:00', 1),
(325, 88, '10:15:00', 1),
(326, 89, '10:15:00', 1),
(327, 90, '10:15:00', 1),
(328, 91, '10:15:00', 1),
(329, 92, '10:15:00', 1),
(330, 93, '10:15:00', 1),
(331, 94, '10:15:00', 1),
(332, 95, '10:15:00', 1),
(333, 96, '10:15:00', 1),
(334, 97, '10:15:00', 1),
(335, 98, '10:15:00', 1),
(336, 99, '10:15:00', 1),
(337, 100, '10:15:00', 1),
(338, 101, '10:15:00', 1),
(339, 102, '10:15:00', 1),
(340, 103, '10:15:00', 1),
(341, 104, '10:45:00', 1),
(342, 105, '10:45:00', 1),
(343, 106, '10:45:00', 1),
(344, 107, '10:45:00', 1),
(345, 108, '10:45:00', 1),
(346, 109, '10:45:00', 1),
(347, 110, '10:45:00', 1),
(348, 111, '10:45:00', 1),
(349, 112, '10:45:00', 1),
(350, 113, '10:45:00', 0),
(351, 114, '10:45:00', 1),
(352, 115, '10:45:00', 1),
(353, 116, '10:45:00', 1),
(354, 117, '10:45:00', 1),
(355, 118, '10:45:00', 1),
(356, 119, '10:45:00', 1),
(357, 120, '10:45:00', 1),
(358, 121, '10:45:00', 1),
(359, 122, '10:45:00', 1),
(360, 123, '10:45:00', 1),
(361, 124, '10:45:00', 1),
(362, 125, '10:45:00', 1),
(363, 126, '10:45:00', 1),
(364, 127, '10:45:00', 1),
(365, 128, '10:45:00', 1),
(366, 129, '10:45:00', 1),
(367, 130, '10:45:00', 1),
(368, 131, '10:45:00', 1),
(369, 132, '10:45:00', 1),
(370, 133, '10:45:00', 1),
(371, 134, '10:45:00', 1),
(372, 135, '10:45:00', 1),
(373, 136, '10:45:00', 1),
(374, 137, '10:45:00', 1),
(375, 138, '10:45:00', 1),
(376, 139, '10:45:00', 1),
(377, 140, '10:45:00', 1),
(378, 141, '10:45:00', 1),
(379, 142, '10:45:00', 1),
(380, 143, '10:45:00', 1),
(381, 144, '10:45:00', 1),
(382, 145, '10:45:00', 1),
(383, 146, '10:45:00', 1),
(384, 147, '10:45:00', 1),
(385, 148, '10:45:00', 1),
(386, 149, '10:45:00', 1),
(387, 150, '10:45:00', 1),
(388, 151, '10:45:00', 1),
(389, 152, '10:45:00', 1),
(390, 153, '10:45:00', 1),
(391, 154, '10:45:00', 1),
(392, 155, '10:45:00', 1),
(393, 156, '10:45:00', 1),
(394, 157, '10:45:00', 1),
(395, 158, '10:45:00', 1),
(396, 159, '10:45:00', 1),
(397, 160, '10:45:00', 1),
(398, 161, '10:45:00', 1),
(399, 162, '10:45:00', 1),
(400, 163, '10:45:00', 1),
(401, 164, '10:45:00', 1),
(402, 165, '10:45:00', 1),
(403, 166, '10:45:00', 1),
(404, 167, '10:45:00', 1),
(405, 168, '10:45:00', 1),
(406, 169, '10:45:00', 1),
(407, 170, '10:45:00', 1),
(408, 171, '10:45:00', 1),
(409, 172, '10:45:00', 1),
(410, 173, '10:45:00', 1),
(411, 174, '10:45:00', 1),
(412, 175, '10:45:00', 1),
(413, 176, '10:45:00', 1),
(414, 177, '10:45:00', 1),
(415, 178, '10:45:00', 1),
(416, 179, '10:45:00', 1),
(417, 180, '10:45:00', 1),
(418, 181, '10:45:00', 1),
(419, 182, '10:45:00', 1),
(420, 183, '10:45:00', 1),
(421, 184, '10:45:00', 1),
(422, 185, '10:45:00', 1),
(423, 186, '10:45:00', 1),
(424, 187, '10:45:00', 1),
(425, 188, '10:45:00', 1),
(426, 189, '10:45:00', 1),
(427, 190, '10:45:00', 1),
(428, 191, '10:45:00', 1),
(429, 192, '10:45:00', 1),
(430, 193, '10:45:00', 1),
(431, 194, '10:45:00', 1),
(432, 195, '10:45:00', 1),
(433, 196, '10:45:00', 1),
(434, 197, '10:45:00', 1),
(435, 198, '10:45:00', 1),
(436, 199, '10:45:00', 1),
(437, 200, '10:45:00', 1),
(438, 201, '10:45:00', 1),
(439, 202, '10:45:00', 1),
(440, 203, '10:45:00', 1),
(441, 204, '10:45:00', 1),
(442, 205, '10:45:00', 0),
(443, 206, '10:45:00', 1),
(444, 207, '10:45:00', 1),
(445, 208, '10:45:00', 1),
(446, 209, '10:45:00', 1),
(447, 210, '10:45:00', 1),
(448, 211, '10:45:00', 1),
(449, 212, '10:45:00', 1),
(450, 213, '10:45:00', 1),
(451, 214, '10:45:00', 1),
(452, 215, '10:45:00', 1),
(453, 216, '10:45:00', 1),
(454, 217, '10:45:00', 1),
(455, 218, '10:45:00', 1),
(456, 219, '10:45:00', 1),
(457, 220, '10:45:00', 1),
(458, 221, '10:45:00', 1),
(459, 222, '10:45:00', 1),
(460, 223, '10:45:00', 1),
(461, 224, '10:45:00', 1),
(462, 225, '10:45:00', 1),
(463, 226, '10:45:00', 1),
(464, 227, '10:45:00', 1),
(465, 228, '10:45:00', 1),
(466, 229, '10:45:00', 1),
(467, 230, '10:45:00', 1),
(468, 231, '10:45:00', 1),
(469, 232, '10:45:00', 1),
(470, 233, '10:45:00', 1),
(471, 234, '10:45:00', 1),
(472, 235, '10:45:00', 1),
(473, 236, '10:45:00', 1),
(474, 0, '11:15:00', 1),
(475, 1, '11:15:00', 1),
(476, 2, '11:15:00', 1),
(477, 3, '11:15:00', 1),
(478, 4, '11:15:00', 1),
(479, 5, '11:15:00', 1),
(480, 6, '11:15:00', 1),
(481, 7, '11:15:00', 1),
(482, 8, '11:15:00', 1),
(483, 9, '11:15:00', 1),
(484, 10, '11:15:00', 1),
(485, 11, '11:15:00', 1),
(486, 12, '11:15:00', 1),
(487, 13, '11:15:00', 1),
(488, 14, '11:15:00', 1),
(489, 15, '11:15:00', 1),
(490, 16, '11:15:00', 1),
(491, 17, '11:15:00', 1),
(492, 18, '11:15:00', 1),
(493, 19, '11:15:00', 1),
(494, 20, '11:15:00', 1),
(495, 21, '11:15:00', 1),
(496, 22, '11:15:00', 1),
(497, 23, '11:15:00', 1),
(498, 24, '11:15:00', 1),
(499, 25, '11:15:00', 1),
(500, 26, '11:15:00', 1),
(501, 27, '11:15:00', 1),
(502, 28, '11:15:00', 1),
(503, 29, '11:15:00', 1),
(504, 30, '11:15:00', 1),
(505, 31, '11:15:00', 1),
(506, 32, '11:15:00', 1),
(507, 33, '11:15:00', 1),
(508, 34, '11:15:00', 1),
(509, 35, '11:15:00', 0),
(510, 36, '11:15:00', 1),
(511, 37, '11:15:00', 1),
(512, 38, '11:15:00', 1),
(513, 39, '11:15:00', 1),
(514, 40, '11:15:00', 1),
(515, 41, '11:15:00', 1),
(516, 42, '11:15:00', 1),
(517, 43, '11:15:00', 1),
(518, 44, '11:15:00', 1),
(519, 45, '11:15:00', 1),
(520, 46, '11:15:00', 1),
(521, 47, '11:15:00', 1),
(522, 48, '11:15:00', 1),
(523, 49, '11:15:00', 1),
(524, 50, '11:15:00', 1),
(525, 51, '11:15:00', 1),
(526, 52, '11:15:00', 1),
(527, 53, '11:15:00', 1),
(528, 54, '11:15:00', 1),
(529, 55, '11:15:00', 1),
(530, 56, '11:15:00', 1),
(531, 57, '11:15:00', 1),
(532, 58, '11:15:00', 1),
(533, 59, '11:15:00', 1),
(534, 60, '11:15:00', 1),
(535, 61, '11:15:00', 1),
(536, 62, '11:15:00', 1),
(537, 63, '11:15:00', 1),
(538, 64, '11:15:00', 1),
(539, 65, '11:15:00', 1),
(540, 66, '11:15:00', 1),
(541, 67, '11:15:00', 1),
(542, 68, '11:15:00', 1),
(543, 69, '11:15:00', 1),
(544, 70, '11:15:00', 1),
(545, 71, '11:15:00', 1),
(546, 72, '11:15:00', 1),
(547, 73, '11:15:00', 1),
(548, 74, '11:15:00', 1),
(549, 75, '11:15:00', 1),
(550, 76, '11:15:00', 1),
(551, 77, '11:15:00', 1),
(552, 78, '11:15:00', 1),
(553, 79, '11:15:00', 1),
(554, 80, '11:15:00', 1),
(555, 81, '11:15:00', 1),
(556, 82, '11:15:00', 1),
(557, 83, '11:15:00', 1),
(558, 84, '11:15:00', 1),
(559, 85, '11:15:00', 1),
(560, 86, '11:15:00', 1),
(561, 87, '11:15:00', 1),
(562, 88, '11:15:00', 1),
(563, 89, '11:15:00', 1),
(564, 90, '11:15:00', 1),
(565, 91, '11:15:00', 1),
(566, 92, '11:15:00', 1),
(567, 93, '11:15:00', 1),
(568, 94, '11:15:00', 1),
(569, 95, '11:15:00', 1),
(570, 96, '11:15:00', 1),
(571, 97, '11:15:00', 1),
(572, 98, '11:15:00', 1),
(573, 99, '11:15:00', 1),
(574, 100, '11:15:00', 1),
(575, 101, '11:15:00', 1),
(576, 102, '11:15:00', 1),
(577, 103, '11:15:00', 1),
(578, 104, '11:15:00', 1),
(579, 105, '11:15:00', 1),
(580, 106, '11:15:00', 1),
(581, 107, '11:15:00', 1),
(582, 108, '11:15:00', 1),
(583, 109, '11:15:00', 1),
(584, 110, '11:15:00', 1),
(585, 111, '11:15:00', 1),
(586, 112, '11:15:00', 1),
(587, 113, '11:15:00', 1),
(588, 114, '11:15:00', 1),
(589, 115, '11:15:00', 1),
(590, 116, '11:15:00', 1),
(591, 117, '11:15:00', 1),
(592, 118, '11:15:00', 1),
(593, 119, '11:15:00', 1),
(594, 120, '11:15:00', 1),
(595, 121, '11:15:00', 1),
(596, 122, '11:15:00', 1),
(597, 123, '11:15:00', 1),
(598, 124, '11:15:00', 1),
(599, 125, '11:15:00', 1),
(600, 126, '11:15:00', 1),
(601, 127, '11:15:00', 1),
(602, 128, '11:15:00', 1),
(603, 129, '11:15:00', 1),
(604, 130, '11:15:00', 1),
(605, 131, '11:15:00', 1),
(606, 132, '11:15:00', 1),
(607, 133, '11:15:00', 1),
(608, 134, '11:15:00', 1),
(609, 135, '11:15:00', 1),
(610, 136, '11:15:00', 1),
(611, 137, '11:15:00', 1),
(612, 138, '11:15:00', 1),
(613, 139, '11:15:00', 1),
(614, 140, '11:15:00', 1),
(615, 141, '11:15:00', 1),
(616, 142, '11:15:00', 1),
(617, 143, '11:15:00', 1),
(618, 144, '11:15:00', 1),
(619, 145, '11:15:00', 1),
(620, 146, '11:15:00', 1),
(621, 147, '11:15:00', 1),
(622, 148, '11:15:00', 1),
(623, 149, '11:15:00', 1),
(624, 150, '11:15:00', 1),
(625, 151, '11:15:00', 1),
(626, 152, '11:15:00', 1),
(627, 153, '11:15:00', 1),
(628, 154, '11:15:00', 1),
(629, 155, '11:15:00', 1),
(630, 156, '11:15:00', 1),
(631, 157, '11:15:00', 1),
(632, 158, '11:15:00', 1),
(633, 159, '11:15:00', 1),
(634, 160, '11:15:00', 1),
(635, 161, '11:15:00', 1),
(636, 162, '11:15:00', 1),
(637, 163, '11:15:00', 1),
(638, 164, '11:15:00', 1),
(639, 165, '11:15:00', 1),
(640, 166, '11:15:00', 1),
(641, 167, '11:15:00', 1),
(642, 168, '11:15:00', 1),
(643, 169, '11:15:00', 1),
(644, 170, '11:15:00', 1),
(645, 171, '11:15:00', 1),
(646, 172, '11:45:00', 1),
(647, 173, '11:45:00', 1),
(648, 174, '11:45:00', 1),
(649, 175, '11:45:00', 1),
(650, 176, '11:45:00', 1),
(651, 177, '11:45:00', 1),
(652, 178, '11:45:00', 1),
(653, 179, '11:45:00', 1),
(654, 180, '11:45:00', 1),
(655, 181, '11:45:00', 1),
(656, 182, '11:45:00', 1),
(657, 183, '11:45:00', 1),
(658, 184, '11:45:00', 1),
(659, 185, '11:45:00', 1),
(660, 186, '11:45:00', 1),
(661, 187, '11:45:00', 1),
(662, 188, '11:45:00', 1),
(663, 189, '11:45:00', 1),
(664, 190, '11:45:00', 1),
(665, 191, '11:45:00', 1),
(666, 192, '11:45:00', 1),
(667, 193, '11:45:00', 1),
(668, 194, '11:45:00', 1),
(669, 195, '11:45:00', 1),
(670, 196, '11:45:00', 1),
(671, 197, '11:45:00', 1),
(672, 198, '11:45:00', 1),
(673, 199, '11:45:00', 1),
(674, 200, '11:45:00', 1),
(675, 201, '11:45:00', 1),
(676, 202, '11:45:00', 1),
(677, 203, '11:45:00', 1),
(678, 204, '11:45:00', 1),
(679, 205, '11:45:00', 1),
(680, 206, '11:45:00', 1),
(681, 207, '11:45:00', 1),
(682, 208, '11:45:00', 1),
(683, 209, '11:45:00', 1),
(684, 210, '11:45:00', 1),
(685, 211, '11:45:00', 1),
(686, 212, '11:45:00', 1),
(687, 213, '11:45:00', 1),
(688, 214, '11:45:00', 1),
(689, 215, '11:45:00', 1),
(690, 216, '11:45:00', 1),
(691, 217, '11:45:00', 1),
(692, 218, '11:45:00', 1),
(693, 219, '11:45:00', 1),
(694, 220, '11:45:00', 1),
(695, 221, '11:45:00', 1),
(696, 222, '11:45:00', 1),
(697, 223, '11:45:00', 1),
(698, 224, '11:45:00', 1),
(699, 225, '11:45:00', 1),
(700, 226, '11:45:00', 1),
(701, 227, '11:45:00', 1),
(702, 228, '11:45:00', 1),
(703, 229, '11:45:00', 1),
(704, 230, '11:45:00', 1),
(705, 231, '11:45:00', 1),
(706, 232, '11:45:00', 1),
(707, 233, '11:45:00', 1),
(708, 234, '11:45:00', 1),
(709, 235, '11:45:00', 1),
(710, 236, '11:45:00', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ELREG_clinics`
--

CREATE TABLE `ELREG_clinics` (
  `id` int(11) NOT NULL,
  `clinic_name` text NOT NULL,
  `clinic_phone` text NOT NULL,
  `clinic_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ELREG_clinics`
--

INSERT INTO `ELREG_clinics` (`id`, `clinic_name`, `clinic_phone`, `clinic_address`) VALUES
(0, 'ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ РЯЗАНСКОЙ ОБЛАСТИ \"ГОРОДСКАЯ ДЕТСКАЯ ПОЛИКЛИНИКА № 2\"', '+7 (4912) 44-55-96', 'Россия, 390023, обл Рязанская, г Рязань, ул Циолковского, д.10'),
(1, 'ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ РЯЗАНСКОЙ ОБЛАСТИ \"ГОРОДСКАЯ ДЕТСКАЯ ПОЛИКЛИНИКА № 3\"', '+7 (4912) 36-73-30', 'Россия, 390039, обл Рязанская, г Рязань, ул Интернациональная, д.1в'),
(2, 'ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ РЯЗАНСКОЙ ОБЛАСТИ \"ГОРОДСКАЯ ДЕТСКАЯ ПОЛИКЛИНИКА № 6\"', '+7 (4912) 37-73-74', 'Россия, 390044, обл Рязанская, г Рязань, ул Костычева, д.6'),
(3, 'ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ РЯЗАНСКОЙ ОБЛАСТИ \"ГОРОДСКАЯ ДЕТСКАЯ ПОЛИКЛИНИКА №1 \"', '+7 (4912) 76-27-88', 'Россия, 390005, обл Рязанская, г Рязань, ул Дзержинского, д.16а'),
(4, 'ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ РЯЗАНСКОЙ ОБЛАСТИ \"ГОРОДСКАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА № 10\"', '+7 (4912) 35-07-79', 'Россия, 390044, обл Рязанская, г Рязань, ул Крупской, д.26а'),
(5, 'ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ РЯЗАНСКОЙ ОБЛАСТИ \"ГОРОДСКАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА № 4\"', '+7 (4912) 44-03-50', 'Россия, 390023, обл Рязанская, г Рязань, ул Есенина, д.17'),
(6, 'ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ РЯЗАНСКОЙ ОБЛАСТИ \"ГОРОДСКАЯ ПОЛИКЛИНИКА № 2\"', '+7 (4912) 76-42-60', 'Россия, 390029, обл Рязанская, г Рязань, ул Профессора Никулина, д.3'),
(7, 'ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ РЯЗАНСКОЙ ОБЛАСТИ \"ГОРОДСКОЙ КЛИНИЧЕСКИЙ РОДИЛЬНЫЙ ДОМ № 2\"', '+7 (4912) 92-95-86', 'Россия, 390026, обл Рязанская, г Рязань, ул Стройкова, д.79/51'),
(8, 'ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ РЯЗАНСКОЙ ОБЛАСТИ \"ЖЕНСКАЯ КОНСУЛЬТАЦИЯ № 1\"', '+7 (4912) 25-63-89', 'Россия, 390000, обл Рязанская, г Рязань, ул Ленина, д.36'),
(9, 'ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ РЯЗАНСКОЙ ОБЛАСТИ \"КАСИМОВСКИЙ МЕЖРАЙОННЫЙ МЕДИЦИНСКИЙ ЦЕНТР\"', '+7 (4913) 15-05-11', 'Россия, 391301, обл Рязанская, г Касимов, ул Загородная, д.13');

-- --------------------------------------------------------

--
-- Структура таблицы `ELREG_clinics_specializations`
--

CREATE TABLE `ELREG_clinics_specializations` (
  `clinic_id` int(11) NOT NULL,
  `specialization_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ELREG_clinics_specializations`
--

INSERT INTO `ELREG_clinics_specializations` (`clinic_id`, `specialization_id`) VALUES
(0, 0),
(0, 1),
(0, 3),
(0, 7),
(0, 9),
(0, 5),
(0, 13),
(1, 0),
(1, 1),
(1, 3),
(1, 5),
(1, 7),
(1, 9),
(1, 13),
(2, 0),
(2, 1),
(2, 3),
(2, 5),
(2, 7),
(2, 9),
(2, 11),
(2, 13),
(3, 0),
(3, 1),
(3, 3),
(3, 5),
(3, 7),
(3, 9),
(3, 13),
(4, 0),
(4, 1),
(4, 2),
(4, 4),
(4, 6),
(4, 8),
(4, 11),
(4, 12),
(5, 0),
(5, 1),
(5, 2),
(5, 4),
(5, 6),
(5, 8),
(5, 11),
(5, 12),
(6, 0),
(6, 1),
(6, 2),
(6, 4),
(6, 6),
(6, 8),
(6, 11),
(6, 12),
(7, 0),
(7, 1),
(7, 8),
(7, 10),
(7, 11),
(7, 12),
(8, 0),
(8, 1),
(8, 8),
(8, 10),
(8, 11),
(8, 12),
(9, 0),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(9, 8),
(9, 9),
(9, 10),
(9, 11),
(9, 12),
(9, 13);

-- --------------------------------------------------------

--
-- Структура таблицы `ELREG_specializations`
--

CREATE TABLE `ELREG_specializations` (
  `id` int(11) NOT NULL,
  `specialization_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ELREG_specializations`
--

INSERT INTO `ELREG_specializations` (`id`, `specialization_name`) VALUES
(0, 'Регистрация электрокардиограммы'),
(1, 'Исследование уровня глюкозы в крови'),
(2, 'Прием гастроэнтеролога'),
(3, 'Прием гастроэнтеролога (детский прием)'),
(4, 'Прием невролога'),
(5, 'Прием невролога (детский прием)'),
(6, 'Прием офтальмолога'),
(7, 'Прием офтальмолога (детский прием)'),
(8, 'Прием эндокринолога'),
(9, 'Прием эндокринолога (детский прием)'),
(10, 'Прием гинеколога'),
(11, 'Анализ крови биохимический общетерапевтический'),
(12, 'Прием кардиолога'),
(13, 'Прием кардиолога (детский прием)');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ELREG_appointments`
--
ALTER TABLE `ELREG_appointments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ELREG_appointments_id_uindex` (`id`),
  ADD KEY `ELREG_appointments_ELREG_availavle_dates_id_fk` (`date_id`),
  ADD KEY `ELREG_appointments_ELREG_clinics_id_fk` (`clinic_id`),
  ADD KEY `ELREG_appointments_ELREG_specializations_id_fk` (`specialization_id`),
  ADD KEY `ELREG_appointments_ELREG_available_times_id_fk` (`time_id`);

--
-- Индексы таблицы `ELREG_available_dates`
--
ALTER TABLE `ELREG_available_dates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ELREG_available_dates_id_uindex` (`id`),
  ADD KEY `ELREG_available_dates_ELREG_clinics_id_fk` (`clinic_id`),
  ADD KEY `ELREG_available_dates_ELREG_specializations_id_fk` (`specialization_id`);

--
-- Индексы таблицы `ELREG_available_times`
--
ALTER TABLE `ELREG_available_times`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ELREG_available_times_id_uindex` (`id`),
  ADD KEY `ELREG_available_times_ELREG_availavle_dates_id_fk` (`date_id`);

--
-- Индексы таблицы `ELREG_clinics`
--
ALTER TABLE `ELREG_clinics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ELREG_clinics_id_uindex` (`id`);

--
-- Индексы таблицы `ELREG_clinics_specializations`
--
ALTER TABLE `ELREG_clinics_specializations`
  ADD KEY `ELREG_clinics_specializations_ELREG_clinics_id_fk` (`clinic_id`),
  ADD KEY `ELREG_clinics_specializations_ELREG_specializations_id_fk` (`specialization_id`);

--
-- Индексы таблицы `ELREG_specializations`
--
ALTER TABLE `ELREG_specializations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ELREG_specializations_id_uindex` (`id`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ELREG_appointments`
--
ALTER TABLE `ELREG_appointments`
  ADD CONSTRAINT `ELREG_appointments_ELREG_available_times_id_fk` FOREIGN KEY (`time_id`) REFERENCES `ELREG_available_times` (`id`),
  ADD CONSTRAINT `ELREG_appointments_ELREG_availavle_dates_id_fk` FOREIGN KEY (`date_id`) REFERENCES `ELREG_available_dates` (`id`),
  ADD CONSTRAINT `ELREG_appointments_ELREG_clinics_id_fk` FOREIGN KEY (`clinic_id`) REFERENCES `ELREG_clinics` (`id`),
  ADD CONSTRAINT `ELREG_appointments_ELREG_specializations_id_fk` FOREIGN KEY (`specialization_id`) REFERENCES `ELREG_specializations` (`id`);

--
-- Ограничения внешнего ключа таблицы `ELREG_available_dates`
--
ALTER TABLE `ELREG_available_dates`
  ADD CONSTRAINT `ELREG_available_dates_ELREG_clinics_id_fk` FOREIGN KEY (`clinic_id`) REFERENCES `ELREG_clinics` (`id`),
  ADD CONSTRAINT `ELREG_available_dates_ELREG_specializations_id_fk` FOREIGN KEY (`specialization_id`) REFERENCES `ELREG_specializations` (`id`);

--
-- Ограничения внешнего ключа таблицы `ELREG_available_times`
--
ALTER TABLE `ELREG_available_times`
  ADD CONSTRAINT `ELREG_available_times_ELREG_availavle_dates_id_fk` FOREIGN KEY (`date_id`) REFERENCES `ELREG_available_dates` (`id`);

--
-- Ограничения внешнего ключа таблицы `ELREG_clinics_specializations`
--
ALTER TABLE `ELREG_clinics_specializations`
  ADD CONSTRAINT `ELREG_clinics_specializations_ELREG_clinics_id_fk` FOREIGN KEY (`clinic_id`) REFERENCES `ELREG_clinics` (`id`),
  ADD CONSTRAINT `ELREG_clinics_specializations_ELREG_specializations_id_fk` FOREIGN KEY (`specialization_id`) REFERENCES `ELREG_specializations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;