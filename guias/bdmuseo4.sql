-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2023 a las 17:51:49
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdmuseo4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dtvisita`
--

CREATE TABLE `dtvisita` (
  `IDVisita` int(11) NOT NULL,
  `Hora_Establecida` int(11) DEFAULT NULL,
  `IDMuseo` int(11) NOT NULL,
  `Orden` int(11) DEFAULT NULL,
  `Duración` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guia`
--

CREATE TABLE `guia` (
  `IDGuia` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Dni` int(11) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Telefono` int(11) NOT NULL,
  `Redes_Sociales` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `museo`
--

CREATE TABLE `museo` (
  `IDMuseo` int(11) NOT NULL,
  `NomMuseo` varchar(30) DEFAULT NULL,
  `Ubicación` int(11) DEFAULT NULL,
  `HoraAp` date DEFAULT NULL,
  `HoraCr` date DEFAULT NULL,
  `Telefono` varchar(12) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `PáginaWeb` varchar(100) DEFAULT NULL,
  `Redes_Sociales` varchar(100) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `IDRegistro` int(11) NOT NULL,
  `IDVisita` int(11) NOT NULL,
  `IDUsuario` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `monto` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IDUsuario` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Telefono` int(11) NOT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `Usuario` varchar(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--

CREATE TABLE `visita` (
  `IDVisita` int(11) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `HoraSalida` int(11) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `IDGuia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dtvisita`
--
ALTER TABLE `dtvisita`
  ADD PRIMARY KEY (`IDMuseo`,`IDVisita`);

--
-- Indices de la tabla `guia`
--
ALTER TABLE `guia`
  ADD PRIMARY KEY (`IDGuia`);

--
-- Indices de la tabla `museo`
--
ALTER TABLE `museo`
  ADD PRIMARY KEY (`IDMuseo`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`IDRegistro`),
  ADD KEY `IDVisita` (`IDVisita`),
  ADD KEY `IDUsuario` (`IDUsuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IDUsuario`);

--
-- Indices de la tabla `visita`
--
ALTER TABLE `visita`
  ADD PRIMARY KEY (`IDVisita`),
  ADD KEY `IDGuia` (`IDGuia`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dtvisita`
--
ALTER TABLE `dtvisita`
  ADD CONSTRAINT `dtvisita_ibfk_1` FOREIGN KEY (`IDMuseo`) REFERENCES `museo` (`IDMuseo`);

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`IDVisita`) REFERENCES `visita` (`IDVisita`),
  ADD CONSTRAINT `registro_ibfk_2` FOREIGN KEY (`IDUsuario`) REFERENCES `usuario` (`IDUsuario`);

--
-- Filtros para la tabla `visita`
--
ALTER TABLE `visita`
  ADD CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`IDGuia`) REFERENCES `guia` (`IDGuia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
