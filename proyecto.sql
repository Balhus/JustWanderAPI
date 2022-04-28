-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Temps de generació: 28-04-2022 a les 17:25:23
-- Versió del servidor: 10.3.15-MariaDB
-- Versió de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `comercios`
--

CREATE TABLE `comercios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `descripcion` text NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `longitud` varchar(45) DEFAULT NULL,
  `latitud` varchar(45) DEFAULT NULL,
  `usuario_creador` int(11) NOT NULL,
  `dueño` int(11) DEFAULT NULL,
  `valoracion` varchar(45) DEFAULT NULL,
  `revisado` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcament de dades per a la taula `comercios`
--

INSERT INTO `comercios` (`id`, `nombre`, `descripcion`, `direccion`, `longitud`, `latitud`, `usuario_creador`, `dueño`, `valoracion`, `revisado`) VALUES
(1, 'Tienda de Sofia', 'Tienda de cafes del mundo y tes', 'Calle Barcelo n6', '41.67538', '34.9876', 1, NULL, '5', 0),
(2, '365 Forn', 'Tienda de desayunos', 'Calle la pepa n7', '34.90982', '12.87639', 1, NULL, '4.2', 0),
(3, 'Tienda de Pepito Grillo', 'Los mejores grillos asados de Barcelona y la costa litoral', 'Calle del cerdo n8', '10.0000', '19.83682', 1, NULL, '3', 0),
(4, 'Panaderia Griega', 'Panaderia de locos', 'Salònica, Grècia', '22.9444191', '40.6400629', 1, NULL, NULL, 0),
(5, 'asds', 'kkk', 'Carrer de Blai, 08004 Barcelona, Espanya', '2.164493', '41.3736842', 1, NULL, NULL, 0),
(6, 'Comercio de prueba', 'Comerico de prueba desde cleopatra', 'C. Marqués de Larios, Málaga, Espanya', '-4.421575', '36.7194687', 3, NULL, NULL, 0),
(7, 'Comercio de prueba', 'Comerico de prueba desde cleopatra', 'C. Marqués de Larios, Málaga, Espanya', '-4.421575', '36.7194687', 3, NULL, NULL, 0),
(8, 'Tienda randoms', 'Tienda de cosas randoms', 'Dubai - Dubayy - Emirats Àrabs Units', '55.2707828', '25.2048493', 1, NULL, NULL, 0),
(9, 'Comercio de fuego', 'Fuego a domicilio, de locos', "Carrer d\'En Llàstics, 6, 08003 Barcelona, Espanya", '2.1795656', '41.3884365', 1, NULL, NULL, 0),
(10, 'testetes', 'asdkahdoahdo', 'Carrer de la Gran Vista, Barcelona, Espanya', '2.1606749', '41.4202592', 1, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `filtros`
--

CREATE TABLE `filtros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcament de dades per a la taula `filtros`
--

INSERT INTO `filtros` (`id`, `nombre`) VALUES
(1, 'Artesanal'),
(2, 'KM0'),
(3, 'Vegano');

-- --------------------------------------------------------

--
-- Estructura de la taula `filtros_comercios`
--

