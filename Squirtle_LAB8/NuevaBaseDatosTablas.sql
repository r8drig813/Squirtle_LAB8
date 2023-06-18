-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lab8
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab8
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab8` DEFAULT CHARACTER SET utf8 ;
USE `lab8` ;

-- -----------------------------------------------------
-- Table `lab8`.`estatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`estatus` (
  `idEstatus` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstatus`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;

LOCK TABLES `estatus` WRITE;
/*!40000 ALTER TABLE `estatus` DISABLE KEYS */;
INSERT INTO `estatus` VALUES (1,'normal'),(2,'silver'),(3,'gold'),(4,'platinum');
/*!40000 ALTER TABLE `estatus` ENABLE KEYS */;
UNLOCK TABLES;


-- -----------------------------------------------------
-- Table `lab8`.`seguros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`seguros` (
  `idSeguros` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSeguros`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;

LOCK TABLES `seguros` WRITE;
/*!40000 ALTER TABLE `seguros` DISABLE KEYS */;
INSERT INTO `seguros` VALUES (1,'Rimac'),(2,'Pacifico'),(3,'La positiva'),(4,'Seguro internacional'),(5,'Otro');
/*!40000 ALTER TABLE `seguros` ENABLE KEYS */;
UNLOCK TABLES;


-- -----------------------------------------------------
-- Table `lab8`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `edad` INT NOT NULL,
  `codigoPucp` VARCHAR(45) NOT NULL,
  `correoPucp` VARCHAR(45) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  `passwordHashed` VARCHAR(255) NOT NULL,
  `idEstatus` INT NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  INDEX `fk_Usuario_Estatus1_idx` (`idEstatus` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Estatus1`
    FOREIGN KEY (`idEstatus`)
    REFERENCES `lab8`.`estatus` (`idEstatus`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb3;

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES 
(1,'Rodrigo ','Tinoco',21,'20190159','a20190159@pucp.edu.pe','Telecomunicaciones','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',1),
(2,'Julio','Aliaga',20,'20190161','a20190161@pucp.edu.pe','Telecomunicaciones','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',2),
(3,'Ricardo','Alvarado',21,'20190162','a20190162@pucp.edu.pe','Telecomunicaciones','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',3),
(4,'Oscar','Agreda',20,'20190163','a20190163@pucp.edu.pe','Telecomunicaciones','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',4),
(5,'Willy','Huallpa',22,'20190164','a20190164@pucp.edu.pe','Telecomunicaciones','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',1),
(6,'Mathias','Bambaren',23,'20190165','a20190165@pucp.edu.pe','Telecomunicaciones','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;


-- -----------------------------------------------------
-- Table `lab8`.`viajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`viajes` (
  `idViajes` INT NOT NULL,
  `fechaReserva` DATE NOT NULL,
  `fechaViaje` DATE NOT NULL,
  `ciudadOrigen` VARCHAR(45) NOT NULL,
  `ciudadaDestino` VARCHAR(45) NOT NULL,
  `numeroBoletos` INT NOT NULL,
  `costoTotal` DECIMAL(10,0) NOT NULL,
  `idUsuarios` INT NOT NULL,
  `idSeguros` INT NOT NULL,
  PRIMARY KEY (`idViajes`),
  INDEX `fk_Viajes_Usuario1_idx` (`idUsuarios` ASC) VISIBLE,
  INDEX `fk_Viajes_Seguros1_idx` (`idSeguros` ASC) VISIBLE,
  CONSTRAINT `fk_Viajes_Seguros1`
    FOREIGN KEY (`idSeguros`)
    REFERENCES `lab8`.`seguros` (`idSeguros`),
  CONSTRAINT `fk_Viajes_Usuario1`
    FOREIGN KEY (`idUsuarios`)
    REFERENCES `lab8`.`usuarios` (`idUsuarios`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

LOCK TABLES `viajes` WRITE;
/*!40000 ALTER TABLE `viajes` DISABLE KEYS */;
INSERT INTO `viajes` VALUES (12345678,'2023-06-15','2023-07-01','Lima','Cusco',3,250,1,3),(23456781,'2023-06-30','2023-07-15','Lima','Tumbes',1,85,4,3),(23456789,'2023-06-22','2023-08-12','Lima','Ica',2,180,2,1),(34567812,'2023-06-19','2023-08-15','Lima','Iquitos',2,150,4,5),(34567890,'2023-07-01','2023-08-01','Lima','Pucallpa',2,180,5,2),(45678901,'2023-07-02','2023-09-02','Lima','Chincha',3,250,6,1),(56781234,'2023-06-17','2023-09-05','Lima','Trujillo',4,320,2,4),(56789012,'2023-07-03','2023-07-20','Lima','Chachapoyas',1,95,3,4),(65432187,'2023-06-20','2023-09-30','Lima','Chiclayo',3,220,5,3),(67890123,'2023-07-04','2023-08-25','Lima','Barranca',4,320,2,5),(78901234,'2023-07-05','2023-09-10','Lima','Cerro de Pasco',2,170,1,3),(87654321,'2023-06-18','2023-07-20','Lima','Piura',1,80,6,1),(89012345,'2023-06-28','2023-08-18','Lima','Chimbote',2,170,1,4),(90123456,'2023-06-29','2023-09-28','Lima','Huancayo',4,310,3,1),(98765432,'2023-06-16','2023-08-10','Lima','Arequipa',2,180,3,2);
/*!40000 ALTER TABLE `viajes` ENABLE KEYS */;
UNLOCK TABLES;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
