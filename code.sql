-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blockbuster` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `blockbuster` ;

-- -----------------------------------------------------
-- Table `blockbuster`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`actors` (
  `actor_id` INT NOT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_update` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `last_update` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`customers` (
  `customer_id` INT NOT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`film_curated`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`film_curated` (
  `film_id` INT NOT NULL,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `rental_duration` INT NULL DEFAULT NULL,
  `rental_rate` DECIMAL(4,2) NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `replacement_cost` DECIMAL(5,2) NULL DEFAULT NULL,
  `rating` VARCHAR(50) NULL DEFAULT NULL,
  `last_update` TIMESTAMP NULL DEFAULT NULL,
  `Deleted Scenes` VARCHAR(45) NULL DEFAULT NULL,
  `Behind the Scenes` VARCHAR(45) NULL DEFAULT NULL,
  `Trailers` VARCHAR(45) NULL DEFAULT NULL,
  `Commentaries` VARCHAR(45) NULL DEFAULT NULL,
  `language` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_id` INT NULL DEFAULT NULL,
  `store_id` INT NULL DEFAULT NULL,
  `last_update` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`inventory_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`old_hdd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`old_hdd` (
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `category_id` INT NULL DEFAULT NULL,
  `film_id` INT NULL DEFAULT NULL,
  `actor_id` INT NULL DEFAULT NULL,
  INDEX `film_id_idx` (`film_id` ASC) VISIBLE,
  INDEX `actor_id_idx` (`actor_id` ASC) VISIBLE,
  INDEX `category_id_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `actor_id`
    FOREIGN KEY (`actor_id`)
    REFERENCES `blockbuster`.`actors` (`actor_id`),
  CONSTRAINT `category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `blockbuster`.`category` (`category_id`),
  CONSTRAINT `film_id`
    FOREIGN KEY (`film_id`)
    REFERENCES `blockbuster`.`film_curated` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` TIMESTAMP NULL DEFAULT NULL,
  `inventory_id` INT NOT NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `return_date` TIMESTAMP NULL DEFAULT NULL,
  `staff_id` INT NULL DEFAULT NULL,
  `last_update` TIMESTAMP NULL DEFAULT NULL,
  `film_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `inventory_id_idx` (`inventory_id` ASC) VISIBLE,
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  INDEX `film_id_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `blockbuster`.`customers` (`customer_id`),
  CONSTRAINT `film_id_fk`
    FOREIGN KEY (`film_id`)
    REFERENCES `blockbuster`.`film_curated` (`film_id`),
  CONSTRAINT `inventory_id_fk`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `blockbuster`.`inventory` (`inventory_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
