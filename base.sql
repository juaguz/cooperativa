-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 05-08-2014 a las 00:37:03
-- Versión del servidor: 5.5.38-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `cooperativa`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `comercios`
--

INSERT INTO `comercios` (`id`, `nombre`, `direccion`, `telefono`, `persona_contacto`, `observaciones`, `id_usuario`, `updated_at`, `created_at`) VALUES
(1, 'nombre', 'direccion', 'telefono', 'contacto', 'obseraciones', 1, '2014-08-05 00:16:33', '2014-08-05 00:16:33'),
(2, 'comercio2edit', 'direccion2edit', '12345698766', 'contactoedit', 'observacionessadasidnasdjasedit', 1, '2014-08-05 00:36:00', '2014-08-05 00:35:42');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `facturas_cocheria`
--

INSERT INTO `facturas_cocheria` (`id`, `fecha`, `descripcion`, `id_socio`, `id_familiar`, `importe`, `porcentaje`, `id_usuario`, `created_at`, `updated_at`) VALUES
(1, '2014-08-02', 'descripcion', 2, 1, 12, 34, 1, '2014-08-03 04:53:38', '2014-08-03 01:53:38'),
(2, '2014-08-07', 'descripcion', 2, 1, 12, 43, 1, '2014-08-03 04:54:29', '2014-08-03 01:54:29'),
(3, '2014-08-02', 'descripcion', 2, 1, 32423423, 432423, 1, '2014-08-03 04:55:25', '2014-08-03 01:55:25'),
(4, '2014-08-02', 'descripcion', 2, 1, 32423423, 432423, 1, '2014-08-03 04:56:16', '2014-08-03 01:56:16'),
(5, '2014-08-02', 'descripcion', 2, 1, 32423423, 432423, 1, '2014-08-03 05:00:49', '2014-08-03 02:00:49'),
(6, '2014-08-02', 'descripcion', 2, 1, 32423423, 432423, 1, '2014-08-03 05:01:22', '2014-08-03 02:01:22'),
(7, '2014-08-02', 'descripcion', 2, 1, 32423423, 432423, 1, '2014-08-03 05:02:25', '2014-08-03 02:02:25'),
(8, '2014-08-09', 'descripcion editado', 2, 1, 12345, 123456, 1, '2014-08-03 05:09:40', '2014-08-03 02:12:18');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `familiares`
--

INSERT INTO `familiares` (`id`, `id_parentezco`, `id_sexo`, `id_estudio`, `id_tipo_documento`, `created_at`, `updated_at`, `nombre`, `apellido`, `nro_documento`, `direccion`, `localidad`, `socio_futbol`, `socio_pesca`, `tel_cel`, `tel_part`, `tel_lab`, `estudios_id`, `tipos_socios_id`, `fecha_nac`, `id_usuario`, `socio_coop`, `id_socio`) VALUES
(1, 2, 2, 2, 2, '2014-07-26 23:52:35', '2014-07-29 02:43:14', 'editado', 'apellido', '05/07/2014', 'direccion', 'localidad', 2, '2', '1318321', '1530359959', '3123123', 0, 0, NULL, 1, 2, 2),
(2, 3, 1, 1, 1, '2014-07-27 03:50:07', '2014-07-27 04:24:58', 'jgfhgfh', '', '', '', '', 1, '1', '', '', '', 0, 0, NULL, 1, 1, 2),
(3, 4, 1, 1, 1, '2014-07-27 04:07:17', '2014-07-27 04:25:18', 'familiar3', '', '', '', '', 1, '1', '', '', '', 0, 0, NULL, 1, 1, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `socios`
--

INSERT INTO `socios` (`id`, `id_sexo`, `id_estudio`, `id_tipo_documento`, `id_tipo_socio`, `created_at`, `updated_at`, `nro_legajo`, `nombre`, `apellido`, `nro_documento`, `direccion`, `localidad`, `socio_futbol`, `socio_pesca`, `valor_historico`, `tel_cel`, `tel_part`, `tel_lab`, `estudios_id`, `tipos_socios_id`, `fecha_nac`, `id_usuario`, `socio_coop`, `socio_cocheria`) VALUES
(1, 3, 3, 2, 2, '2014-07-12 22:56:32', '2014-07-19 17:19:51', 1234, 'Nombreaaa', 'Apellido', '10/07/2014', 'direccion', 'localidad', 3, '3', NULL, '5555', '4444', '6666', 0, 0, '2014-07-18', 1, 3, 2),
(2, 2, 3, 2, 3, '2014-07-12 22:58:34', '2014-07-27 04:31:52', 432423, 'Nombre', 'Apellido', '31/07/2014', 'zxfsfs', 'sdfsdfsd', 3, '2', NULL, '423432', '23432', '23423432', 0, 0, NULL, 1, 2, 2),
(3, 0, NULL, 1, 0, '2014-07-12 22:58:56', '2014-07-12 22:58:56', NULL, 'gfdgdfgd', 'fgfdgdfgdf', '56756765', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 0, 2),
(4, 0, NULL, 1, 0, '2014-07-12 23:00:29', '2014-07-12 23:00:29', NULL, 'gfdgdfgd', 'fgfdgdfgdf', '56756765', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 0, 1),
(5, 0, NULL, 1, 0, '2014-07-12 23:00:38', '2014-07-12 23:00:38', NULL, 'gfdgdfgd', 'fgfdgdfgdf', '56756765', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 0, 1),
(6, 0, NULL, 1, 0, '2014-07-12 23:00:49', '2014-07-12 23:00:49', NULL, 'gfdgdfgd', 'fgfdgdfgdf', '56756765', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 0, 1),
(7, 0, NULL, 4, 0, '2014-07-12 23:07:38', '2014-07-12 23:07:38', NULL, 'dfgdfgdf', 'gfdgdfg', '756756756', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 0, 1),
(8, 0, NULL, 1, 0, '2014-07-13 03:27:27', '2014-07-13 03:27:27', NULL, 'nombre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 0, 1),
(9, 0, NULL, 2, 0, '2014-07-13 03:28:01', '2014-07-13 03:28:01', NULL, 'asdsadsa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 0, 1);

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
(1, 'test', 'test', 1, 2, '12345', 'test', '$2y$10$C8xzxbBlIzBrLsxt9l5/Y.k1nm2vZMR.uUYPf99ucSV.a.TI17atG', '2014-08-02 17:02:11', '2014-08-03 06:09:22', 'BPZ36rLrii0AKAiisTDUlKXHJF26x8F3NTVCmhXdVNQiFCY85ytXlfOdKTRs');

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
