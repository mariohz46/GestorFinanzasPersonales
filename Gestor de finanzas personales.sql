CREATE DATABASE gestorFinanzasPersonales;
use gestorFinanzasPersonales;

CREATE TABLE `CategoriaIngresos` (
  `idCategoriaIngreso` INT NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(30),
  PRIMARY KEY(`idCategoriaIngreso`)
);

CREATE TABLE `CategoriaGastos` (
  `idCategoriaGasto` INT NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(30),
  PRIMARY KEY(`idCategoriaGasto`)
);

CREATE TABLE `Ingresos` (
  `idIngreso` INT NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100),
  `fecha` date,
  `monto` int,
  `idCategoriaIngreso` int,
  PRIMARY KEY(`idIngreso`),
  FOREIGN KEY (`idCategoriaIngreso`) REFERENCES `CategoriaIngresos` (`idCategoriaIngreso`)
);

CREATE TABLE `Ahorros` (
  `idAhorro` INT NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50),
  `monto` int,
  `idIngreso` int,
  PRIMARY KEY(`idAhorro`),
  FOREIGN KEY (`idIngreso`) REFERENCES `Ingresos` (`idIngreso`)
);

CREATE TABLE `GastosVariables` (
  `idGastoV` INT NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60),
  `monto` int,
  `idCategoriaGasto` int,
  PRIMARY KEY(`idGastoV`),
  FOREIGN KEY (`idCategoriaGasto`) REFERENCES `CategoriaGastos` (`idCategoriaGasto`)
);

CREATE TABLE `GastosFijos` (
  `idGastoF` INT NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60),
  `monto` int,
  `idCategoriaGasto` int,
  PRIMARY KEY(`idGastoF`),
  FOREIGN KEY (`idCategoriaGasto`) REFERENCES `CategoriaGastos` (`idCategoriaGasto`)
);

CREATE TABLE `RegistroGastos` (
  `idRegistroGasto` INT NOT NULL AUTO_INCREMENT,
  `fecha` date,
  `idCategoriaGasto` int,
  PRIMARY KEY(`idRegistroGasto`),
  FOREIGN KEY (`idCategoriaGasto`) REFERENCES `CategoriaGastos` (`idCategoriaGasto`)
);

CREATE TABLE `FechasDePago` (
  `idFechaDePago` INT NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50),
  `fecha` date,
  PRIMARY KEY(`idFechaDePago`)
);

CREATE TABLE `Presupuestos` (
  `idPresupuesto` INT NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255),
  `fechaInicio` date,
  `fechaFinal` date,
  `totalPresupuesto` int,
  PRIMARY KEY(`idPresupuesto`)
);

/* Tablas puente (many-to-many) */

CREATE TABLE `GastosVariables_RegistroGastos` (
  `idGastoV` INT,
  `idRegistroGasto` INT,
  PRIMARY KEY (`idGastoV`, `idRegistroGasto`), /*Llave primaria compuesta*/
  FOREIGN KEY (`idGastoV`) REFERENCES `GastosVariables` (`idGastoV`),
  FOREIGN KEY (`idRegistroGasto`) REFERENCES `RegistroGastos` (`idRegistroGasto`)
);

CREATE TABLE `GastosFijos_RegistroGastos` (
  `idGastoF` INT,
  `idRegistroGasto` INT,
  PRIMARY KEY (`idGastoF`, `idRegistroGasto`), /*Llave primaria compuesta*/
  FOREIGN KEY (`idGastoF`) REFERENCES `GastosFijos` (`idGastoF`),
  FOREIGN KEY (`idRegistroGasto`) REFERENCES `RegistroGastos` (`idRegistroGasto`)
);

CREATE TABLE `Ingresos_Ahorros` (
  `idIngreso` INT,
  `idAhorro` INT,
  PRIMARY KEY (`idIngreso`, `idAhorro`),
  FOREIGN KEY (`idIngreso`) REFERENCES `Ingresos` (`idIngreso`),
  FOREIGN KEY (`idAhorro`) REFERENCES `Ahorros` (`idAhorro`)
);

CREATE TABLE `GastosVariables_FechasDePago` (
  `idGastoV` INT,
  `idFechaDePago` INT,
  PRIMARY KEY (`idGastoV`, `idFechaDePago`),
  FOREIGN KEY (`idGastoV`) REFERENCES `GastosVariables` (`idGastoV`),
  FOREIGN KEY (`idFechaDePago`) REFERENCES `FechasDePago` (`idFechaDePago`)
);

CREATE TABLE `GastosFijos_FechasDePago` (
  `idGastoF` INT,
  `idFechaDePago` INT,
  PRIMARY KEY (`idGastoF`, `idFechaDePago`),
  FOREIGN KEY (`idGastoF`) REFERENCES `GastosFijos` (`idGastoF`),
  FOREIGN KEY (`idFechaDePago`) REFERENCES `FechasDePago` (`idFechaDePago`)
);

CREATE TABLE `GastosFijos_Presupuestos` (
  `idGastoF` INT,
  `idPresupuesto` INT,
  PRIMARY KEY (`idGastoF`, `idPresupuesto`),
  FOREIGN KEY (`idGastoF`) REFERENCES `GastosFijos` (`idGastoF`),
  FOREIGN KEY (`idPresupuesto`) REFERENCES `Presupuestos` (`idPresupuesto`)
);

CREATE TABLE `GastosVariables_Presupuestos` (
  `idGastoV` INT,
  `idPresupuesto` INT,
  PRIMARY KEY (`idGastoV`, `idPresupuesto`),
  FOREIGN KEY (`idGastoV`) REFERENCES `GastosVariables` (`idGastoV`),
  FOREIGN KEY (`idPresupuesto`) REFERENCES `Presupuestos` (`idPresupuesto`)
);

CREATE TABLE `Ingresos_Presupuestos` (
  `idIngreso` INT,
  `idPresupuesto` INT,
  PRIMARY KEY (`idIngreso`, `idPresupuesto`),
  FOREIGN KEY (`idIngreso`) REFERENCES `Ingresos` (`idIngreso`),
  FOREIGN KEY (`idPresupuesto`) REFERENCES `Presupuestos` (`idPresupuesto`)
);