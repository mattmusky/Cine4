-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Cine4
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Cine4` ;

-- -----------------------------------------------------
-- Schema Cine4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cine4` DEFAULT CHARACTER SET utf8 ;
USE `Cine4` ;

-- -----------------------------------------------------
-- Table `Cine4`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cine4`.`Users` (
  `UID` INT(10) NOT NULL,
  `First` VARCHAR(100) NULL,
  `Last` VARCHAR(100) NULL,
  `Email` VARCHAR(100) NULL,
  `Pass` VARCHAR(100) NULL,
  PRIMARY KEY (`UID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cine4`.`Movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cine4`.`Movies` (
  `MID` INT(10) NOT NULL,
  `Title` VARCHAR(100) NULL,
  `Overview` VARCHAR(500) NULL,
  `Date` DATETIME NULL,
  `Poster` VARCHAR(100) NULL,
  `Backdrop` VARCHAR(100) NULL,
  `DVDLink` VARCHAR(100) NULL,
  `TicketLink` VARCHAR(100) NULL,
  PRIMARY KEY (`MID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cine4`.`Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cine4`.`Genre` (
  `GID` INT(10) NOT NULL,
  `GName` VARCHAR(45) NULL,
  `MID` INT(10) NOT NULL,
  PRIMARY KEY (`GID`, `MID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cine4`.`Comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cine4`.`Comments` (
  `ComID` INT(255) NOT NULL,
  `MID` INT(10) NULL,
  `Content` VARCHAR(500) NULL,
  `UID` INT(10) NULL,
  PRIMARY KEY (`ComID`),
  CONSTRAINT `Comments_Movies_MID`
    FOREIGN KEY (`MID`)
    REFERENCES `Cine4`.`Movies` (`MID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Comments_Users_UID`
    FOREIGN KEY (`UID`)
    REFERENCES `Cine4`.`Users` (`UID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `Movies_MID_idx` ON `Cine4`.`Comments` (`MID` ASC);

CREATE INDEX `Users_UID_idx` ON `Cine4`.`Comments` (`UID` ASC);


-- -----------------------------------------------------
-- Table `Cine4`.`UsersFavorMovies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cine4`.`UsersFavorMovies` (
  `UID` INT(10) NOT NULL,
  `MID` INT(10) NOT NULL,
  PRIMARY KEY (`UID`, `MID`),
  CONSTRAINT `Favor_Users_UID`
    FOREIGN KEY (`UID`)
    REFERENCES `Cine4`.`Users` (`UID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Favor_Movies_MID`
    FOREIGN KEY (`MID`)
    REFERENCES `Cine4`.`Movies` (`MID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `Movies_MID_idx` ON `Cine4`.`UsersFavorMovies` (`MID` ASC);


-- -----------------------------------------------------
-- Table `Cine4`.`UsersViewMovies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cine4`.`UsersViewMovies` (
  `UID` INT(10) NOT NULL,
  `MID` INT(10) NOT NULL,
  PRIMARY KEY (`UID`, `MID`),
  CONSTRAINT `View_Users_UID`
    FOREIGN KEY (`UID`)
    REFERENCES `Cine4`.`Users` (`UID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `View_Movies_MID`
    FOREIGN KEY (`MID`)
    REFERENCES `Cine4`.`Movies` (`MID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `Movies_MID_idx` ON `Cine4`.`UsersViewMovies` (`MID` ASC);


-- -----------------------------------------------------
-- Table `Cine4`.`MoviesHasGenre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cine4`.`MoviesHasGenre` (
  `MID` INT(10) NOT NULL,
  `GID` INT(10) NOT NULL,
  PRIMARY KEY (`MID`, `GID`),
  CONSTRAINT `Movies_MID`
    FOREIGN KEY (`MID`)
    REFERENCES `Cine4`.`Movies` (`MID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Genre_GID`
    FOREIGN KEY (`GID`)
    REFERENCES `Cine4`.`Genre` (`GID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cine4`.`UsersFriendUsers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cine4`.`UsersFriendUsers` (
  `AddingUID` INT(10) NOT NULL,
  `AddedUID` INT(10) NOT NULL,
  PRIMARY KEY (`AddingUID`, `AddedUID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cine4`.`MoviesHasGenre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cine4`.`MoviesHasGenre` (
  `MID` INT(10) NOT NULL,
  `GID` INT(10) NOT NULL,
  PRIMARY KEY (`MID`, `GID`),
  CONSTRAINT `Movies_MID`
    FOREIGN KEY (`MID`)
    REFERENCES `Cine4`.`Movies` (`MID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Genre_GID`
    FOREIGN KEY (`GID`)
    REFERENCES `Cine4`.`Genre` (`GID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `Genre_GID_idx` ON `Cine4`.`MoviesHasGenre` (`GID` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
