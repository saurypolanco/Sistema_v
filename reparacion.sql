-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-04-2020 a las 03:54:30
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reparacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `id_art` int(13) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `precio_compra` decimal(10,2) NOT NULL,
  `precio_venta` float(10,2) NOT NULL,
  `itbis` float(10,2) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`id_art`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `itbis`, `status`) VALUES
(1, 'cpu', 'dell inspiron 2500', '2000.00', 2200.00, 2.00, b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(13) NOT NULL,
  `fecha_reg` date NOT NULL,
  `status` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `fecha_reg`, `status`) VALUES
(1, '2020-03-24', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `num_compra` int(13) NOT NULL,
  `id_tercero` int(13) NOT NULL,
  `id_user` int(13) NOT NULL,
  `fecha` date NOT NULL,
  `total` float NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`num_compra`, `id_tercero`, `id_user`, `fecha`, `total`, `status`) VALUES
(1, 1, 2, '2020-04-12', 500, b'0'),
(2, 1, 2, '2020-05-12', 1000, b'0'),
(3, 1, 2, '2020-06-12', 2000, b'0'),
(4, 1, 2, '2020-07-12', 15000, b'0'),
(5, 1, 2, '2020-08-12', 6000, b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id_detalle` int(13) NOT NULL,
  `num_compra` int(13) NOT NULL,
  `articulo` varchar(50) NOT NULL,
  `precio_compra` float NOT NULL,
  `precio_venta` float NOT NULL,
  `cantidad` int(13) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `subtotal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `num_detalle` int(13) NOT NULL,
  `num_factura` int(13) NOT NULL,
  `id_orden` int(13) DEFAULT NULL,
  `id_art` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_orden`
--

CREATE TABLE `detalle_orden` (
  `id_orden` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `serial` varchar(50) NOT NULL,
  `diagnostico` int(11) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_orden`
--

INSERT INTO `detalle_orden` (`id_orden`, `item`, `id_equipo`, `serial`, `diagnostico`, `descripcion`) VALUES
(3, 1, 1, 'AS022354', 1, 'no enciende'),
(3, 2, 1, 'ASDA', 1, 'asdasd'),
(0, 1, 1, 'FDS', 1, 'sdfsd'),
(4, 1, 1, 'ASDSADS', 1, 'asdasd'),
(5, 1, 1, 'ASDSADS', 1, 'asdasd'),
(5, 2, 1, 'ASDSADS', 1, 'asdasd'),
(5, 3, 1, 'ASDSADS', 1, 'asdasd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico`
--

CREATE TABLE `diagnostico` (
  `id_diagnostico` int(13) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha_reg` date NOT NULL,
  `precio` float(10,2) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `diagnostico`
--

INSERT INTO `diagnostico` (`id_diagnostico`, `nombre`, `fecha_reg`, `precio`, `status`) VALUES
(1, 'NO ENCIENDE', '2020-03-24', 500.00, b'0'),
(3, 'PANTALLA NO DA VIDEO', '2020-04-05', 5000.00, b'0'),
(4, 'EL TECLADO NO FUNCIONA', '2020-04-05', 1000.00, b'0'),
(5, 'LA PC NO LEE LAS USB', '2020-04-06', 2500.00, b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_per` int(13) NOT NULL,
  `fecha_r` date NOT NULL DEFAULT current_timestamp(),
  `t_emp` varchar(50) NOT NULL,
  `tanda` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_per`, `fecha_r`, `t_emp`, `tanda`, `status`) VALUES
(1, '2020-03-22', 'Fijo', 'Matutina', b'0'),
(3, '2020-03-30', 'Fijo', 'Matutina', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id_equipo` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `fec_reg` date NOT NULL,
  `usuario` int(11) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id_equipo`, `nombre`, `fec_reg`, `usuario`, `status`) VALUES
(1, 'CPU', '2020-03-25', 1, b'0'),
(2, 'MONITOR', '2020-03-25', 1, b'0'),
(3, 'IMPRESORA', '2020-03-25', 1, b'0'),
(4, 'UPS', '2020-03-25', 1, b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `num_factura` int(11) NOT NULL,
  `usuario` varchar(15) CHARACTER SET latin1 NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `forma_pago` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `itbis` float NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id_orden` int(13) NOT NULL,
  `id_cliente` int(13) NOT NULL,
  `id_user` int(13) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `subtotal` float(10,2) NOT NULL,
  `num_factura` int(11) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id_orden`, `id_cliente`, `id_user`, `id_tipo`, `fecha`, `subtotal`, `num_factura`, `status`) VALUES
(3, 1, 1, 8, '2020-03-30', 0.00, NULL, b'0'),
(4, 1, 2, 8, '2020-04-19', 0.00, NULL, b'0'),
(5, 1, 2, 8, '2020-04-19', 0.00, NULL, b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_per` int(13) NOT NULL,
  `tipo_doc` int(13) NOT NULL,
  `documento` varchar(13) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `sexo` bit(1) NOT NULL,
  `fecha_nac` date NOT NULL,
  `direccion` text NOT NULL,
  `tel` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecreg` datetime NOT NULL DEFAULT current_timestamp(),
  `ureg` varchar(15) NOT NULL DEFAULT 'user',
  `status` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_per`, `tipo_doc`, `documento`, `nombre`, `apellido`, `sexo`, `fecha_nac`, `direccion`, `tel`, `email`, `fecreg`, `ureg`, `status`) VALUES
(1, 0, '40212783688', 'SAURY JS', 'POLANCO VERAS', b'0', '2000-07-14', 'BARRIO FELIPE DURAN #51, TAMBORIL, SANTIAGO', '829-638-1144', 'saurypolanco@gmail.com', '2020-03-20 19:49:46', 'USUARIO', b'0'),
(2, 1, '123456789', 'administrador', 'administrador', b'0', '2020-04-12', '.', '.', '.', '2020-04-12 19:58:16', 'user', b'0'),
(3, 0, '123123122', 'JUAN', 'PEREZ', b'0', '2000-07-14', 'TAMBORIL, #51, SANTIAGO', '829-658-7541', 'jperez@gmail.com', '2020-03-30 18:18:45', 'USUARIO', b'0'),
(4, 0, '40212785488', 'MARIA', 'BRITO', b'1', '1998-01-02', 'LOS REYES #32', '829-698-5887', 'mbrito@gmail.com', '2020-04-05 17:02:08', 'SPOLANCO', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id_tipo` int(13) NOT NULL,
  `grptipo` varchar(20) DEFAULT NULL,
  `tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id_tipo`, `grptipo`, `tipo`) VALUES
(1, 'DOC', 'CEDULA'),
(2, 'DOC', 'PASAPORTE'),
(3, 'USR', 'ADMINISTRADOR'),
(4, 'USR', 'SUPERVISOR'),
(5, 'USR', 'USUARIO'),
(6, 'FAC', 'COMPRA'),
(7, 'FAC', 'VENTA'),
(8, 'MANT', 'REPARACION'),
(9, 'MANT', 'CORRECTIVO'),
(10, 'MANT', 'PREVENTIVO'),
(11, 'FPAGO', 'EFECTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_per` int(13) NOT NULL,
  `user_name` varchar(15) NOT NULL,
  `pass` text NOT NULL,
  `tipo` int(11) NOT NULL,
  `status` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_per`, `user_name`, `pass`, `tipo`, `status`) VALUES
(2, 'ADMIN', '123456', 3, b'0'),
(3, 'JPEREZ', '12345', 3, b'0'),
(1, 'SPOLANCO', 'ADMIN', 3, b'0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`id_art`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`num_compra`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id_detalle`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`num_detalle`,`num_factura`),
  ADD KEY `id_orden` (`id_orden`),
  ADD KEY `id_art` (`id_art`);

--
-- Indices de la tabla `detalle_orden`
--
ALTER TABLE `detalle_orden`
  ADD KEY `id_orden` (`id_orden`),
  ADD KEY `diagnostico` (`diagnostico`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD PRIMARY KEY (`id_diagnostico`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD KEY `id_per` (`id_per`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id_equipo`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`num_factura`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `usuario_2` (`usuario`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_tipo` (`id_tipo`),
  ADD KEY `num_factura` (`num_factura`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_per`),
  ADD KEY `ureg` (`ureg`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`user_name`),
  ADD UNIQUE KEY `id_per` (`id_per`),
  ADD KEY `tipo` (`tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `id_art` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `num_compra` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id_detalle` int(13) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `num_detalle` int(13) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `num_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id_orden` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id_tipo` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `persona` (`id_per`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`user_name`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
