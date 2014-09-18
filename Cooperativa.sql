-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-09-2014 a las 04:28:34
-- Versión del servidor: 5.5.32
-- Versión de PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `cooperativa`
--
CREATE DATABASE IF NOT EXISTS `cooperativa` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cooperativa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `circulos`
--

CREATE TABLE IF NOT EXISTS `circulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `cantidad_socios` int(11) NOT NULL,
  `importe` float NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `circulos`
--

INSERT INTO `circulos` (`id`, `nombre`, `cantidad_socios`, `importe`, `fecha_inicio`, `fecha_fin`, `created_at`, `updated_at`, `id_usuario`) VALUES
(1, 'Círculo', 10, 10000, '2014-08-04', '2014-08-20', '2014-08-17 19:42:28', '2014-08-17 19:42:28', 1),
(2, 'nombre', 10, 111, '2014-08-04', '2014-09-09', '2014-09-07 16:31:34', '2014-09-07 16:31:34', 1),
(3, 'AAA', 11, 10000, '2014-09-07', '2014-09-09', '2014-09-07 16:34:00', '2014-09-07 16:34:00', 1),
(4, 'AAA', 11, 10000, '2014-09-07', '2014-09-09', '2014-09-07 16:34:07', '2014-09-07 16:34:07', 1),
(5, 'AAA', 11, 10000, '2014-09-07', '2014-09-09', '2014-09-07 16:36:16', '2014-09-07 16:36:16', 1),
(6, 'AAA', 11, 10000, '2014-09-07', '2014-09-09', '2014-09-07 16:36:19', '2014-09-07 16:36:19', 1),
(7, 'aaaa', 3, 111111, '2014-09-13', '2014-09-13', '2014-09-13 14:43:32', '2014-09-13 14:43:32', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `circulos_socios`
--

CREATE TABLE IF NOT EXISTS `circulos_socios` (
  `id_circulo` int(11) NOT NULL,
  `id_socio` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `circulos_socios`
--

INSERT INTO `circulos_socios` (`id_circulo`, `id_socio`, `created_at`, `updated_at`) VALUES
(7, 1, '2014-09-13 14:43:32', '2014-09-13 11:43:32'),
(7, 2, '2014-09-13 14:43:32', '2014-09-13 11:43:32'),
(7, 3, '2014-09-13 14:43:33', '2014-09-13 11:43:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comercios`
--

CREATE TABLE IF NOT EXISTS `comercios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `persona_contacto` varchar(255) NOT NULL,
  `observaciones` text NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `comercios`
--

INSERT INTO `comercios` (`id`, `nombre`, `direccion`, `telefono`, `persona_contacto`, `observaciones`, `id_usuario`, `updated_at`, `created_at`) VALUES
(1, 'Jumbo', 'Vidal 2831', '48473060', 'Ricardo Perez', '', 1, '2014-08-09 10:08:07', '2014-08-05 00:16:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuotas_prestamo`
--

CREATE TABLE IF NOT EXISTS `cuotas_prestamo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_prestamo` int(11) NOT NULL,
  `importe` float NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=228 ;

--
-- Volcado de datos para la tabla `cuotas_prestamo`
--

