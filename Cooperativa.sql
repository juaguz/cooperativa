-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2014 a las 07:07:57
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `circulos`
--

INSERT INTO `circulos` (`id`, `nombre`, `cantidad_socios`, `importe`, `fecha_inicio`, `fecha_fin`, `created_at`, `updated_at`, `id_usuario`) VALUES
(8, '1001', 10, 303, '2014-01-01', '2014-12-30', '2014-10-14 03:31:59', '2014-10-14 03:31:59', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `circulos_socios`
--

CREATE TABLE IF NOT EXISTS `circulos_socios` (
  `id_circulo` int(11) NOT NULL,
  `id_socio` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `circulos_socios`
--

INSERT INTO `circulos_socios` (`id_circulo`, `id_socio`, `created_at`, `updated_at`, `id`) VALUES
(8, 3, '2014-10-14 03:31:59', '2014-10-14 00:31:59', 4);

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
-- Estructura de tabla para la tabla `cuotas_circulos`
--

CREATE TABLE IF NOT EXISTS `cuotas_circulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_circulo_socio` int(11) NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `liquidado` date NOT NULL,
  `nro_mes` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `cuotas_circulos`
--

INSERT INTO `cuotas_circulos` (`id`, `id_circulo_socio`, `fecha_vencimiento`, `liquidado`, `nro_mes`) VALUES
(1, 4, '2014-01-29', '2014-01-29', 0),
(2, 4, '2014-02-28', '2014-02-28', 0),
(3, 4, '2014-03-29', '2014-03-29', 0),
(4, 4, '2014-04-29', '2014-04-29', 0),
(5, 4, '2014-05-29', '2014-05-29', 0),
(6, 4, '2014-06-29', '2014-06-29', 0),
(7, 4, '2014-07-29', '2014-07-29', 0),
(8, 4, '2014-08-29', '2014-08-29', 0),
(9, 4, '2014-09-29', '2014-09-29', 0),
(10, 4, '2014-10-29', '0000-00-00', 0),
(11, 4, '2014-11-29', '0000-00-00', 0),
(12, 4, '2014-12-29', '0000-00-00', 0);

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
  `liquidada` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cuotas_prestamo`
--

INSERT INTO `cuotas_prestamo` (`id`, `id_prestamo`, `importe`, `fecha_vencimiento`, `updated_at`, `created_at`, `id_usuario`, `liquidada`) VALUES
(1, 1, 500, '2014-10-14', '2014-10-14 04:16:56', '2014-10-14 04:16:56', 1, '0000-00-00'),
(2, 1, 500, '2014-11-11', '2014-10-14 04:16:56', '2014-10-14 04:16:56', 1, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuotas_servicios`
--

CREATE TABLE IF NOT EXISTS `cuotas_servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `importe` float NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `cuotas_servicios`
--

INSERT INTO `cuotas_servicios` (`id`, `importe`, `fecha_vencimiento`, `created_at`, `updated_at`, `id_servicio`, `id_usuario`) VALUES
(1, 110, '2014-09-18', '2014-09-18 22:32:45', '2014-09-18 22:32:45', 2, 1),
(2, 110, '2014-10-18', '2014-09-18 22:32:45', '2014-09-18 22:32:45', 2, 1),
(3, 110, '2014-11-18', '2014-09-18 22:32:45', '2014-09-18 22:32:45', 2, 1),
(4, 240, '2014-09-19', '2014-09-19 00:29:48', '2014-09-19 00:29:48', 3, 1),
(5, 240, '2014-09-19', '2014-09-19 00:29:48', '2014-09-19 00:29:48', 3, 1),
(6, 240, '2014-09-19', '2014-09-19 00:29:48', '2014-09-19 00:29:48', 3, 1),
(7, 240, '2014-11-13', '2014-09-19 00:29:48', '2014-09-19 00:29:48', 3, 1),
(8, 240, '2014-09-27', '2014-09-19 00:29:48', '2014-09-19 00:29:48', 3, 1);

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
  `liquidada` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `cuotas_ventas`
--

INSERT INTO `cuotas_ventas` (`id`, `importe`, `fecha_vencimiento`, `created_at`, `updated_at`, `id_venta`, `id_usuario`, `liquidada`) VALUES
(1, 100, '2014-10-14', '2014-10-14 01:58:36', '2014-10-14 01:58:36', 1, 1, '0000-00-00'),
(2, 100, '2014-11-14', '2014-10-14 01:58:36', '2014-10-14 01:58:36', 1, 1, '0000-00-00'),
(3, 100, '2014-12-14', '2014-10-14 01:58:36', '2014-10-14 01:58:36', 1, 1, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE IF NOT EXISTS `empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id`, `nombre`, `sigla`) VALUES
(1, '-', ''),
(2, 'Agco', 'AGC'),
(3, 'AYL', 'AYL'),
(4, 'Motores San Luis', 'MSL'),
(5, 'Transmisiones Argentinas', 'TAR');

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
  `liquidada` date NOT NULL,
  `nro_factura` varchar(255) NOT NULL,
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `facturas_cocheria`
--

INSERT INTO `facturas_cocheria` (`id`, `fecha`, `descripcion`, `id_socio`, `id_familiar`, `importe`, `porcentaje`, `id_usuario`, `created_at`, `updated_at`, `liquidada`, `nro_factura`) VALUES
(1, '2014-08-02', 'Servicio Fúnebre', 2, 1, 120000, 34, 1, '2014-08-03 04:53:38', '2014-08-09 10:07:33', '0000-00-00', '1234');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `familiares`
--

INSERT INTO `familiares` (`id`, `id_parentezco`, `id_sexo`, `id_estudio`, `id_tipo_documento`, `created_at`, `updated_at`, `nombre`, `apellido`, `nro_documento`, `direccion`, `localidad`, `socio_futbol`, `socio_pesca`, `tel_cel`, `tel_part`, `tel_lab`, `estudios_id`, `tipos_socios_id`, `fecha_nac`, `id_usuario`, `socio_coop`, `id_socio`) VALUES
(1, 6, 1, 1, 1, '2014-10-14 03:02:42', '2014-10-14 03:02:42', 'Nélida', 'Bravo', '', '', '', 1, '1', '', '', '', 0, 0, NULL, 1, 1, 3),
(2, 4, 1, 1, 1, '2014-10-14 03:03:10', '2014-10-14 03:03:10', 'Fernando', 'Acuña', '', '', '', 1, '1', '', '', '', 0, 0, NULL, 1, 1, 3),
(3, 2, 1, 1, 1, '2014-10-14 03:03:35', '2014-10-14 03:03:35', 'Silverio', 'Acuña', '', '', '', 1, '1', '', '', '', 0, 0, NULL, 1, 1, 3),
(4, 3, 1, 1, 1, '2014-10-14 03:03:54', '2014-10-14 03:03:54', 'Rojas', 'Alcira', '', '', '', 1, '1', '', '', '', 0, 0, NULL, 1, 1, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `parentezcos`
--

INSERT INTO `parentezcos` (`id`, `descripcion`) VALUES
(1, ''),
(2, 'Padre'),
(3, 'Madre'),
(4, 'Hijo/a'),
(5, 'Suegro/a'),
(6, 'Esposo/a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `penias`
--

CREATE TABLE IF NOT EXISTS `penias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `penias`
--

INSERT INTO `penias` (`id`, `nombre`) VALUES
(1, 'Pesca'),
(2, 'Futbol');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id`, `id_socio`, `monto`, `interes`, `cantidad_cuotas`, `id_usuario`, `created_at`, `updated_at`) VALUES
(1, 3, 1000, 0, 2, 1, '2014-10-14 04:16:56', '2014-10-14 04:16:56');

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
(1, '2014', 1, 10000, 0, 70, '2014-08-09', 1, '2014-10-14 03:08:25', '2014-10-14 03:08:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rifas_socios`
--

CREATE TABLE IF NOT EXISTS `rifas_socios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_socio` int(11) NOT NULL,
  `id_rifa` int(11) NOT NULL,
  `numero_1` int(11) NOT NULL,
  `numero_2` int(11) NOT NULL,
  `numero_3` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `rifas_socios`
--

INSERT INTO `rifas_socios` (`id`, `id_socio`, `id_rifa`, `numero_1`, `numero_2`, `numero_3`) VALUES
(1, 3, 1, 345, 678, 234);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE IF NOT EXISTS `servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_socio` int(11) NOT NULL,
  `id_penia` int(11) NOT NULL,
  `monto` float NOT NULL,
  `interes` float NOT NULL,
  `cantidad_cuotas` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `id_socio`, `id_penia`, `monto`, `interes`, `cantidad_cuotas`, `created_at`, `updated_at`, `descripcion`, `id_usuario`) VALUES
(1, 1, 0, 300, 10, 3, '2014-09-18 22:31:37', '2014-09-18 22:31:37', 'Viaje a Córdoba', 1),
(2, 1, 0, 300, 10, 3, '2014-09-18 22:32:45', '2014-09-18 22:32:45', 'Viaje a Córdoba', 1),
(3, 3, 0, 1000, 20, 5, '2014-09-19 00:29:48', '2014-09-19 00:29:48', 'Mesa con Sillas', 1);

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
  `nro_legajo` varchar(30) DEFAULT NULL,
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
  `id_empresa` int(255) NOT NULL,
  `fecha_inicio` varchar(30) NOT NULL,
  PRIMARY KEY (`id`,`estudios_id`,`tipos_socios_id`,`id_sexo`,`id_tipo_socio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=955 ;

--
-- Volcado de datos para la tabla `socios`
--

INSERT INTO `socios` (`id`, `id_sexo`, `id_estudio`, `id_tipo_documento`, `id_tipo_socio`, `created_at`, `updated_at`, `nro_legajo`, `nombre`, `apellido`, `nro_documento`, `direccion`, `localidad`, `socio_futbol`, `socio_pesca`, `valor_historico`, `tel_cel`, `tel_part`, `tel_lab`, `estudios_id`, `tipos_socios_id`, `fecha_nac`, `id_usuario`, `socio_coop`, `socio_cocheria`, `id_empresa`, `fecha_inicio`) VALUES
(1, 0, NULL, 5, 0, '2014-10-14 02:31:50', NULL, '3362', 'PEDRO', 'MARINOTTI', '9471062', 'CAAGUAZU 320', 'PQE S.MARTIN MERLO', NULL, NULL, 797, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 1, '31036'),
(2, 0, NULL, 3, 0, '2014-10-14 02:31:50', NULL, '4587', 'LUIS DOMINGO', 'FABRIS', '8389006', 'OLEGARIO V.ANDRADE 985', 'SAN A. DE PADUA C.P 1718', NULL, NULL, 2837, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '27286'),
(3, 1, 1, 2, 1, '2014-10-14 02:31:50', '2014-10-14 03:07:22', '0151', 'JULIO ROBERTO', 'ACUÑA', '10177847', 'ITAPIRU 129', 'MORON', 2, '2', 2810, '', '', '', 0, 0, NULL, NULL, 1, 2, 5, '30538'),
(4, 0, NULL, 2, 0, '2014-10-14 02:31:50', NULL, '4000', 'CARLOS ENRIQUE', 'RODRIGUEZ', '16395692', 'SOCRATES 1945', 'HAEDO', NULL, NULL, 2243, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '31080'),
(5, 0, NULL, 2, 0, '2014-10-14 02:31:50', NULL, '3340', 'JOSE RAFAEL', 'BLANCO', '11466222', 'BRASIL 2386', 'MERLO', NULL, NULL, 796, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '31187'),
(6, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '4411', 'ENRIQUE LEOPOLDO', 'MOLINA', '8492068', 'LOS PARAISOS 158', 'CASTELAR C.P 1712', NULL, NULL, 813, NULL, '450-5011', NULL, 0, 0, NULL, NULL, 0, 1, 5, '30183'),
(7, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '0567', 'JUAN JOSE', 'PERALTA', '8514894', 'CALFUCURA 747', 'MORON', NULL, NULL, 2810, NULL, '628 7939', NULL, 0, 0, NULL, NULL, 1, 1, 5, '31667'),
(8, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '3344', 'JUAN ANTONIO', 'ROMANO', '12706465', 'LA PLATA 675', 'MORENO', NULL, NULL, 797, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '31657'),
(9, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '3345', 'RUBEN EDUARDO', 'SANCHEZ', '14246224', 'ALBENIZ 2932', 'WILLIAMS MORRIS', NULL, NULL, 797, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '31188'),
(10, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '0718', 'JOSE LUIS', 'RODRIGUEZ', '13410652', 'JUAN AGUSTIN GARCIA 937', 'CASTELAR', NULL, NULL, 2810, NULL, '450-7465', NULL, 0, 0, NULL, NULL, 1, 1, 5, '30210'),
(11, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '0763', 'CARLOS ESTEBAN', 'VERCESI', '14944658', 'LOS LAURELES 2527', 'ITUZAINGO', NULL, NULL, 2810, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '32608'),
(12, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '0814', 'DANIEL OSVALDO', 'PUIATTI', '12691479', '', '', NULL, NULL, 2810, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '31952'),
(13, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '0824', 'ALBERTO LIBORIO', 'NAVARRO', '13397211', 'CARREL 6689', 'MORENO', NULL, NULL, 2810, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '32359'),
(14, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '0870', 'RUBEN ERNESTO', 'MOLLE', '5400337', '', '', NULL, NULL, 2810, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '31177'),
(15, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '3324', 'MIGUEL ANGEL', 'SANCHEZ', '10083358', 'HUSARES 689', 'VILLA TESEI', NULL, NULL, 797, NULL, '450-0281', NULL, 0, 0, NULL, NULL, 0, 1, 5, '30853'),
(16, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '3272', 'MIGUEL ANGEL', 'VALDEZ', '18398696', 'MONTGOLFIER 332', 'ISIDRO CASANOVA', NULL, NULL, 699, NULL, '669-2591', NULL, 0, 0, NULL, NULL, 0, 1, 2, '32407'),
(17, 0, NULL, 3, 0, '2014-10-14 02:31:51', NULL, '3357', 'OSVALDO EULALIO', 'QUEVEDO', '4536475', 'MALARRO 1820', 'MORON', NULL, NULL, 797, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '30222'),
(18, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '0994', 'MIGUEL', 'STROLLO', '10355602', 'MASA 1827', 'MERLO', NULL, NULL, 2810, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '32121'),
(19, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '3360', 'LUIS HILARIO', 'RUIZ', '7204384', 'JUAN B.JUSTO 1042', 'MERLO', NULL, NULL, 797, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '31762'),
(20, 0, NULL, 3, 0, '2014-10-14 02:31:51', NULL, '3564', 'CARLOS RAMON', 'LASCANO', '4891490', 'GALICIA 1489', 'CASTELAR', NULL, NULL, 849, NULL, '623 8798', NULL, 0, 0, NULL, NULL, 0, 1, 5, '30244'),
(21, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '3327', 'ERNESTO OSCAR', 'CASAS', '7745204', 'LOS ANDES 1886', 'ISIDRO CASANOVA PDO MATANZA', NULL, NULL, 797, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '31169'),
(22, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '4002', 'MARIANO SOCORRO', 'ACEVEDO', '11321749', 'JOSEFINA B.DE MARQUEZ 3785', 'MORON', NULL, NULL, 2849, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '30385'),
(23, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '1195', 'PEDRO EMILIO', 'FERELLA', '11690504', 'GERARDO DOMAK 272', 'VILLA TESEI', NULL, NULL, 2810, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '30265'),
(24, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '1196', 'JOSE ABEL', 'VERA', '10975120', 'GUIDO 1633', 'PASO DEL REY', NULL, NULL, 2810, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '31195'),
(25, 0, NULL, 5, 0, '2014-10-14 02:31:51', NULL, '3361', 'RAFAEL ALEJANDRO', 'PIANA', '9076949', 'BERMUDEZ 5539', 'ISIDRO CASANOVA', NULL, NULL, 797, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '30722'),
(26, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '1208', 'JUAN ANTONIO', 'SIMOES', '10638418', 'FLORENCIO VARELA 829', 'MORON', NULL, NULL, 1134, NULL, '629 3346', NULL, 0, 0, NULL, NULL, 1, 1, 5, '31162'),
(27, 0, NULL, 2, 0, '2014-10-14 02:31:51', NULL, '4007', 'JOSE LIBERATO', 'LESCANO', '12091758', 'QUINTANA 1556', 'MERLO', NULL, NULL, 2849, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 2, '31075'),
(28, 0, NULL, 3, 0, '2014-10-14 02:31:51', NULL, '3328', 'DIONEL', 'GONZALEZ', '7737898', '', '', NULL, NULL, 797, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '28344'),
(29, 0, NULL, 3, 0, '2014-10-14 02:31:52', NULL, '3330', 'NESTOR DARIO', 'CORIA', '4882343', 'BARCELONA 1229', 'HAEDO', NULL, NULL, 797, NULL, '4628 2019', NULL, 0, 0, NULL, NULL, 0, 1, 2, '30719'),
(30, 0, NULL, 3, 0, '2014-10-14 02:31:52', NULL, '3332', 'MIGUEL ANGEL', 'DI CHENNA', '7710295', 'PRUDAN 1550', 'CASTELAR', NULL, NULL, 797, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '28351'),
(31, 0, NULL, 2, 0, '2014-10-14 02:31:52', NULL, '9069', 'DANIEL GUSTAVO', 'LOPEZ', '16751563', 'GRANADA 1131', 'HURLINGHAM  1686', NULL, NULL, 976, NULL, '459-1321', NULL, 0, 0, NULL, NULL, 0, 1, 2, '31008'),
(32, 0, NULL, 3, 0, '2014-10-14 02:31:52', NULL, '3637', 'VICTOR RAUL', 'DE FINO', '7596337', 'CAAGUAZU 458', 'ITUZAINGO', NULL, NULL, 1398, NULL, '623 7805', NULL, 0, 0, NULL, NULL, 0, 1, 5, '30505'),
(33, 0, NULL, 2, 0, '2014-10-14 02:31:52', NULL, '4077', 'ALEJANDRO RICARDO', 'TAYEH', '8515750', 'IRALA 848', 'RAMOS MEJIA', NULL, NULL, 2837, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 2, '27746'),
(34, 0, NULL, 3, 0, '2014-10-14 02:31:52', NULL, '3024', 'JUAN JOSE', 'BALZARINI', '7794599', 'TUYUTI 1279', 'HAEDO', NULL, NULL, 953, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '27750'),
(35, 0, NULL, 2, 0, '2014-10-14 02:31:52', NULL, '4293', 'CARLOS EDGARDO', 'PECHEURY', '11321005', 'ORTIZ DE ROSAS 1297', 'MORON (ESQUINA LA ROCHE)', NULL, NULL, 2837, NULL, '628 7196', NULL, 0, 0, NULL, NULL, 1, 1, 5, '30960'),
(36, 0, NULL, 2, 0, '2014-10-14 02:31:52', NULL, '4322', 'ANTONIO JESUS AMERIC', 'AMANO', '10546131', 'ARAOZ 203', 'SAN A.DE PADUA', NULL, NULL, 2837, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '31046'),
(37, 0, NULL, 2, 0, '2014-10-14 02:31:52', NULL, '9050', 'CARLOS ALBERTO', 'RUGGERI', '10529779', 'CLIERMENT 1998', 'ITUZAINGO', NULL, NULL, 1235, NULL, '623 6852', NULL, 0, 0, NULL, NULL, 0, 1, 2, '28713'),
(38, 0, NULL, 2, 0, '2014-10-14 02:31:52', NULL, '4464', 'JORGE ALBERTO', 'COTTIZ', '16150046', 'EVARISTO CARRIEGO 2533', 'EL PALOMAR', NULL, NULL, 2837, NULL, '4-460-0730', NULL, 0, 0, NULL, NULL, 1, 1, 2, '31265'),
(39, 0, NULL, 2, 0, '2014-10-14 02:31:52', NULL, '9066', 'ALBERTO', 'FROIO', '12021511', 'FRANCISCO BERRA 660', 'MORON', NULL, NULL, 687, NULL, '629 2719', NULL, 0, 0, NULL, NULL, 1, 1, 2, '28358'),
(40, 0, NULL, 2, 0, '2014-10-14 02:31:52', NULL, '4481', 'JORGE ALBERTO', 'STREMIS', '11586775', 'COLOMBIA 31', 'LIBERTAD', NULL, NULL, 2837, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '28440'),
(41, 0, NULL, 2, 0, '2014-10-14 02:31:52', NULL, '4610', 'FELIPE JOSE', 'CELLO', '12795854', 'ALSINA 468', 'MERLO', NULL, NULL, 2837, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '30179'),
(42, 0, NULL, 3, 0, '2014-10-14 02:31:52', NULL, '3365', 'JORGE OMAR', 'TOMASSONI', '4980196', 'SAN MARTIN 1611', 'SAN A.DE PADUA', NULL, NULL, 784, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '28928'),
(43, 0, NULL, 2, 0, '2014-10-14 02:31:52', NULL, '4675', 'JORGE JOSE', 'SCABBIOLO', '8,310707', 'ANGELA DORREGO 2152', 'HAEDO', NULL, NULL, 2836, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '31157'),
(44, 0, NULL, 2, 0, '2014-10-14 02:31:52', NULL, '4686', 'JUAN.A', 'RODRIGUEZ MARTINEZ', '14502662', 'NOYA 2900', 'LANUS OESTE', NULL, NULL, 2752, NULL, '240 6187', NULL, 0, 0, NULL, NULL, 1, 1, 4, '30265'),
(45, 0, NULL, 2, 0, '2014-10-14 02:31:52', NULL, '4699', 'ALBERTO ANTONIO', 'PAOLINI', '11334885', 'BERNASCONI 2832', 'ITUZAINGO', NULL, NULL, 2836, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '28017'),
(46, 0, NULL, 3, 0, '2014-10-14 02:31:52', NULL, '3255', 'GENARO AMARANTO', 'OLMO', '6718575', 'J.M. DE ROSAS 675', 'BELLA VISTA', NULL, NULL, 621, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '25126'),
(47, 0, NULL, 2, 0, '2014-10-14 02:31:52', NULL, '3581', 'ANTONIO DONATO', 'PAFUNDI', '4400051', 'MURGUIONDO 1760 PB D', 'CAPITAL', NULL, NULL, 1224, NULL, '687-6547', NULL, 0, 0, NULL, NULL, 0, 1, 2, '31365'),
(48, 0, NULL, 5, 0, '2014-10-14 02:31:52', NULL, '4790', 'RODOLFO FEDERICO', 'SCHEWE', '7277512', 'MIRANDA 740', 'HURLINGHAM', NULL, NULL, 2522, NULL, '665 9428', NULL, 0, 0, NULL, NULL, 0, 1, 4, '31364'),
(49, 0, NULL, 5, 0, '2014-10-14 02:31:52', NULL, '9013', 'ADRIAN HORACIO', 'DE SOSA CADETE', '5111338', '', '', NULL, NULL, 382, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 2, '32673'),
(50, 0, NULL, 3, 0, '2014-10-14 02:31:52', NULL, '9017', 'CARLOS ALBERTO', 'VIOLA', '8330726', 'RAWSON 247', 'HAEDO', NULL, NULL, 382, NULL, '628-3347', NULL, 0, 0, NULL, NULL, 1, 1, 2, '29268'),
(51, 0, NULL, 1, 0, '2014-10-14 02:31:52', NULL, '3322', 'NICOLAS', 'DE VITA', '', 'FORMOSA 2160', 'MERLO', NULL, NULL, 796, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '30671'),
(52, 0, NULL, 3, 0, '2014-10-14 02:31:52', NULL, '3089', 'ENRIQUE NESTOR', 'RODRIGUEZ', '4840535', 'SOCRATES 1945', 'HAEDO', NULL, NULL, 649, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '30357'),
(53, 0, NULL, 5, 0, '2014-10-14 02:31:52', NULL, '3366', 'JOSE', 'MARTINEZ', '5616720', 'CARLOS PELLEGRINI 804', 'MORON', NULL, NULL, 784, NULL, '629 0225', NULL, 0, 0, NULL, NULL, 0, 1, 5, '30204'),
(54, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '3639', 'GERARDO ALBERTO', 'PEREZ', '4888430', 'TALCAHUANO 137 DTO.3', 'TAPIALES', NULL, NULL, 1190, NULL, '655-0459', NULL, 0, 0, NULL, NULL, 0, 1, 5, '25826'),
(55, 0, NULL, 3, 0, '2014-10-14 02:31:53', NULL, '3653', 'ALBERTO MARIO', 'GRANDE', '4600114', '', '', NULL, NULL, 1347, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '32674'),
(56, 0, NULL, 1, 0, '2014-10-14 02:31:53', NULL, '3042', 'GERARDO', 'PEREZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38814'),
(57, 0, NULL, 3, 0, '2014-10-14 02:31:53', NULL, '3333', 'RAMON PONCE', 'HIDALGO', '5659751', 'RUMANIA 4554', 'MORON', NULL, NULL, 796, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '26083'),
(58, 0, NULL, 3, 0, '2014-10-14 02:31:53', NULL, '3740', 'JOSE ALBERTO', 'RODRIGUEZ', '8095636', 'JUAN DEL CAMPILLO 3524', 'SAN JUSTO', NULL, NULL, 2019, NULL, '461-0084', NULL, 0, 0, NULL, NULL, 1, 1, 5, '30196'),
(59, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '0623', 'ANTONIO', 'FELIPE', '14508707', 'ACHALA 2743', 'SAN JUSTO', NULL, NULL, 2809, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '32434'),
(60, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '3000', 'FELIX ALBERTO', 'ZAVALA', '4979192', 'PARIS 350', 'BANFIELD', NULL, NULL, 1360, NULL, '286-0699', NULL, 0, 0, NULL, NULL, 0, 1, 2, '32677'),
(61, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '3347', 'RUBEN OSVALDO', 'PEREYRA', '11214953', 'BUSTAMANTE 3945', 'WILLIAN MORRIS', NULL, NULL, 796, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '30786'),
(62, 0, NULL, 1, 0, '2014-10-14 02:31:53', NULL, '1182', 'ANTONIO EDESIO', 'MORALES', '', 'BELEN 1031', 'MERLO', NULL, NULL, 2809, NULL, '02204807208', NULL, 0, 0, NULL, NULL, 1, 1, 5, '30786'),
(63, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '9059', 'PEDRO ALFREDO', 'DI DONATO', '13235528', 'SANTIAGO DE CHILE 633', 'MORON', NULL, NULL, 588, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '32779'),
(64, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '1036', 'MIGUEL ANGEL', 'PEREZ', '11636997', 'CALVUNCURA 1427', 'JOSE C. PAZ', NULL, NULL, 2809, NULL, '0320-30233', NULL, 0, 0, NULL, NULL, 1, 1, 5, '32895'),
(65, 0, NULL, 1, 0, '2014-10-14 02:31:53', NULL, '3003', 'C.A.S.A.L. LTDA.', 'COOPERATIVA', '', 'RAWSON 513', 'HAEDO', NULL, NULL, 51, NULL, '628-6612', NULL, 0, 0, NULL, NULL, 0, 1, 2, '32975'),
(66, 0, NULL, 3, 0, '2014-10-14 02:31:53', NULL, '3363', 'ROGELIO ALEJANDRO', 'MARAVILLA', '7757744', 'PADILLA 2616', 'LIBERTAD - PDO DE MERLO', NULL, NULL, 782, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '32975'),
(67, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '4584', 'ADRIANA', 'GARCIA DE LEANDRINI', '12666826', 'SORDEAUX 370', 'BELLA VISTA', NULL, NULL, 2834, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '32983'),
(68, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '0426', 'RAUL MARCIAL', 'PEREYRA', '11540048', 'ISAAC BELSKY 455 PQUE SAN MARTIN', 'MERLO', NULL, NULL, 2804, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '33024'),
(69, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '4577', 'FABIO MIGUEL', 'FORMICHELLI', '18341926', 'PLUMERILLO 2071', 'HURLINGHAM', NULL, NULL, 2830, NULL, '665/8409', NULL, 0, 0, NULL, NULL, 1, 1, 5, '33037'),
(70, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '0262', 'SERGIO RAFAEL', 'HEINZ', '17839386', 'BLANDENGUES 212', 'EL PALOMAR', NULL, NULL, 2804, NULL, '628 2350', NULL, 0, 0, NULL, NULL, 1, 1, 5, '33043'),
(71, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '1600', 'JORGE', 'DOTTORI', '16126461', 'AZUL N?2237', 'MORON', NULL, NULL, 2801, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '33064'),
(72, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '3002', 'MARIA LAURA', 'ZACANINI', '21438369', 'CUZCO 578', 'MORON', NULL, NULL, 142, NULL, '4459-0921', NULL, 0, 0, NULL, NULL, 1, 1, 2, '32853'),
(73, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '3320', 'JORGE OSVALDO', 'BRAHIM', '13702371', 'DORREGO 494', 'MERLO', NULL, NULL, 786, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '33113'),
(74, 0, NULL, 5, 0, '2014-10-14 02:31:53', NULL, '0602', 'FELIX DANIEL', 'FLORES', '8371228', 'LAVALLOL 5471', 'GONZALEZ CATAN', NULL, NULL, 2797, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '33134'),
(75, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '3334', 'RAUL', 'PAZ', '8038339', 'TORQUINS 6048', 'ISIDRO CASANOVA', NULL, NULL, 778, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '33189'),
(76, 0, NULL, 1, 0, '2014-10-14 02:31:53', NULL, '0403', 'ROBERTO', 'NAVARRO', '', '', '', NULL, NULL, 806, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '33191'),
(77, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '3381', 'JUAN CARLOS', 'SUAREZ', '10607428', 'ANA DE GUERRIERI 744', 'HAEDO', NULL, NULL, 848, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '33193'),
(78, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '1125', 'ALFREDO ABEL', 'BIDEGAIN', '13638587', 'PASAJE MOLTEDO 4928', 'SAN MARTIN', NULL, NULL, 2787, NULL, '752 9140', NULL, 0, 0, NULL, NULL, 1, 1, 5, '33212'),
(79, 0, NULL, 5, 0, '2014-10-14 02:31:53', NULL, '0906', 'JOSE', 'NOVAS MEIRA', '7395606', 'SARANDI 4655', 'LA TABLADA  MATANZA', NULL, NULL, 2770, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '33346'),
(80, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '3008', 'GRACIELA NORA', 'BELTRAMINI', '11321007', 'SAN LUIS 816', 'MORON', NULL, NULL, 111, NULL, '628-0907', NULL, 0, 0, NULL, NULL, 0, 1, 2, '33420'),
(81, 0, NULL, 2, 0, '2014-10-14 02:31:53', NULL, '4001', 'EDGARDO CARLOS', 'GATTESCO', '10152211', 'CASTRO BARROS 374', 'S. A. DE PADUA', NULL, NULL, 2723, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '33458'),
(82, 0, NULL, 2, 0, '2014-10-14 02:31:54', NULL, '3205', 'JUAN ALBERTO', 'GOBETTO', '7768844', 'VIAMONTE 1940', 'CASTELAR', NULL, NULL, 95, NULL, '628-0175', NULL, 0, 0, NULL, NULL, 0, 1, 2, '33645'),
(83, 0, NULL, 2, 0, '2014-10-14 02:31:54', NULL, '3325', 'FELIX OCTAVIO', 'SANCHEZ', '13076347', 'JOSE E. RODO 675', 'MORON', NULL, NULL, 596, NULL, '4450-7487', NULL, 0, 0, NULL, NULL, 0, 1, 2, '33681'),
(84, 0, NULL, 2, 0, '2014-10-14 02:31:54', NULL, '1957', 'ROQUE', 'LACANNA', '10687694', 'AV. DERQUI 3855', 'CAP. FED.', NULL, NULL, 2697, NULL, '4674-2455', NULL, 0, 0, NULL, NULL, 1, 1, 5, '33735'),
(85, 0, NULL, 3, 0, '2014-10-14 02:31:54', NULL, '3329', 'VICTOR DAVID', 'SATURNINO', '7754957', 'SAN LUIS 851', 'MORON', NULL, NULL, 609, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '33735'),
(86, 0, NULL, 2, 0, '2014-10-14 02:31:54', NULL, '4536', 'ANTONIO', 'LOFFREDA', '13722721', 'ING. BRIAN 1162', 'HAEDO', NULL, NULL, 2692, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '33735'),
(87, 0, NULL, 1, 0, '2014-10-14 02:31:54', NULL, '3021', 'HUGO', 'RAMON PATTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '33828'),
(88, 0, NULL, 2, 0, '2014-10-14 02:31:54', NULL, '3576', 'MARCELO JORGE', 'ACU?A', '14819774', 'ITAPIR? 127', 'MORON', NULL, NULL, 1261, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '33837'),
(89, 0, NULL, 3, 0, '2014-10-14 02:31:54', NULL, '3338', 'ERNESTO FELIPE', 'PIERDONA', '4543093', 'SAN MART?N 710', 'MERLO', NULL, NULL, 666, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '33843'),
(90, 0, NULL, 2, 0, '2014-10-14 02:31:54', NULL, '0455', 'ALEJANDRO', 'ACU?A', '20156912', 'PTE. IBA?EZ 1263', 'MORON', NULL, NULL, 2679, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '33848'),
(91, 0, NULL, 2, 0, '2014-10-14 02:31:54', NULL, '0613', 'SERGIO RUBEN', 'IGLESIAS', '17508467', 'STA. TERESITA 8545', 'PABLO PODESTA', NULL, NULL, 2673, NULL, '769-8713', NULL, 0, 0, NULL, NULL, 1, 1, 5, '33893'),
(92, 0, NULL, 3, 0, '2014-10-14 02:31:54', NULL, '3738', 'RICARDO EDUARDO', 'CIURO', '4888177', 'LAPRIDA 1472', 'ITUZAINGO', NULL, NULL, 1059, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '33897'),
(93, 0, NULL, 2, 0, '2014-10-14 02:31:54', NULL, '3351', 'LUIS ALBERTO', 'RAMIREZ', '16240930', 'LA PAMPA Y YERSIN B?JOS? C. PAZ CUARTELV', 'MORENO', NULL, NULL, 647, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '33933'),
(94, 0, NULL, 2, 0, '2014-10-14 02:31:54', NULL, '1014', 'SALVADOR ALBERTO', 'GROSSO', '11980678', 'DRUMOND 640', 'SAN A. DE PADUA', NULL, NULL, 2660, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '33934'),
(95, 0, NULL, 2, 0, '2014-10-14 02:31:54', NULL, '4005', 'JORGE OSCAR', 'DUARTE ROMERO', '24500228', 'BALCARCE 1087', 'MERLO', NULL, NULL, 2687, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 2, '34001'),
(96, 0, NULL, 2, 0, '2014-10-14 02:31:54', NULL, '0871', 'MARIANO', 'PERALTA', '12493023', 'TRIUNVIRATO 3334', 'SAN JUSTO', NULL, NULL, 2629, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '34046'),
(97, 0, NULL, 3, 0, '2014-10-14 02:31:54', NULL, '3341', 'RICARDO', 'DELMAN', '7768302', 'CURUPAYTI 483', 'MORON', NULL, NULL, 584, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '34048'),
(98, 0, NULL, 3, 0, '2014-10-14 02:31:54', NULL, '3335', 'LUCIANO JORGE', 'ROMERO', '5761440', 'MANUEL CASTRO 1733', 'REMEDIOS DE ESCALADA', NULL, NULL, 584, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '34248'),
(99, 0, NULL, 2, 0, '2014-10-14 02:31:54', NULL, '4643', 'GABRIEL', 'QUEVEDO', '22326073', 'MALARRO 1620', 'MORON', NULL, NULL, 2591, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 2, '34050'),
(100, 0, NULL, 3, 0, '2014-10-14 02:31:54', NULL, '0029', 'RUBEN AGUSTIN', 'FERREYRA', '8236535', 'ESTOMBA 1077', 'EL PALOMAR', NULL, NULL, 2604, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '34232'),
(101, 0, NULL, 2, 0, '2014-10-14 02:31:54', NULL, '3331', 'ADRIAN VICENT', 'LAMELA', '22549362', 'NAVARRO 2573', 'CASTELAR', NULL, NULL, 584, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '34257'),
(102, 0, NULL, 2, 0, '2014-10-14 02:31:54', NULL, '4734', 'ENRIQUE', 'JOFRE', '11817863', 'PARAGUAY 649', 'BANFIELD', NULL, NULL, 2629, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 2, '34258'),
(103, 0, NULL, 2, 0, '2014-10-14 02:31:55', NULL, '3356', 'JOSE SIMON', 'GOMEZ', '8631171', 'PABLO AREGUATTI 1158', 'GRAND BOURG', NULL, NULL, 578, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '34277'),
(104, 0, NULL, 2, 0, '2014-10-14 02:31:55', NULL, '3208', 'CARLOS', 'GOBETTO', '23952430', 'VIAMONTE 1940', 'CASTELAR', NULL, NULL, 28, NULL, '628-0175', NULL, 0, 0, NULL, NULL, 0, 1, 2, '34354'),
(105, 0, NULL, 5, 0, '2014-10-14 02:31:55', NULL, '3336', 'VENTURA', 'MEZA', '8112164', 'BOLONIA 462', 'BANDFIELD', NULL, NULL, 552, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '34388'),
(106, 0, NULL, 2, 0, '2014-10-14 02:31:55', NULL, '0909', 'ALFREDO ENRIQUE', 'MU?OZ', '23572161', 'CAPDEVILA 798', 'RAFAEL CASTILLO', NULL, NULL, 2559, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '34403'),
(107, 0, NULL, 3, 0, '2014-10-14 02:31:55', NULL, '4475', 'LUIS ROBERTO', 'RAMPININI', '8558966', 'CABILDO 193', 'VILLA BALLESTER', NULL, NULL, 2584, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '34429'),
(108, 0, NULL, 2, 0, '2014-10-14 02:31:55', NULL, '3342', 'ALEJANDRO', 'GARCIA', '8537564', 'ALMAFUERTE 3822', 'SAN JUSTO LA MATANZA', NULL, NULL, 539, NULL, '4651-5217', NULL, 0, 0, NULL, NULL, 0, 1, 5, '34443'),
(109, 0, NULL, 2, 0, '2014-10-14 02:31:55', NULL, '0751', 'GABRIEL MARIO', 'ROLLI', '12566093', 'ARENGREEN 225', 'ITUZAINGO', NULL, NULL, 2545, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '34457'),
(110, 0, NULL, 2, 0, '2014-10-14 02:31:55', NULL, '9320', 'EDUARDO DANIEL', 'TATO', '16800744', 'ESCOBAR 2047', 'LIBERTAD', NULL, NULL, 2022, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '34463'),
(111, 0, NULL, 2, 0, '2014-10-14 02:31:55', NULL, '1701', 'DANIEL MARIO', 'BADANO', '13022952', 'ORIBE 77', 'ITUZAINGO', NULL, NULL, 2545, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '34466'),
(112, 0, NULL, 2, 0, '2014-10-14 02:31:55', NULL, '0528', 'JORGE LEONARDO', 'MARAVILLA', '22326162', 'CUENCA 3321', 'LIBERTAD', NULL, NULL, 2538, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '34508'),
(113, 0, NULL, 5, 0, '2014-10-14 02:31:55', NULL, '3349', 'RUBEN OSCAR', 'ROMERO', '9089967', 'SUD AMERICA 6197', 'G.DE LAFERRERE', NULL, NULL, 497, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '34614'),
(114, 0, NULL, 3, 0, '2014-10-14 02:31:55', NULL, '4533', 'CESAR HORACIO', 'GALGUERA', '14997634', 'AMATO 1484', 'HAEDO', NULL, NULL, 2542, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 2, '34618'),
(115, 0, NULL, 3, 0, '2014-10-14 02:31:55', NULL, '3343', 'RUBEN EDUARDO', 'ALVAREZ', '6189742', 'LAS FLORES 948', 'HAEDO', NULL, NULL, 497, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '34628'),
(116, 0, NULL, 2, 0, '2014-10-14 02:31:55', NULL, '0765', 'JORGE', 'PINTO DA ASCENCAO', '12765911', 'TOKIO 2863', 'HURLINGHAM', NULL, NULL, 2510, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '34635'),
(117, 0, NULL, 3, 0, '2014-10-14 02:31:55', NULL, '0754', 'JOSE', 'RIGAU', '8595897', 'FREUD 2960', 'VILLA TESEI', NULL, NULL, 2503, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '34635'),
(118, 0, NULL, 2, 0, '2014-10-14 02:31:55', NULL, '3358', 'JOSE R.', 'ALEGRE', '92022309', 'AV. ARGENTINA 4945', 'MERLO', NULL, NULL, 490, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '34659'),
(119, 0, NULL, 2, 0, '2014-10-14 02:31:55', NULL, '3323', 'JORGE ANDRES', 'SALDIVAR', '16095749', 'BUCEO 4266', 'LAFERRERE', NULL, NULL, 483, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '34694'),
(120, 0, NULL, 5, 0, '2014-10-14 02:31:55', NULL, '9074', 'CARLOS DIEGO', 'ACU?A', '11942005', 'I. MALVINAS 3065', 'SAN ANDRES', NULL, NULL, 707, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 2, '34709'),
(121, 0, NULL, 2, 0, '2014-10-14 02:31:55', NULL, '1010', 'JOSE RAFAEL', 'MALDONADO', '14420385', 'GRAL. RODRIGUEZ 2050', 'HURLINGHAM', NULL, NULL, 2489, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '34722'),
(122, 0, NULL, 2, 0, '2014-10-14 02:31:56', NULL, '0818', 'HECTOR RUBEN', 'LIGUORI', '10530068', 'I. MANNY 1320', 'GRAL. RODRIGUEZ', NULL, NULL, 2489, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '34722'),
(123, 0, NULL, 2, 0, '2014-10-14 02:31:56', NULL, '0637', 'DANIEL ANGEL', 'TOSO', '12280358', 'ZUVIRIA 618', 'MORON', NULL, NULL, 2475, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '34732'),
(124, 0, NULL, 2, 0, '2014-10-14 02:31:56', NULL, '0840', 'NESTOR HUGO', 'YEGROS', '10785715', 'GUAMINI S/N', 'VIRREY DEL PINO', NULL, NULL, 2475, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '34751'),
(125, 0, NULL, 2, 0, '2014-10-14 02:31:56', NULL, '0891', 'OSCAR C.', 'GALVEZ', '12785387', 'DERQUI N?530', 'EL PALOMAR', NULL, NULL, 2475, NULL, '4758-0374', NULL, 0, 0, NULL, NULL, 1, 1, 5, '34752'),
(126, 0, NULL, 2, 0, '2014-10-14 02:31:56', NULL, '3348', 'JAVIER ALEJANDRO', 'SALAS', '20318839', 'SANTA TERESA 3434', 'MORON', NULL, NULL, 455, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '34772'),
(127, 0, NULL, 5, 0, '2014-10-14 02:31:56', NULL, '4644', 'SAMUEL', 'CUCINIELLO', '8960190', 'MARCONI N?3973', 'I. CASANOVA', NULL, NULL, 2500, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 2, '34794'),
(128, 0, NULL, 2, 0, '2014-10-14 02:31:56', NULL, '1405', 'GABRIEL ALEJANDRO', 'MARINOTTI', '16050713', 'LAGOMARSINO 556', 'MERLO', NULL, NULL, 2461, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '34795'),
(129, 0, NULL, 3, 0, '2014-10-14 02:31:56', NULL, '3203', 'ESTANISLAO AMERICO', 'MORALES', '3457976', 'RODO 117', 'MORON BARRIO GAONA', NULL, NULL, 7, NULL, '450-7584', NULL, 0, 0, NULL, NULL, 0, 1, 2, '34835'),
(130, 0, NULL, 1, 0, '2014-10-14 02:31:56', NULL, '', '', '', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, ''),
(131, 0, NULL, 5, 0, '2014-10-14 02:31:56', NULL, '3339', 'JULIAN', 'VELAZQUEZ', '3583604', 'ESTIVAO Y SIMON PEREZ', 'GONZALEZ CATAN', NULL, NULL, 420, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '34919'),
(132, 0, NULL, 2, 0, '2014-10-14 02:31:56', NULL, '3074', 'ARTURO', 'SOTELO', '', '', '', NULL, NULL, 7, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, ''),
(133, 0, NULL, 2, 0, '2014-10-14 02:31:56', NULL, '4022', 'HECTOR OSCAR', 'FIERRO', '6084142', 'DANTE 5418 PTA. BAJA', 'JOSE MARIA BOSCH', NULL, NULL, 2430, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '35108'),
(134, 0, NULL, 1, 0, '2014-10-14 02:31:56', NULL, '', '', '', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, ''),
(135, 0, NULL, 2, 0, '2014-10-14 02:31:56', NULL, '3346', 'RUBEN ALFONSO', 'REBERTE', '13645401', 'JOSE MARIA TORRES 667', 'MORON', NULL, NULL, 364, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '35179'),
(136, 0, NULL, 1, 0, '2014-10-14 02:31:56', NULL, '3300', '', 'PE?A DE FUTBOL', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '35221'),
(137, 0, NULL, 1, 0, '2014-10-14 02:31:56', NULL, '3301', '', 'PE?A PESCA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '35228'),
(138, 0, NULL, 2, 0, '2014-10-14 02:31:56', NULL, '0721', 'GUILLERMO ENRIQUE', 'CONTI', '13068373', 'BRASIL 1338', 'MORENO', NULL, NULL, 2356, NULL, '1568866344', NULL, 0, 0, NULL, NULL, 1, 1, 5, '35269'),
(139, 0, NULL, 2, 0, '2014-10-14 02:31:56', NULL, '9232', 'ADALBERTO HORACIO', 'ZABALZA', '11615912', 'LA PLATA 2844', 'LUJAN', NULL, NULL, 1094, NULL, '0323-28195', NULL, 0, 0, NULL, NULL, 1, 1, 5, '35712'),
(140, 0, NULL, 1, 0, '2014-10-14 02:31:56', NULL, '3215', 'CLAUDIO', 'SILVETTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '35746'),
(141, 0, NULL, 2, 0, '2014-10-14 02:31:56', NULL, '0894', 'MIGUEL', 'WARZALA', '7619535', 'POSO N?590', 'LA MATANZA', NULL, NULL, 2188, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '35983'),
(142, 0, NULL, 2, 0, '2014-10-14 02:31:56', NULL, '3260', 'MARCIAL', 'ZAVALA', '6497928', 'CHIVILCOY N?2516', 'CASTELAR', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '35748'),
(143, 0, NULL, 1, 0, '2014-10-14 02:31:56', NULL, '', '', '', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, ''),
(144, 0, NULL, 2, 0, '2014-10-14 02:31:56', NULL, '4560', 'LUCIA ESTELA', 'CANNICI', '11690667', 'RIO PIEDRAS 255 P.B. C', 'MORON', NULL, NULL, 2276, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 2, '35760'),
(145, 0, NULL, 2, 0, '2014-10-14 02:31:56', NULL, '0561', 'LUIS ALBERTO', 'CARNEVALI', '14988115', 'CNEL. ROJAS 3151', 'LANUS OESTE', NULL, NULL, 2230, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '35808'),
(146, 0, NULL, 2, 0, '2014-10-14 02:31:56', NULL, '0466', 'ALEJANDRO JOSE', 'REY', '22548741', 'LEON GALLO 2812', 'SAN JUSTO', NULL, NULL, 2209, NULL, '441-8934', NULL, 0, 0, NULL, NULL, 1, 1, 5, '35892'),
(147, 0, NULL, 2, 0, '2014-10-14 02:31:56', NULL, '1153', 'WALTER FABIAN', 'DIAZ', '18089449', 'PAMPA 1660', 'EL PALOMAR', NULL, NULL, 2069, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '36509'),
(148, 0, NULL, 1, 0, '2014-10-14 02:31:57', NULL, '0462', 'SERGIO', 'GARCIA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '35944'),
(149, 0, NULL, 2, 0, '2014-10-14 02:31:57', NULL, '0902', 'ALMISE', 'ROMERO', '10940145', 'GRANADA 5016', 'ISIDRO CASANOVA', NULL, NULL, 2160, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '36125'),
(150, 0, NULL, 2, 0, '2014-10-14 02:31:57', NULL, '4671', 'DARIO RUBEN', 'LOPEZ', '16589603', 'TTE. ZATTINO 2699', 'ITUZAINGO', NULL, NULL, 2129, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '36397'),
(151, 0, NULL, 1, 0, '2014-10-14 02:31:57', NULL, '9068', 'RICARDO', 'TURATI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '36340'),
(152, 0, NULL, 1, 0, '2014-10-14 02:31:57', NULL, '3238', 'CRISTA', 'KAHMAN DE MANSILLA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '36340'),
(153, 0, NULL, 1, 0, '2014-10-14 02:31:57', NULL, '3240', 'ALDO', 'BRUNO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '36340'),
(154, 0, NULL, 1, 0, '2014-10-14 02:31:57', NULL, '3242', 'CARLOS', 'DURE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '36382'),
(155, 0, NULL, 3, 0, '2014-10-14 02:31:57', NULL, '3245', 'NESTOR', 'COSTA', '7730779', 'GUIDO SPANO 1765', 'VILLA LUZURIAGA', NULL, NULL, 645, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '25131'),
(156, 0, NULL, 1, 0, '2014-10-14 02:31:57', NULL, '', '', '', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 1, ''),
(157, 0, NULL, 2, 0, '2014-10-14 02:31:57', NULL, '3259', 'NICOLAS', 'SUAREZ', '13020753', 'EL CONDOR 770', 'HURLINGHAM', NULL, NULL, 203, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '35373'),
(158, 0, NULL, 2, 0, '2014-10-14 02:31:57', NULL, '3090', 'JOSE JORGE', 'DIEGUEZ', '4414881', 'MAESTRO ROCHA MONTARCE 1441', 'HAEDO', NULL, NULL, 0, NULL, '4650-8185', NULL, 0, 0, NULL, NULL, 0, 1, 4, '36658'),
(159, 0, NULL, 2, 0, '2014-10-14 02:31:57', NULL, '3276', 'ALDO', 'SOTELO', '8480005', 'GUAYANAS Y CHILE', 'LIBERTAD - MERLO', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '36908'),
(160, 0, NULL, 1, 0, '2014-10-14 02:31:57', NULL, '3277', 'PABLO', 'TIALDE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '36924'),
(161, 0, NULL, 2, 0, '2014-10-14 02:31:57', NULL, '3278', 'EMILIO', 'CRAVERO', '17224743', 'BECCAR 975', 'HAEDO', NULL, NULL, 0, NULL, '4443-3539', NULL, 0, 0, NULL, NULL, 0, 1, 2, '36924'),
(162, 0, NULL, 2, 0, '2014-10-14 02:31:57', NULL, '3279', 'MARIO', 'RODRIGUEZ', '14555355', 'SORDEUX 1626', 'MORON', NULL, NULL, 610, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '33854'),
(163, 0, NULL, 2, 0, '2014-10-14 02:31:57', NULL, '3280', 'ALFREDO', 'ALVARENGA', '7670036', 'M. TORRES 3625', 'VILLA TESEI', NULL, NULL, 0, NULL, '4450-8607', NULL, 0, 0, NULL, NULL, 0, 1, 5, '36984'),
(164, 0, NULL, 2, 0, '2014-10-14 02:31:57', NULL, '3281', 'ROBERTO CARLOS', 'AITA', '12678786', 'RIOBAMBA 276', 'TAPIALES', NULL, NULL, 0, NULL, '4442-7698', NULL, 0, 0, NULL, NULL, 0, 1, 5, '36990'),
(165, 0, NULL, 1, 0, '2014-10-14 02:31:57', NULL, '0957', 'RUBEN', 'NEGRO WESTON', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37112'),
(166, 0, NULL, 1, 0, '2014-10-14 02:31:57', NULL, '0912', 'VICTOR', 'CAMARA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37113'),
(167, 0, NULL, 1, 0, '2014-10-14 02:31:57', NULL, '9072', 'JORGE', 'MAZZEI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37113'),
(168, 0, NULL, 1, 0, '2014-10-14 02:31:57', NULL, '3655', 'SEBASTIAN', 'POSSE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37117'),
(169, 0, NULL, 2, 0, '2014-10-14 02:31:57', NULL, '0060', 'ALEJANDRO LUIS', 'TURPO', '17558210', 'DAVINCCI 4225', 'LA FERRERE', NULL, NULL, 1481, NULL, '4698-0058', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38938'),
(170, 0, NULL, 1, 0, '2014-10-14 02:31:57', NULL, '0220', 'MIGUEL', 'PALLEROS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37117'),
(171, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '3337', 'ARIEL', 'MELENDEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37117'),
(172, 0, NULL, 2, 0, '2014-10-14 02:31:58', NULL, '0566', 'SANTIAGO', 'CARDACHI', '10638433', 'RIO DE LA PLATA 883', 'MORON', NULL, NULL, 1894, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37267'),
(173, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '0647', 'SERGIO', 'FERREIRA', '', '', '', NULL, NULL, 782, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40672'),
(174, 0, NULL, 3, 0, '2014-10-14 02:31:58', NULL, '0660', 'GUSTAVO', 'BORGHI', '16273096', 'LOBOS 1735', 'CASTELAR', NULL, NULL, 1803, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37117'),
(175, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '0769', 'NORBERTO', 'POSSE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37117'),
(176, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '0787', 'ADRIAN', 'BENITEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37117'),
(177, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '0801', 'FRANCISCO', 'MAZZEO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37117'),
(178, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '3352', 'CARLOS', 'MORALES', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37117'),
(179, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '3353', 'HECTOR', 'MELENDEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37117'),
(180, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '3354', 'ROQUE', 'MATEO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37117'),
(181, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '3355', 'ROBERTO', 'EZQUIVEL', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37117'),
(182, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '3359', 'CLAUDIA', 'MARTIN', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37117'),
(183, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '1109', 'NESTOR', 'MORENO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37117'),
(184, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '1110', 'JAVIER', 'VARELA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37117'),
(185, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '3577', 'WALTER', 'DILAVELLO', '', 'COLIAVEO 1342', 'JOSE C. PAZ', NULL, NULL, 392, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37642'),
(186, 0, NULL, 3, 0, '2014-10-14 02:31:58', NULL, '3147', 'JUAN ENRIQUE', 'AVILA', '8128996', 'RIZZO PATRON 6001', 'LA FERRERE', NULL, NULL, 843, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37357'),
(187, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '4796', 'GERD', 'BEHNERT', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '37117'),
(188, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '3321', '', 'MACHIONNE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37117'),
(189, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '3306', 'ALBERTO HORACIO', 'SARRU', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37118'),
(190, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '4801', 'GABRIEL', 'PONCE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '37118'),
(191, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '3305', 'LUCIANO', 'SEGUROTTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37118'),
(192, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '3304', 'EDUARDO', 'CALABRIA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37118'),
(193, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '3364', 'DANIEL', 'KOCH', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37118'),
(194, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '4784', 'EDUARDO', 'HOERMANN', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37118'),
(195, 0, NULL, 2, 0, '2014-10-14 02:31:58', NULL, '3380', 'MARCELA', 'GIMBATTI', '20357808', 'ZABALA 1436', 'CASTELAR', NULL, NULL, 42, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37118'),
(196, 0, NULL, 1, 0, '2014-10-14 02:31:58', NULL, '4735', 'MARCELO', 'MAURO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '37118'),
(197, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '4716', 'REGINA', 'HERZIG', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '37118'),
(198, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '4615', 'MARCELA A.', 'URRUNAGA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37125'),
(199, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '3350', 'ALBERTO', 'NANNINI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37137'),
(200, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '3100', 'ALFREDO', 'LUIS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37141'),
(201, 0, NULL, 3, 0, '2014-10-14 02:31:59', NULL, '4121', 'CARLOS ALBERTO', 'SANCHEZ', '11129970', 'AV. SAN MARTIN 4178', 'LANUS OESTE', NULL, NULL, 2045, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '35037'),
(202, 0, NULL, 2, 0, '2014-10-14 02:31:59', NULL, '3368', 'JUAN ESTEBAN', 'YANIVELLI', '8608888', 'SUD AMERICA 5486', 'LA FERRERE', NULL, NULL, 14, NULL, '4457-2220', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37228'),
(203, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '4276', 'RAFAEL', 'FIGOLA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37243'),
(204, 0, NULL, 2, 0, '2014-10-14 02:31:59', NULL, '0655', 'RUBEN OSVALDO', 'PEREYRA', '11214953', 'BUSTAMANTE 3945', 'WILLIAN MORRIS', NULL, NULL, 2690, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37244'),
(205, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '4779', 'EDUARDO', 'RUCKERT', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '37382'),
(206, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '0652', 'LUIS R.', 'VECOLI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37382'),
(207, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '4541', 'SILVIO', 'SENINI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37383'),
(208, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '3638', 'LUIS OSVALDO', 'SILVA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37383'),
(209, 0, NULL, 2, 0, '2014-10-14 02:31:59', NULL, '4006', 'LUIS', 'LEGUIZAMON', '13235621', 'JOSE FUSCH 1715', '', NULL, NULL, 1070, NULL, '4697-9373', NULL, 0, 0, NULL, NULL, 1, 1, 2, '40137'),
(210, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '9070', 'JOSE', 'MORENA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37389'),
(211, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '4081', 'JORGE', 'POLETILO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '37396'),
(212, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '3372', 'RUBEN', 'SANCHEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37505'),
(213, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '1630', 'OSCAR', 'ACU?A', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37516'),
(214, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '4040', 'PASCUAL', 'CIANFAGNA', '', 'OLIVERA 2455', 'ITUZAINGO', NULL, NULL, 2503, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '37517'),
(215, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '1141', 'RAMIRO', 'RODRIGUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37537'),
(216, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '4515', 'JUAN JOSE', 'URANGA', '', 'O CONNOR 46', 'RAMOS MEJIA', NULL, NULL, 1870, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 2, '37551'),
(217, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '0070', 'FERNANDO', 'BLANCO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(218, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '0127', 'JOSE MARIA', 'BEROLEGUI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(219, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '0152', 'HORACIO', 'MARENGO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(220, 0, NULL, 1, 0, '2014-10-14 02:31:59', NULL, '0204', 'ALBERTO', 'AGUIRRE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(221, 0, NULL, 2, 0, '2014-10-14 02:31:59', NULL, '0257', 'JORGE', 'BRAHIM', '13702371', 'DORREGO 494', 'MERLO', NULL, NULL, 2543, NULL, '0220-483-6753', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37578'),
(222, 0, NULL, 2, 0, '2014-10-14 02:31:59', NULL, '0282', 'PABLO', 'SANCHEZ', '27311821', 'SAN JUAN 2740', 'MERLO', NULL, NULL, 394, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(223, 0, NULL, 2, 0, '2014-10-14 02:32:00', NULL, '0411', 'FABIO', 'FERREIRA', '17821960', 'FORET 702', 'LIBERTAD - MERLO', NULL, NULL, 1817, NULL, '0220-494 6800', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37578'),
(224, 0, NULL, 1, 0, '2014-10-14 02:32:00', NULL, '0430', 'ORFILIO', 'CHAMORRO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(225, 0, NULL, 1, 0, '2014-10-14 02:32:00', NULL, '0439', 'JUAN', 'DEPPELER', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(226, 0, NULL, 1, 0, '2014-10-14 02:32:00', NULL, '0459', 'ERNESTO', 'PIERDONA', '', '', '', NULL, NULL, 2355, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37578'),
(227, 0, NULL, 5, 0, '2014-10-14 02:32:00', NULL, '0476', 'JULIO', 'QUINTERO', '11584231', 'SAN JUAN 2583', 'MERLO', NULL, NULL, 2349, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37578'),
(228, 0, NULL, 1, 0, '2014-10-14 02:32:00', NULL, '0515', 'JUAN', 'LOMBARDO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(229, 0, NULL, 1, 0, '2014-10-14 02:32:00', NULL, '3533', 'OSVALDO', 'ARREGUI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(230, 0, NULL, 2, 0, '2014-10-14 02:32:00', NULL, '0604', 'JOSE', 'MILANESI', '12599314', 'MARCELO T DE ALVEAR 1369', 'JOSE C. PAZ', NULL, NULL, 1782, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37578'),
(231, 0, NULL, 1, 0, '2014-10-14 02:32:00', NULL, '0610', 'DANIEL', 'ROMANELLI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(232, 0, NULL, 1, 0, '2014-10-14 02:32:00', NULL, '0638', 'MARCELO', 'FREIRE DA SILVA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(233, 0, NULL, 2, 0, '2014-10-14 02:32:00', NULL, '0646', 'RUBEN', 'REBERTE', '13645401', 'ORDONEZ 1276', 'V. TESEI', NULL, NULL, 2048, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38065'),
(234, 0, NULL, 1, 0, '2014-10-14 02:32:00', NULL, '0651', 'JOSE', 'RAMOS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(235, 0, NULL, 1, 0, '2014-10-14 02:32:00', NULL, '0674', 'JUAN', 'OKAHISA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(236, 0, NULL, 1, 0, '2014-10-14 02:32:00', NULL, '0717', 'ROBERTO', 'RUGGIERI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(237, 0, NULL, 1, 0, '2014-10-14 02:32:00', NULL, '0728', 'OMAR', 'DIAZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(238, 0, NULL, 1, 0, '2014-10-14 02:32:00', NULL, '0738', 'CARLOS', 'ESTEVES', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(239, 0, NULL, 1, 0, '2014-10-14 02:32:00', NULL, '0747', 'LUIS', 'PEREYRA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(240, 0, NULL, 1, 0, '2014-10-14 02:32:00', NULL, '0762', 'JOSE', 'LA FRANCA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(241, 0, NULL, 1, 0, '2014-10-14 02:32:00', NULL, '0775', 'OSCAR', 'VILLANUEVA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(242, 0, NULL, 1, 0, '2014-10-14 02:32:00', NULL, '0782', 'OMAR', 'KUZMICH', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(243, 0, NULL, 1, 0, '2014-10-14 02:32:00', NULL, '0790', 'GERARDO', 'PINTO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(244, 0, NULL, 5, 0, '2014-10-14 02:32:00', NULL, '0804', 'JORGE', 'RAMIREZ', '21090575', 'BILBAO 770', 'MERLO', NULL, NULL, 1705, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38077'),
(245, 0, NULL, 2, 0, '2014-10-14 02:32:00', NULL, '4200', 'CARLOS ALBERTO', 'CARBALLO', '17323614', 'MALVINAS 3225', 'SAN MIGUEL', NULL, NULL, 1838, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37813'),
(246, 0, NULL, 2, 0, '2014-10-14 02:32:00', NULL, '0820', 'HORACIO', 'REGNER', '14317332', 'JOSE M. PAZ 1885', 'SAN MIGUEL', NULL, NULL, 1212, NULL, '4664-5962', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39757'),
(247, 0, NULL, 1, 0, '2014-10-14 02:32:01', NULL, '0830', 'CARLOS', 'MORALES', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(248, 0, NULL, 1, 0, '2014-10-14 02:32:01', NULL, '0837', 'CLAUDIO', 'CRUCE?O', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(249, 0, NULL, 1, 0, '2014-10-14 02:32:01', NULL, '0857', 'ROQUE', 'MATTEO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(250, 0, NULL, 5, 0, '2014-10-14 02:32:01', NULL, '0915', 'RAUL', 'MOSSO', '17034069', 'PTE. ILLIA 2271', 'MU?IZ', NULL, NULL, 1768, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37817'),
(251, 0, NULL, 1, 0, '2014-10-14 02:32:01', NULL, '0955', 'CARLOS', 'PEREZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(252, 0, NULL, 1, 0, '2014-10-14 02:32:01', NULL, '0998', 'GASPAR', 'CARBALLO', '', '', '', NULL, NULL, 0, NULL, '46624866', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(253, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '1008', 'JUAN', 'MICHNIUK', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(254, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '1012', 'ROBERTO', 'POTERALA', '', '', '', NULL, NULL, 728, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37578'),
(255, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '1090', 'RAUL', 'RIOS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(256, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '1148', 'ABEL', 'MOREYRA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(257, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '2472', 'ADRIAN', 'LAMELA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(258, 0, NULL, 5, 0, '2014-10-14 02:32:02', NULL, '2501', 'OSMAR OSVALDO', 'BARGAS', '8378983', 'FRIAS 5016', 'ADROGUE', NULL, NULL, 2322, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37578'),
(259, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '2502', 'HORACIO', 'SANCHEZ', '', '', '', NULL, NULL, 1589, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37578'),
(260, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '2504', 'SERGIO', 'TURCONI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(261, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '4281', 'MARCELO', 'BARBAGELATA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37578'),
(262, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '0612', 'PEDRO', 'ORUE', '', '', '', NULL, NULL, 2270, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37580'),
(263, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '1177', 'LEONDINO', 'CHIOCARELLO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37580'),
(264, 0, NULL, 2, 0, '2014-10-14 02:32:02', NULL, '3374', 'CLAUDIO ALEJANDRO', 'GONZALEZ', '18423220', 'BRANSEN 1917', 'ITUZAINGO', NULL, NULL, 14, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37586'),
(265, 0, NULL, 2, 0, '2014-10-14 02:32:02', NULL, '4025', 'GABRIEL ANTONIO', 'HERRERA', '18171059', 'GIBRALTAR 1024', 'HURLINGHAM', NULL, NULL, 1842, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '37656'),
(266, 0, NULL, 2, 0, '2014-10-14 02:32:02', NULL, '0632', 'RUBEN', 'SANCHEZ', '14246224', 'ALBENIZ 2932', 'HURLINGHAM', NULL, NULL, 1796, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37677'),
(267, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '0935', 'JORGE ANGEL', 'DIAZ EDUARDO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37687'),
(268, 0, NULL, 2, 0, '2014-10-14 02:32:02', NULL, '0688', 'MARCELO VICTOR', 'MALDONADO', '18003151', 'PERITO MORENO 10221', 'MORENO', NULL, NULL, 1726, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37972'),
(269, 0, NULL, 2, 0, '2014-10-14 02:32:02', NULL, '0681', 'JORGE EVARISTO', 'LOBOS', '14259506', 'ACERBONI 318', 'JOSE C. PAZ', NULL, NULL, 1782, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37687'),
(270, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '3540', 'ROMAN GUILLERMO', 'RODRIGUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37687'),
(271, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '2507', 'JUAN PABLO', 'MIGUEL', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37687');
INSERT INTO `socios` (`id`, `id_sexo`, `id_estudio`, `id_tipo_documento`, `id_tipo_socio`, `created_at`, `updated_at`, `nro_legajo`, `nombre`, `apellido`, `nro_documento`, `direccion`, `localidad`, `socio_futbol`, `socio_pesca`, `valor_historico`, `tel_cel`, `tel_part`, `tel_lab`, `estudios_id`, `tipos_socios_id`, `fecha_nac`, `id_usuario`, `socio_coop`, `socio_cocheria`, `id_empresa`, `fecha_inicio`) VALUES
(272, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '9035', 'HECTOR CESAR', 'BERTOLONE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 2, '37693'),
(273, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '4029', 'EDUARDO', 'RUCKERT', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '37694'),
(274, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '4032', 'GERD', 'BEHNERT', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '37694'),
(275, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '4033', 'GABRIEL', 'PONCE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '37694'),
(276, 0, NULL, 2, 0, '2014-10-14 02:32:02', NULL, '4802', 'ROWE', 'PISANI', '93156969', 'CASCARAVILLA 2099', '', NULL, NULL, 1448, NULL, '4661-2602', NULL, 0, 0, NULL, NULL, 1, 1, 4, '37694'),
(277, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '4035', 'GERARDO', 'FERRARIO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '37694'),
(278, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '4516', 'PABLO', 'SARRINCHA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '37698'),
(279, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '4826', 'PATRICIO', 'FRYDMAN', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(280, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '4757', 'MIGUEL', 'ASTOLFO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(281, 0, NULL, 1, 0, '2014-10-14 02:32:02', NULL, '4753', 'PATRICIA', 'GOMEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(282, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '4656', 'PASCUAL', 'DOCIMO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(283, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '3559', 'MIGUEL', 'GILI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(284, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '4282', 'MARCOS', 'FOTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(285, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '2527', 'DIEGO', 'ACU?A', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37698'),
(286, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '2514', 'EZEQUIEL', 'INFANTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37698'),
(287, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '2512', 'ARIEL', 'ZOYA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37698'),
(288, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '2511', 'SEBASTIAN', 'PAEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37698'),
(289, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '2510', 'ALEJANDRO', 'RACKAUSKAS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37698'),
(290, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '2509', 'GUSTAVO', 'YEGROS', '', 'GUAMINI 10076', 'VIRREY DEL PINO', NULL, NULL, 1768, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37698'),
(291, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '9071', 'MARTIN', 'BRAN', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(292, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '9073', 'RICARDO', 'TURATI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(293, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '3502', 'RICARDO', 'STOLL', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37698'),
(294, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '3500', 'JORGE', 'PEDROZA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(295, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '3555', 'DANIEL', 'KOCH', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '37698'),
(296, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '3504', 'ROQUE ANTONIO', 'RUGGIERO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(297, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '3505', 'YANINA', 'DONOSO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(298, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '3506', 'MARIO', 'BUZZALINO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(299, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '3507', 'MAURICIO', 'HIDALGO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(300, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '3508', 'ALBERTO', 'SARRU', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(301, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '3509', 'GABRIELA', 'CASTILLO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(302, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '3510', 'JORGE', 'VIGUERA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(303, 0, NULL, 2, 0, '2014-10-14 02:32:03', NULL, '3513', 'LUIS MARIO', 'GOBETTO', '7783980', 'MERCEDES 1706', 'CASTELAR', NULL, NULL, 0, NULL, '4627-8332', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38938'),
(304, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '3514', 'LUIS', 'ALFREDO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(305, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '3515', 'MARCELINO', 'RUIZ DIAS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(306, 0, NULL, 1, 0, '2014-10-14 02:32:03', NULL, '3516', 'MARIANO', 'DIAZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(307, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '3517', 'HUGO', 'MARTINEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(308, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '3518', 'LEANDRO', 'RUIZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(309, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '3519', 'REYNA', 'ORELLANA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(310, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '3520', 'DANTE', 'ORELLANA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(311, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '3521', 'LIDIA', 'NU?EZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(312, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '3522', 'LEONARDO', 'CALABRIA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(313, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '3523', 'JOSE', 'MARTINEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(314, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '3524', 'MAURICIO', 'PAOLONI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(315, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '3525', 'JUAN CARLOS', 'FIGUEROA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(316, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '3526', 'OSVALDO', 'SILVA', '', '', '', NULL, NULL, 14, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37698'),
(317, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '3527', 'MARTIN', 'MEDICA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(318, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '3528', 'DANIEL', 'SAPORITI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(319, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '3530', 'GUILLERMO', 'GUERRERO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(320, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '3531', 'FABIANA', 'RAELE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37698'),
(321, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '3532', 'AMADO', 'ROMERO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '37698'),
(322, 0, NULL, 5, 0, '2014-10-14 02:32:04', NULL, '2542', 'JULIO CESAR', 'GALEANO', '26933849', 'MEXICO YSV', 'GONZALEZ CATAN', NULL, NULL, 1782, NULL, '15-3306-3020', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37740'),
(323, 0, NULL, 2, 0, '2014-10-14 02:32:04', NULL, '0712', 'JUAN CARLOS', 'GIMENEZ', '12909306', 'EDISON 3115', 'ISIDRO CASANOVA', NULL, NULL, 1536, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37748'),
(324, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '3023', 'MANUEL RODOLFO', 'OMAR', '', 'JOSE MARIA QUINTEROS 681', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37764'),
(325, 0, NULL, 5, 0, '2014-10-14 02:32:04', NULL, '0682', 'SERGIO ALEJANDRO', 'TRAVAGLINI', '20822381', 'P. GIORELLO 1875', 'STOS. LUGARES', NULL, NULL, 1761, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37834'),
(326, 0, NULL, 2, 0, '2014-10-14 02:32:04', NULL, '0663', 'ANTONIO LUIS', 'PASTORINO', '17736479', 'GARIBALDI 2451', '', NULL, NULL, 1747, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37911'),
(327, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '0545', 'ROBERTO', 'FIGUEROA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(328, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '0580', 'ALEJANDRO', 'TAFURI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(329, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '0581', 'DAVID', 'KUZMICH', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(330, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '0615', 'JUAN', 'ROMANO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(331, 0, NULL, 2, 0, '2014-10-14 02:32:04', NULL, '0781', 'ESTEBAN', 'MIJATOVICH', '17273278', 'ANDALGALA 2750', 'ISIDRO CASANOVA', NULL, NULL, 1719, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37987'),
(332, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '0831', 'RICHARD', 'JAIMES', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(333, 0, NULL, 3, 0, '2014-10-14 02:32:04', NULL, '0877', 'ALFREDO', 'ALVARENGA', '7670036', 'TORRES 3625', 'V. TESEI', NULL, NULL, 2404, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38027'),
(334, 0, NULL, 1, 0, '2014-10-14 02:32:04', NULL, '0892', 'MIGUEL', 'SANCHEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(335, 0, NULL, 2, 0, '2014-10-14 02:32:05', NULL, '3539', 'CARLOS ALBERTO', 'GOMEZ', '', 'GARIBALDI 3935', 'SAN JUSTO', NULL, NULL, 221, NULL, '4486-6847', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38175'),
(336, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '0911', 'CARLOS', 'MARTINEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(337, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '0921', 'OSCAR', 'NOVGORODSKY', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(338, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '0940', 'CARLOS', 'BELFORTE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(339, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '0961', 'MARCOS', 'LUNA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(340, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '1038', 'WALTER', 'MACIA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(341, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '1100', 'ORLANDO', 'RAMIREZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(342, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '2145', 'ALDO', 'BERGAGLIO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(343, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '2515', 'JOSE', 'RUSU', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(344, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '2516', 'PABLO CARLOS', 'FERNANDEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(345, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '2517', 'ANDRES', 'MIGUELES', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(346, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '2518', 'CESAR', 'ROMERO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(347, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '2519', 'PABLO', 'FINOCCHIARO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(348, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '2521', 'ALBERTO', 'SCABBIOLO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(349, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '2522', 'MARTIN', 'HERRERA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(350, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '2523', 'CARLOS', 'FERREIRA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(351, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '2525', 'ROBERTO', 'ARAUJO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '37915'),
(352, 0, NULL, 2, 0, '2014-10-14 02:32:05', NULL, '3307', 'ALFREDO', 'LOMBARDI', '18127479', 'MONTE 1471', 'CASTELAR', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '37937'),
(353, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '2530', 'GUSTAVO DAVID', 'UNUKOWSKI', '', 'CHOCANO Y COSTA', '', NULL, NULL, 1726, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '37974'),
(354, 0, NULL, 2, 0, '2014-10-14 02:32:05', NULL, '2539', 'OSCAR MARCELO', 'ACU?A', '30576988', 'J.B. DE MARQUEZ 4477', 'MORON', NULL, NULL, 1719, NULL, '4697-3142', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38034'),
(355, 0, NULL, 2, 0, '2014-10-14 02:32:05', NULL, '4039', 'ROBERTO', 'AITA', '13678786', 'RIOBAMBA 276', 'TAPIALES', NULL, NULL, 2218, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '38034'),
(356, 0, NULL, 2, 0, '2014-10-14 02:32:05', NULL, '4037', 'AMADO ANGEL', 'ROMERO', '8290928', 'FILIPINAS 727', 'ITUZAINGO', NULL, NULL, 1758, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '38034'),
(357, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '4700', 'DANIEL', 'TOMOLATTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38042'),
(358, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '4030', 'HUGO', 'PONCE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38042'),
(359, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '4532', 'JOSE', 'LASCANO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38042'),
(360, 0, NULL, 1, 0, '2014-10-14 02:32:05', NULL, '4483', 'JORGE', 'COSSIO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38042'),
(361, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '4368', 'ROMULO', 'AMAYA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38042'),
(362, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '4309', 'GERARDO', 'BERNACHGA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38042'),
(363, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '4089', 'DIEGO', 'BRUNO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38042'),
(364, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '4038', 'MIGUEL', 'DI CHENNA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38042'),
(365, 0, NULL, 2, 0, '2014-10-14 02:32:06', NULL, '4036', 'JOSE RAFAEL', 'BLANCO', '11466222', 'BRASIL 2386', 'MERLO', NULL, NULL, 1098, NULL, '1563543517', NULL, 0, 0, NULL, NULL, 1, 1, 4, '40101'),
(366, 0, NULL, 2, 0, '2014-10-14 02:32:06', NULL, '3584', 'JULIO', 'ONTIVERO', '7740418', 'JOSE MIRO 374', 'LIBERTAD MERLO', NULL, NULL, 363, NULL, '02204943937', NULL, 0, 0, NULL, NULL, 1, 1, 4, '38042'),
(367, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '4814', 'CARLOS', 'BORZONE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38042'),
(368, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '4547', 'SILVIO', 'SENINI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38042'),
(369, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '3534', 'PABLO (CAFETERO)', 'GARCIA NICORA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38042'),
(370, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '3535', 'OSVALDO', 'LAZARTE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38814'),
(371, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '3536', 'HOERMANN', 'BECCHETTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38042'),
(372, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '3537', 'EZEQUIEL', 'FERNANDEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38042'),
(373, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '3538', 'JORGE', 'ORELLANA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38042'),
(374, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '4800', 'JUAN MANUEL', 'NU?EZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38042'),
(375, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '4712', 'DIEGO A.', 'FRYDMAN', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38042'),
(376, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '3541', 'JORGE RUBEN', 'DIAZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38042'),
(377, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '4810', 'JAVIER', 'BERARDO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38048'),
(378, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '4369', 'GUSTAVO DANIEL', 'RIPAMONTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38049'),
(379, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '3544', 'FABIAN', 'MATTUS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38049'),
(380, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '4670', 'DANIEL CARLOS', 'GRIGNASCHI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38049'),
(381, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '4529', 'JUAN MANUEL', 'COSSU', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38049'),
(382, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '4524', 'GASTON', 'MU?OZ', '', '', '', NULL, NULL, 1224, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '39512'),
(383, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '4310', 'ARIEL', 'BOHONOS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38049'),
(384, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '3543', 'MARIANO', 'RUGGERI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38049'),
(385, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '4020', 'JOSE LUIS', 'LEVAR', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38049'),
(386, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '4109', 'HECTOR', 'RUSSO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38049'),
(387, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '3542', 'FERNANDO', 'COLLA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38049'),
(388, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '2533', 'ROMAN G.', 'RODRIGUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38049'),
(389, 0, NULL, 2, 0, '2014-10-14 02:32:06', NULL, '2534', 'MARCELO ARIEL', 'AVENDA?O', '26719354', 'BELSKY 410', 'MERLO', NULL, NULL, 111, NULL, '0220-448731', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38049'),
(390, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '2536', 'LUCIANO', 'MARIANI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38049'),
(391, 0, NULL, 2, 0, '2014-10-14 02:32:06', NULL, '2546', 'ORLANDO JAVIER', 'FALCO', '29013474', 'SARMIENTO 4017', 'JOSE C PAZ', NULL, NULL, 28, NULL, '02320 434 129', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38247'),
(392, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '2531', 'MATIAS', 'ACOSTA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38055'),
(393, 0, NULL, 1, 0, '2014-10-14 02:32:06', NULL, '2532', 'JOSE ISIDRO', 'RODRIGUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38055'),
(394, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '2537', 'FERNANDO', 'CIERI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38055'),
(395, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '2540', 'MARTIN', 'AGUIRRE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38055'),
(396, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '4702', 'MIGUEL ANGEL', 'LACABA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38055'),
(397, 0, NULL, 2, 0, '2014-10-14 02:32:07', NULL, '4129', 'JORGE', 'UZAL', '18122895', 'SANTIAGO DERQUI 869', 'PALOMAR', NULL, NULL, 1637, NULL, '4751-0737', NULL, 0, 0, NULL, NULL, 1, 1, 4, '38546'),
(398, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '3547', 'RAFAEL', 'RECALDE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38055'),
(399, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '4625', 'JORGE', 'DIAZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38058'),
(400, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '2552', 'GABRIEL', 'FIGUEROA', '', '', '', NULL, NULL, 1670, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38058'),
(401, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '3548', 'BLANCA', 'HERRERA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38062'),
(402, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '3550', 'GUSTAVO', 'QUISPE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38062'),
(403, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '4565', 'IGNACIO JAVIER', 'D AURIR', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38062'),
(404, 0, NULL, 2, 0, '2014-10-14 02:32:07', NULL, '4261', 'ALBERTO ENRIQUE', 'CORELLI', '14751162', 'SAN LUIS 971', 'MORON', NULL, NULL, 2481, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38068'),
(405, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '3560', 'JUAN ALBERTO', 'IRIBARNE', '', '', '', NULL, NULL, 14, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38068'),
(406, 0, NULL, 2, 0, '2014-10-14 02:32:07', NULL, '4023', 'SERGIO ALCIDES', 'MELENDE', '14493173', 'GURRUCHAGA 2662', 'HURLINGHAM', NULL, NULL, 1716, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '38209'),
(407, 0, NULL, 2, 0, '2014-10-14 02:32:07', NULL, '3004', 'ALDANA LUCIA', 'LUCENA', '30602979', 'JOSE INGENIEROS 698', 'HAEDO', NULL, NULL, 109, NULL, '4483-4668', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38201'),
(408, 0, NULL, 2, 0, '2014-10-14 02:32:07', NULL, '0692', 'NESTOR GABRIEL', 'PEDROZA', '14216363', 'LAS ACACIAS 369', 'SAN ANTONIO DE PADUA', NULL, NULL, 1663, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38251'),
(409, 0, NULL, 2, 0, '2014-10-14 02:32:07', NULL, '0689', 'DIEGO ARIEL', 'SUAREZ', '25060041', 'RAWSON 5829', '', NULL, NULL, 1663, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38251'),
(410, 0, NULL, 2, 0, '2014-10-14 02:32:07', NULL, '0691', 'JORGE WASHINGTON', 'REYES', '92594163', 'SOULE 827', 'MORENO', NULL, NULL, 1663, NULL, '4696-4272', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38254'),
(411, 0, NULL, 2, 0, '2014-10-14 02:32:07', NULL, '4726', 'ALEJANDRO FABIAN', 'SCAVELLA', '22891959', 'MONTEAGUDO 5366', 'JOSE C PAZ', NULL, NULL, 1702, NULL, '4469-7868', NULL, 0, 0, NULL, NULL, 1, 1, 2, '38261'),
(412, 0, NULL, 2, 0, '2014-10-14 02:32:07', NULL, '0875', 'MARIO ANGEL', 'MIONETTO', '16520678', 'CAXARAVILLE 2287', 'ITUZAINGO', NULL, NULL, 1649, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38328'),
(413, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '3573', 'JORGE', 'BONANO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(414, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '4563', '', 'GATTAS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(415, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '4070', '', 'KOLLER', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(416, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '4071', '', 'GUILLEMONT', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(417, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '9918', 'VIVIANA', 'RODRIGUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(418, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '9915', '', 'BONAVITA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(419, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '3562', 'ALEJANDRO ADRIAN', 'AVILA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(420, 0, NULL, 1, 0, '2014-10-14 02:32:07', NULL, '0510', 'MIGUEL FABIO', 'DI LELLA', '', '', '', NULL, NULL, 1400, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38337'),
(421, 0, NULL, 1, 0, '2014-10-14 02:32:08', NULL, '0511', 'ARIEL OSCAR', 'VILLANUEVA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(422, 0, NULL, 2, 0, '2014-10-14 02:32:08', NULL, '0512', 'CRISTIAN JAVIER', 'WARZALA', '24476053', '', '', NULL, NULL, 1589, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38337'),
(423, 0, NULL, 1, 0, '2014-10-14 02:32:08', NULL, '0551', 'DIEGO GONZALO', 'LOPEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(424, 0, NULL, 1, 0, '2014-10-14 02:32:08', NULL, '0552', 'RODOLFO OMAR', 'MANUEL', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(425, 0, NULL, 1, 0, '2014-10-14 02:32:08', NULL, '0529', 'CLAUDIO HERNAN', 'SANCHEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(426, 0, NULL, 2, 0, '2014-10-14 02:32:08', NULL, '0662', 'MARCELINO', 'RUIZ DIAZ', '23271875', 'VIAMONTE 2449', 'CASTELAR', NULL, NULL, 1580, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38337'),
(427, 0, NULL, 1, 0, '2014-10-14 02:32:08', NULL, '0686', 'MARIO MARCELO', 'DE SEMINA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(428, 0, NULL, 1, 0, '2014-10-14 02:32:08', NULL, '0706', 'JUAN JOSE', 'GALVAN', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(429, 0, NULL, 2, 0, '2014-10-14 02:32:08', NULL, '0719', 'HERNAN HECTOR', 'ALMIRON', '22126435', 'LAS CALANDRIAS 2718', '', NULL, NULL, 980, NULL, '1530044829', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40275'),
(430, 0, NULL, 2, 0, '2014-10-14 02:32:08', NULL, '0739', 'LEONARDO OMAR', 'BIBINI', '18411498', 'VILLGAS 3078', 'SAN JUSTO', NULL, NULL, 1373, NULL, '4484-4250', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39316'),
(431, 0, NULL, 2, 0, '2014-10-14 02:32:08', NULL, '0741', 'HECTOR JORGE', 'ORTA', '11598439', 'ALEGRIA 1076 DTO 2', 'HAEDO', NULL, NULL, 1621, NULL, '4443-5749', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38337'),
(432, 0, NULL, 1, 0, '2014-10-14 02:32:08', NULL, '0742', 'GUSTAVO MARCELO', 'DENARO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(433, 0, NULL, 2, 0, '2014-10-14 02:32:08', NULL, '0745', 'ARMANDO CLAUDIO', 'DE LORENZO', '17785092', 'MONTE 1577', '', NULL, NULL, 1607, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38495'),
(434, 0, NULL, 2, 0, '2014-10-14 02:32:08', NULL, '0746', 'FABIAN MARCELO', 'CENCIG', '22442109', 'ROSETTI 186', 'MU?IZ', NULL, NULL, 1628, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38337'),
(435, 0, NULL, 2, 0, '2014-10-14 02:32:08', NULL, '0778', 'OSCAR RAMON ANTONIO', 'FLEITAS', '18441863', '', '', NULL, NULL, 1050, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40137'),
(436, 0, NULL, 1, 0, '2014-10-14 02:32:08', NULL, '0822', 'DANIEL JOSE', 'PETRONE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(437, 0, NULL, 2, 0, '2014-10-14 02:32:08', NULL, '0884', 'EDUARDO RENE', 'RAMIREZ', '20768610', 'PAMPA Y MOLINA CAMPOS', 'MORENO', NULL, NULL, 1614, NULL, '1554938704', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38337'),
(438, 0, NULL, 1, 0, '2014-10-14 02:32:08', NULL, '0885', 'ANTONIO', 'ROSITANO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(439, 0, NULL, 1, 0, '2014-10-14 02:32:08', NULL, '3700', 'HECTOR', 'RUIZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(440, 0, NULL, 2, 0, '2014-10-14 02:32:08', NULL, '3887', 'JOSE LUIS', 'RAMIREZ', '21015177', 'BERMEJO 5367', 'SAN JUSTO', NULL, NULL, 300, NULL, '4487-6062', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(441, 0, NULL, 1, 0, '2014-10-14 02:32:08', NULL, '0889', 'CARLOS', 'RACKAUSKAS', '', '', '', NULL, NULL, 896, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40476'),
(442, 0, NULL, 1, 0, '2014-10-14 02:32:08', NULL, '0903', 'GUSTAVO JAVIER', 'OBARRIO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(443, 0, NULL, 2, 0, '2014-10-14 02:32:08', NULL, '0907', 'CLAUDIO ALEJANDRO', 'NIEVA', '23653914', 'COBO 2979', 'MERLO', NULL, NULL, 1614, NULL, '4999223', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38488'),
(444, 0, NULL, 2, 0, '2014-10-14 02:32:08', NULL, '0910', 'HUGO EMILIO', 'AMARILLA', '17192518', 'SAN BENITO 298', 'MERLO', NULL, NULL, 1628, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38337'),
(445, 0, NULL, 1, 0, '2014-10-14 02:32:08', NULL, '041', 'GUSTAVO', 'GINALA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(446, 0, NULL, 1, 0, '2014-10-14 02:32:08', NULL, '0954', 'CHRISTIAN', 'BARRIONUEVO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(447, 0, NULL, 2, 0, '2014-10-14 02:32:08', NULL, '3993', 'MANUEL', 'PIRIS', '25577183', 'VIENA 114', 'MARCOS PAZ', NULL, NULL, 490, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38413'),
(448, 0, NULL, 2, 0, '2014-10-14 02:32:08', NULL, '1091', 'LEONARDO GABRIEL', 'RIOS', '22789124', 'SANTA TERESA 2539', 'MORON', NULL, NULL, 1614, NULL, '4697-1083', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38483'),
(449, 0, NULL, 2, 0, '2014-10-14 02:32:09', NULL, '1117', 'OSVALDO', 'TORRES', '17558201', '', '', NULL, NULL, 34, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '41682'),
(450, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '1120', 'SERGIO', 'RAMOS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(451, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '1144', 'LEONARDO', 'AGUIRRE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(452, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '1150', 'MARTIN', 'CORREA FLORES', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(453, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '0941', 'GUSTAVO', 'GINALA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(454, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '1702', 'HECTOR', 'VEIRANA', '', '', '', NULL, NULL, 1526, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38792'),
(455, 0, NULL, 2, 0, '2014-10-14 02:32:09', NULL, '2153', 'MIGUEL ANGEL', 'FERRARI', '16967015', 'MBURUCUYA 1361', 'MORON', NULL, NULL, 1598, NULL, '4697-3203', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38546'),
(456, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '4073', 'JOSE', 'RODRIGUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(457, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '4150', 'HUGO', 'LIVOSI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(458, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '4157', '', '', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(459, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '4189', '', 'TURCONI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(460, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '4194', 'ANDRES', 'MIGUELES', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(461, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '4196', 'JUAN PABLO', 'MIGUEL', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(462, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '4197', 'CESAR', 'ROMERO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(463, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '4202', 'PABLO', 'FINOCCHIARO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(464, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '4208', 'LUIS', 'INGEGNERI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(465, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '4211', 'ALBERTO', 'SCABBIOLO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(466, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '4212', 'ARIEL', 'ZOYA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(467, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '4214', '', 'INFANTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(468, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '2545', 'SEBASTIAN', 'CHICO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(469, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '4227', 'LAZARO', 'PEROVICH', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(470, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '2558', 'SEBASTIAN', 'JUAREZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(471, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '4233', 'ANGEL', 'MARTINEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(472, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '4234', 'ARIEL', 'ARANDA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(473, 0, NULL, 1, 0, '2014-10-14 02:32:09', NULL, '4235', 'JUAN PABLO', 'DEBIASSI BOGAO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(474, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '4238', 'DAMIAN', 'TURCONI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(475, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '4244', 'GUILLERMO', 'ORTEGA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(476, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '4247', 'CLAUDIO', 'PAZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(477, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '4248', 'JUAN RODRIGO', 'DEPPELER', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(478, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '2547', 'DANIEL', 'PARENTINI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(479, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '4260', 'LEONARDO', 'RODRIGUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(480, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '4363', 'FREDDY', 'SOSA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(481, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '4264', 'JORGE', 'NERIZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(482, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '2560', 'GERMAN', 'TOSO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(483, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '2549', 'ANTONIO', 'VAZQUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(484, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '2550', 'MAXIMILIANO', 'FERRANDO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(485, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '4269', 'PABLO', 'ARANDA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(486, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '2553', 'JAVIER', 'CAMPOS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(487, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '4277', 'LEANDRO', 'CORONA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(488, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '2561', 'MATIAS', 'ABALOS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(489, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '2562', 'CRISTIAN', 'NIELSEN', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(490, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '4286', 'PABLO', 'LEGAN', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(491, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '3290', 'CARLOS', 'CASTILLO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(492, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '4443', 'DIEGO', 'BERNAZZA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(493, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '4301', 'DANIEL', 'PINTO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(494, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '4302', 'EMANUEL', 'COSTA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(495, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '4303', 'PATRICIO', 'SACCONE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(496, 0, NULL, 1, 0, '2014-10-14 02:32:10', NULL, '2564', 'FABIAN', 'MATTUS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(497, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '4444', 'SEBASTIAN', 'PAEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(498, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '4445', 'JUAN', 'SUAREZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(499, 0, NULL, 2, 0, '2014-10-14 02:32:11', NULL, '2565', 'DAMIAN', 'GORDILLO', '27724572', 'GRAL. PINTOS 1136', 'ITUZAINGO', NULL, NULL, 111, NULL, '4623-2417', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38413'),
(500, 0, NULL, 2, 0, '2014-10-14 02:32:11', NULL, '2566', 'HERNAN DARIO', 'PERES', '28504177', 'ABRAMO 550', 'MERLO', NULL, NULL, 1289, NULL, '02204941009', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39542'),
(501, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '2567', 'ROBERTO', 'BENITEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(502, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '4314', 'MARCELO', 'BRIZUELA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(503, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '2568', 'PEDRO', 'AVIDIO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(504, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '2569', 'WALTER', 'LEON', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(505, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '2573', 'PABLO', 'PIERDONA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(506, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '4325', 'LEANDRO', 'MARINOTTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(507, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '2574', 'GONZALO', 'VECOLI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(508, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '4331', 'ROBERTO', 'ARAUJO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(509, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '4561', 'HECTOR', 'VECINO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(510, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '2528', 'CARLOS', 'FERREIRA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38337'),
(511, 0, NULL, 2, 0, '2014-10-14 02:32:11', NULL, '4719', 'FRANCISCO', 'AMMATUNA', '14102484', 'AVENIDA F.F. CRUZ 838 2? B', 'CAPITAL FEDERAL', NULL, NULL, 1695, NULL, '1550947913', NULL, 0, 0, NULL, NULL, 1, 1, 2, '38366'),
(512, 0, NULL, 2, 0, '2014-10-14 02:32:11', NULL, '4104', 'JORGE ALEJANDRO', 'STREMIS', '28027952', 'COLOMBIA 31', 'LIBERTAD', NULL, NULL, 1674, NULL, '4944958', NULL, 0, 0, NULL, NULL, 1, 1, 4, '38378'),
(513, 0, NULL, 2, 0, '2014-10-14 02:32:11', NULL, '4116', 'JOSE EMILIO', 'CRAVERO', '17224743', 'BECCAR 975', 'HAEDO', NULL, NULL, 1667, NULL, '4443-3539', NULL, 0, 0, NULL, NULL, 1, 1, 4, '38408'),
(514, 0, NULL, 2, 0, '2014-10-14 02:32:11', NULL, '3052', 'ANGEL ROBERTO', 'GONZALEZ', '6643058', 'MONTEVIDEO 251', 'BELLA VISTA', NULL, NULL, 14, NULL, '1541753642', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38407'),
(515, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '2556', 'CLAUDIO', 'PAZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38412'),
(516, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '2555', 'LAZARO ENRIQUE', 'PEROVICH', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38412'),
(517, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '3553', 'ALEJANDRO LUIS', 'MAXIMILIANO', '', 'CARTAGENA 656', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38413'),
(518, 0, NULL, 3, 0, '2014-10-14 02:32:11', NULL, '3623', 'CARLOS OMAR', 'DURE', '7768885', 'AVELINO DIAZ 639', 'HAEDO', NULL, NULL, 1100, NULL, '4682-4910', NULL, 0, 0, NULL, NULL, 1, 1, 5, '41096'),
(519, 0, NULL, 2, 0, '2014-10-14 02:32:11', NULL, '3007', 'CATALINA', 'SIMEONI', '14010309', 'SOFOCLES 5635', 'MORENO', NULL, NULL, 14, NULL, '0237468737', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38418'),
(520, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '4797', 'JOSE', 'CARONTE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38425'),
(521, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '4792', 'VICTOR', 'OZUNA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38425'),
(522, 0, NULL, 1, 0, '2014-10-14 02:32:11', NULL, '4791', 'VICENTE', 'GALLO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38425'),
(523, 0, NULL, 1, 0, '2014-10-14 02:32:12', NULL, '4696', 'GUILLERMO', 'MENDIOLA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38425'),
(524, 0, NULL, 1, 0, '2014-10-14 02:32:12', NULL, '4607', 'NORMA', 'RECALDE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38425'),
(525, 0, NULL, 1, 0, '2014-10-14 02:32:12', NULL, '3580', 'GABRIELA', 'CASTILLO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38425'),
(526, 0, NULL, 1, 0, '2014-10-14 02:32:12', NULL, '4012', 'JAVIER', 'VARELA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38427'),
(527, 0, NULL, 2, 0, '2014-10-14 02:32:12', NULL, '4120', 'JOSE RAMON', 'ALEGRE', '92022309', 'AV. ARGENTINA 4945', 'MERLO', NULL, NULL, 2143, NULL, '4802869', NULL, 0, 0, NULL, NULL, 1, 1, 4, '38427'),
(528, 0, NULL, 2, 0, '2014-10-14 02:32:12', NULL, '4114', 'ENRIQUE LEOPOLDO', 'MOLINA', '8492068', 'LOS PARAISOS 158', 'CASTELAR', NULL, NULL, 2634, NULL, '4450-5011', NULL, 0, 0, NULL, NULL, 1, 1, 4, '30183'),
(529, 0, NULL, 1, 0, '2014-10-14 02:32:12', NULL, '4067', 'FERNANDO', 'ROMERO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38427'),
(530, 0, NULL, 1, 0, '2014-10-14 02:32:12', NULL, '4412', 'ALEJANDRO ARIEL', 'PASTORINO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38427'),
(531, 0, NULL, 5, 0, '2014-10-14 02:32:12', NULL, '4795', 'ERICO BRUNO', 'OBENAUS', '3731727', 'BARROS PAZOS 1334', 'VILLA CELINA', NULL, NULL, 1419, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 3, '33193'),
(532, 0, NULL, 1, 0, '2014-10-14 02:32:12', NULL, '3600', 'DANIEL (RIFA)', 'AMARGOS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38427'),
(533, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '3601', 'MARCELO', 'CONJIU', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38427'),
(534, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '3602', 'OSVALDO', 'DAMIANO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38427'),
(535, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '3603', 'JUAN (RIFA)', 'DEPPELER', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38427'),
(536, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '3604', 'JOSE MARIA', 'HOYOS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38427'),
(537, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '3605', 'VILMA', 'FARIAS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38427'),
(538, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '3606', 'RICARDO', 'IACOPONI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38427'),
(539, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '3607', 'ABEL (RIFA)', 'MOREYRA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38427'),
(540, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '3608', 'GASTON', 'MU?OZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38427'),
(541, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '3609', 'OSCAR (RIFA)', 'NOVGORATSKY', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38427'),
(542, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '3610', 'RAMON DARIO', 'PARED', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38427'),
(543, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '3611', 'RICARDO', 'PEREYRA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38427'),
(544, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '3612', 'HECTOR CESAR', 'VERLENGO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38427'),
(545, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '3613', 'MIGUEL ANGEL', 'WESTREPP', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38427'),
(546, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '8017', 'JUAN CRUZ', 'ZEBALLOS', '', 'VALTRA', 'DESC. MANUAL', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 3, '38427'),
(547, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '3009', 'MIGUEL ANGEL', 'MARTINEZ', '', 'CHOCANO 155', 'MERLO', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38435'),
(548, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '3614', 'ANGEL', 'GONZALEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38448'),
(549, 0, NULL, 2, 0, '2014-10-14 02:32:13', NULL, '4127', 'DANIEL', 'MOLINA', '16341332', 'ROMA 3033', 'JOSE C. PAZ', NULL, NULL, 1660, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '38453'),
(550, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '2557', 'LEONARDO', 'JACIUK', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38509'),
(551, 0, NULL, 2, 0, '2014-10-14 02:32:13', NULL, '1620', 'JUAN HORACIO', 'FERNANDEZ', '26348827', 'QUIROZ 2464', 'ITUZAINGO', NULL, NULL, 1598, NULL, '4623-5828', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38527'),
(552, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '4013', 'PABLO', 'LABORDE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38553'),
(553, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '4014', 'SEBASTIAN', 'IBA?EZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38553'),
(554, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '4015', 'RUBEN', 'MOTTA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38553'),
(555, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '4016', 'DIEGO', 'BERNAZZA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38553'),
(556, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '4105', 'SACARIAS', 'ARAUJO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38553'),
(557, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '4118', 'JOSE', 'FLORES', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38553'),
(558, 0, NULL, 2, 0, '2014-10-14 02:32:13', NULL, '4113', 'HUGO', 'PONCE', '12645218', 'CASTRO 1350', 'MERLO', NULL, NULL, 1619, NULL, '0220-485-8084', NULL, 0, 0, NULL, NULL, 1, 1, 4, '38553'),
(559, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '4128', 'ALEJANDRO ARIEL', 'PASTORINO', '', 'AV. J. CASTRO 1322', 'MERLO', NULL, NULL, 1619, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '38594'),
(560, 0, NULL, 1, 0, '2014-10-14 02:32:13', NULL, '2563', 'EZEQUIEL', 'PAEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38607'),
(561, 0, NULL, 2, 0, '2014-10-14 02:32:13', NULL, '3563', 'JUAN CARLOS', 'FIGUEROA', '4394975', 'MARTIN FIERRO 6859', 'V. BOSCH', NULL, NULL, 0, NULL, '1540268105', NULL, 0, 0, NULL, NULL, 1, 1, 2, '38658'),
(562, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '2571', 'LEONARDO', 'RODRIGUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38670'),
(563, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '2572', 'EZEQUIEL', 'PAEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38670'),
(564, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '3570', 'HECTOR', 'PEREZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38670'),
(565, 0, NULL, 2, 0, '2014-10-14 02:32:14', NULL, '3571', 'RICARDO EDUARDO', 'CIURO', '4888177', 'LAPRIDA 1472', 'ITUZAINGO', NULL, NULL, 0, NULL, '4623-1966', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38763'),
(566, 0, NULL, 2, 0, '2014-10-14 02:32:14', NULL, '3582', 'EDUARDO NESTOR', 'OLMO', '67185575', 'MIRARE 2640', 'ITUAINGO', NULL, NULL, 173, NULL, '4481-4283', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38810'),
(567, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '2575', 'GUILLERMO', 'ORTEGA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38814'),
(568, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '2576', 'PABLO', 'LEGAN', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38814');
INSERT INTO `socios` (`id`, `id_sexo`, `id_estudio`, `id_tipo_documento`, `id_tipo_socio`, `created_at`, `updated_at`, `nro_legajo`, `nombre`, `apellido`, `nro_documento`, `direccion`, `localidad`, `socio_futbol`, `socio_pesca`, `valor_historico`, `tel_cel`, `tel_part`, `tel_lab`, `estudios_id`, `tipos_socios_id`, `fecha_nac`, `id_usuario`, `socio_coop`, `socio_cocheria`, `id_empresa`, `fecha_inicio`) VALUES
(569, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '4579', 'GUILLERMO', 'BOHRT', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38814'),
(570, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '4650', 'PATRICIA', 'GOIRIENA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38814'),
(571, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '4798', 'RUBEN', 'VANZZETTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38814'),
(572, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '4901', 'MAURICIO', 'PAOLONI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38814'),
(573, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '4662', 'MARIANO', 'ALONSO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38814'),
(574, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '3616', 'LAURA', 'GODOY', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38814'),
(575, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '9052', 'OSCAR JOSE', 'RIVAS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '38814'),
(576, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '9065', 'JOSE LUIS', 'MORENA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38814'),
(577, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '3617', 'MARCELO', 'MERIDOL', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38814'),
(578, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '3618', 'GUSTAVO', 'ZAVALA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '38824'),
(579, 0, NULL, 2, 0, '2014-10-14 02:32:14', NULL, '2500', 'CESAR DANIEL', 'ROMERO', '27544344', 'EUFRATES 245', 'RAFAEL CASTILLO', NULL, NULL, 1499, NULL, '4486-8702', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38869'),
(580, 0, NULL, 2, 0, '2014-10-14 02:32:14', NULL, '2503', 'LAZARO ENRIQUE', 'PEROVICH', '29171593', 'ANTOFAGASTA 4061', '', NULL, NULL, 1499, NULL, '466-5508', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38869'),
(581, 0, NULL, 2, 0, '2014-10-14 02:32:14', NULL, '0569', 'ROQUE OMAR', 'LAZARTE', '16514038', 'CHILECITO 3987', 'FCO. ALVAREZ', NULL, NULL, 1481, NULL, '0237487188', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38931'),
(582, 0, NULL, 2, 0, '2014-10-14 02:32:14', NULL, '4088', 'FELIX RICARDO', 'PEREYRA', '8310116', 'PUEYRREDON 2535', 'L. DEL MIRADOR', NULL, NULL, 1511, NULL, '4488-1300', NULL, 0, 0, NULL, NULL, 1, 1, 4, '38943'),
(583, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '3472', 'LEONARDO', 'GIMENEZ MACHADO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38975'),
(584, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '3575', 'RUBEN', 'CAMPANA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '38975'),
(585, 0, NULL, 2, 0, '2014-10-14 02:32:14', NULL, '2155', 'EDUARDO ALBERTO', 'CAMPO', '16319612', 'CUYO 4778', 'G. CATAN', NULL, NULL, 1463, NULL, '02202439214', NULL, 0, 0, NULL, NULL, 1, 1, 5, '38994'),
(586, 0, NULL, 2, 0, '2014-10-14 02:32:14', NULL, '4125', 'JUAN IGNACIO', 'FLORES', '18299609', 'NICASIO ORO?O 810', 'MERLO', NULL, NULL, 1511, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '38994'),
(587, 0, NULL, 2, 0, '2014-10-14 02:32:14', NULL, '4521', 'EMILIO ESTEBAN', 'LASCHERA', '14121434', 'AVELINO DIAZ 436', 'CAP. FED.', NULL, NULL, 1511, NULL, '4924-1224', NULL, 0, 0, NULL, NULL, 1, 1, 4, '38994'),
(588, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '4819', 'FLORENCIO', 'LEBE?A', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39010'),
(589, 0, NULL, 1, 0, '2014-10-14 02:32:14', NULL, '3572', 'GUIDO', 'AMAYA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39036'),
(590, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '4685', 'ROBERTO', 'BRISCHI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39150'),
(591, 0, NULL, 2, 0, '2014-10-14 02:32:15', NULL, '0685', 'CLAUDIO', 'DEL VALLE', '17945164', 'COLOMBIA 1926', '', NULL, NULL, 1056, NULL, '4210-5436', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39503'),
(592, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '4714', 'GERARDO', 'FERRARIO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39150'),
(593, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '4652', 'GERARDO', 'BOIERO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39150'),
(594, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '4637', 'GABRIEL', 'MORELLI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39150'),
(595, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '4616', 'MARIANA', 'FLORES', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39150'),
(596, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '4510', 'WALTER', 'OLIVERA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39150'),
(597, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '4347', 'FERNANDO', 'INGRATTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39150'),
(598, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '2579', 'JUAN CARLOS', 'SUAREZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39150'),
(599, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '2581', 'ANGEL', 'MARTINEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39150'),
(600, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '1046', 'ALBERTO', 'ARAGON', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39150'),
(601, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '3619', 'MARCELO', 'MARTINEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39150'),
(602, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '3620', 'HUGO', 'LIVOSI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39150'),
(603, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '3621', 'PEDRO', 'PERROTA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39150'),
(604, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '3622', 'LORENA', 'DUARTE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39150'),
(605, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '3623', 'LEONARDO', 'GIMENEZ MACHADO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39150'),
(606, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '3624', 'TOMAS', 'BOGADO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39150'),
(607, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '3625', 'IRENE', 'MAGLIANO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39150'),
(608, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '4783', '', 'BERTOGLIO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39150'),
(609, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '4135', 'JORGE', 'LEON', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39150'),
(610, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '4133', 'MARTIN', 'DURE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39150'),
(611, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '4131', 'CRISTIAN', 'MARQUES DE AMARAL', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39150'),
(612, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '4130', 'FABIAN', 'BOTTARO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39150'),
(613, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '4713', 'LEANDRO', 'RUIZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39161'),
(614, 0, NULL, 2, 0, '2014-10-14 02:32:15', NULL, '3640', 'ANABELLA', 'SORIANO', '23903520', '', '', NULL, NULL, 36, NULL, '4469-7814', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39167'),
(615, 0, NULL, 2, 0, '2014-10-14 02:32:15', NULL, '3578', 'DIEGO RODOLFO', 'MARIN', '26096738', 'CALLE 332 BIS 1089', 'QUILMES', NULL, NULL, 0, NULL, '4278-2461', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39167'),
(616, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '2582', 'HERNAN', 'PEREZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39167'),
(617, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '3579', 'JOSE', 'MARTINEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39167'),
(618, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '2589', 'CARLOS', 'ATKINSON', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39167'),
(619, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '4522', 'CAROLINA', 'VAZQUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39181'),
(620, 0, NULL, 2, 0, '2014-10-14 02:32:15', NULL, '2583', 'LUIS RUBEN RAMON', 'ROSALES', '28747437', '18 DE OCTUBRE 1229', '', NULL, NULL, 1409, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39184'),
(621, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '2584', 'DANIEL', 'ANGELINI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39185'),
(622, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '2585', 'RODRIGO', 'ZOYA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39512'),
(623, 0, NULL, 1, 0, '2014-10-14 02:32:15', NULL, '2586', 'CARLOS', 'CASTILLO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39185'),
(624, 0, NULL, 1, 0, '2014-10-14 02:32:16', NULL, '2587', 'LEANDRO', 'MARINOTTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39185'),
(625, 0, NULL, 1, 0, '2014-10-14 02:32:16', NULL, '4799', 'IRENE', 'MAGLIANO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39189'),
(626, 0, NULL, 2, 0, '2014-10-14 02:32:16', NULL, '4410', 'SACARIAS', 'ARAUJO', '7670606', 'JUAN B. JUSTO 1882', 'LIBERTAD', NULL, NULL, 1448, NULL, '494-7714', NULL, 0, 0, NULL, NULL, 1, 1, 4, '39206'),
(627, 0, NULL, 2, 0, '2014-10-14 02:32:16', NULL, '2588', 'JAVIER ANDRES', 'GONZALEZ', '28894096', 'DILLADO 278', 'MARIANO ACOSTA', NULL, NULL, 1300, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39524'),
(628, 0, NULL, 2, 0, '2014-10-14 02:32:16', NULL, '2142', 'OMAR MARIO', 'ALASSIA', '16747064', 'BASUALDO 309', 'ISIDRO CASANOVA', NULL, NULL, 1373, NULL, '4486-5221', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39304'),
(629, 0, NULL, 2, 0, '2014-10-14 02:32:16', NULL, '2600', 'PABLO MIGUEL', 'MOYANO', '29751124', 'BARADERO 1921', 'MORON', NULL, NULL, 1373, NULL, '1551020556', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39304'),
(630, 0, NULL, 1, 0, '2014-10-14 02:32:16', NULL, '4132', 'HERNAN', 'FLORES', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '39315'),
(631, 0, NULL, 1, 0, '2014-10-14 02:32:16', NULL, '4413', 'MARIANO', 'DE VICENZO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '39315'),
(632, 0, NULL, 2, 0, '2014-10-14 02:32:16', NULL, '0583', 'LEONARDO DAMIAN', 'VALLE', '24117114', 'CNEL PRINGLES 3874', '', NULL, NULL, 1373, NULL, '4652-4439', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39316'),
(633, 0, NULL, 1, 0, '2014-10-14 02:32:16', NULL, '3010', 'MARCELO', 'ACU?A', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39318'),
(634, 0, NULL, 2, 0, '2014-10-14 02:32:16', NULL, '2599', 'GABINO', 'FLECHA VELAZQUEZ', '94533059', 'SERRO LAS TORTOLAS 3544', 'CASEROS', NULL, NULL, 1364, NULL, '1564851407', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39325'),
(635, 0, NULL, 2, 0, '2014-10-14 02:32:16', NULL, '1045', 'JUAN CARLOS', 'DELGADO', '22470778', 'AMERICA 4014 DTO 18', 'VILLA LUZURIAGA', NULL, NULL, 1162, NULL, '1540845478', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39888'),
(636, 0, NULL, 1, 0, '2014-10-14 02:32:16', NULL, '2592', '', 'CASTILLO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39363'),
(637, 0, NULL, 1, 0, '2014-10-14 02:32:16', NULL, '2593', 'EMANUEL', 'COSTA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39363'),
(638, 0, NULL, 1, 0, '2014-10-14 02:32:16', NULL, '2594', '', 'DE FILIPPO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39363'),
(639, 0, NULL, 1, 0, '2014-10-14 02:32:16', NULL, '2595', 'JULIO', 'CALOGGI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39364'),
(640, 0, NULL, 1, 0, '2014-10-14 02:32:16', NULL, '4537', 'JAVIER', 'RUIZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39371'),
(641, 0, NULL, 1, 0, '2014-10-14 02:32:16', NULL, '4654', 'ANDREA', 'MEDICA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39371'),
(642, 0, NULL, 2, 0, '2014-10-14 02:32:16', NULL, '4009', 'ELEUTRIO', 'ARROYO', '16755360', 'CASTELAR 2747', 'ITUZAINGO', NULL, NULL, 1000, NULL, '4621-5476', NULL, 0, 0, NULL, NULL, 1, 1, 2, '40289'),
(643, 0, NULL, 2, 0, '2014-10-14 02:32:16', NULL, '4480', 'JORGE ALBERTO', 'VIGUERA', '13792522', 'AVELLANEDA 3404', 'OLIVOS', NULL, NULL, 1359, NULL, '4711-9406', NULL, 0, 0, NULL, NULL, 1, 1, 4, '39491'),
(644, 0, NULL, 1, 0, '2014-10-14 02:32:16', NULL, '2597', 'RAMIRO', 'RODRIGUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39399'),
(645, 0, NULL, 1, 0, '2014-10-14 02:32:16', NULL, '4367', 'RAMIRO', 'RODRIGUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39399'),
(646, 0, NULL, 2, 0, '2014-10-14 02:32:16', NULL, '3917', 'DANIEL ALBERTO', 'BERNAOLA', '25523177', 'MIGUEL CANE 4730', 'SAN JUSTO', NULL, NULL, 280, NULL, '4485-9211', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39402'),
(647, 0, NULL, 2, 0, '2014-10-14 02:32:16', NULL, '2614', 'JUAN', 'GRILLO', '28615242', 'CARABOBO 4926', 'SAN JUSTO', NULL, NULL, 1344, NULL, '4486-0535', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39402'),
(648, 0, NULL, 1, 0, '2014-10-14 02:32:16', NULL, '4517', 'PABLO', 'SARINHA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '39430'),
(649, 0, NULL, 2, 0, '2014-10-14 02:32:16', NULL, '4137', 'GERMAN DAMIAN', 'IBA?EZ', '32402051', 'M. SALINAS 735', 'TESEI', NULL, NULL, 1370, NULL, '4450-9686', NULL, 0, 0, NULL, NULL, 1, 1, 4, '39435'),
(650, 0, NULL, 2, 0, '2014-10-14 02:32:16', NULL, '3583', 'GENARO AMARANTO', 'OLMO', '6718575', 'MIRAVE 2640', 'ITUZAINGO', NULL, NULL, 0, NULL, '4481-4283', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39444'),
(651, 0, NULL, 2, 0, '2014-10-14 02:32:16', NULL, '2598', 'LEANDRO JAVIER', 'MARINOTTI', '31702728', 'ARENALES 2031', '0220-493-1551', NULL, NULL, 1322, NULL, 'MERLO', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39444'),
(652, 0, NULL, 1, 0, '2014-10-14 02:32:16', NULL, '0931', 'SEBASTIAN', 'ISLIC', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39512'),
(653, 0, NULL, 1, 0, '2014-10-14 02:32:16', NULL, '0860', 'CARLOS', 'PEREZ PERALTA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39512'),
(654, 0, NULL, 1, 0, '2014-10-14 02:32:16', NULL, '0916', 'JORGE', 'HUBER', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39512'),
(655, 0, NULL, 2, 0, '2014-10-14 02:32:17', NULL, '0259', 'TOMAS OSVALDO', 'BOGADO', '10505117', 'ICALMA 6260', '', NULL, NULL, 1300, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39524'),
(656, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '2613', 'GERMAN', 'TOSO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39514'),
(657, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '4134', 'DIEGO', 'CALCAGNO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39514'),
(658, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '4136', 'ARMANDO', 'DALLA CORTE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39514'),
(659, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '4355', 'MARIO', 'QUINTANA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39514'),
(660, 0, NULL, 2, 0, '2014-10-14 02:32:17', NULL, '4672', 'JOSE', 'MARTINEZ', '43368097', 'C. PELEGRINI 804', 'MORON', NULL, NULL, 1249, NULL, '4489-5483', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39778'),
(661, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '3654', 'MIGUEL', 'RUZZO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39514'),
(662, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '4902', 'JAVIER', 'QUARESIMA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39514'),
(663, 0, NULL, 2, 0, '2014-10-14 02:32:17', NULL, '2602', 'HORACIO', 'PALACIOS', '31999939', 'V.LOPEZ Y PLANES 2095', '', NULL, NULL, 938, NULL, '1568493470', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40387'),
(664, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '2603', 'LUIS MARCOS', 'INGEGNERI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39514'),
(665, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '2604', 'FERNANDO MIGUEL', 'INGRATTI', '', '', '', NULL, NULL, 896, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39514'),
(666, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '2605', 'MARIO GABRIEL', 'DIARMAS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39514'),
(667, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '2606', 'SERGIO', 'ROBLES', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39514'),
(668, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '4751', 'JULIO', 'LANOSA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39514'),
(669, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '2607', 'EMANUEL GASTON', 'AGUERO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39514'),
(670, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '2608', 'JUAN ALBERTO', 'RODRIGUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39514'),
(671, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '2609', 'PABLO', 'RODRIGUE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39514'),
(672, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '3610', '', 'NERIZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39514'),
(673, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '2611', 'JUAN PABLO', 'VILIERT', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39514'),
(674, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '3626', 'DIEGO', 'MARIN', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39514'),
(675, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '3627', 'LUCIO EMANUEL', 'MALAGRECA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39514'),
(676, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '3628', 'ANGEL JAVIER', 'BAEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39514'),
(677, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '4804', 'MARCELO', 'MERINDOL', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39514'),
(678, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '4805', 'RODRIGO', 'ZEBALLOS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39514'),
(679, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '2612', 'JUAN EDGARDO', 'VILLA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39519'),
(680, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '0872', 'RAUL DAMIAN', 'YAPURA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39519'),
(681, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '3629', 'ANGEL', 'ESQUERRO', '', 'MASTRCLEAN', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39519'),
(682, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '3630', 'LEANDRO', 'MENDIBERRY', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39519'),
(683, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '3631', 'RAMON', 'NICOLLEK', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39519'),
(684, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '3632', 'MARCELO', 'GIMENEZ', '', 'CEVA', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39519'),
(685, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '3633', 'PEDRO', 'PERROTTA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39519'),
(686, 0, NULL, 1, 0, '2014-10-14 02:32:17', NULL, '3634', 'SEBASTIAN', 'GOMEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39519'),
(687, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '3635', 'MARCO', 'ESCAMILLA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39519'),
(688, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '3636', 'MARIANO RAUL', 'ALVAREZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39521'),
(689, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '3641', 'FABIO', 'BAEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39527'),
(690, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '3148', 'ABEL', 'MOREYRA', '', '2? QUINCENA', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39533'),
(691, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '3642', 'JEAN', 'JASTRZELASKI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39533'),
(692, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '3643', 'FELIX', 'ZAVALA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39533'),
(693, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '2615', 'MARCOS', 'ESCAMILLA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39570'),
(694, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '2616', 'MARIANO RAUL', 'ALVAREZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39570'),
(695, 0, NULL, 2, 0, '2014-10-14 02:32:18', NULL, '2617', 'CLAUDIO ALEJANDRO', 'PAZ', '28464117', 'MURGUIONDO 2857', 'LA FERRERE', NULL, NULL, 1267, NULL, '4457-7197', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39596'),
(696, 0, NULL, 2, 0, '2014-10-14 02:32:18', NULL, '2146', 'JOSE LUIS', 'JUAREZ', '20157914', 'CHARLONES 7120', '', NULL, NULL, 1256, NULL, '4729-6996', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39631'),
(697, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '2618', 'SEBASTIAN', 'GOMEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39696'),
(698, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '2529', 'MATIAS', 'MARIANI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39717'),
(699, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '2505', 'ARIEL', 'ARANDA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39717'),
(700, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '0501', 'ALAN', 'ROJAS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39717'),
(701, 0, NULL, 2, 0, '2014-10-14 02:32:18', NULL, '0659', 'EZEQUIEL', 'FERNANDEZ', '27668244', 'ESPEJO 2085', 'ITUZAINGO', NULL, NULL, 528, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39717'),
(702, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '0748', 'PABLO', 'GREGORUTTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39717'),
(703, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '0749', 'ROBERTO', 'ALONSO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39717'),
(704, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '0750', 'MARTIN', 'IBACEIA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39717'),
(705, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '0809', 'GUSTAVO', 'KRAUSS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39717'),
(706, 0, NULL, 2, 0, '2014-10-14 02:32:18', NULL, '0808', 'RODRIGO JOSE', 'ESPINOSA', '31180227', 'L.N. ALEM 3008', 'MERLO', NULL, NULL, 1064, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40101'),
(707, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '0810', 'JOSE', 'OLIVERA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39717'),
(708, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '2506', 'HUGO', 'LIVOSI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39717'),
(709, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '2554', '', 'SOSA FREDY', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39717'),
(710, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '4501', 'LUIS', 'TELLO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '39717'),
(711, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '4027', 'MARCELO', 'MAURO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '39717'),
(712, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '4082', 'JORGE', 'POLATILLO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '39717'),
(713, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '0861', 'JEAN', 'JASTREBSKI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39727'),
(714, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '3644', 'RUBEN', 'REBERTE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39727'),
(715, 0, NULL, 1, 0, '2014-10-14 02:32:18', NULL, '3645', 'GUADALUPE', 'CARVAJAL', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39727'),
(716, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '3646', 'MARCELO', 'MARTINEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39727'),
(717, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '3647', 'EDUARDO', 'ARAGON', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39727'),
(718, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '3648', 'GERARDO', 'BERNACHEA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39727'),
(719, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '3649', 'ENRIQUE', 'MOLINA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39727'),
(720, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '3650', 'MIGUEL', 'WESTREPP', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39727'),
(721, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '3651', 'MAXIMILIANO', 'SOSA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39727'),
(722, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '4658', 'JOSE', 'LEVA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '39727'),
(723, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '4676', 'G.', 'PELAGAGGI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '39727'),
(724, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '4479', 'ALEJANDRO', 'ARENA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '39727'),
(725, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '4107', 'DANIEL', 'TOMOLATTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '39727'),
(726, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '4401', 'JUAN', 'TORRES', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39727'),
(727, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '4400', 'ELIAS', 'SOTO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39727'),
(728, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '0866', 'JULIO', 'SPAGNOLO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39727'),
(729, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '0587', 'PABLO', 'VASTARTE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39727'),
(730, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '0586', '', 'LUDUE?A', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39727'),
(731, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '3652', 'VICTOR', 'CALEFFA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39727'),
(732, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '2619', 'OSCAR', 'GOMEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39727'),
(733, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '2620', 'ARIEL', 'ALVAREZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39727'),
(734, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '2621', 'HECTOR', 'MARTINEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39727'),
(735, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '4613', 'GILVERTO', 'IANNARELLI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '39727'),
(736, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '4414', 'LEONARDO', 'VALSUANI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '39727'),
(737, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '4512', 'FERNANDO', 'ROMERO', '', '', '', NULL, NULL, 1098, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '39741'),
(738, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '4535', 'MARIANO', 'DE VICENZO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '39741'),
(739, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '4138', 'LEONARDO', 'CARROZZO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '39741'),
(740, 0, NULL, 2, 0, '2014-10-14 02:32:19', NULL, '4139', 'DIEGO', 'GHIAZZA', '29238798', 'MARCOS PAZ 381', '0220494-6522', NULL, NULL, 1249, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '39792'),
(741, 0, NULL, 2, 0, '2014-10-14 02:32:19', NULL, '4148', 'LEONARDO RAMON', 'ABOITIZ', '29238689', 'DTOR GELPI 1963', '', NULL, NULL, 1196, NULL, '4458-2538', NULL, 0, 0, NULL, NULL, 1, 1, 4, '39902'),
(742, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '4102', 'HECTOR', 'RUSSO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '39741'),
(743, 0, NULL, 1, 0, '2014-10-14 02:32:19', NULL, '4506', 'RODRIGO', 'MACRI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '39741'),
(744, 0, NULL, 2, 0, '2014-10-14 02:32:19', NULL, '2622', 'HECTOR', 'MARTINEZ', '30733459', 'ARARAT 16', '', NULL, NULL, 1212, NULL, '4669-0975', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39757'),
(745, 0, NULL, 2, 0, '2014-10-14 02:32:19', NULL, '4141', 'LUIS MATIAS', 'DOMINGUEZ BARRIENTO', '30603570', 'MARCOS PAZ 270', '0220-4941971', NULL, NULL, 1249, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '39792'),
(746, 0, NULL, 2, 0, '2014-10-14 02:32:19', NULL, '0483', 'MARCELO JORGE', 'ACU?A', '14819774', 'ITAPIRU 127', '', NULL, NULL, 1201, NULL, '4697-9951', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39792'),
(747, 0, NULL, 2, 0, '2014-10-14 02:32:19', NULL, '4140', 'VICTOR HUGO', 'ALVAREZ', '23492743', 'V. DOLORES 4070', '', NULL, NULL, 1249, NULL, '4484-0502', NULL, 0, 0, NULL, NULL, 1, 1, 4, '39792'),
(748, 0, NULL, 2, 0, '2014-10-14 02:32:19', NULL, '2381', 'JUAN SEBASTIAN', 'GOMEZ', '30710553', 'DORREGO 797', 'LUJAN', NULL, NULL, 1162, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39876'),
(749, 0, NULL, 1, 0, '2014-10-14 02:32:20', NULL, '2361', 'MAURO', 'FABRIS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39909'),
(750, 0, NULL, 2, 0, '2014-10-14 02:32:20', NULL, '4333', 'CRISTIAN DAVID', 'DI GIOVANNI', '34146759', 'RICARDO BALBIN 163', '', NULL, NULL, 1098, NULL, '4629-9171', NULL, 0, 0, NULL, NULL, 1, 1, 4, '40101'),
(751, 0, NULL, 1, 0, '2014-10-14 02:32:20', NULL, '4124', 'ARMANDO', 'DALLA CORTE', '', '', '', NULL, NULL, 14, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39909'),
(752, 0, NULL, 1, 0, '2014-10-14 02:32:20', NULL, '4648', 'MARIANA', 'RUGGERI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39909'),
(753, 0, NULL, 1, 0, '2014-10-14 02:32:20', NULL, '4679', 'MARTIN', 'MEDICA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '39909'),
(754, 0, NULL, 1, 0, '2014-10-14 02:32:20', NULL, '2379', 'FABIAN HERNAN', 'LOZANO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39909'),
(755, 0, NULL, 1, 0, '2014-10-14 02:32:20', NULL, '2385', 'CRISTIAN LEONARDO', 'OJEDA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39909'),
(756, 0, NULL, 1, 0, '2014-10-14 02:32:20', NULL, '2388', 'CRISTIAN', 'ALONSO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39909'),
(757, 0, NULL, 1, 0, '2014-10-14 02:32:20', NULL, '2313', 'ROBERTO', 'BENITEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '39911'),
(758, 0, NULL, 2, 0, '2014-10-14 02:32:20', NULL, '2242', 'MIGUEL MARTIN', 'AGUIRRE', '29707719', 'MONTES DE OCA 2994', '', NULL, NULL, 1148, NULL, '4458-4288', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39917'),
(759, 0, NULL, 2, 0, '2014-10-14 02:32:20', NULL, '4143', 'BERNARDO', 'GAMARRA PAIVA', '92974882', 'DOBLAS 3147', 'G. CATAN', NULL, NULL, 1196, NULL, '1553337902', NULL, 0, 0, NULL, NULL, 1, 1, 4, '39920'),
(760, 0, NULL, 1, 0, '2014-10-14 02:32:20', NULL, '4582', 'ADRIAN', 'DE MELO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40007'),
(761, 0, NULL, 1, 0, '2014-10-14 02:32:20', NULL, '2357', 'RODRIGO', 'ZOYA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40007'),
(762, 0, NULL, 1, 0, '2014-10-14 02:32:20', NULL, '4503', 'MARIA VICTORIA', 'SBACCO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '40011'),
(763, 0, NULL, 1, 0, '2014-10-14 02:32:20', NULL, '4292', 'CLAUDIO', 'SILVETTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '40011'),
(764, 0, NULL, 1, 0, '2014-10-14 02:32:20', NULL, '4504', 'PABLO', 'ACOSTA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '40011'),
(765, 0, NULL, 1, 0, '2014-10-14 02:32:20', NULL, '4505', 'CECILIA', 'MOSQUEIRA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '40011'),
(766, 0, NULL, 1, 0, '2014-10-14 02:32:20', NULL, '4117', 'GERARDO', 'BERNACHEA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '40011'),
(767, 0, NULL, 2, 0, '2014-10-14 02:32:20', NULL, '4513', 'LEONARDO JAVIER', 'CARROZO', '27684130', 'CURUPAYTI 1344', 'MORON', NULL, NULL, 1098, NULL, '4645-2680', NULL, 0, 0, NULL, NULL, 1, 1, 4, '40101'),
(768, 0, NULL, 2, 0, '2014-10-14 02:32:20', NULL, '2345', 'WALTER ARIEL', 'VANEGAS', '29396114', 'RUTA 25', 'KM 6000', NULL, NULL, 1064, NULL, '15-62524328', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40101'),
(769, 0, NULL, 1, 0, '2014-10-14 02:32:20', NULL, '0584', 'JOSE', 'ALEGRE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40011'),
(770, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '0767', 'FRANCISCO', 'PONCE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40011'),
(771, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '2228', 'ISIDRO', 'RODRIGUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40018'),
(772, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '4525', 'ETEL', 'VAZQUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40018'),
(773, 0, NULL, 2, 0, '2014-10-14 02:32:21', NULL, '1656', 'EUGENIO', 'MARINOTTI', '31546926', 'RODRIGUEZ 4471', '', NULL, NULL, 710, NULL, '4480-0957', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40105'),
(774, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '2338', 'JULIO', 'CALOGGI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40112'),
(775, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '2286', 'PABLO', 'LEGAN', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40126'),
(776, 0, NULL, 2, 0, '2014-10-14 02:32:21', NULL, '2283', 'MATIAS', 'ABALOS', '29544810', 'GERMAN ABDALA 2754', '', NULL, NULL, 1022, NULL, '4485-6425', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40207'),
(777, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '1669', 'MARTIN', 'GARCIA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40249'),
(778, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '1658', 'DINO OMAR', 'RIQUELME', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40249'),
(779, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '4849', 'GUSTAVO', 'ZAVALA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40249'),
(780, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '1652', 'ALEJANDRO', 'BECAAZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40249'),
(781, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '0913', 'JUAN RAMON', 'OBREGON', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40249'),
(782, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '1715', 'DAVID ALEJANDRO', 'BARRERA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40249'),
(783, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '2376', 'DAMIAN', 'BORDA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40249'),
(784, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '2248', 'RODRIGO', 'DEPPELER', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40249'),
(785, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '2383', 'GERMAN', 'DEL CAMPO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40249'),
(786, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '2365', 'JAVIER', 'BARCELO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40249'),
(787, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '2249', 'DAMIAN', 'DILAVELLO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40249'),
(788, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '2324', '', 'PIERDONA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40249'),
(789, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '3684', 'ADRIANA', 'BELTRAN LUIS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40249'),
(790, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '4021', 'MARCELO', 'MERINDOL', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40252'),
(791, 0, NULL, 2, 0, '2014-10-14 02:32:21', NULL, '2395', 'CRISTIAN LEONARDO', 'MOLINA', '33150790', 'SAN JAVIER 2361', 'PABLO PODESTA', NULL, NULL, 980, NULL, '4848.1183', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40282'),
(792, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '2184', 'JOSE MANUEL', 'RUSU', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40310'),
(793, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '2202', 'PABLO', 'FINOCHIARO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40310'),
(794, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '2217', 'MATIAS', 'ACOSTA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40310'),
(795, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '2391', 'DAVID', 'AGUIRRE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40310'),
(796, 0, NULL, 1, 0, '2014-10-14 02:32:21', NULL, '2359', 'ARIEL', 'ALVAREZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40310'),
(797, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '2358', 'JUAN', 'RODRIGUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40310'),
(798, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '2349', 'DIEGO', 'FRANCO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40310'),
(799, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '4110', 'VALERIA', 'GOMEZ GATTESCO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '40311'),
(800, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '2156', 'MARCOS', 'SALVATIERRA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40311'),
(801, 0, NULL, 2, 0, '2014-10-14 02:32:22', NULL, '2154', 'OSMAR ADRIAN', 'DELGADO', '23135013', 'SAN LORENZO 424', 'CA?UELAS', NULL, NULL, 882, NULL, '0222615539537', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40508'),
(802, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '1661', 'ALFREDO', 'DE RUIZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40311'),
(803, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '1660', 'MIGUEL', 'ROMERO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40311'),
(804, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '1655', 'EDGARDO', 'LIEBG', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40311'),
(805, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '1653', '', 'LAZARCZUK', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40311'),
(806, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '1651', 'CLAUDIO', 'AMADOR', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40311'),
(807, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '0962', '', 'BULDREGHINI', '', '', '', NULL, NULL, 0, NULL, '4645-0323', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40311'),
(808, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '0900', 'CARLOS', 'GOMEZ', '', '', '', NULL, NULL, 896, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40476'),
(809, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '0255', 'RODRIGO', 'AYLLON', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40311'),
(810, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '4100', 'ADRIAN', 'POZO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '40311'),
(811, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '4101', 'MAXIMILIANO', 'SOSA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '40311'),
(812, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '4103', 'MARIA', 'SBACCO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '40311'),
(813, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '4106', 'PABLO', 'ACOSTA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '40311'),
(814, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '4108', 'MARIA DEL MAR', 'MARTINEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '40311'),
(815, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '0120', 'RAUL', 'PAZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40322'),
(816, 0, NULL, 1, 0, '2014-10-14 02:32:22', NULL, '4152', 'MAXIMILIANO', 'SOSA', '', '', '', NULL, NULL, 986, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '40338'),
(817, 0, NULL, 2, 0, '2014-10-14 02:32:22', NULL, '2366', 'EMANUEL GASTON', 'AGUERO', '34249672', 'DA SILVA 2840', 'LIBERTAD', NULL, NULL, 952, NULL, '02204951614', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40343'),
(818, 0, NULL, 2, 0, '2014-10-14 02:32:22', NULL, '4852', 'LUCIO EMANUEL', 'MALAGRECA', '33397138', 'CHARCAS 3280', 'MORON', NULL, NULL, 972, NULL, '4697-5890', NULL, 0, 0, NULL, NULL, 1, 1, 2, '40357'),
(819, 0, NULL, 2, 0, '2014-10-14 02:32:23', NULL, '0460', 'DIEGO LUCAS', 'VILLAMIL', '29564928', 'CENTENERA 2076', 'SAN JUSTO', NULL, NULL, 396, NULL, '1560478184', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40394'),
(820, 0, NULL, 2, 0, '2014-10-14 02:32:23', NULL, '4008', 'EDUARDO DANIEL', 'VIOLA', '4704883', 'G. HERCHT 385', 'MORON', NULL, NULL, 944, NULL, '4450-9758', NULL, 0, 0, NULL, NULL, 1, 1, 2, '40431'),
(821, 0, NULL, 2, 0, '2014-10-14 02:32:23', NULL, '4402', 'FERNANDO GABRIEL', 'CIANFAGNA', '28285329', 'OLIVRA 2455', '', NULL, NULL, 944, NULL, '4624-8001', NULL, 0, 0, NULL, NULL, 1, 1, 4, '40434'),
(822, 0, NULL, 1, 0, '2014-10-14 02:32:23', NULL, '4403', 'GUSTAVO', 'RIPAMONTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '40434'),
(823, 0, NULL, 2, 0, '2014-10-14 02:32:23', NULL, '2226', 'MARCELO ARIEL', 'AVENDA?O', '26719354', 'ISACC BELSKY 410', '', NULL, NULL, 896, NULL, '1564970091', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40455'),
(824, 0, NULL, 1, 0, '2014-10-14 02:32:23', NULL, '4807', '', 'COSSIO', '44803', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '40464'),
(825, 0, NULL, 1, 0, '2014-10-14 02:32:23', NULL, '2267', 'MAXIMILIANO', 'FERRANDO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40522'),
(826, 0, NULL, 1, 0, '2014-10-14 02:32:23', NULL, '2256', 'MAXIMILIANO', 'PAEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40522'),
(827, 0, NULL, 1, 0, '2014-10-14 02:32:23', NULL, '2367', 'MARIANO', 'ACEVEDO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40532'),
(828, 0, NULL, 1, 0, '2014-10-14 02:32:23', NULL, '2397', 'MARIANO', 'ACEVEDO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40532'),
(829, 0, NULL, 2, 0, '2014-10-14 02:32:23', NULL, '4415', 'ADRIAN MAXIMILIANO', 'POZO', '23562222', 'MAZA 2345', 'MERLO 0220-4830675', NULL, NULL, 870, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 4, '40588'),
(830, 0, NULL, 1, 0, '2014-10-14 02:32:23', NULL, '1628', 'ALEJANDRO', 'PACHILLA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40589'),
(831, 0, NULL, 2, 0, '2014-10-14 02:32:23', NULL, '1659', 'MAXIMILIANO', 'ROJAS', '26038080', 'MARCOS PAZ 3763', '', NULL, NULL, 728, NULL, '1569475975', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40772'),
(832, 0, NULL, 1, 0, '2014-10-14 02:32:23', NULL, '0531', 'CARLOS', 'MONGES', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40589'),
(833, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '0641', 'JUAN MANUEL', 'DUARTE', '', '', '', NULL, NULL, 506, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40589'),
(834, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '0932', 'LUCIANO', 'PONZONI', '', '', '', NULL, NULL, 352, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40589'),
(835, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '0965', 'MARCELO', 'REYNOSO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40589'),
(836, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '3383', 'GERMAN', 'DEL CAMPO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40589'),
(837, 0, NULL, 2, 0, '2014-10-14 02:32:24', NULL, '2356', 'MARTIN', 'CALABOZO', '32810571', 'QUINTANA 1640', 'S.A.DE PADUA', NULL, NULL, 1400, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39150'),
(838, 0, NULL, 2, 0, '2014-10-14 02:32:24', NULL, '2208', 'MARCOS', 'INGEGNERI', '28674158', 'CAMPANA 1857', 'ING. BUDGE', NULL, NULL, 1344, NULL, '4285-5019', NULL, 0, 0, NULL, NULL, 1, 1, 5, '39402'),
(839, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '2426', 'ELIAS EZEQUIEL', 'OBREGON', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40589'),
(840, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '2227', 'LAZARO', 'PEROVICH', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40589'),
(841, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '2266', 'ANTONIO', 'VAZQUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40589'),
(842, 0, NULL, 2, 0, '2014-10-14 02:32:24', NULL, '2402', 'MATIAS', 'PASTEN', '33210532', 'ALCORTA 2901 P.A.', '', NULL, NULL, 674, NULL, '4476-0500', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40854'),
(843, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '2258', 'JAVIER', 'GONZALEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40589'),
(844, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '2382', 'JONATHAN', 'LUQUE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40589'),
(845, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '2403', 'MIGUEL', 'ESCAJADILLA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40589'),
(846, 0, NULL, 2, 0, '2014-10-14 02:32:24', NULL, '2428', 'FACUNDO ANDRS', 'HUMANO', '32543925', 'DOBLAS 2890', 'LIBERTAD MERLO', NULL, NULL, 0, NULL, '02204950961', NULL, 0, 0, NULL, NULL, 1, 1, 5, '41717'),
(847, 0, NULL, 2, 0, '2014-10-14 02:32:24', NULL, '2410', 'EZEQUIEL', 'REARTE', '32788926', 'J. NEWBERY 5338', 'G. CATAN', NULL, NULL, 418, NULL, '1567419226', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40589'),
(848, 0, NULL, 2, 0, '2014-10-14 02:32:24', NULL, '2309', 'JUAN CARLOS', 'SUAREZ', '30356411', 'FIDEL LOPEZ 2407', 'MARCOS PAZ', NULL, NULL, 230, NULL, '02204770630', NULL, 0, 0, NULL, NULL, 1, 1, 5, '41485'),
(849, 0, NULL, 2, 0, '2014-10-14 02:32:24', NULL, '2423', 'CESAR', 'RAMIREZ', '33258257', 'ITALIA 350', 'M. PAZ', NULL, NULL, 352, NULL, '01149492616', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40589'),
(850, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '2405', 'ANDRES', 'ROJO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40589'),
(851, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '2368', 'PABLO', 'RODRIGUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40589'),
(852, 0, NULL, 2, 0, '2014-10-14 02:32:24', NULL, '2350', 'MARIO', 'DIARMAS', '33261675', 'ACHACA 4325', 'MORON', NULL, NULL, 594, NULL, '46975335', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40989'),
(853, 0, NULL, 2, 0, '2014-10-14 02:32:24', NULL, '4083', 'JULIAN DAVID', 'GENES', '24949641', 'DORREGO 220', 'MARCOS PAZ', NULL, NULL, 852, NULL, '11-6100-6953', NULL, 0, 0, NULL, NULL, 1, 1, 4, '40589'),
(854, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '3400', 'LUISA DELIA', 'LENCINA', '', '(CONTI)', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40590'),
(855, 0, NULL, 2, 0, '2014-10-14 02:32:24', NULL, '4158', 'HECTOR ANTONIO', 'RUIZ', '23628150', 'MARIA REINA 151', 'MORON', NULL, NULL, 852, NULL, '4659-2328', NULL, 0, 0, NULL, NULL, 1, 1, 4, '40606'),
(856, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '3800', 'WALTER', 'MACIA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40606'),
(857, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '3801', 'ELIDA BEATRIZ', 'CABRAL', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40606'),
(858, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '3802', 'CRISTIAN', 'OLIVERA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40606'),
(859, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '3803', 'PABLO', 'BADANO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40606'),
(860, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '2218', 'CARLOS', 'FERREIRA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40606'),
(861, 0, NULL, 1, 0, '2014-10-14 02:32:24', NULL, '2362', 'JUAN PABLO', 'VILIERI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40606'),
(862, 0, NULL, 2, 0, '2014-10-14 02:32:25', NULL, '2364', 'JUAN ARIEL', 'SEGALA', '29320146', 'OZANAN 305', '', NULL, NULL, 764, NULL, '1561656230', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40718'),
(863, 0, NULL, 2, 0, '2014-10-14 02:32:25', NULL, '4154', 'ERIKA BEATRIZ', 'CRISTEAN', '27025393', 'AVIADOR AGNETA 700', 'CIUDAD JARDIN', NULL, NULL, 762, NULL, '47578229', NULL, 0, 0, NULL, NULL, 1, 1, 4, '40739');
INSERT INTO `socios` (`id`, `id_sexo`, `id_estudio`, `id_tipo_documento`, `id_tipo_socio`, `created_at`, `updated_at`, `nro_legajo`, `nombre`, `apellido`, `nro_documento`, `direccion`, `localidad`, `socio_futbol`, `socio_pesca`, `valor_historico`, `tel_cel`, `tel_part`, `tel_lab`, `estudios_id`, `tipos_socios_id`, `fecha_nac`, `id_usuario`, `socio_coop`, `socio_cocheria`, `id_empresa`, `fecha_inicio`) VALUES
(864, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '1667', 'VICTOR DIEGO', 'CHAILE', '', '', '', NULL, NULL, 728, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40760'),
(865, 0, NULL, 2, 0, '2014-10-14 02:32:25', NULL, '2425', 'CARLOS GASTON', 'MACIAS', '32961001', 'ZAPIOLA 2629', 'CASTELAR', NULL, NULL, 710, NULL, '54300914', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40786'),
(866, 0, NULL, 2, 0, '2014-10-14 02:32:25', NULL, '1632', 'OSVALDO JESUS', 'MARTINEZ', '24032235', 'FRAY BOTTARO 3749', '', NULL, NULL, 710, NULL, '1550942301', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40788'),
(867, 0, NULL, 2, 0, '2014-10-14 02:32:25', NULL, '1668', 'ARIEL HERNAN', 'MARINOTTI', '26194487', 'PIEDRA 3750', 'LOS POLVORINES', NULL, NULL, 710, NULL, '1544390494', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40788'),
(868, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '3900', 'MATIAS', 'PONCE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40791'),
(869, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '9002', 'FRANCISCO', 'PARADA VILLAR', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40791'),
(870, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '2399', 'MATIAS', 'ENDRIZZI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40791'),
(871, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '3901', 'CECILIA', 'COSCIO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40791'),
(872, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '4649', 'LUCILA', 'ALBINI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40791'),
(873, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '4848', 'ANTONELLA', 'DE FIORE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40791'),
(874, 0, NULL, 2, 0, '2014-10-14 02:32:25', NULL, '1654', 'PABLO ANDRES', 'REINOSO', '21958275', 'THOMSON 3461', '', NULL, NULL, 710, NULL, '1565204029', NULL, 0, 0, NULL, NULL, 1, 1, 5, '40793'),
(875, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '4871', 'MARTIN', 'ZUPPI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40791'),
(876, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '0973', 'HECTOR', 'SOTO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40791'),
(877, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '4864', 'MATIAS', 'GUIDOBONO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40791'),
(878, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '4119', 'JULIO', 'I?ON DIAZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40791'),
(879, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '3902', 'MARCELO', 'PINI CONJIU', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40791'),
(880, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '3903', 'GISELLA', 'MORENA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40791'),
(881, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '3904', 'SEGURO', 'CHOLO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40791'),
(882, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '4905', 'MIGUEL', 'LIVIERO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '40791'),
(883, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '3905', 'FERNANDO', 'INGRATTI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40795'),
(884, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '0478', 'LEANDRO', 'DOMINGUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40799'),
(885, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '0585', 'CESAR', 'LAMARI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40799'),
(886, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '3150', 'MARTIN', 'CORREA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40799'),
(887, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '9755', 'ANTONIO', 'SCIACCA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40799'),
(888, 0, NULL, 1, 0, '2014-10-14 02:32:25', NULL, '0568', 'ALBERTO', 'SE?UQUE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40799'),
(889, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '0991', '', 'JACIUK', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40799'),
(890, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '4011', 'DANIEL', 'FERRANDO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40799'),
(891, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '2389', 'ALEJANDRO', 'LENCINAS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40799'),
(892, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '2318', 'PEDRO', 'AVIDO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40799'),
(893, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '4752', 'CLAUDIO', 'PASCALE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '40800'),
(894, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '0465', 'JULIAN', 'VELAZQUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40800'),
(895, 0, NULL, 2, 0, '2014-10-14 02:32:26', NULL, '0469', 'CLAUDIO', 'DEL VALLE', '32564941', '', '', NULL, NULL, 34, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '41682'),
(896, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '0525', 'MARIANO', 'JUAREZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40827'),
(897, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '0920', 'HERNAN', 'BELFORT', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40827'),
(898, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '2331', 'ROBERTO', 'ARAUJO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40827'),
(899, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '4024', 'JUAN CARLOS', 'MACIAS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40827'),
(900, 0, NULL, 2, 0, '2014-10-14 02:32:26', NULL, '1634', 'JUAN CARLOS', 'VILLALBA', '26895186', 'CONGRESO 1877', 'J.C.PAZ', NULL, NULL, 0, NULL, '023206272225', NULL, 0, 0, NULL, NULL, 1, 1, 5, '41705'),
(901, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '0473', 'MARTIN', 'LABORDE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40827'),
(902, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '1635', 'RICARDO', 'ROJAS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40827'),
(903, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '2371', 'OSCAR', 'GOMEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40827'),
(904, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '0471', 'PABLO', 'MILANESI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40827'),
(905, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '0065', 'EZEQUIEL', 'FERNANDEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40827'),
(906, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '1624', 'MARCELO', 'FRREIRA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40827'),
(907, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '1665', 'JAVIER', 'VILLALBA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40827'),
(908, 0, NULL, 2, 0, '2014-10-14 02:32:26', NULL, '0461', 'LUCIANO', 'CAIRATTI', '34372329', 'GARCIA SILVA 1106', 'MORON', NULL, NULL, 118, NULL, '46295381', NULL, 0, 0, NULL, NULL, 1, 1, 5, '41600'),
(909, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '0474', 'DIEGO', 'BECERRA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40827'),
(910, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '2417', 'VICTOR HUGO', 'FERRARO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40861'),
(911, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '0971', 'JULIAN', 'SERFILIPPI', '', 'NOGOYA 5096', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40973'),
(912, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '1633', 'MARIO', 'ALASSIA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40973'),
(913, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '4159', 'PABLO GUILLERMO', 'CRESCIMONE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '40973'),
(914, 0, NULL, 1, 0, '2014-10-14 02:32:26', NULL, '2415', 'MATIAS', 'GIORDANI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40973'),
(915, 0, NULL, 1, 0, '2014-10-14 02:32:27', NULL, '0708', 'FERNANDO DARIO', 'LOSA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40973'),
(916, 0, NULL, 2, 0, '2014-10-14 02:32:27', NULL, '1663', 'LEONARDO GABRIEL', 'UNUKOWSKI', '28028469', 'CHOCANO', 'MERLO', NULL, NULL, 418, NULL, '1549759188', NULL, 0, 0, NULL, NULL, 1, 1, 5, '41227'),
(917, 0, NULL, 1, 0, '2014-10-14 02:32:27', NULL, '2420', 'ROBERTO', 'POTERALA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40975'),
(918, 0, NULL, 1, 0, '2014-10-14 02:32:27', NULL, '2377', 'MARIANO', 'ALVAREZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40975'),
(919, 0, NULL, 1, 0, '2014-10-14 02:32:27', NULL, '0467', 'MIGUEL', 'ROLLI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40982'),
(920, 0, NULL, 1, 0, '2014-10-14 02:32:27', NULL, '2341', 'DIEGO', 'MONTENEGRO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '40996'),
(921, 0, NULL, 1, 0, '2014-10-14 02:32:27', NULL, '2431', 'LAUTARO', 'LAZARTE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41096'),
(922, 0, NULL, 2, 0, '2014-10-14 02:32:27', NULL, '1657', 'ANGEL GABRIEL', 'PEREYRA', '27728622', 'QUINTANA 6691', 'MORENO', NULL, NULL, 396, NULL, '1558651706', NULL, 0, 0, NULL, NULL, 1, 1, 5, '41262'),
(923, 0, NULL, 1, 0, '2014-10-14 02:32:27', NULL, '2448', 'HUMBERTO ARIEL', 'CABRERA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41319'),
(924, 0, NULL, 1, 0, '2014-10-14 02:32:27', NULL, '4166', 'CRISTIAN', 'PEREYRA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '41346'),
(925, 0, NULL, 1, 0, '2014-10-14 02:32:27', NULL, '2429', 'CRISTIAN', 'OLIVERA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41346'),
(926, 0, NULL, 1, 0, '2014-10-14 02:32:27', NULL, '3750', 'SERGIO', 'BARRIOS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '41346'),
(927, 0, NULL, 1, 0, '2014-10-14 02:32:27', NULL, '3751', 'LEONEL', 'CALLERO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 2, '41346'),
(928, 0, NULL, 1, 0, '2014-10-14 02:32:27', NULL, '2427', 'CHISTIAN', 'SANCHEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41346'),
(929, 0, NULL, 1, 0, '2014-10-14 02:32:27', NULL, '0823', 'MARCELO', 'DIAZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41346'),
(930, 0, NULL, 1, 0, '2014-10-14 02:32:27', NULL, '4755', 'ANTONIO', 'SCIACCA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41346'),
(931, 0, NULL, 1, 0, '2014-10-14 02:32:27', NULL, '1367', 'RAMIRO', 'RODRIGUEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41346'),
(932, 0, NULL, 2, 0, '2014-10-14 02:32:28', NULL, '0841', 'LUIS', 'RAMIREZ', '34372479', 'ITALIA 354', '', NULL, NULL, 0, NULL, '1538875547', NULL, 0, 0, NULL, NULL, 1, 1, 5, '41705'),
(933, 0, NULL, 1, 0, '2014-10-14 02:32:28', NULL, '0950', 'WALTER', 'GIOVANONE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41355'),
(934, 0, NULL, 2, 0, '2014-10-14 02:32:28', NULL, '4162', 'GUSTAVO', 'WILLIANS', '24448116', 'BERMEJO 4039', 'SAN JUSTO', NULL, NULL, 339, NULL, '46912300', NULL, 0, 0, NULL, NULL, 1, 1, 4, '41355'),
(935, 0, NULL, 5, 0, '2014-10-14 02:32:28', NULL, '3140', 'OSCAR', 'ALVAREZ', '6408675', 'GORRITTI 2331', 'HURLINGHAM', NULL, NULL, 2005, NULL, '4662-6027', NULL, 0, 0, NULL, NULL, 0, 1, 2, '25943'),
(936, 0, NULL, 1, 0, '2014-10-14 02:32:28', NULL, '2452', 'GASTON', 'BRITEZ', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41400'),
(937, 0, NULL, 2, 0, '2014-10-14 02:32:28', NULL, '2439', 'RICARDO', 'OZAN', '16437059', '', '', NULL, NULL, 34, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '41682'),
(938, 0, NULL, 1, 0, '2014-10-14 02:32:28', NULL, '2363', 'EDGARDO', 'VILLA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41414'),
(939, 0, NULL, 1, 0, '2014-10-14 02:32:28', NULL, '0836', 'CARLOS', 'MONTINI', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41437'),
(940, 0, NULL, 1, 0, '2014-10-14 02:32:28', NULL, '0261', 'DANIEL SEBASTIAN', 'DIAZ', '', '', '', NULL, NULL, 62, NULL, '', NULL, 0, 0, NULL, NULL, 1, 1, 5, '41652'),
(941, 0, NULL, 2, 0, '2014-10-14 02:32:28', NULL, '0062', 'EDUARDO FELIPE', 'PAZ', '17895569', 'CACIQUE COLIQUEO 2168', '', NULL, NULL, 34, NULL, '0232044675', NULL, 0, 0, NULL, NULL, 1, 1, 5, '41680'),
(942, 0, NULL, 1, 0, '2014-10-14 02:32:28', NULL, '4165', 'MATIAS', 'PONCE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '41712'),
(943, 0, NULL, 1, 0, '2014-10-14 02:32:28', NULL, '2412', 'NAHUEL', 'VARGAS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41712'),
(944, 0, NULL, 1, 0, '2014-10-14 02:32:28', NULL, '2446', 'MAXIMILIANO', 'SANTANDER', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41712'),
(945, 0, NULL, 1, 0, '2014-10-14 02:32:28', NULL, '0030', 'EMMANUEL', 'ALASSIA', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41712'),
(946, 0, NULL, 1, 0, '2014-10-14 02:32:28', NULL, '2265', 'GERMAN', 'TOSO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41712'),
(947, 0, NULL, 1, 0, '2014-10-14 02:32:28', NULL, '0843', 'DANTE', 'ROJAS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41712'),
(948, 0, NULL, 1, 0, '2014-10-14 02:32:28', NULL, '2203', 'ALEJANDRO', 'RACKAUSKAS', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41712'),
(949, 0, NULL, 1, 0, '2014-10-14 02:32:29', NULL, '2401', 'JUAN PABLO', 'TORRES', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41712'),
(950, 0, NULL, 1, 0, '2014-10-14 02:32:29', NULL, '2418', 'GERMAN', 'GUIDOZZOLO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41712'),
(951, 0, NULL, 1, 0, '2014-10-14 02:32:29', NULL, '2411', 'GABRIEL', 'PONCE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41712'),
(952, 0, NULL, 1, 0, '2014-10-14 02:32:29', NULL, '2354', 'SERGIO', 'ROBLES', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41712'),
(953, 0, NULL, 1, 0, '2014-10-14 02:32:29', NULL, '4416', 'PABLO', 'CRESCIMONE', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 4, '41712'),
(954, 0, NULL, 1, 0, '2014-10-14 02:32:29', NULL, '1621', 'NICOLAS', 'DI FIORIO', '', '', '', NULL, NULL, 0, NULL, '', NULL, 0, 0, NULL, NULL, 0, 1, 5, '41712');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tipos_documentos`
--

INSERT INTO `tipos_documentos` (`id`, `descripcion`, `create_time`, `update_time`) VALUES
(1, '-', '2014-07-12 22:24:47', NULL),
(2, 'DNI', '2014-07-12 22:24:47', NULL),
(3, 'LE', '2014-07-12 22:24:57', NULL),
(4, 'Pasaporte', '2014-07-12 22:24:57', NULL),
(5, 'CI', '2014-07-12 22:24:57', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_socio`, `id_comercio`, `monto`, `interes`, `cantidad_cuotas`, `created_at`, `updated_at`, `descripcion`, `id_usuario`) VALUES
(1, 3, 1, 300, 0, 3, '2014-10-14 01:58:36', '2014-10-14 01:58:36', 'Venta', 1);

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
