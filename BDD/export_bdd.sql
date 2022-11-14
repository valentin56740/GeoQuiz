-- Valentin ENAUD
-- Export de la base de données
-- Mis à jour le 15/10/2022

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema zal3-zenaudva0_1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema zal3-zenaudva0_1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `zal3-zenaudva0_1` DEFAULT CHARACTER SET utf8 ;
USE `zal3-zenaudva0_1` ;

-- -----------------------------------------------------
-- Table `zal3-zenaudva0_1`.`t_compte_cpt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zal3-zenaudva0_1`.`t_compte_cpt` (
  `cpt_pseudo` VARCHAR(20) NOT NULL,
  `cpt_mdp` CHAR(64) NULL,
  PRIMARY KEY (`cpt_pseudo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zal3-zenaudva0_1`.`t_profil_pfl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zal3-zenaudva0_1`.`t_profil_pfl` (
  `cpt_pseudo` VARCHAR(20) NOT NULL,
  `pfl_prenom` VARCHAR(60) NULL,
  `pfl_nom` VARCHAR(60) NULL,
  `pfl_mail` VARCHAR(100) NULL,
  `pfl_role` CHAR(1) NULL,
  `pfl_statut` CHAR(1) NULL,
  PRIMARY KEY (`cpt_pseudo`),
  INDEX `fk_t_profil_pfl_t_compte_cpt_idx` (`cpt_pseudo` ASC),
  CONSTRAINT `cpt_pseudo`
    FOREIGN KEY (`cpt_pseudo`)
    REFERENCES `zal3-zenaudva0_1`.`t_compte_cpt` (`cpt_pseudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zal3-zenaudva0_1`.`t_actualite_act`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zal3-zenaudva0_1`.`t_actualite_act` (
  `act_id` INT NOT NULL AUTO_INCREMENT,
  `act_titre` VARCHAR(30) NULL,
  `act_texte` VARCHAR(500) NULL,
  `act_statut` CHAR(1) NULL,
  `act_date` DATETIME NULL,
  `cpt_pseudo` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`act_id`),
  INDEX `fk_t_actualite_act_t_compte_cpt1_idx` (`cpt_pseudo` ASC),
  CONSTRAINT `fk_t_actualite_act_t_compte_cpt1`
    FOREIGN KEY (`cpt_pseudo`)
    REFERENCES `zal3-zenaudva0_1`.`t_compte_cpt` (`cpt_pseudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zal3-zenaudva0_1`.`t_quiz_qui`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zal3-zenaudva0_1`.`t_quiz_qui` (
  `qui_id` INT NOT NULL AUTO_INCREMENT,
  `qui_intitule` VARCHAR(60) NULL,
  `qui_img` VARCHAR(200) NULL,
  `qui_statut` CHAR(1) NULL,
  `cpt_pseudo` VARCHAR(20) NULL,
  PRIMARY KEY (`qui_id`),
  INDEX `fk_t_quiz_qui_t_compte_cpt1_idx` (`cpt_pseudo` ASC),
  CONSTRAINT `fk_t_quiz_qui_t_compte_cpt1`
    FOREIGN KEY (`cpt_pseudo`)
    REFERENCES `zal3-zenaudva0_1`.`t_compte_cpt` (`cpt_pseudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zal3-zenaudva0_1`.`t_match_mtc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zal3-zenaudva0_1`.`t_match_mtc` (
  `mtc_code` CHAR(8) NOT NULL,
  `mtc_intitule` VARCHAR(60) NULL,
  `mtc_date_debut` DATETIME NULL,
  `mtc_date_fin` DATETIME NULL,
  `mtc_corrige` BOOLEAN NOT NULL,
  `mtc_statut` CHAR(1) NOT NULL,
  `cpt_pseudo` VARCHAR(20) NOT NULL,
  `qui_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`mtc_code`),
  INDEX `fk_t_match_mtc_t_compte_cpt1_idx` (`cpt_pseudo` ASC),
  INDEX `fk_t_match_mtc_t_quiz_qui1_idx` (`qui_id` ASC),
  CONSTRAINT `fk_t_match_mtc_t_compte_cpt1`
    FOREIGN KEY (`cpt_pseudo`)
    REFERENCES `zal3-zenaudva0_1`.`t_compte_cpt` (`cpt_pseudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_match_mtc_t_quiz_qui1`
    FOREIGN KEY (`qui_id`)
    REFERENCES `zal3-zenaudva0_1`.`t_quiz_qui` (`qui_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zal3-zenaudva0_1`.`t_joueur_jou`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zal3-zenaudva0_1`.`t_joueur_jou` (
  `jou_id` INT NOT NULL AUTO_INCREMENT,
  `jou_pseudo` VARCHAR(20) NULL,
  `jou_score` DOUBLE NULL,
  `mtc_code` CHAR(8) NOT NULL,
  PRIMARY KEY (`jou_id`),
  INDEX `fk_t_joueur_jou_t_match_mtc1_idx` (`mtc_code` ASC),
  CONSTRAINT `fk_t_joueur_jou_t_match_mtc1`
    FOREIGN KEY (`mtc_code`)
    REFERENCES `zal3-zenaudva0_1`.`t_match_mtc` (`mtc_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zal3-zenaudva0_1`.`t_question_qes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zal3-zenaudva0_1`.`t_question_qes` (
  `qes_id` INT NOT NULL AUTO_INCREMENT,
  `qes_intitule` VARCHAR(60) NULL,
  `qes_statut` CHAR(1) NULL,
  `qes_ordre` INT NULL,
  `qui_id` INT NOT NULL,
  PRIMARY KEY (`qes_id`),
  INDEX `fk_t_question_qes_t_quiz_qui1_idx` (`qui_id` ASC),
  CONSTRAINT `fk_t_question_qes_t_quiz_qui1`
    FOREIGN KEY (`qui_id`)
    REFERENCES `zal3-zenaudva0_1`.`t_quiz_qui` (`qui_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zal3-zenaudva0_1`.`t_reponse_rep`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zal3-zenaudva0_1`.`t_reponse_rep` (
  `rep_id` INT NOT NULL AUTO_INCREMENT,
  `rep_intitule` VARCHAR(60) NULL,
  `rep_exacte` CHAR(1) NULL,
  `qes_id` INT NOT NULL,
  PRIMARY KEY (`rep_id`),
  INDEX `fk_t_reponse_rep_t_question_qes1_idx` (`qes_id` ASC),
  CONSTRAINT `fk_t_reponse_rep_t_question_qes1`
    FOREIGN KEY (`qes_id`)
    REFERENCES `zal3-zenaudva0_1`.`t_question_qes` (`qes_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
