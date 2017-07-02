-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-06-2017 a las 04:16:00
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `pokemon2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ataques`
--

CREATE TABLE IF NOT EXISTS `ataques` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `max_poder` tinyint(3) NOT NULL,
  `tipos_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_ataques_tipos1_idx` (`tipos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `ataques`
--

INSERT INTO `ataques` (`id`, `nombre`, `max_poder`, `tipos_id`) VALUES
(1, 'Tirar Fuego', 6, 4),
(2, 'Tirar Agua', 6, 18),
(3, 'Plantaso', 126, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenadores`
--

CREATE TABLE IF NOT EXISTS `entrenadores` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `edad` varchar(255) NOT NULL,
  `sexos_id1` tinyint(1) unsigned NOT NULL,
  `pueblos_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entrenadores_sexos1_idx` (`sexos_id1`),
  KEY `fk_entrenadores_pueblos1_idx` (`pueblos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `entrenadores`
--

INSERT INTO `entrenadores` (`id`, `nombre`, `edad`, `sexos_id1`, `pueblos_id`) VALUES
(6, 'Dracula', '174', 5, 1),
(7, 'El Jorobado', '27', 5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especies`
--

CREATE TABLE IF NOT EXISTS `especies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `especies`
--

INSERT INTO `especies` (`id`, `nombre`) VALUES
(1, 'Charmander'),
(2, 'Charmeleon'),
(3, 'Charizard'),
(4, 'Bulbasaur'),
(5, 'Ivysaur'),
(6, 'Venusaur'),
(7, 'Squirtle'),
(8, 'Wartortle'),
(9, 'Blastoise'),
(10, 'Vulpix'),
(11, 'Ninetales'),
(12, 'Meowth'),
(13, 'Persian'),
(14, 'Psyduck'),
(15, 'Golduck'),
(16, 'Eevee'),
(17, 'Vaporeon'),
(18, 'Jolteon'),
(19, 'Flareon'),
(20, 'Mew'),
(21, 'Mewtwo'),
(22, 'Krookodile');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especies_tipos`
--

CREATE TABLE IF NOT EXISTS `especies_tipos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `especies_id` int(10) unsigned DEFAULT NULL,
  `tipos_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `especies_id` (`especies_id`) USING BTREE,
  KEY `fk_especies_tipos_tipos1_idx` (`tipos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `especies_tipos`
--

INSERT INTO `especies_tipos` (`id`, `especies_id`, `tipos_id`) VALUES
(1, 1, 4),
(2, 2, 4),
(3, 3, 4),
(4, 4, 14),
(5, 5, 14),
(6, 6, 14),
(7, 7, 18),
(8, 8, 18),
(9, 9, 18),
(10, 10, 4),
(11, 11, 4),
(12, 12, 7),
(13, 13, 7),
(14, 14, 18),
(15, 14, 8),
(16, 15, 18),
(17, 15, 8),
(18, 16, 7),
(19, 17, 18),
(20, 18, 11),
(21, 19, 4),
(22, 20, 8),
(23, 21, 8),
(24, 22, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evoluciones`
--

CREATE TABLE IF NOT EXISTS `evoluciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `especies_id` int(10) unsigned NOT NULL,
  `evolucion_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_evoluciones_especies1_idx` (`especies_id`),
  KEY `fk_evoluciones_especies2_idx` (`evolucion_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `evoluciones`
--

INSERT INTO `evoluciones` (`id`, `especies_id`, `evolucion_id`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 4, 5),
(4, 5, 6),
(5, 7, 8),
(6, 8, 9),
(7, 10, 11),
(8, 12, 13),
(9, 14, 15),
(10, 16, 17),
(11, 16, 18),
(12, 16, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gimnasios`
--

CREATE TABLE IF NOT EXISTS `gimnasios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `pueblos_id` int(10) unsigned NOT NULL,
  `entrenadores_id` int(11) unsigned NOT NULL,
  `medallas_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_gimnasios_pueblos1_idx` (`pueblos_id`),
  KEY `fk_gimnasios_entrenadores1_idx` (`entrenadores_id`),
  KEY `fk_gimnasios_medallas1_idx` (`medallas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `gimnasios`
--

INSERT INTO `gimnasios` (`id`, `nombre`, `pueblos_id`, `entrenadores_id`, `medallas_id`) VALUES
(1, 'Megatlon', 1, 6, 2),
(2, 'SportClub', 2, 7, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE IF NOT EXISTS `imagenes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `especies_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `especies_id` (`especies_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`id`, `image`, `especies_id`) VALUES
(8, '2.png', 4),
(9, '6.png', 3),
(10, '1.png', 7),
(11, '4.png', 1),
(12, '16.png', 5),
(13, '17.png', 8),
(14, '3.png', 6),
(15, '15.png', 20),
(16, '14.png', 21),
(17, '553.png', 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medallas`
--

CREATE TABLE IF NOT EXISTS `medallas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `medallas`
--

INSERT INTO `medallas` (`id`, `nombre`) VALUES
(1, 'Bronce'),
(2, 'Oro'),
(3, 'Plata');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medallas_entrenadores`
--

CREATE TABLE IF NOT EXISTS `medallas_entrenadores` (
  `medallas_id` int(10) unsigned DEFAULT NULL,
  `entrenadores_id` int(11) unsigned DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_medallas_has_entrenadores_entrenadores1_idx` (`entrenadores_id`),
  KEY `fk_medallas_has_entrenadores_medallas1_idx` (`medallas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokebolas`
--

CREATE TABLE IF NOT EXISTS `pokebolas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipos_pokebolas_id` int(10) unsigned NOT NULL,
  `entrenadores_id` int(11) unsigned NOT NULL,
  `pokemones_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_pokebolas_tipos_pokebolas1_idx` (`tipos_pokebolas_id`),
  KEY `fk_pokebolas_entrenadores1_idx` (`entrenadores_id`),
  KEY `fk_pokebolas_pokemones1_idx` (`pokemones_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `pokebolas`
--

INSERT INTO `pokebolas` (`id`, `tipos_pokebolas_id`, `entrenadores_id`, `pokemones_id`) VALUES
(1, 1, 6, 12),
(2, 3, 7, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemones`
--

CREATE TABLE IF NOT EXISTS `pokemones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `nivel` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sexos_id` tinyint(1) unsigned NOT NULL,
  `especies_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `sexos_id` (`sexos_id`) USING BTREE,
  KEY `especies_id` (`especies_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `pokemones`
--

INSERT INTO `pokemones` (`id`, `nombre`, `nivel`, `sexos_id`, `especies_id`) VALUES
(12, 'Tincho', 1, 5, 11),
(13, 'Negro', 1, 6, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemones_ataques`
--

CREATE TABLE IF NOT EXISTS `pokemones_ataques` (
  `ataques_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pokemones_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_especies_has_ataques_ataques1_idx` (`ataques_id`),
  KEY `fk_pokemones_ataques_pokemones1_idx` (`pokemones_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pueblos`
--

CREATE TABLE IF NOT EXISTS `pueblos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `pueblos`
--

INSERT INTO `pueblos` (`id`, `nombre`) VALUES
(1, 'Pensilvania'),
(2, 'Notre Dame'),
(3, 'Springfield'),
(4, 'Esparta'),
(5, 'Villa Dalmine'),
(6, '1-11-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexos`
--

CREATE TABLE IF NOT EXISTS `sexos` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `sexo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `sexos`
--

INSERT INTO `sexos` (`id`, `sexo`) VALUES
(5, 'masculino'),
(6, 'femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE IF NOT EXISTS `tipos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id`, `nombre`) VALUES
(1, 'Bicho'),
(2, 'Dragon'),
(3, 'Hada'),
(4, 'Fuego'),
(5, 'Fantasma'),
(6, 'Tierra'),
(7, 'Normal'),
(8, 'Psiquico'),
(9, 'Acero'),
(10, 'Siniestro'),
(11, 'Electrico'),
(12, 'Lucha'),
(13, 'Volador'),
(14, 'Planta'),
(15, 'Hielo'),
(16, 'Veneno'),
(17, 'Roca'),
(18, 'Agua'),
(19, 'Oscuro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_pokebolas`
--

CREATE TABLE IF NOT EXISTS `tipos_pokebolas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tipos_pokebolas`
--

INSERT INTO `tipos_pokebolas` (`id`, `nombre`) VALUES
(1, 'Normal'),
(2, 'Super'),
(3, 'Master');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `nivel` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `pass`, `nivel`) VALUES
(1, 'Martin', 'Bobbio', 'martinbobbio1@gmail.com', '$2y$10$xcXN7SZMpEv/mjN70LCFX.7Nv5nMZXQRkhNWW8k72Ge7CIZYYAkKa', 1),
(2, 'Pepe', 'Lima', 'pepe@gmail.com', '$2y$10$y8QCnORwWR4YJjaEnJF3PubLBDoFCcFB81KCubBek7YFmoovGFM/2', 0),
(3, 'Sergio', 'Ramos', 'sergioramos@gmail.com', '$2y$10$aQs1IkKWDBBNBXG1sbvRu.W1tWulZSQgsI5GpGNFFhXaav7Z5gQ6K', 0),
(5, 'Soraya', 'Piolo', 'soraya@gmail.com', '$2y$10$otgksUinIS3ejNChzksO0eZ/ou8wC6rrt4UNqW3wPKQlRND6guYb6', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ataques`
--
ALTER TABLE `ataques`
  ADD CONSTRAINT `fk_ataques_tipos1` FOREIGN KEY (`tipos_id`) REFERENCES `tipos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entrenadores`
--
ALTER TABLE `entrenadores`
  ADD CONSTRAINT `fk_entrenadores_pueblos1` FOREIGN KEY (`pueblos_id`) REFERENCES `pueblos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_entrenadores_sexos1` FOREIGN KEY (`sexos_id1`) REFERENCES `sexos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `especies_tipos`
--
ALTER TABLE `especies_tipos`
  ADD CONSTRAINT `fk_especies_tipos` FOREIGN KEY (`especies_id`) REFERENCES `especies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_especies_tipos_tipos1` FOREIGN KEY (`tipos_id`) REFERENCES `tipos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `evoluciones`
--
ALTER TABLE `evoluciones`
  ADD CONSTRAINT `fk_evoluciones_especies1` FOREIGN KEY (`especies_id`) REFERENCES `especies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_evoluciones_especies2` FOREIGN KEY (`evolucion_id`) REFERENCES `especies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `gimnasios`
--
ALTER TABLE `gimnasios`
  ADD CONSTRAINT `fk_gimnasios_entrenadores1` FOREIGN KEY (`entrenadores_id`) REFERENCES `entrenadores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gimnasios_medallas1` FOREIGN KEY (`medallas_id`) REFERENCES `medallas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gimnasios_pueblos1` FOREIGN KEY (`pueblos_id`) REFERENCES `pueblos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD CONSTRAINT `fk_pespecies_imagenes` FOREIGN KEY (`especies_id`) REFERENCES `especies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `medallas_entrenadores`
--
ALTER TABLE `medallas_entrenadores`
  ADD CONSTRAINT `fk_entrenadores_entrenadores_medallas` FOREIGN KEY (`entrenadores_id`) REFERENCES `entrenadores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_medallas_entrenadores_medallas` FOREIGN KEY (`medallas_id`) REFERENCES `medallas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pokebolas`
--
ALTER TABLE `pokebolas`
  ADD CONSTRAINT `fk_pokebolas_entrenadores1` FOREIGN KEY (`entrenadores_id`) REFERENCES `entrenadores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pokebolas_pokemones1` FOREIGN KEY (`pokemones_id`) REFERENCES `pokemones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pokebolas_tipos_pokebolas1` FOREIGN KEY (`tipos_pokebolas_id`) REFERENCES `tipos_pokebolas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pokemones`
--
ALTER TABLE `pokemones`
  ADD CONSTRAINT `fk_especies_pokemones` FOREIGN KEY (`especies_id`) REFERENCES `especies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sexos_pokemones` FOREIGN KEY (`sexos_id`) REFERENCES `sexos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `pokemones_ataques`
--
ALTER TABLE `pokemones_ataques`
  ADD CONSTRAINT `fk_especies_has_ataques_ataques1` FOREIGN KEY (`ataques_id`) REFERENCES `ataques` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pokemones_ataques_pokemones1` FOREIGN KEY (`pokemones_id`) REFERENCES `pokemones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
