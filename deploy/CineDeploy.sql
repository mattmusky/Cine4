-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema CineDeploy
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `CineDeploy` ;

-- -----------------------------------------------------
-- Schema CineDeploy
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CineDeploy` DEFAULT CHARACTER SET utf8 ;
USE `CineDeploy` ;

-- -----------------------------------------------------
-- Table `CineDeploy`.`Machine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CineDeploy`.`Machine` (
  `HostIP` VARCHAR(100) NOT NULL,
  `Hostname` VARCHAR(45) NULL,
  PRIMARY KEY (`HostIP`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CineDeploy`.`Package`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CineDeploy`.`Package` (
  `PackageName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PackageName`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CineDeploy`.`Version`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CineDeploy`.`Version` (
  `VersionID` INT(10) NOT NULL AUTO_INCREMENT,
  `VersionNum` VARCHAR(45) NULL,
  `Date` DATETIME NULL,
  `Deprecate` ENUM('Y', 'N') NULL DEFAULT 'N',
  `PackageName` VARCHAR(45) NULL,
  PRIMARY KEY (`VersionID`),
  CONSTRAINT `Version.PackageName`
    FOREIGN KEY (`PackageName`)
    REFERENCES `CineDeploy`.`Package` (`PackageName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `Version.PackageName_idx` ON `CineDeploy`.`Version` (`PackageName` ASC);


-- -----------------------------------------------------
-- Table `CineDeploy`.`Machinehaspackage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CineDeploy`.`Machinehaspackage` (
  `HostIP` VARCHAR(100) NOT NULL,
  `VersionID` INT(10) NOT NULL,
  `Date` DATETIME NULL,
  PRIMARY KEY (`HostIP`, `VersionID`),
  CONSTRAINT `Machinehaspackage_Machine_Hostname`
    FOREIGN KEY (`HostIP`)
    REFERENCES `CineDeploy`.`Machine` (`HostIP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Machinehaspackage_Version_VersionID`
    FOREIGN KEY (`VersionID`)
    REFERENCES `CineDeploy`.`Version` (`VersionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `Machinehaspackage_Version_VersionID_idx` ON `CineDeploy`.`Machinehaspackage` (`VersionID` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

