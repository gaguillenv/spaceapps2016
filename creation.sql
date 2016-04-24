-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema XackraDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema XackraDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `XackraDB` DEFAULT CHARACTER SET utf8 ;
USE `XackraDB` ;

-- -----------------------------------------------------
-- Table `XackraDB`.`EnvironmentalFactor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XackraDB`.`EnvironmentalFactor` (
  `idFactor` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Unit` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`idFactor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XackraDB`.`FactorValue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XackraDB`.`FactorValue` (
  `idFactorValue` INT NOT NULL,
  `idFactor` INT NULL,
  `Country` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `Value` DOUBLE NULL,
  `Date` DATETIME NULL,
  PRIMARY KEY (`idFactorValue`),
  INDEX `fk_idFactor_1_idx` (`idFactor` ASC),
  CONSTRAINT `fk_FactorValue_1`
    FOREIGN KEY (`idFactor`)
    REFERENCES `XackraDB`.`EnvironmentalFactor` (`idFactor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XackraDB`.`Symptoms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XackraDB`.`Symptoms` (
  `idSymptoms` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `DescripciÃ³n` VARCHAR(45) NULL,
  PRIMARY KEY (`idSymptoms`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XackraDB`.`RespiratoryDisease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XackraDB`.`RespiratoryDisease` (
  `idDisease` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`idDisease`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XackraDB`.`RegistrationSymptoms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XackraDB`.`RegistrationSymptoms` (
  `idRecord` INT NOT NULL,
  `idSymptoms` INT NULL,
  `Date` DATETIME NULL,
  `Latitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  `Intesitity` INT NULL,
  PRIMARY KEY (`idRecord`),
  INDEX `idSymptoms_idx` (`idSymptoms` ASC),
  CONSTRAINT `fk_RegistrationSymptoms_1`
    FOREIGN KEY (`idSymptoms`)
    REFERENCES `XackraDB`.`Symptoms` (`idSymptoms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XackraDB`.`DiseaseCorrespondence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XackraDB`.`DiseaseCorrespondence` (
  `idDiseaseCorrespondence` INT NOT NULL,
  `idDisease` INT NULL,
  `idSymptoms` INT NULL,
  PRIMARY KEY (`idDiseaseCorrespondence`),
  INDEX `fk_DiseaseCorrespondence_1_idx` (`idDisease` ASC),
  INDEX `fk_DiseaseCorrespondence_2_idx` (`idSymptoms` ASC),
  CONSTRAINT `fk_DiseaseCorrespondence_1`
    FOREIGN KEY (`idDisease`)
    REFERENCES `XackraDB`.`RespiratoryDisease` (`idDisease`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DiseaseCorrespondence_2`
    FOREIGN KEY (`idSymptoms`)
    REFERENCES `XackraDB`.`Symptoms` (`idSymptoms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XackraDB`.`Correlation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XackraDB`.`Correlation` (
  `idCorrelation` INT NOT NULL,
  `idFactor` INT NULL,
  `idSymptoms` INT NULL,
  `Begin` DATETIME NULL,
  `End` DATETIME NULL,
  `Value` DOUBLE NULL,
  PRIMARY KEY (`idCorrelation`),
  INDEX `fk_Correlation_1_idx` (`idFactor` ASC),
  INDEX `fk_Correlation_2_idx` (`idSymptoms` ASC),
  CONSTRAINT `fk_Correlation_1`
    FOREIGN KEY (`idFactor`)
    REFERENCES `XackraDB`.`EnvironmentalFactor` (`idFactor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Correlation_2`
    FOREIGN KEY (`idSymptoms`)
    REFERENCES `XackraDB`.`Symptoms` (`idSymptoms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

