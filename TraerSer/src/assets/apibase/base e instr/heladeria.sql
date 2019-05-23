-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-05-2019 a las 00:13:07
-- Versión del servidor: 10.1.33-MariaDB
-- Versión de PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `heladeria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `nacionalidad` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `sexo` varchar(8) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `edad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nombre`, `nacionalidad`, `sexo`, `edad`) VALUES
(1, 'Juan Garca', 'Chilena', 'm', 44),
(2, 'Hong Chen', 'China', 'm', 63),
(3, 'Mara Bente', 'Argentina', 'f', 27),
(4, 'Facundo Moreno', 'Argentina', 'm', 33),
(5, 'Patricio Gallego', 'Uruguaya', 'm', 41),
(6, 'Helena Fava', 'Uruguaya', 'f', 50),
(7, 'Ana Marrones', 'Peruana', 'f', 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `nombre` varchar(128) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `turno` varchar(128) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `tipo` varchar(128) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `idempleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`nombre`, `turno`, `tipo`, `idempleado`) VALUES
('Juan Alberto Garcia', 'noche', 'novato', 1),
('Fausto Manoste', 'mañana', 'novato', 2),
('Julio Sosa', 'tarde', 'novato', 3),
('Emilce Diaz', 'tarde', 'novato', 4),
('Mariano Torres', 'mañana', 'novato', 5),
('Francisco Lopez', 'noche', 'novato', 6),
('Marcela Alarillo', 'tarde', 'ecargado', 7),
('Nahuel Mercado', 'mañana', 'encargado', 8),
('Osvaldo Hospital', 'mañana', 'jefe', 9),
('Micaela Gramajo', 'noche', 'jefe', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helados`
--

CREATE TABLE `helados` (
  `Idhelado` int(11) NOT NULL,
  `sabor` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `precio` float NOT NULL,
  `tipo` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `kilos` int(11) NOT NULL,
  `foto` varchar(30) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `helados`
--

INSERT INTO `helados` (`Idhelado`, `sabor`, `precio`, `tipo`, `kilos`, `foto`) VALUES
(1, 'Limon', 200, 'Agua', 10000, '1_limon.jpeg'),
(2, 'Chocolate', 350, 'Crema', 10000, '2_chocolate.jpg'),
(3, 'Dulce de leche', 550, 'Crema', 10000, '3_dulce-de-leche.jpg'),
(4, 'Pomelo', 350, 'Agua', 10000, '4_pomelo.jpg'),
(5, 'Durazno', 350, 'Crema', 9995, '5_durazno.jpg'),
(6, 'Frambuesa', 450, 'Crema', 10000, '6_frambuesa.jpg'),
(7, 'Kiwi', 250, 'Agua', 10000, '7_kiwi.jpg'),
(8, 'Maracuya', 250, 'Agua', 10000, '8_maracuya.jpg'),
(9, 'Limon', 500, 'Crema', 12000, '9_limon.jpeg'),
(10, 'Chocolate', 0, 'Agua', 15000, '10_chocolate.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locales`
--

CREATE TABLE `locales` (
  `idLocal` int(11) NOT NULL,
  `direccion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `idLocalidad` int(11) NOT NULL,
  `estado` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `locales`
--

INSERT INTO `locales` (`idLocal`, `direccion`, `idLocalidad`, `estado`) VALUES
(1, 'Rincon 408', 7, 'abierto'),
(2, 'Albarracin 48', 10, 'abierto'),
(3, 'Perez Volpin 2483', 2, 'abierto'),
(4, 'Sultanes 101', 8, 'abierto'),
(5, 'Bores 1280', 5, 'cerrado'),
(6, 'Belgrano 12087', 3, 'cerrado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `idLocalidad` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `provincia` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` varchar(15) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `localidades`
--

INSERT INTO `localidades` (`idLocalidad`, `nombre`, `provincia`, `estado`) VALUES
(1, 'Gualeguay', 'Entre Rios', 'cerrado'),
(2, 'Mar del Plata', 'Buenos Aires', 'abierto'),
(3, 'Barrio Lindo', 'Buenos Aires', 'cerrado'),
(4, 'Villaguay', 'Corrientes', 'abierto'),
(5, 'Tingal', 'Formosa', 'cerrado'),
(6, 'Monte', 'Buenos Aires', 'cerrado'),
(7, 'Bragado', 'Buenos Aires', 'abierto'),
(8, 'Bariloche', 'Neuquen', 'abierto'),
(9, 'Punta Indio', 'Buenos Aires', 'cerrado'),
(10, 'Necochea', 'Buenos Aires', 'abierto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idventa` int(11) NOT NULL,
  `idlocal` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idempleado` int(11) NOT NULL,
  `idhelado` int(11) NOT NULL,
  `fecha` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idventa`, `idlocal`, `idcliente`, `idempleado`, `idhelado`, `fecha`, `cantidad`) VALUES
(1, 3, 1, 3, 5, '16/03/2001', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idempleado`);

--
-- Indices de la tabla `helados`
--
ALTER TABLE `helados`
  ADD PRIMARY KEY (`Idhelado`);

--
-- Indices de la tabla `locales`
--
ALTER TABLE `locales`
  ADD PRIMARY KEY (`idLocal`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`idLocalidad`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idventa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idempleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `helados`
--
ALTER TABLE `helados`
  MODIFY `Idhelado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=800;

--
-- AUTO_INCREMENT de la tabla `locales`
--
ALTER TABLE `locales`
  MODIFY `idLocal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `idLocalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
