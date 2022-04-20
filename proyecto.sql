-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Temps de generació: 20-04-2022 a les 16:17:09
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

-- --------------------------------------------------------

--
-- Estructura de la taula `filtros`
--

CREATE TABLE `filtros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `filtros_comercios`
--

CREATE TABLE `filtros_comercios` (
  `id` int(11) NOT NULL,
  `id_comercio` int(11) NOT NULL,
  `id_filtro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `fotos`
--

CREATE TABLE `fotos` (
  `id` int(11) NOT NULL,
  `idComercio` int(11) DEFAULT NULL,
  `nombre_img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `puntuacion` int(11) DEFAULT NULL,
  `feed_check` tinyint(4) DEFAULT NULL,
  `ubicacion_check` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcament de dades per a la taula `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellidos`, `email`, `nombre_usuario`, `password`, `puntuacion`, `feed_check`, `ubicacion_check`) VALUES
(1, 'test', 'test', 'test@gmail.com', 'test', '1234', NULL, NULL, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `filtros`
--
ALTER TABLE `filtros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `filtros_comercios`
--
ALTER TABLE `filtros_comercios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `seguidores`
--
ALTER TABLE `seguidores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
