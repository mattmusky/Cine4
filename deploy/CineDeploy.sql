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
  `PackageID` INT(10) NOT NULL,
  `PackageName` VARCHAR(45) NULL,
  PRIMARY KEY (`PackageID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CineDeploy`.`Version`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CineDeploy`.`Version` (
  `VersionID` INT(10) NOT NULL,
  `VersionNum` VARCHAR(45) NULL,
  `Date` DATETIME NULL,
  `Deprecate` ENUM('Y', 'N') NULL,
  `PackageID` INT(10) NULL,
  PRIMARY KEY (`VersionID`),
  CONSTRAINT `Version_PackageID`
    FOREIGN KEY (`PackageID`)
    REFERENCES `CineDeploy`.`Package` (`PackageID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `Package_PackageID_idx` ON `CineDeploy`.`Version` (`PackageID` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