CREATE TABLE `filtros_comercios` (
  `id` int(11) NOT NULL,
  `id_comercio` int(11) NOT NULL,
  `id_filtro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcament de dades per a la taula `filtros_comercios`
--

INSERT INTO `filtros_comercios` (`id`, `id_comercio`, `id_filtro`) VALUES
(1, 1, 1),
(2, 1, 2),
(4, 2, 3),
(5, 2, 2),
(6, 3, 2),
(7, 3, 3),
(8, 4, 1),
(9, 5, 1),
(10, 5, 2),
(11, 5, 3),
(12, 6, 1),
(13, 7, 1),
(14, 8, 1),
(15, 8, 3),
(16, 9, 2),
(17, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `fotos`
--

CREATE TABLE `fotos` (
  `id` int(11) NOT NULL,
  `idComercio` int(11) DEFAULT NULL,
  `nombre_img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcament de dades per a la taula `fotos`
--

INSERT INTO `fotos` (`id`, `idComercio`, `nombre_img`) VALUES
(1, 7, '1650979907469-PVU fondo.PNG'),
(2, 8, '1650995201819-andromeda-galaxy-way-ik-1920x1080.jpg'),
(3, 9, '1651069193781-fire.png'),
(4, 10, '1651152370470-andromeda-galaxy-way-ik-1920x1080.jpg');

-- --------------------------------------------------------

--
-- Estructura de la taula `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_filtro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `seguidores`
--

CREATE TABLE `seguidores` (
  `id` int(11) NOT NULL,
  `id_usuario_seguido` int(11) NOT NULL,
  `id_seguidor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcament de dades per a la taula `seguidores`
--

INSERT INTO `seguidores` (`id`, `id_usuario_seguido`, `id_seguidor`) VALUES
(1, 3, 1),
(2, 3, 2),
(3, 2, 3),
(4, 1, 3),
(5, 1, 2),
(7, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `email` varchar(60) NOT NULL,
  `nombre_usuario` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `puntuacion` int(11) DEFAULT 0,
  `feed_check` tinyint(4) DEFAULT NULL,
  `ubicacion_check` tinyint(4) DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT 0,
  `foto_usuario` varchar(150) DEFAULT NULL,
  `rol` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcament de dades per a la taula `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellidos`, `email`, `nombre_usuario`, `password`, `puntuacion`, `feed_check`, `ubicacion_check`, `activo`, `foto_usuario`, `rol`) VALUES
(1, 'test', 'test', 'test@gmail.com', 'test', '1234', 0, NULL, NULL, 1, NULL, 0),
(2, 'Teresa', 'Almucena', 'teresa@gmail.com', 'TereAlmu', '0987', 0, NULL, NULL, 1, NULL, 0),
(3, 'Cleopatra', 'Szamud', 'cleo@gmail.com', 'Cleosza', 'cleopatra', 0, NULL, NULL, 1, NULL, 0),
(4, 'Marc', 'asdasd', 'asd@gmail.com', 'asdass', '$2b$10$ssOam.ldJ8/RtY.77LE4b.XoI49zhoxTyBgcoi', 0, NULL, NULL, 0, NULL, 0),
(5, 'admin', 'admin', 'admin', 'Administrador', 'admin', 0, NULL, NULL, 1, NULL, 1);

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `comercios`
--
ALTER TABLE `comercios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_creador_idx` (`usuario_creador`);

--
-- Índexs per a la taula `filtros`
--
ALTER TABLE `filtros`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `filtros_comercios`
--
ALTER TABLE `filtros_comercios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comercio_idx` (`id_comercio`),
  ADD KEY `fk_filtro_idx` (`id_filtro`);

--
-- Índexs per a la taula `fotos`
--
ALTER TABLE `fotos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_foto_comercio_idx` (`idComercio`);

--
-- Índexs per a la taula `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_newsletter_idx` (`id_usuario`),
  ADD KEY `fk_filtro_newsletter_idx` (`id_filtro`);

--
-- Índexs per a la taula `seguidores`
--
ALTER TABLE `seguidores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_seguidor_idx` (`id_seguidor`),
  ADD KEY `fk_seguido_idx` (`id_usuario_seguido`);

--
-- Índexs per a la taula `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `comercios`
--
ALTER TABLE `comercios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la taula `filtros`
--
ALTER TABLE `filtros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la taula `filtros_comercios`
--
ALTER TABLE `filtros_comercios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT per la taula `fotos`
--
ALTER TABLE `fotos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la taula `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `seguidores`
--
ALTER TABLE `seguidores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la taula `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `comercios`
--
ALTER TABLE `comercios`
  ADD CONSTRAINT `fk_usuario_creador` FOREIGN KEY (`usuario_creador`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restriccions per a la taula `filtros_comercios`
--
ALTER TABLE `filtros_comercios`
  ADD CONSTRAINT `fk_comercio` FOREIGN KEY (`id_comercio`) REFERENCES `comercios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_filtro` FOREIGN KEY (`id_filtro`) REFERENCES `filtros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restriccions per a la taula `fotos`
--
ALTER TABLE `fotos`
  ADD CONSTRAINT `fk_foto_comercio` FOREIGN KEY (`idComercio`) REFERENCES `comercios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restriccions per a la taula `newsletter`
--
ALTER TABLE `newsletter`
  ADD CONSTRAINT `fk_filtro_newsletter` FOREIGN KEY (`id_filtro`) REFERENCES `filtros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_newsletter` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restriccions per a la taula `seguidores`
--
ALTER TABLE `seguidores`
  ADD CONSTRAINT `fk_seguido` FOREIGN KEY (`id_usuario_seguido`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seguidor` FOREIGN KEY (`id_seguidor`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
