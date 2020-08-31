-- MySQL Script generated by MySQL Workbench
-- Wed Aug 19 20:47:34 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bd_appjuridico
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_appjuridico
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_appjuridico` DEFAULT CHARACTER SET utf8 ;
USE `bd_appjuridico` ;

-- -----------------------------------------------------
-- Table `bd_appjuridico`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_appjuridico`.`clientes` (
  `idcliente` INT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(15) NULL,
  `email` VARCHAR(255) NULL,
  `ativo` VARCHAR(1) NOT NULL,
  `datacriacao` DATETIME NOT NULL,
  `datamodificacao` DATETIME NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_appjuridico`.`tipo_processos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_appjuridico`.`tipo_processos` (
  `idtipo_processo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `ativo` VARCHAR(1) NOT NULL,
  `datacriacao` DATETIME NOT NULL,
  `datamodificacao` DATETIME NOT NULL,
  PRIMARY KEY (`idtipo_processo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_appjuridico`.`processos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_appjuridico`.`processos` (
  `idprocesso` INT NOT NULL AUTO_INCREMENT,
  `num_numprocessos` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `descricao` TEXT(255) NULL,
  `arquivo` VARCHAR(100) NULL,
  `dataprocesso` DATETIME NOT NULL,
  `dataencerramento` DATETIME NOT NULL,
  `idcliente` INT NOT NULL,
  `idtipo_processo` INT NOT NULL,
  PRIMARY KEY (`idprocesso`),
  INDEX `fk_processos_clientes_idx` (`idcliente` ASC),
  INDEX `fk_processos_tipo_processos1_idx` (`idtipo_processo` ASC),
  CONSTRAINT `fk_processos_clientes`
    FOREIGN KEY (`idcliente`)
    REFERENCES `bd_appjuridico`.`clientes` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_processos_tipo_processos1`
    FOREIGN KEY (`idtipo_processo`)
    REFERENCES `bd_appjuridico`.`tipo_processos` (`idtipo_processo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
