-- MySQL Script generated by MySQL Workbench
-- Fri Nov  6 14:59:55 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tk3223_univ_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tk3223_univ_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tk3223_univ_db` DEFAULT CHARACTER SET utf8 ;
USE `tk3223_univ_db` ;

-- -----------------------------------------------------
-- Table `tk3223_univ_db`.`PROFESSOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tk3223_univ_db`.`PROFESSOR` (
  `idProfessor` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `office_room_number` INT NOT NULL,
  `start_office_hours` INT NOT NULL,
  `duration_office_hours` INT NOT NULL,
  `department_number` INT NOT NULL,
  PRIMARY KEY (`idProfessor`),
  UNIQUE INDEX `idProfessor_UNIQUE` (`idProfessor` ASC) VISIBLE,
  UNIQUE INDEX `office_room_number_UNIQUE` (`office_room_number` ASC) VISIBLE,
  INDEX `fk_PROFESSOR_DEPARTMENT1_idx` (`department_number` ASC) VISIBLE,
  CONSTRAINT `fk_PROFESSOR_DEPARTMENT1`
    FOREIGN KEY (`department_number`)
    REFERENCES `tk3223_univ_db`.`DEPARTMENT` (`department_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tk3223_univ_db`.`DEPARTMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tk3223_univ_db`.`DEPARTMENT` (
  `department_number` INT NOT NULL,
  `department_name` VARCHAR(45) NOT NULL,
  `PROFESSOR_idProfessor` INT NOT NULL,
  PRIMARY KEY (`department_number`),
  UNIQUE INDEX `department_number_UNIQUE` (`department_number` ASC) VISIBLE,
  UNIQUE INDEX `department_name_UNIQUE` (`department_name` ASC) VISIBLE,
  INDEX `fk_DEPARTMENT_PROFESSOR1_idx` (`PROFESSOR_idProfessor` ASC) VISIBLE,
  CONSTRAINT `fk_DEPARTMENT_PROFESSOR1`
    FOREIGN KEY (`PROFESSOR_idProfessor`)
    REFERENCES `tk3223_univ_db`.`PROFESSOR` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tk3223_univ_db`.`STUDENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tk3223_univ_db`.`STUDENT` (
  `idSTUDENT` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `number_of_major` INT NULL,
  `year_admitted` INT NOT NULL,
  `birth_day` INT NOT NULL AUTO_INCREMENT,
  `DEPARTMENT_department_number` INT NOT NULL,
  PRIMARY KEY (`idSTUDENT`),
  UNIQUE INDEX `idSTUDENT_UNIQUE` (`idSTUDENT` ASC) VISIBLE,
  INDEX `fk_STUDENT_DEPARTMENT_idx` (`DEPARTMENT_department_number` ASC) VISIBLE,
  CONSTRAINT `fk_STUDENT_DEPARTMENT`
    FOREIGN KEY (`DEPARTMENT_department_number`)
    REFERENCES `tk3223_univ_db`.`DEPARTMENT` (`department_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tk3223_univ_db`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tk3223_univ_db`.`Courses` (
  `course_number` INT NOT NULL,
  `course_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`course_number`),
  UNIQUE INDEX `course_number_UNIQUE` (`course_number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tk3223_univ_db`.`PROFESSOR_has_Classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tk3223_univ_db`.`PROFESSOR_has_Classes` (
  `PROFESSOR_idProfessor` INT NOT NULL,
  `Classes_class_number` INT NOT NULL,
  PRIMARY KEY (`PROFESSOR_idProfessor`, `Classes_class_number`),
  INDEX `fk_PROFESSOR_has_Classes_Classes1_idx` (`Classes_class_number` ASC) VISIBLE,
  INDEX `fk_PROFESSOR_has_Classes_PROFESSOR1_idx` (`PROFESSOR_idProfessor` ASC) VISIBLE,
  CONSTRAINT `fk_PROFESSOR_has_Classes_PROFESSOR1`
    FOREIGN KEY (`PROFESSOR_idProfessor`)
    REFERENCES `tk3223_univ_db`.`PROFESSOR` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROFESSOR_has_Classes_Classes1`
    FOREIGN KEY (`Classes_class_number`)
    REFERENCES `tk3223_univ_db`.`Classes` (`class_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tk3223_univ_db`.`Classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tk3223_univ_db`.`Classes` (
  `class_number` INT NOT NULL,
  `Section_of_class` INT NOT NULL,
  `semester` VARCHAR(45) NOT NULL,
  `year` INT NOT NULL,
  `day` VARCHAR(45) NOT NULL,
  `duration_class` INT NOT NULL,
  `class_start_time` INT NOT NULL,
  `idProfessor` INT NOT NULL,
  PRIMARY KEY (`class_number`),
  UNIQUE INDEX `class_number_UNIQUE` (`class_number` ASC) VISIBLE,
  UNIQUE INDEX `Section_of_class_UNIQUE` (`Section_of_class` ASC) VISIBLE,
  INDEX `fk_Classes_PROFESSOR_has_Classes1_idx` (`idProfessor` ASC) VISIBLE,
  CONSTRAINT `fk_Classes_PROFESSOR_has_Classes1`
    FOREIGN KEY (`idProfessor`)
    REFERENCES `tk3223_univ_db`.`PROFESSOR_has_Classes` (`PROFESSOR_idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tk3223_univ_db`.`Courses_has_Classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tk3223_univ_db`.`Courses_has_Classes` (
  `Courses_course_number` INT NOT NULL,
  `Classes_class_number` INT NOT NULL,
  PRIMARY KEY (`Courses_course_number`, `Classes_class_number`),
  INDEX `fk_Courses_has_Classes_Classes1_idx` (`Classes_class_number` ASC) VISIBLE,
  INDEX `fk_Courses_has_Classes_Courses1_idx` (`Courses_course_number` ASC) VISIBLE,
  CONSTRAINT `fk_Courses_has_Classes_Courses1`
    FOREIGN KEY (`Courses_course_number`)
    REFERENCES `tk3223_univ_db`.`Courses` (`course_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Courses_has_Classes_Classes1`
    FOREIGN KEY (`Classes_class_number`)
    REFERENCES `tk3223_univ_db`.`Classes` (`class_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tk3223_univ_db`.`Enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tk3223_univ_db`.`Enrollment` (
  `course_number` INT NOT NULL,
  `semester` VARCHAR(45) NOT NULL,
  `Section_of_class` INT NOT NULL,
  `idSTUDENT` INT NOT NULL,
  UNIQUE INDEX `course_number_UNIQUE` (`course_number` ASC) VISIBLE,
  UNIQUE INDEX `idSTUDENT_UNIQUE` (`idSTUDENT` ASC) VISIBLE,
  INDEX `fk_Enrollment_Classes1_idx` (`semester` ASC) VISIBLE,
  CONSTRAINT `fk_Enrollment_Courses_has_Classes1`
    FOREIGN KEY (`course_number`)
    REFERENCES `tk3223_univ_db`.`Courses_has_Classes` (`Courses_course_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enrollment_STUDENT1`
    FOREIGN KEY (`idSTUDENT`)
    REFERENCES `tk3223_univ_db`.`STUDENT` (`idSTUDENT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enrollment_Classes1`
    FOREIGN KEY (`semester`)
    REFERENCES `tk3223_univ_db`.`Classes` (`semester`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enrollment_Courses1`
    FOREIGN KEY (`course_number`)
    REFERENCES `tk3223_univ_db`.`Courses` (`course_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tk3223_univ_db`.`Final_grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tk3223_univ_db`.`Final_grade` (
  `course_number` INT NOT NULL,
  `idSTUDENT` INT NOT NULL,
  `semester` VARCHAR(45) NOT NULL,
  `year` INT NOT NULL,
  `Final_grade` VARCHAR(45) NOT NULL,
  `Section_of_class` INT NOT NULL,
  UNIQUE INDEX `course_number_UNIQUE` (`course_number` ASC) VISIBLE,
  UNIQUE INDEX `idSTUDENT_UNIQUE` (`idSTUDENT` ASC) VISIBLE,
  UNIQUE INDEX `Final_gradecol_UNIQUE` (`Final_grade` ASC) VISIBLE,
  INDEX `fk_Final_grade_Classes1_idx` (`semester` ASC) VISIBLE,
  INDEX `fk_Final_grade_Classes2_idx` (`year` ASC) VISIBLE,
  INDEX `fk_Final_grade_Classes3_idx` (`Section_of_class` ASC) VISIBLE,
  CONSTRAINT `fk_Final_grade_STUDENT1`
    FOREIGN KEY (`idSTUDENT`)
    REFERENCES `tk3223_univ_db`.`STUDENT` (`idSTUDENT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Final_grade_Classes1`
    FOREIGN KEY (`semester`)
    REFERENCES `tk3223_univ_db`.`Classes` (`semester`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Final_grade_Classes2`
    FOREIGN KEY (`year`)
    REFERENCES `tk3223_univ_db`.`Classes` (`year`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Final_grade_Courses1`
    FOREIGN KEY (`course_number`)
    REFERENCES `tk3223_univ_db`.`Courses` (`course_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Final_grade_Classes3`
    FOREIGN KEY (`Section_of_class`)
    REFERENCES `tk3223_univ_db`.`Classes` (`Section_of_class`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;