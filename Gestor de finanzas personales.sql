use gestorfinanzaspersonales;
 
CREATE TABLE `TiposDeIngresos` (
  `idCategoriaIngreso` INT NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(30),
  primary key(`idCategoriaIngreso`)
);

CREATE TABLE `TiposDeGastos` (
  `idCategoriaGasto` INT NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(30),
  primary key(`idCategoriaGasto`)
);

CREATE TABLE `Ingresos` (
  `idIngreso` INT NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100),
  `fecha` date,
  `monto` int,
  `totalIngresos` int,
  `idTipoIngreso` int,
  primary key(`idIngreso`)
);

CREATE TABLE `FechasDePago` (
  `idFechaDePago` INT NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50),
  `fecha` date,
  `idGastoF` int,
  `idGastoV` int,
  primary key(`idFechaDePago`)
);

CREATE TABLE `RegistroGastos` (
  `idRegistroGasto` INT NOT NULL AUTO_INCREMENT,
  `fecha` date,
  `totalGastos` int,
  `idGastoV` int,
  `idGastoF` int,
  `idCategoriaGasto` int,
  primary key(`idRegistroGasto`)
);

CREATE TABLE `Ahorros` (
  `idAhorro` INT NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50),
  `monto` int,
  `idIngreso` int,
  primary key(`idAhorro`)
);

CREATE TABLE `GastosVariables` (
  `idGastoV` INT NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60),
  `monto` int,
  `idTipoGasto` int,
  `TotalGastosV` int,
  primary key(`idGastoV`)
);

CREATE TABLE `GastosFijos` (
  `idGastoF` INT NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60),
  `monto` int,
  `idTipoGasto` int,
  `TotalGastosF` int,
  primary key(`idGastoF`)
);

CREATE TABLE `Presupuestos` (
  `idPresupuesto` INT NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255),
  `fechaInicio` date,
  `fechaFinal` date,
  `totalPresupuesto` int,
  `idGastosF` int,
  `idGastosV` int,
  `idIngresos` int,
  primary key(`idPresupuesto`)
);

ALTER TABLE `Ingresos` ADD FOREIGN KEY (`idIngreso`) REFERENCES `TiposDeIngresos` (`idCategoriaIngreso`);

ALTER TABLE `RegistroGastos` ADD FOREIGN KEY (`idRegistroGasto`) REFERENCES `TiposDeGastos` (`idCategoriaGasto`);

CREATE TABLE `GastosVariables_RegistroGastos` (
  `GastosVariables_idGastoV` INT,
  `RegistroGastos_idRegistroGasto` INT,
  PRIMARY KEY (`GastosVariables_idGastoV`, `RegistroGastos_idRegistroGasto`)
);

ALTER TABLE `GastosVariables_RegistroGastos` ADD FOREIGN KEY (`GastosVariables_idGastoV`) REFERENCES `GastosVariables` (`idGastoV`);

ALTER TABLE `GastosVariables_RegistroGastos` ADD FOREIGN KEY (`RegistroGastos_idRegistroGasto`) REFERENCES `RegistroGastos` (`idRegistroGasto`);


CREATE TABLE `GastosFijos_RegistroGastos` (
  `GastosFijos_idGastoF` INT,
  `RegistroGastos_idRegistroGasto` INT,
  PRIMARY KEY (`GastosFijos_idGastoF`, `RegistroGastos_idRegistroGasto`)
);

ALTER TABLE `GastosFijos_RegistroGastos` ADD FOREIGN KEY (`GastosFijos_idGastoF`) REFERENCES `db`.`GastosFijos` (`idGastoF`);

ALTER TABLE `GastosFijos_RegistroGastos` ADD FOREIGN KEY (`RegistroGastos_idRegistroGasto`) REFERENCES `RegistroGastos` (`idRegistroGasto`);


