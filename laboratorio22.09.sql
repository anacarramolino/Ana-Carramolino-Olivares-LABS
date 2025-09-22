-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TikTokDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TikTokDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TikTokDB` DEFAULT CHARACTER SET utf8 ;
USE `TikTokDB` ;

-- -----------------------------------------------------
-- Table `TikTokDB`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`usuarios` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nombre_usuario` VARCHAR(150) NOT NULL,
  `correo_electronico` VARCHAR(150) NOT NULL,
  `fecha_registro` DATE NOT NULL,
  `país_origen` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`videos` (
  `idvideos` INT NOT NULL AUTO_INCREMENT,
  `idusuario` INT NOT NULL,
  `titulo_video` VARCHAR(150) NOT NULL,
  `descripcion` TEXT NULL,
  `fecha_publicacion` DATETIME NOT NULL,
  `duracion_segundos` INT NOT NULL,
  PRIMARY KEY (`idvideos`),
  INDEX `idusuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `idusuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `TikTokDB`.`usuarios` (`idusuario`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`comentarios` (
  `idcomentario` INT NOT NULL,
  `idvideo` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `texto` TEXT NOT NULL,
  `fecha_comentario` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idcomentario`),
  INDEX `idvideo_idx` (`idvideo` ASC) VISIBLE,
  INDEX `idusuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `idvideo`
    FOREIGN KEY (`idvideo`)
    REFERENCES `TikTokDB`.`videos` (`idvideos`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `idusuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `TikTokDB`.`usuarios` (`idusuario`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`likes` (
  `idlike` INT NOT NULL,
  `idvideo` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `fecha_like` DATETIME NOT NULL,
  PRIMARY KEY (`idlike`),
  INDEX `idvideo_idx` (`idvideo` ASC) VISIBLE,
  INDEX `idusuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `idvideo`
    FOREIGN KEY (`idvideo`)
    REFERENCES `TikTokDB`.`videos` (`idvideos`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `idusuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `TikTokDB`.`usuarios` (`idusuario`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`seguidores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`seguidores` (
  `idseguidor` INT NOT NULL AUTO_INCREMENT,
  `usuario_seguidor` INT NOT NULL,
  `usuario_seguido` INT NOT NULL,
  `fecha_seguimiento` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idseguidor`),
  INDEX `usuario_seguidor_idx` (`usuario_seguidor` ASC) VISIBLE,
  INDEX `usuario_seguido_idx` (`usuario_seguido` ASC) VISIBLE,
  CONSTRAINT `usuario_seguidor`
    FOREIGN KEY (`usuario_seguidor`)
    REFERENCES `TikTokDB`.`usuarios` (`idusuario`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `usuario_seguido`
    FOREIGN KEY (`usuario_seguido`)
    REFERENCES `TikTokDB`.`usuarios` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
