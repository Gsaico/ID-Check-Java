SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `ID_Check_DB` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ID_Check_DB` ;

-- -----------------------------------------------------
-- Table `ID_Check_DB`.`EmpresaColaboradora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ID_Check_DB`.`EmpresaColaboradora` (
  `NombreEmpresa` VARCHAR(100) NOT NULL,
  `Gerente` VARCHAR(100) NULL,
  `Telefono` VARCHAR(15) NULL,
  `Email` VARCHAR(100) NULL,
  `idEmpresaColaboradora` CHAR(11) NOT NULL,
  PRIMARY KEY (`idEmpresaColaboradora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ID_Check_DB`.`TipoPersonal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ID_Check_DB`.`TipoPersonal` (
  `idTipoPersonal` SMALLINT NOT NULL,
  `NombreTipoPersonal` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idTipoPersonal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ID_Check_DB`.`Personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ID_Check_DB`.`Personal` (
  `idPersonal` CHAR(8) NOT NULL,
  `Nombres` VARCHAR(100) NOT NULL,
  `Apellidos` VARCHAR(100) NOT NULL,
  `FechaNac` DATE NOT NULL,
  `Cargo` VARCHAR(50) NOT NULL,
  `Foto` BINARY NULL,
  `idEmpresaColaboradora` CHAR(11) NULL,
  `idTipoPersonal` SMALLINT NOT NULL,
  PRIMARY KEY (`idPersonal`),
  INDEX `fk_Personal_EmpresaColaboradora1_idx` (`idEmpresaColaboradora` ASC),
  INDEX `fk_Personal_TipoPersonal1_idx` (`idTipoPersonal` ASC),
  CONSTRAINT `fk_Personal_EmpresaColaboradora1`
    FOREIGN KEY (`idEmpresaColaboradora`)
    REFERENCES `ID_Check_DB`.`EmpresaColaboradora` (`idEmpresaColaboradora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Personal_TipoPersonal1`
    FOREIGN KEY (`idTipoPersonal`)
    REFERENCES `ID_Check_DB`.`TipoPersonal` (`idTipoPersonal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ID_Check_DB`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ID_Check_DB`.`Administrador` (
  `Pasword` VARCHAR(50) NOT NULL,
  `idPersonal` CHAR(8) NOT NULL,
  PRIMARY KEY (`idPersonal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ID_Check_DB`.`Area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ID_Check_DB`.`Area` (
  `idArea` SMALLINT NOT NULL,
  `NombreArea` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idArea`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ID_Check_DB`.`Acceso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ID_Check_DB`.`Acceso` (
  `idAcceso` BIGINT NOT NULL,
  `idPersonal` CHAR(8) NULL,
  `Fecha` DATE NOT NULL,
  `FechaIngreso` DATE NOT NULL,
  `FechaCese` DATE NOT NULL,
  `Nota` VARCHAR(50) NULL,
  `Essalud` TINYINT(1) NOT NULL,
  `sctrSalud` TINYINT(1) NOT NULL,
  `sctrPensiones` TINYINT(1) NOT NULL,
  `pdtplame` TINYINT(1) NOT NULL,
  `afp` TINYINT(1) NOT NULL,
  `onp` TINYINT(1) NOT NULL,
  `idArea` SMALLINT NOT NULL,
  `idAutorizacion` CHAR(8) NULL,
  PRIMARY KEY (`idAcceso`),
  INDEX `fk_Acceso_Personal1_idx` (`idPersonal` ASC),
  INDEX `fk_Acceso_Area1_idx` (`idArea` ASC),
  INDEX `fk_Acceso_Personal2_idx` (`idAutorizacion` ASC),
  CONSTRAINT `fk_Acceso_Personal1`
    FOREIGN KEY (`idPersonal`)
    REFERENCES `ID_Check_DB`.`Personal` (`idPersonal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Acceso_Area1`
    FOREIGN KEY (`idArea`)
    REFERENCES `ID_Check_DB`.`Area` (`idArea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Acceso_Personal2`
    FOREIGN KEY (`idAutorizacion`)
    REFERENCES `ID_Check_DB`.`Personal` (`idPersonal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ID_Check_DB`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ID_Check_DB`.`Estado` (
  `idEstado` SMALLINT NOT NULL,
  `NombreEstado` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idEstado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ID_Check_DB`.`Registro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ID_Check_DB`.`Registro` (
  `idRegistro` BIGINT NOT NULL,
  `Fecha` DATE NOT NULL,
  `Hora` TIME NOT NULL,
  `idEstado` SMALLINT NOT NULL,
  `idAcceso` BIGINT NOT NULL,
  PRIMARY KEY (`idRegistro`),
  INDEX `fk_Registro_Acceso1_idx` (`idAcceso` ASC),
  INDEX `fk_Registro_Estado1_idx` (`idEstado` ASC),
  CONSTRAINT `fk_Registro_Acceso1`
    FOREIGN KEY (`idAcceso`)
    REFERENCES `ID_Check_DB`.`Acceso` (`idAcceso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Estado1`
    FOREIGN KEY (`idEstado`)
    REFERENCES `ID_Check_DB`.`Estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `ID_Check_DB`.`EmpresaColaboradora`
-- -----------------------------------------------------
START TRANSACTION;
USE `ID_Check_DB`;
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('EMPRESA MINERA SA', 'pedro perez manuel jobita1', '349230', '20100098041@gmail.com', '20100098041');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('INSTITUTO SUPERIOR SAN IGNACIO DE LOYOLA S.A.', 'pedro perez manuel jobita2', '349231', '20100134455@gmail.com', '20100134455');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('MINERA CERRO VERDE', 'pedro perez manuel jobita3', '349232', '20100178070@gmail.com', '20100178070');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('FUNDACION IGNACIA R VDA DE CANEVARO', 'pedro perez manuel jobita4', '349233', '20100266793@gmail.com', '20100266793');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('SOC.ITALIANA DE BENEFICENCIA Y ASIST', 'pedro perez manuel jobita5', '349234', '20100331951@gmail.com', '20100331951');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('ASOCIACION EDUCATIVA PITAGORAS', 'pedro perez manuel jobita6', '349235', '20100426669@gmail.com', '20100426669');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('MONASTERIO DE JESUS MARIA Y JOSE', 'pedro perez manuel jobita7', '349236', '20100479193@gmail.com', '20100479193');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('ASOCIACION FRAY LUIS DE LEON', 'pedro perez manuel jobita8', '349237', '20100559898@gmail.com', '20100559898');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('SANTA MAGDALENA SOFIA SOCIEDAD CIVIL DE RESPONSABI', 'pedro perez manuel jobita9', '349238', '20100606641@gmail.com', '20100606641');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('INST SUP TECNOLOGICO NO EST ALMTE GRAU', 'pedro perez manuel jobita10', '349239', '20100607701@gmail.com', '20100607701');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('INST SUPERIOR TECNOL NO ESTAT EN PRO DEN', 'pedro perez manuel jobita11', '349240', '20100716152@gmail.com', '20100716152');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('C E P NUESTRA SEÑORA DEL PILAR', 'pedro perez manuel jobita12', '349241', '20100754917@gmail.com', '20100754917');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('ASOC IGLESIA METODISTA DEL PERU', 'pedro perez manuel jobita13', '349242', '20100762341@gmail.com', '20100762341');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('C.E.P. \'ABRAHAM VALDELOMAR\'', 'pedro perez manuel jobita14', '349243', '20100894174@gmail.com', '20100894174');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('C.E.N.E. MARIA CURIE', 'pedro perez manuel jobita15', '349244', '20100907411@gmail.com', '20100907411');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('CENTRO DE PSICOTERAPIA PSICOANALITICA DE LIMA', 'pedro perez manuel jobita16', '349245', '20100958083@gmail.com', '20100958083');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('SAN SILVESTRE SCHOOL ASOCIACION CIVIL', 'pedro perez manuel jobita17', '349246', '20101002242@gmail.com', '20101002242');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('ACADEMIA SAN IGNACIO DE LOYOLA', 'pedro perez manuel jobita18', '349247', '20101002838@gmail.com', '20101002838');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('CENTRO EDUCATIVO PARTICULAR LOS SIERVOS DE JESUS S', 'pedro perez manuel jobita19', '349248', '20101013520@gmail.com', '20101013520');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('FUNDACION INSTITUTO HIPOLITO UNANUE', 'pedro perez manuel jobita20', '349249', '20101042031@gmail.com', '20101042031');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('ASOC PERUANA D L SOKA GAKKAI INTERN PSGI', 'pedro perez manuel jobita21', '349250', '20101063110@gmail.com', '20101063110');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('FUNDACION BBVA BANCO CONTINENTAL', 'pedro perez manuel jobita22', '349251', '20101098924@gmail.com', '20101098924');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('FUNDACION MONTERREY', 'pedro perez manuel jobita23', '349252', '20101171516@gmail.com', '20101171516');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('COOP.SERV.EDUC. ING CARLOS LISSON B LTDA', 'pedro perez manuel jobita24', '349253', '20101247865@gmail.com', '20101247865');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('COOP DE SERVS EDUCACIONALES STA FELICIA', 'pedro perez manuel jobita25', '349254', '20101251111@gmail.com', '20101251111');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('LIGA PERUANA DE LUCHA CONTRA EL CANCER', 'pedro perez manuel jobita26', '349255', '20101258476@gmail.com', '20101258476');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('FUNDACION PARA EL DESARROLLO AGRARIO', 'pedro perez manuel jobita27', '349256', '20101259014@gmail.com', '20101259014');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('FUND SAN FELIPE ESCUELA DE ENFERMERAS', 'pedro perez manuel jobita28', '349257', '20101260292@gmail.com', '20101260292');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('CAMARA DE COMERCIO DE LIMA', 'pedro perez manuel jobita29', '349258', '20101266819@gmail.com', '20101266819');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('ASOCIACION PERUANO JAPONESA', 'pedro perez manuel jobita30', '349259', '20101267467@gmail.com', '20101267467');
INSERT INTO `ID_Check_DB`.`EmpresaColaboradora` (`NombreEmpresa`, `Gerente`, `Telefono`, `Email`, `idEmpresaColaboradora`) VALUES ('COOPERATIVA DE SERV. EDUC. SAN FELIPE', 'pedro perez manuel jobita31', '349260', '20101267629@gmail.com', '20101267629');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ID_Check_DB`.`TipoPersonal`
-- -----------------------------------------------------
START TRANSACTION;
USE `ID_Check_DB`;
INSERT INTO `ID_Check_DB`.`TipoPersonal` (`idTipoPersonal`, `NombreTipoPersonal`) VALUES (1, 'Visitante');
INSERT INTO `ID_Check_DB`.`TipoPersonal` (`idTipoPersonal`, `NombreTipoPersonal`) VALUES (2, 'Trabajador con Contrato Fijo');
INSERT INTO `ID_Check_DB`.`TipoPersonal` (`idTipoPersonal`, `NombreTipoPersonal`) VALUES (3, 'Trabajador Tercero');
INSERT INTO `ID_Check_DB`.`TipoPersonal` (`idTipoPersonal`, `NombreTipoPersonal`) VALUES (5, 'Intermediacion Laboral');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ID_Check_DB`.`Personal`
-- -----------------------------------------------------
START TRANSACTION;
USE `ID_Check_DB`;
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('44535858', 'Honorina', 'Muñoz Molina', '1972-05-20', 'operador', NULL, '20100098041', 2);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('10226219', 'Marilyn Marlene', 'Arratia Rivas', '1972-05-21', 'peon', NULL, '20100098041', 2);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('10226093', 'Francisco Segundo', 'Ascencio Vera', '1972-05-22', 'operador', NULL, '20100098041', 2);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('09954108', 'Susana Angela', 'Mora Soutullo', '1972-05-23', 'peon', NULL, '20100098041', 2);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('07523648', 'Bernarda del Carmen', 'Fonseca', '1972-05-24', 'operador', NULL, '20100098041', 1);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('09532601', 'Segundo Ramón', 'Paz Zambrano', '1972-05-25', 'peon', NULL, '20100098041', 1);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('08036799', 'Flor Esilda', 'Bustos Riffo', '1972-05-26', 'operador', NULL, '20100098041', 1);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('10305236', 'Cecilia', 'Gallardo Tapia', '1972-05-27', 'peon', NULL, '20100098041', 1);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('10706891', 'Samuel Segundo', 'Alarcón Valdebenito', '1972-05-28', 'operador', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('09159894', 'Sonia Inés', 'Leal Leal', '1972-05-29', 'peon', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('43087580', 'Lucila', 'Aravena Hernandez', '1972-05-30', 'operador', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('40556643', 'Juan', 'Carrasco Vega', '1972-05-31', 'peon', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('46784633', 'Maritza', 'Lagos Oliva', '1972-06-01', 'operador', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('09952776', 'Irma Eliana', 'Recabal Silva', '1972-06-02', 'peon', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('08945926', 'José', 'Medina Cisternas', '1972-06-03', 'operador', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('44061233', 'Rosa Eulalia', 'Vera Meli', '1972-06-04', 'peon', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('09144433', 'Flilomena del Carmen', 'Loyola Cortéz', '1972-06-05', 'operador', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('10595907', 'Juan', 'Ramos Peña', '1972-06-06', 'peon', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('08898576', 'Edita', 'Salgado Ortiz', '1972-06-07', 'operador', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('42388482', 'Rosa Elena', 'Romero benavente', '1972-06-08', 'peon', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('41009386', 'Ema del Carmen', 'Rocha saez', '1972-06-09', 'operador', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('10515671', 'María Angélica', 'Martinez Aravena', '1972-06-10', 'peon', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('22707420', 'Heraldo', 'Cuevas Orellana', '1972-06-11', 'operador', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('09284554', 'Sergio', 'Ibañez Torres', '1972-06-12', 'peon', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('04071357', 'Moises', 'Alarcón salazar', '1972-06-13', 'operador', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('41131292', 'Graciela', 'Salazar Hermosilla', '1972-06-14', 'peon', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('09596483', 'José Maria', 'fierro Muñoz', '1972-06-15', 'operador', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('40263189', 'Magaly del Pilar', 'Rivera Retamal', '1972-06-16', 'peon', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('07484492', 'Hilda Ester', 'Contreras Pincheira', '1972-06-17', 'operador', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('07690102', 'Juan Honorino', 'Fredes Carrillo', '1972-06-18', 'peon', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('44229519', 'Leonardo Manuel', 'Carrasco Palma', '1972-06-19', 'operador', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('06946954', 'Marta', 'Faundez Baeza', '1972-06-20', 'peon', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('42403620', 'Alejandra del Carmen', 'Contreras Rodriguez', '1972-06-21', 'operador', NULL, '20100098041', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('42722920', 'Tania Angelica', 'Villar Cariaga', '1972-06-22', 'peon', NULL, '20100134455', 3);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('10593824', 'Irene del Carmen', 'Aguilera Rivera', '1972-06-23', 'operador', NULL, NULL, 1);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('45833457', 'Estela de Las Mercedes', 'Zapata Arriagada', '1972-06-24', 'peon', NULL, NULL, 1);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('09586145', 'Roguers Alberto', 'Morales Navarrete', '1972-06-25', 'operador', NULL, NULL, 1);
INSERT INTO `ID_Check_DB`.`Personal` (`idPersonal`, `Nombres`, `Apellidos`, `FechaNac`, `Cargo`, `Foto`, `idEmpresaColaboradora`, `idTipoPersonal`) VALUES ('10754417', 'Maria margarita', 'Fuentealba vallejos', '1972-06-26', 'peon', NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ID_Check_DB`.`Area`
-- -----------------------------------------------------
START TRANSACTION;
USE `ID_Check_DB`;
INSERT INTO `ID_Check_DB`.`Area` (`idArea`, `NombreArea`) VALUES (1, 'Mantenimiento');
INSERT INTO `ID_Check_DB`.`Area` (`idArea`, `NombreArea`) VALUES (2, 'Mina');
INSERT INTO `ID_Check_DB`.`Area` (`idArea`, `NombreArea`) VALUES (3, 'Procesos');
INSERT INTO `ID_Check_DB`.`Area` (`idArea`, `NombreArea`) VALUES (4, 'Planta de oxidos');
INSERT INTO `ID_Check_DB`.`Area` (`idArea`, `NombreArea`) VALUES (5, 'Oficinas Administrativas');
INSERT INTO `ID_Check_DB`.`Area` (`idArea`, `NombreArea`) VALUES (6, 'Laboratorio');
INSERT INTO `ID_Check_DB`.`Area` (`idArea`, `NombreArea`) VALUES (7, 'Seguridad');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ID_Check_DB`.`Estado`
-- -----------------------------------------------------
START TRANSACTION;
USE `ID_Check_DB`;
INSERT INTO `ID_Check_DB`.`Estado` (`idEstado`, `NombreEstado`) VALUES (1, 'Ingreso');
INSERT INTO `ID_Check_DB`.`Estado` (`idEstado`, `NombreEstado`) VALUES (2, 'Salida');

COMMIT;