CREATE TABLE `Ingresos_Ahorros` (
  `Ingresos_idIngreso` INT,
  `Ahorros_idAhorro` INT,
  PRIMARY KEY (`Ingresos_idIngreso`, `Ahorros_idAhorro`)
);

ALTER TABLE `Ingresos_Ahorros` ADD FOREIGN KEY (`Ingresos_idIngreso`) REFERENCES `Ingresos` (`idIngreso`);

ALTER TABLE `Ingresos_Ahorros` ADD FOREIGN KEY (`Ahorros_idAhorro`) REFERENCES `Ahorros` (`idAhorro`);


CREATE TABLE `GastosVariables_FechasDePago` (
  `GastosVariables_idGastoV` INT,
  `FechasDePago_idFechaDePago` INT,
  PRIMARY KEY (`GastosVariables_idGastoV`, `FechasDePago_idFechaDePago`)
);

ALTER TABLE `GastosVariables_FechasDePago` ADD FOREIGN KEY (`GastosVariables_idGastoV`) REFERENCES `GastosVariables` (`idGastoV`);

ALTER TABLE `GastosVariables_FechasDePago` ADD FOREIGN KEY (`FechasDePago_idFechaDePago`) REFERENCES `FechasDePago` (`idFechaDePago`);


CREATE TABLE `GastosFijos_FechasDePago` (
  `GastosFijos_idGastoF` INT,
  `FechasDePago_idFechaDePago` INT,
  PRIMARY KEY (`GastosFijos_idGastoF`, `FechasDePago_idFechaDePago`)
);

ALTER TABLE `GastosFijos_FechasDePago` ADD FOREIGN KEY (`GastosFijos_idGastoF`) REFERENCES `GastosFijos` (`idGastoF`);

ALTER TABLE `GastosFijos_FechasDePago` ADD FOREIGN KEY (`FechasDePago_idFechaDePago`) REFERENCES `FechasDePago` (`idFechaDePago`);


CREATE TABLE `GastosFijos_Presupuestos` (
  `GastosFijos_idGastoF` INT,
  `Presupuestos_idPresupuesto` INT,
  PRIMARY KEY (`GastosFijos_idGastoF`, `Presupuestos_idPresupuesto`)
);

ALTER TABLE `GastosFijos_Presupuestos` ADD FOREIGN KEY (`GastosFijos_idGastoF`) REFERENCES `GastosFijos` (`idGastoF`);

ALTER TABLE `GastosFijos_Presupuestos` ADD FOREIGN KEY (`Presupuestos_idPresupuesto`) REFERENCES `Presupuestos` (`idPresupuesto`);


CREATE TABLE `GastosVariables_Presupuestos` (
  `GastosVariables_idGastoV` INT,
  `Presupuestos_idPresupuesto` INT,
  PRIMARY KEY (`GastosVariables_idGastoV`, `Presupuestos_idPresupuesto`)
);

ALTER TABLE `GastosVariables_Presupuestos` ADD FOREIGN KEY (`GastosVariables_idGastoV`) REFERENCES `GastosVariables` (`idGastoV`);

ALTER TABLE `GastosVariables_Presupuestos` ADD FOREIGN KEY (`Presupuestos_idPresupuesto`) REFERENCES `Presupuestos` (`idPresupuesto`);


CREATE TABLE `Ingresos_Presupuestos` (
  `Ingresos_idIngreso` INT,
  `Presupuestos_idPresupuesto` INT,
  PRIMARY KEY (`Ingresos_idIngreso`, `Presupuestos_idPresupuesto`)
);

ALTER TABLE `Ingresos_Presupuestos` ADD FOREIGN KEY (`Ingresos_idIngreso`) REFERENCES `Ingresos` (`idIngreso`);

ALTER TABLE `Ingresos_Presupuestos` ADD FOREIGN KEY (`Presupuestos_idPresupuesto`) REFERENCES `Presupuestos` (`idPresupuesto`);

