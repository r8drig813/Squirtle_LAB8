-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab8
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab8
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab8` DEFAULT CHARACTER SET utf8 ;
USE `lab8` ;

-- -----------------------------------------------------
-- Table `lab8`.`Estatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`Estatus` (
  `idEstatus` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab8`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`Usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `edad` INT NOT NULL,
  `codigoPucp` VARCHAR(45) NOT NULL,
  `correoPucp` VARCHAR(45) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  `idEstatus` INT NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  INDEX `fk_Usuario_Estatus1_idx` (`idEstatus` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Estatus1`
    FOREIGN KEY (`idEstatus`)
    REFERENCES `lab8`.`Estatus` (`idEstatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab8`.`Credenciales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`Credenciales` (
  `idUsuarios` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `passwordHashed` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  INDEX `fk_credenciales_Usuario_idx` (`idUsuarios` ASC) VISIBLE,
  CONSTRAINT `fk_credenciales_Usuario`
    FOREIGN KEY (`idUsuarios`)
    REFERENCES `lab8`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab8`.`Seguros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`Seguros` (
  `idSeguros` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSeguros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab8`.`Viajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`Viajes` (
  `idViajes` INT NOT NULL,
  `fechaReserva` DATE NOT NULL,
  `fechaViaje` DATE NOT NULL,
  `ciudadOrigen` VARCHAR(45) NOT NULL,
  `ciudadaDestino` VARCHAR(45) NOT NULL,
  `numeroBoletos` INT NOT NULL,
  `costoTotal` DECIMAL NOT NULL,
  `idUsuario` INT NOT NULL,
  `idSeguros` INT NOT NULL,
  PRIMARY KEY (`idViajes`),
  INDEX `fk_Viajes_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `fk_Viajes_Seguros1_idx` (`idSeguros` ASC) VISIBLE,
  CONSTRAINT `fk_Viajes_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `lab8`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Viajes_Seguros1`
    FOREIGN KEY (`idSeguros`)
    REFERENCES `lab8`.`Seguros` (`idSeguros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