INSERT INTO `cuotas_prestamo` (`id`, `id_prestamo`, `importe`, `fecha_vencimiento`, `updated_at`, `created_at`, `id_usuario`) VALUES
(1, 0, 0, '0000-00-00', '2014-08-17 22:39:09', '2014-08-17 22:39:09', 1),
(2, 0, 0, '0000-00-00', '2014-08-17 22:39:56', '2014-08-17 22:39:56', 1),
(3, 0, 0, '0000-00-00', '2014-08-17 22:44:35', '2014-08-17 22:44:35', 1),
(4, 0, 0, '0000-00-00', '2014-08-17 22:44:48', '2014-08-17 22:44:48', 1),
(5, 0, 0, '0000-00-00', '2014-08-17 22:49:53', '2014-08-17 22:49:53', 1),
(6, 0, 0, '0000-00-00', '2014-08-17 22:50:08', '2014-08-17 22:50:08', 1),
(7, 0, 0, '0000-00-00', '2014-08-17 22:51:26', '2014-08-17 22:51:26', 1),
(8, 0, 0, '0000-00-00', '2014-08-17 22:51:45', '2014-08-17 22:51:45', 1),
(9, 0, 0, '0000-00-00', '2014-08-17 22:52:10', '2014-08-17 22:52:10', 1),
(10, 0, 0, '0000-00-00', '2014-08-17 22:53:35', '2014-08-17 22:53:35', 1),
(11, 3, 24.42, '0000-00-00', '2014-08-17 23:09:07', '2014-08-17 23:09:07', 1),
(12, 3, 24.42, '0000-00-00', '2014-08-17 23:09:07', '2014-08-17 23:09:07', 1),
(13, 3, 24.42, '0000-00-00', '2014-08-17 23:09:07', '2014-08-17 23:09:07', 1),
(14, 3, 24.42, '0000-00-00', '2014-08-17 23:09:07', '2014-08-17 23:09:07', 1),
(15, 3, 24.42, '0000-00-00', '2014-08-17 23:09:07', '2014-08-17 23:09:07', 1),
(16, 4, 24.42, '0000-00-00', '2014-08-17 23:10:33', '2014-08-17 23:10:33', 1),
(17, 4, 24.42, '0000-00-00', '2014-08-17 23:10:33', '2014-08-17 23:10:33', 1),
(18, 4, 24.42, '0000-00-00', '2014-08-17 23:10:33', '2014-08-17 23:10:33', 1),
(19, 4, 24.42, '0000-00-00', '2014-08-17 23:10:33', '2014-08-17 23:10:33', 1),
(20, 4, 24.42, '0000-00-00', '2014-08-17 23:10:33', '2014-08-17 23:10:33', 1),
(21, 5, 24.42, '0000-00-00', '2014-08-17 23:10:35', '2014-08-17 23:10:35', 1),
(22, 5, 24.42, '0000-00-00', '2014-08-17 23:10:35', '2014-08-17 23:10:35', 1),
(23, 5, 24.42, '0000-00-00', '2014-08-17 23:10:35', '2014-08-17 23:10:35', 1),
(24, 5, 24.42, '0000-00-00', '2014-08-17 23:10:35', '2014-08-17 23:10:35', 1),
(25, 5, 24.42, '0000-00-00', '2014-08-17 23:10:35', '2014-08-17 23:10:35', 1),
(26, 6, 24.42, '0000-00-00', '2014-08-17 23:10:59', '2014-08-17 23:10:59', 1),
(27, 6, 24.42, '0000-00-00', '2014-08-17 23:10:59', '2014-08-17 23:10:59', 1),
(28, 6, 24.42, '0000-00-00', '2014-08-17 23:10:59', '2014-08-17 23:10:59', 1),
(29, 6, 24.42, '0000-00-00', '2014-08-17 23:10:59', '2014-08-17 23:10:59', 1),
(30, 6, 24.42, '0000-00-00', '2014-08-17 23:10:59', '2014-08-17 23:10:59', 1),
(31, 7, 24.42, '0000-00-00', '2014-08-17 23:11:35', '2014-08-17 23:11:35', 1),
(32, 7, 24.42, '0000-00-00', '2014-08-17 23:11:35', '2014-08-17 23:11:35', 1),
(33, 7, 24.42, '0000-00-00', '2014-08-17 23:11:35', '2014-08-17 23:11:35', 1),
(34, 7, 24.42, '0000-00-00', '2014-08-17 23:11:35', '2014-08-17 23:11:35', 1),
(35, 7, 24.42, '0000-00-00', '2014-08-17 23:11:36', '2014-08-17 23:11:36', 1),
(36, 10, 24.42, '0000-00-00', '2014-08-17 23:13:03', '2014-08-17 23:13:03', 1),
(37, 10, 24.42, '0000-00-00', '2014-08-17 23:13:04', '2014-08-17 23:13:04', 1),
(38, 10, 24.42, '0000-00-00', '2014-08-17 23:13:04', '2014-08-17 23:13:04', 1),
(39, 10, 24.42, '0000-00-00', '2014-08-17 23:13:04', '2014-08-17 23:13:04', 1),
(40, 10, 24.42, '0000-00-00', '2014-08-17 23:13:04', '2014-08-17 23:13:04', 1),
(41, 11, 24.42, '0000-00-00', '2014-08-17 23:14:11', '2014-08-17 23:14:11', 1),
(42, 11, 24.42, '0000-00-00', '2014-08-17 23:14:11', '2014-08-17 23:14:11', 1),
(43, 11, 24.42, '0000-00-00', '2014-08-17 23:14:11', '2014-08-17 23:14:11', 1),
(44, 11, 24.42, '0000-00-00', '2014-08-17 23:14:11', '2014-08-17 23:14:11', 1),
(45, 11, 24.42, '0000-00-00', '2014-08-17 23:14:11', '2014-08-17 23:14:11', 1),
(46, 12, 24.42, '2014-08-01', '2014-08-17 23:15:22', '2014-08-17 23:15:22', 1),
(47, 12, 24.42, '2014-08-02', '2014-08-17 23:15:22', '2014-08-17 23:15:22', 1),
(48, 12, 24.42, '2014-08-02', '2014-08-17 23:15:22', '2014-08-17 23:15:22', 1),
(49, 12, 24.42, '2014-08-02', '2014-08-17 23:15:23', '2014-08-17 23:15:23', 1),
(50, 12, 24.42, '2014-08-04', '2014-08-17 23:15:23', '2014-08-17 23:15:23', 1),
(51, 13, 110, '2014-08-23', '2014-08-23 22:17:16', '2014-08-23 22:17:16', 1),
(52, 13, 110, '2014-08-23', '2014-08-23 22:17:16', '2014-08-23 22:17:16', 1),
(53, 13, 110, '2014-08-23', '2014-08-23 22:17:16', '2014-08-23 22:17:16', 1),
(54, 13, 110, '2014-08-22', '2014-08-23 22:17:16', '2014-08-23 22:17:16', 1),
(55, 13, 110, '2014-08-23', '2014-08-23 22:17:16', '2014-08-23 22:17:16', 1),
(56, 13, 110, '2014-08-23', '2014-08-23 22:17:16', '2014-08-23 22:17:16', 1),
(57, 13, 110, '2014-08-23', '2014-08-23 22:17:16', '2014-08-23 22:17:16', 1),
(58, 13, 110, '2014-08-23', '2014-08-23 22:17:16', '2014-08-23 22:17:16', 1),
(59, 13, 110, '2014-08-23', '2014-08-23 22:17:16', '2014-08-23 22:17:16', 1),
(60, 13, 110, '2014-08-23', '2014-08-23 22:17:16', '2014-08-23 22:17:16', 1),
(61, 14, 12000, '2014-08-31', '2014-08-24 00:40:04', '2014-08-23 22:32:02', 1),
(62, 14, 2444, '2014-08-23', '2014-08-24 00:36:47', '2014-08-23 22:32:02', 1),
(63, 14, 120, '2014-08-23', '2014-08-23 22:32:02', '2014-08-23 22:32:02', 1),
(64, 14, 120, '2014-08-23', '2014-08-23 22:32:02', '2014-08-23 22:32:02', 1),
(65, 14, 120, '2014-08-23', '2014-08-23 22:32:02', '2014-08-23 22:32:02', 1),
(66, 14, 120, '2014-08-23', '2014-08-23 22:32:02', '2014-08-23 22:32:02', 1),
(67, 14, 120, '2014-08-29', '2014-08-23 22:32:02', '2014-08-23 22:32:02', 1),
(68, 14, 120, '2014-08-30', '2014-08-23 22:32:02', '2014-08-23 22:32:02', 1),
(69, 14, 120, '2014-08-30', '2014-08-23 22:32:02', '2014-08-23 22:32:02', 1),
(70, 14, 120, '2014-08-30', '2014-08-23 22:32:02', '2014-08-23 22:32:02', 1),
(71, 15, 254.627, '2014-08-30', '2014-09-06 23:23:08', '2014-08-24 00:40:47', 1),
(72, 15, 254.627, '2014-08-27', '2014-08-24 00:40:47', '2014-08-24 00:40:47', 1),
(73, 15, 254.627, '2014-08-30', '2014-08-24 00:40:47', '2014-08-24 00:40:47', 1),
(74, 15, 254.627, '2014-08-30', '2014-08-24 00:40:47', '2014-08-24 00:40:47', 1),
(75, 15, 254.627, '2014-08-30', '2014-08-24 00:40:47', '2014-08-24 00:40:47', 1),
(76, 15, 254.627, '2014-11-15', '2014-08-24 00:40:47', '2014-08-24 00:40:47', 1),
(77, 15, 254.627, '2014-11-28', '2014-08-24 00:40:47', '2014-08-24 00:40:47', 1),
(78, 15, 254.627, '2014-10-31', '2014-08-24 00:40:47', '2014-08-24 00:40:47', 1),
(79, 15, 254.627, '2014-10-31', '2014-08-24 00:40:47', '2014-08-24 00:40:47', 1),
(80, 15, 254.627, '2014-10-31', '2014-08-24 00:40:47', '2014-08-24 00:40:47', 1),
(81, 15, 254.627, '2014-10-31', '2014-08-24 00:40:47', '2014-08-24 00:40:47', 1),
(82, 15, 254.627, '2014-10-31', '2014-08-24 00:40:47', '2014-08-24 00:40:47', 1),
(83, 15, 254.627, '2014-10-31', '2014-08-24 00:40:47', '2014-08-24 00:40:47', 1),
(84, 15, 254.627, '2014-10-31', '2014-08-24 00:40:47', '2014-08-24 00:40:47', 1),
(85, 15, 254.627, '2014-10-31', '2014-08-24 00:40:47', '2014-08-24 00:40:47', 1),
(86, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(87, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(88, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(89, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(90, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(91, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(92, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(93, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(94, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(95, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(96, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(97, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(98, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(99, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(100, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(101, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(102, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(103, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(104, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(105, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(106, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(107, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(108, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(109, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(110, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(111, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(112, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(113, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(114, 15, 254.627, '2014-10-31', '2014-08-24 00:40:48', '2014-08-24 00:40:48', 1),
(115, 15, 254.627, '2014-10-31', '2014-08-24 00:40:49', '2014-08-24 00:40:49', 1),
(116, 15, 254.627, '2014-10-31', '2014-08-24 00:40:49', '2014-08-24 00:40:49', 1),
(117, 15, 254.627, '2014-10-31', '2014-08-24 00:40:49', '2014-08-24 00:40:49', 1),
(118, 15, 254.627, '2014-10-31', '2014-08-24 00:40:49', '2014-08-24 00:40:49', 1),
(119, 16, 254.627, '2014-08-23', '2014-08-24 00:41:05', '2014-08-24 00:41:05', 1),
(120, 16, 254.627, '2014-08-27', '2014-08-24 00:41:05', '2014-08-24 00:41:05', 1),
(121, 16, 254.627, '2014-08-30', '2014-08-24 00:41:05', '2014-08-24 00:41:05', 1),
(122, 16, 254.627, '2014-08-30', '2014-08-24 00:41:05', '2014-08-24 00:41:05', 1),
(123, 16, 254.627, '2014-08-30', '2014-08-24 00:41:05', '2014-08-24 00:41:05', 1),
(124, 16, 254.627, '2014-11-15', '2014-08-24 00:41:05', '2014-08-24 00:41:05', 1),
(125, 16, 254.627, '2014-11-28', '2014-08-24 00:41:05', '2014-08-24 00:41:05', 1),
(126, 16, 254.627, '2014-10-31', '2014-08-24 00:41:05', '2014-08-24 00:41:05', 1),
(127, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(128, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(129, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(130, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(131, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(132, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(133, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(134, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(135, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(136, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(137, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(138, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(139, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(140, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(141, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(142, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(143, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(144, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(145, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(146, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(147, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(148, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(149, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(150, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(151, 16, 254.627, '2014-10-31', '2014-08-24 00:41:06', '2014-08-24 00:41:06', 1),
(152, 16, 254.627, '2014-10-31', '2014-08-24 00:41:07', '2014-08-24 00:41:07', 1),
(153, 16, 254.627, '2014-10-31', '2014-08-24 00:41:07', '2014-08-24 00:41:07', 1),
(154, 16, 254.627, '2014-10-31', '2014-08-24 00:41:07', '2014-08-24 00:41:07', 1),
(155, 16, 254.627, '2014-10-31', '2014-08-24 00:41:07', '2014-08-24 00:41:07', 1),
(156, 16, 254.627, '2014-10-31', '2014-08-24 00:41:07', '2014-08-24 00:41:07', 1),
(157, 16, 254.627, '2014-10-31', '2014-08-24 00:41:07', '2014-08-24 00:41:07', 1),
(158, 16, 254.627, '2014-10-31', '2014-08-24 00:41:07', '2014-08-24 00:41:07', 1),
(159, 16, 254.627, '2014-10-31', '2014-08-24 00:41:07', '2014-08-24 00:41:07', 1),
(160, 16, 254.627, '2014-10-31', '2014-08-24 00:41:07', '2014-08-24 00:41:07', 1),
(161, 16, 254.627, '2014-10-31', '2014-08-24 00:41:07', '2014-08-24 00:41:07', 1),
(162, 16, 254.627, '2014-10-31', '2014-08-24 00:41:07', '2014-08-24 00:41:07', 1),
(163, 16, 254.627, '2014-10-31', '2014-08-24 00:41:07', '2014-08-24 00:41:07', 1),
(164, 16, 254.627, '2014-10-31', '2014-08-24 00:41:07', '2014-08-24 00:41:07', 1),
(165, 16, 254.627, '2014-10-31', '2014-08-24 00:41:07', '2014-08-24 00:41:07', 1),
(166, 16, 254.627, '2014-10-31', '2014-08-24 00:41:07', '2014-08-24 00:41:07', 1),
(167, 17, 254.627, '2014-08-23', '2014-08-24 00:41:31', '2014-08-24 00:41:31', 1),
(168, 17, 254.627, '2014-08-27', '2014-08-24 00:41:31', '2014-08-24 00:41:31', 1),
(169, 17, 254.627, '2014-08-30', '2014-08-24 00:41:31', '2014-08-24 00:41:31', 1),
(170, 17, 254.627, '2014-08-30', '2014-08-24 00:41:31', '2014-08-24 00:41:31', 1),
(171, 17, 254.627, '2014-08-30', '2014-08-24 00:41:31', '2014-08-24 00:41:31', 1),
(172, 17, 254.627, '2014-11-15', '2014-08-24 00:41:31', '2014-08-24 00:41:31', 1),
(173, 17, 254.627, '2014-11-28', '2014-08-24 00:41:31', '2014-08-24 00:41:31', 1),
(174, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(175, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(176, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(177, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(178, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(179, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(180, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(181, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(182, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(183, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(184, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(185, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(186, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(187, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(188, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(189, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(190, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(191, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(192, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(193, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(194, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(195, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(196, 17, 254.627, '2014-10-31', '2014-08-24 00:41:32', '2014-08-24 00:41:32', 1),
(197, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(198, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(199, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(200, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(201, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(202, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(203, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(204, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(205, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(206, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(207, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(208, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(209, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(210, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(211, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(212, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(213, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(214, 17, 254.627, '2014-10-31', '2014-08-24 00:41:33', '2014-08-24 00:41:33', 1),
(215, 18, 110, '2014-08-23', '2014-08-24 00:48:21', '2014-08-24 00:48:21', 1),
(216, 19, 110, '2014-08-23', '2014-08-24 00:48:57', '2014-08-24 00:48:57', 1),
(217, 19, 110, NULL, '2014-08-24 00:48:57', '2014-08-24 00:48:57', 1),
(218, 19, 110, NULL, '2014-08-24 00:48:57', '2014-08-24 00:48:57', 1),
(219, 19, 110, NULL, '2014-08-24 00:48:57', '2014-08-24 00:48:57', 1),
(220, 19, 110, NULL, '2014-08-24 00:48:57', '2014-08-24 00:48:57', 1),
(221, 19, 110, NULL, '2014-08-24 00:48:58', '2014-08-24 00:48:58', 1),
(222, 19, 110, NULL, '2014-08-24 00:48:58', '2014-08-24 00:48:58', 1),
(223, 19, 110, NULL, '2014-08-24 00:48:58', '2014-08-24 00:48:58', 1),
(224, 19, 110, NULL, '2014-08-24 00:48:58', '2014-08-24 00:48:58', 1),
(225, 19, 110, NULL, '2014-08-24 00:48:58', '2014-08-24 00:48:58', 1),
(226, 20, 100, '2014-08-30', '2014-08-24 00:53:00', '2014-08-24 00:52:44', 1),
(227, 20, 5.5, '2014-10-10', '2014-08-24 00:53:10', '2014-08-24 00:52:44', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuotas_ventas`
--

CREATE TABLE IF NOT EXISTS `cuotas_ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `importe` float NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cuotas_ventas`
--

INSERT INTO `cuotas_ventas` (`id`, `importe`, `fecha_vencimiento`, `created_at`, `updated_at`, `id_venta`, `id_usuario`) VALUES
(1, 550, '2014-09-14', '2014-09-14 20:19:11', '2014-09-14 20:19:11', 4, 1),
(2, 550, '2014-10-14', '2014-09-14 20:19:11', '2014-09-14 20:19:11', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudios`
--

CREATE TABLE IF NOT EXISTS `estudios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `estudios`
--

INSERT INTO `estudios` (`id`, `descripcion`, `update_time`, `create_time`) VALUES
(1, NULL, NULL, '2014-07-19 17:10:41'),
(2, 'Primario', NULL, '2014-07-19 17:10:41'),
(3, 'Secundario', NULL, '2014-07-19 17:10:53'),
(4, 'Terciario', NULL, '2014-07-19 17:10:53'),
(5, 'Universitario', NULL, '2014-07-19 17:10:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas_cocheria`
--

CREATE TABLE IF NOT EXISTS `facturas_cocheria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `descripcion` text NOT NULL,
  `id_socio` int(11) NOT NULL,
  `id_familiar` int(11) NOT NULL,
  `importe` int(11) NOT NULL,
  `porcentaje` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `facturas_cocheria`
--

INSERT INTO `facturas_cocheria` (`id`, `fecha`, `descripcion`, `id_socio`, `id_familiar`, `importe`, `porcentaje`, `id_usuario`, `created_at`, `updated_at`) VALUES
(1, '2014-08-02', 'Servicio Fúnebre', 2, 1, 1200, 34, 1, '2014-08-03 04:53:38', '2014-08-09 10:07:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familiares`
--

CREATE TABLE IF NOT EXISTS `familiares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_parentezco` int(11) NOT NULL,
  `id_sexo` int(11) NOT NULL DEFAULT '0',
  `id_estudio` int(11) DEFAULT NULL,
  `id_tipo_documento` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `nro_documento` varchar(45) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `socio_futbol` tinyint(1) DEFAULT NULL,
  `socio_pesca` varchar(45) DEFAULT NULL,
  `tel_cel` varchar(45) DEFAULT NULL,
  `tel_part` varchar(45) DEFAULT NULL,
  `tel_lab` varchar(45) DEFAULT NULL,
  `estudios_id` int(11) NOT NULL,
  `tipos_socios_id` int(11) NOT NULL,
  `fecha_nac` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `socio_coop` tinyint(1) NOT NULL,
  `id_socio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `familiares`
--

INSERT INTO `familiares` (`id`, `id_parentezco`, `id_sexo`, `id_estudio`, `id_tipo_documento`, `created_at`, `updated_at`, `nombre`, `apellido`, `nro_documento`, `direccion`, `localidad`, `socio_futbol`, `socio_pesca`, `tel_cel`, `tel_part`, `tel_lab`, `estudios_id`, `tipos_socios_id`, `fecha_nac`, `id_usuario`, `socio_coop`, `id_socio`) VALUES
(1, 2, 2, 2, 2, '2014-07-26 23:52:35', '2014-08-09 13:06:29', 'Juan', 'Perez', '11529219', 'av cabildao ', 'belgrano', 2, '2', '1530309090', '48473050', '48473030', 0, 0, '2012-08-01', 1, 2, 2),
(2, 3, 1, 1, 1, '2014-07-27 03:50:07', '2014-08-09 13:06:49', 'Diego', 'Perez', '11000999', 'blanco encalada y vidal', 'belgrano', 1, '1', '1530359928', '48473050', '45428385', 1, 0, NULL, 1, 1, 2),
(3, 4, 1, 1, 1, '2014-07-27 04:07:17', '2014-08-09 13:07:08', 'Susana', 'Perez', '11000992', 'monroe y balbin', 'belgrano', 1, '1', '153039393', '48473070', '153039291', 2, 2, NULL, 1, 1, 2),
(4, 2, 2, 3, 2, '2014-08-24 01:05:26', '2014-08-24 01:05:26', 'nombre', 'apellido', '23/08/2014', 'direccion', 'localidad', 3, '3', '1', '1111', '1111111', 0, 0, NULL, 1, 2, 1),
(5, 3, 2, 1, 2, '2014-08-24 01:12:42', '2014-08-24 01:12:42', 'aaaaaaaaaaaa', 'ssssssss', '23/08/2014', '', '', 1, '1', '', '', '', 0, 0, NULL, 1, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_07_06_230228_create_estudios_table', 1),
('2014_07_06_230228_create_perfiles_table', 1),
('2014_07_06_230228_create_sexos_table', 1),
('2014_07_06_230228_create_tipos_documentos_table', 1),
('2014_07_06_230228_create_tipos_socios_table', 1),
('2014_07_12_184944_create_usuarios_table', 2),
('2014_07_12_184945_add_foreign_keys_to_usuarios_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_pago`
--

CREATE TABLE IF NOT EXISTS `orden_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_movimiento` date NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `monto` float NOT NULL,
  `destinatario` varchar(255) NOT NULL,
  `tipo_movimiento` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentezcos`
--

CREATE TABLE IF NOT EXISTS `parentezcos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `parentezcos`
--

INSERT INTO `parentezcos` (`id`, `descripcion`) VALUES
(1, ''),
(2, 'Padre'),
(3, 'Madre'),
(4, 'Hijo/a'),
(5, 'Suegro/a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE IF NOT EXISTS `perfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id`, `descripcion`, `create_time`, `update_time`) VALUES
(1, 'Administrador', '2014-08-02 17:01:47', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE IF NOT EXISTS `prestamos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_socio` int(11) NOT NULL,
  `monto` float NOT NULL,
  `interes` float NOT NULL,
  `cantidad_cuotas` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id`, `id_socio`, `monto`, `interes`, `cantidad_cuotas`, `id_usuario`, `created_at`, `updated_at`) VALUES
(1, 3, 111, 10, 5, 1, '2014-08-17 22:56:12', '2014-08-17 22:56:12'),
(2, 3, 111, 10, 5, 1, '2014-08-17 22:56:29', '2014-08-17 22:56:29'),
(3, 3, 111, 10, 5, 1, '2014-08-17 23:09:07', '2014-08-17 23:09:07'),
(4, 3, 111, 10, 5, 1, '2014-08-17 23:10:33', '2014-08-17 23:10:33'),
(5, 3, 111, 10, 5, 1, '2014-08-17 23:10:35', '2014-08-17 23:10:35'),
(6, 3, 111, 10, 5, 1, '2014-08-17 23:10:59', '2014-08-17 23:10:59'),
(7, 3, 111, 10, 5, 1, '2014-08-17 23:11:35', '2014-08-17 23:11:35'),
(8, 3, 111, 10, 5, 1, '2014-08-17 23:12:03', '2014-08-17 23:12:03'),
(9, 3, 111, 10, 5, 1, '2014-08-17 23:12:54', '2014-08-17 23:12:54'),
(10, 3, 111, 10, 5, 1, '2014-08-17 23:13:03', '2014-08-17 23:13:03'),
(11, 3, 111, 10, 5, 1, '2014-08-17 23:14:10', '2014-08-17 23:14:10'),
(12, 3, 111, 10, 5, 1, '2014-08-17 23:15:22', '2014-08-17 23:15:22'),
(13, 3, 1000, 10, 10, 1, '2014-08-23 22:17:15', '2014-08-23 22:17:15'),
(14, 2, 1000, 20, 10, 1, '2014-08-23 22:32:02', '2014-08-23 22:32:02'),
(15, 1, 11111, 10, 48, 1, '2014-08-24 00:40:47', '2014-08-24 00:40:47'),
(16, 1, 11111, 10, 48, 1, '2014-08-24 00:41:05', '2014-08-24 00:41:05'),
(17, 1, 11111, 10, 48, 1, '2014-08-24 00:41:31', '2014-08-24 00:41:31'),
(18, 3, 1000, 10, 10, 1, '2014-08-24 00:48:21', '2014-08-24 00:48:21'),
(19, 3, 1000, 10, 10, 1, '2014-08-24 00:48:57', '2014-08-24 00:48:57'),
(20, 1, 10, 10, 2, 1, '2014-08-24 00:52:44', '2014-08-24 00:52:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rifas`
--

CREATE TABLE IF NOT EXISTS `rifas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `desde` int(11) NOT NULL,
  `hasta` int(11) NOT NULL,
  `ganador` int(11) NOT NULL,
  `precio` float NOT NULL,
  `fecha_sorteo` date NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `rifas`
--

INSERT INTO `rifas` (`id`, `nombre`, `desde`, `hasta`, `ganador`, `precio`, `fecha_sorteo`, `id_usuario`, `created_at`, `updated_at`) VALUES
(1, 'rifa', 1, 10000, 0, 300, '2014-08-09', 1, '2014-08-17 18:50:07', '2014-08-17 18:50:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexos`
--

CREATE TABLE IF NOT EXISTS `sexos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `sexos`
--

INSERT INTO `sexos` (`id`, `descripcion`, `update_time`, `create_time`) VALUES
(1, NULL, NULL, '2014-07-16 03:46:20'),
(2, 'Masculino', NULL, '2014-07-16 03:46:20'),
(3, 'Femenino', NULL, '2014-07-16 03:46:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `si_no`
--

CREATE TABLE IF NOT EXISTS `si_no` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `si_no`
--

INSERT INTO `si_no` (`id`, `descripcion`) VALUES
(1, ''),
(2, 'Si'),
(3, 'No');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE IF NOT EXISTS `socios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sexo` int(11) NOT NULL DEFAULT '0',
  `id_estudio` int(11) DEFAULT NULL,
  `id_tipo_documento` int(11) DEFAULT NULL,
  `id_tipo_socio` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nro_legajo` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `nro_documento` varchar(45) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `socio_futbol` tinyint(1) DEFAULT NULL,
  `socio_pesca` varchar(45) DEFAULT NULL,
  `valor_historico` float DEFAULT NULL,
  `tel_cel` varchar(45) DEFAULT NULL,
  `tel_part` varchar(45) DEFAULT NULL,
  `tel_lab` varchar(45) DEFAULT NULL,
  `estudios_id` int(11) NOT NULL,
  `tipos_socios_id` int(11) NOT NULL,
  `fecha_nac` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `socio_coop` tinyint(1) NOT NULL,
  `socio_cocheria` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`estudios_id`,`tipos_socios_id`,`id_sexo`,`id_tipo_socio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `socios`
--

INSERT INTO `socios` (`id`, `id_sexo`, `id_estudio`, `id_tipo_documento`, `id_tipo_socio`, `created_at`, `updated_at`, `nro_legajo`, `nombre`, `apellido`, `nro_documento`, `direccion`, `localidad`, `socio_futbol`, `socio_pesca`, `valor_historico`, `tel_cel`, `tel_part`, `tel_lab`, `estudios_id`, `tipos_socios_id`, `fecha_nac`, `id_usuario`, `socio_coop`, `socio_cocheria`) VALUES
(1, 3, 3, 2, 2, '2014-07-12 22:56:32', '2014-07-19 17:19:51', 1234, 'Juan', 'Gomez', '11320202', 'Rawson 513', 'Haedo', 3, '3', NULL, '5555', '4444', '6666', 0, 0, '2014-07-18', 1, 3, 2),
(2, 2, 3, 2, 3, '2014-07-12 22:58:34', '2014-07-27 04:31:52', 1235, 'Pedro', 'Perez', '10529012', 'Los Paraisos 158', 'Ituzaingó', 3, '2', NULL, '423432', '23432', '23423432', 0, 0, NULL, 1, 2, 2),
(3, 2, 3, 2, 2, '2014-07-12 22:58:56', '2014-08-24 01:14:18', 1236, 'Joaquin', 'García', '550030', 'Velez 700', 'Morón', 2, '2', NULL, '1111111111111111', '11111111', '111111111', 0, 0, '2014-08-30', 1, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_documentos`
--

CREATE TABLE IF NOT EXISTS `tipos_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tipos_documentos`
--

INSERT INTO `tipos_documentos` (`id`, `descripcion`, `create_time`, `update_time`) VALUES
(1, '-', '2014-07-12 22:24:47', NULL),
(2, 'DNI', '2014-07-12 22:24:47', NULL),
(3, 'LE', '2014-07-12 22:24:57', NULL),
(4, 'Pasaporte', '2014-07-12 22:24:57', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_socios`
--

CREATE TABLE IF NOT EXISTS `tipos_socios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tipos_socios`
--

INSERT INTO `tipos_socios` (`id`, `descripcion`, `update_time`, `create_time`) VALUES
(1, NULL, NULL, '2014-07-16 03:31:47'),
(2, 'Quincenal', NULL, '2014-07-16 03:31:47'),
(3, 'Mensual', NULL, '2014-07-16 03:32:00'),
(4, 'Altos Mandos', NULL, '2014-07-16 03:32:00'),
(5, 'DAMSA', NULL, '2014-07-16 03:32:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  `id_tipo_documento` int(11) DEFAULT NULL,
  `nro_documento` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuario` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remember_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  KEY `fk_usuarios_1_perfil_idx` (`id_perfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `id_perfil`, `id_tipo_documento`, `nro_documento`, `usuario`, `password`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, 'Prueba', '', 1, 2, '12345', 'prueba', '$2y$10$C8xzxbBlIzBrLsxt9l5/Y.k1nm2vZMR.uUYPf99ucSV.a.TI17atG', '2014-08-02 17:02:11', '2014-08-07 02:56:04', 'hPuGviFyeXLhjncgGUQR2cALw3gisaTOAh11eOD385kkFBDzAdGClR6ASqy8');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE IF NOT EXISTS `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_socio` int(11) NOT NULL,
  `id_comercio` int(11) NOT NULL,
  `monto` float NOT NULL,
  `interes` float NOT NULL,
  `cantidad_cuotas` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_socio`, `id_comercio`, `monto`, `interes`, `cantidad_cuotas`, `created_at`, `updated_at`, `descripcion`, `id_usuario`) VALUES
(1, 3, 1, 1000, 10, 2, '2014-09-14 20:17:45', '2014-09-14 20:17:45', 'Mesa con Sillas', 1),
(2, 3, 1, 1000, 10, 2, '2014-09-14 20:18:16', '2014-09-14 20:18:16', 'Mesa con Sillas', 1),
(3, 3, 1, 1000, 10, 2, '2014-09-14 20:18:47', '2014-09-14 20:18:47', 'Mesa con Sillas', 1),
(4, 3, 1, 1000, 10, 2, '2014-09-14 20:19:10', '2014-09-14 20:19:10', 'Mesa con Sillas', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_id_perfil_foreign` FOREIGN KEY (`id_perfil`) REFERENCES `perfiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
