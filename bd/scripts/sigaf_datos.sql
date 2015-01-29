-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-01-2015 a las 12:14:04
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sigaf`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `act_adicional_emp`
--

CREATE TABLE IF NOT EXISTS `act_adicional_emp` (
  `id` int(11) NOT NULL COMMENT 'Codigo Docente',
  `tipo_curso_emp` int(11) NOT NULL COMMENT 'Cod tipo cur (Rec,Imp,Interes)',
  `curso` int(11) NOT NULL COMMENT 'Código curso',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  KEY `fk_act_adicional_emp_tipo_curso_emp1_idx` (`tipo_curso_emp`),
  KEY `fk_act_adicional_emp_act_profesional_adic1_idx` (`curso`),
  KEY `fk_act_adicional_emp_users1_idx` (`users_id`),
  KEY `fk_act_adicional_emp_users2_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `act_adicional_emp`
--

INSERT INTO `act_adicional_emp` (`id`, `tipo_curso_emp`, `curso`, `users_id`) VALUES
(18, 1, 1, 1),
(18, 1, 2, 1),
(18, 1, 3, 1),
(18, 1, 4, 1),
(18, 1, 5, 1),
(18, 2, 6, 1),
(18, 1, 7, 1),
(18, 1, 8, 1),
(18, 1, 9, 1),
(18, 1, 10, 1);

--
-- Disparadores `act_adicional_emp`
--
DROP TRIGGER IF EXISTS `bit_D_act_adicional_emp`;
DELIMITER //
CREATE TRIGGER `bit_D_act_adicional_emp` AFTER DELETE ON `act_adicional_emp`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *act_adicional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES ('act_adicional_emp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
    OLD.curso, 
    OLD.id,
    OLD.tipo_curso_emp ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_act_adicional_emp`;
DELIMITER //
CREATE TRIGGER `bit_I_act_adicional_emp` AFTER INSERT ON `act_adicional_emp`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *act_adicional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES ('act_adicional_emp', NEW.users_id, 'I', curdate( ) , concat_WS( '|',  
    NEW.curso, 
    NEW.id,
    NEW.tipo_curso_emp ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_act_adicional_emp`;
DELIMITER //
CREATE TRIGGER `bit_U_act_adicional_emp` AFTER UPDATE ON `act_adicional_emp`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *act_adicional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,
registro_old
)
VALUES ('act_adicional_emp', NEW.users_id, 'U', curdate( ) , concat_WS( '|',  
    NEW.curso, 
    NEW.id,
    NEW.tipo_curso_emp ), concat_WS( '|', 
    OLD.curso, 
    OLD.id,
    OLD.tipo_curso_emp ) 
    
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `act_profesional_adic`
--

CREATE TABLE IF NOT EXISTS `act_profesional_adic` (
  `curso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código curso,congreso,taller',
  `periodo` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL COMMENT 'Desc:cur,cong,tall',
  `fecha` date NOT NULL COMMENT 'Fecha curso',
  `creditos` int(11) NOT NULL COMMENT 'Creditos',
  `horas` decimal(11,2) unsigned NOT NULL COMMENT 'Horas',
  `caracteristica_cur` int(11) NOT NULL,
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`curso`),
  KEY `fk_act_profesional_adic_users1_idx` (`users_id`),
  KEY `fk_act_profesional_adic_periodos1` (`periodo`),
  KEY `fk_act_profesional_adic_caracteristica_cur1` (`caracteristica_cur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `act_profesional_adic`
--

INSERT INTO `act_profesional_adic` (`curso`, `periodo`, `descripcion`, `fecha`, `creditos`, `horas`, `caracteristica_cur`, `users_id`) VALUES
(1, 20141, 'ELABORACION DE MATERIAL DIDACTICO DIGITAL UTILIZANDO LAS HERRAMIENTAS DE POWER POINT Y "PREZI"', '2014-07-21', 10, '25.00', 1, 1),
(2, 20141, 'GOOGLE SITES', '2014-06-11', 10, '2.30', 1, 1),
(3, 20141, 'JAVA SCRIPT', '2014-06-10', 10, '3.00', 1, 1),
(4, 20141, 'CONTPAQI: CONTABILIDAD ELECTRONICA Y EL TIMBRADO DE LA NOMINA', '2014-06-10', 10, '3.00', 1, 1),
(5, 20141, 'DESARROLLO DE APPS PARA IOS', '2014-06-09', 10, '1.30', 1, 1),
(6, 20132, 'UML Y DISENO DE SISTEMAS', '2014-03-24', 10, '0.00', 1, 1),
(7, 20131, 'HERRAMIENTAS DIDACTICAS PARA LA DOCENCIA', '2013-04-14', 0, '5.00', 1, 1),
(8, 20131, 'PRIMERA PARTE: PROYECT MANAGEMENT', '2013-04-22', 10, '5.00', 1, 1),
(9, 20131, 'TALLER DE HERRAMIENTAS DE EVOLUCION EN BLACKBOARD', '2013-06-04', 10, '25.00', 1, 1),
(10, 20131, 'DOCENCIA POYADA EN TECNOLOGIAS DE INF., COMUNICACION Y COLABORACION I (INTERMEDIO)', '2013-06-10', 10, '25.00', 1, 1);

--
-- Disparadores `act_profesional_adic`
--
DROP TRIGGER IF EXISTS `bit_D_act_profesional_adic`;
DELIMITER //
CREATE TRIGGER `bit_D_act_profesional_adic` AFTER DELETE ON `act_profesional_adic`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *act_profesional_adic*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'act_profesional_adic', OLD.users_id, 'D', curdate( ) , concat_WS( '|',  
  OLD.curso,
  OLD.periodo,
  OLD.descripcion, 
  OLD.fecha,
  OLD.creditos,
  OLD.horas,
  OLD.caracteristica_cur ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_act_profesional_adic`;
DELIMITER //
CREATE TRIGGER `bit_I_act_profesional_adic` AFTER INSERT ON `act_profesional_adic`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *act_profesional_adic*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'act_profesional_adic', NEW.users_id, 'I', curdate( ) , concat_WS( '|',  
NEW.curso,
NEW.periodo, 
NEW.descripcion,
NEW.fecha,
NEW.creditos,
NEW.horas,
NEW.caracteristica_cur ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_act_profesional_adic`;
DELIMITER //
CREATE TRIGGER `bit_U_act_profesional_adic` AFTER UPDATE ON `act_profesional_adic`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *act_profesional_adic*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,
registro_old
)
VALUES (
'act_profesional_adic', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.curso,
NEW.periodo, 
NEW.descripcion,
NEW.fecha,
NEW.creditos,
NEW.horas,
NEW.caracteristica_cur )
, concat_WS( '|', 
OLD.curso,
OLD.periodo, 
OLD.descripcion,
OLD.fecha,
OLD.creditos,
OLD.horas,
OLD.caracteristica_cur )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `act_profesional_emp`
--

CREATE TABLE IF NOT EXISTS `act_profesional_emp` (
  `carrera` int(11) NOT NULL COMMENT 'Carrera adicional',
  `id` int(11) NOT NULL COMMENT 'Usuario',
  `universidad` int(11) NOT NULL COMMENT 'Universidad carr adic',
  `nivel` int(11) NOT NULL COMMENT 'grado (Lic, post, tecn)',
  `cedula` int(11) DEFAULT NULL COMMENT 'No cedula',
  `fec_tit` date DEFAULT NULL COMMENT 'Fecha Tit',
  `obtuvo_grado` int(11) NOT NULL COMMENT '1=SI, 2=NO',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`carrera`,`id`),
  KEY `fk_act_profesional_emp_nvprograma1_idx` (`nivel`),
  KEY `fk_act_profesional_emp_users1_idx` (`users_id`),
  KEY `fk_act_profesional_emp_users2_idx` (`id`),
  KEY `fk_act_profesional_emp_carreras_emp1_idx` (`carrera`),
  KEY `fk_act_profesional_emp_universidades_emp1_idx` (`universidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `act_profesional_emp`
--

INSERT INTO `act_profesional_emp` (`carrera`, `id`, `universidad`, `nivel`, `cedula`, `fec_tit`, `obtuvo_grado`, `users_id`) VALUES
(1, 18, 1, 1, 8000054, '1997-04-30', 1, 18),
(5, 1, 2, 1, NULL, NULL, 1, 1),
(5, 9, 2, 1, NULL, NULL, 1, 1),
(5, 10, 2, 1, NULL, NULL, 1, 1),
(5, 11, 2, 1, NULL, NULL, 1, 1),
(5, 17, 2, 1, NULL, NULL, 2, 1),
(6, 9, 1, 2, NULL, NULL, 1, 1),
(6, 17, 1, 2, NULL, NULL, 1, 9);

--
-- Disparadores `act_profesional_emp`
--
DROP TRIGGER IF EXISTS `bit_D_act_profesional_emp`;
DELIMITER //
CREATE TRIGGER `bit_D_act_profesional_emp` AFTER DELETE ON `act_profesional_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *act_profesional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'carga', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.carrera, 
OLD.id,
OLD.universidad, 
OLD.nivel,                                                                                         
OLD.cedula, 
OLD.fec_tit, 
OLD.obtuvo_grado
));
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_act_profesional_emp`;
DELIMITER //
CREATE TRIGGER `bit_I_act_profesional_emp` AFTER INSERT ON `act_profesional_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *act_profesional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'carga', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.carrera, 
NEW.id,
NEW.universidad, 
NEW.nivel,                                                                                         
NEW.cedula, 
NEW.fec_tit, 
NEW.obtuvo_grado
));
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_act_profesional_emp`;
DELIMITER //
CREATE TRIGGER `bit_U_act_profesional_emp` AFTER UPDATE ON `act_profesional_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *act_profesional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,
registro_old
)
VALUES (
'carga', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.carrera, 
NEW.id,
NEW.universidad, 
NEW.nivel,                                                                                         
NEW.cedula, 
NEW.fec_tit, 
NEW.obtuvo_grado
),
concat_WS( '|', 
OLD.carrera, 
OLD.id,
OLD.universidad, 
OLD.nivel,                                                                                         
OLD.cedula, 
OLD.fec_tit, 
OLD.obtuvo_grado));
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE IF NOT EXISTS `bitacora` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo',
  `tabla` varchar(25) NOT NULL COMMENT 'Tabla',
  `usuario` varchar(20) NOT NULL COMMENT 'Usuario',
  `operacion` char(3) NOT NULL COMMENT 'Operacion realizada',
  `fecha` datetime NOT NULL COMMENT 'Fecha realizacion cambio',
  `registro` varchar(200) DEFAULT NULL COMMENT 'Registro Insertado',
  `registro_old` varchar(200) DEFAULT NULL COMMENT 'Registro Modificado/Borrado',
  PRIMARY KEY (`id`),
  UNIQUE KEY `BI_id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3103 ;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id`, `tabla`, `usuario`, `operacion`, `fecha`, `registro`, `registro_old`) VALUES
(989, 'periodos', '1', 'I', '2014-10-29 00:00:00', '20142|1|2014|7|2014-09-01|2014-12-15|1', NULL),
(990, 'periodos', '1', 'I', '2014-10-29 00:00:00', '20141|1|2014|1|2014-01-01|2014-07-31|1', NULL),
(991, 'periodos', '1', 'I', '2014-10-29 00:00:00', '20131|1|2013|1|2013-01-01|2013-07-31|1', NULL),
(992, 'periodos', '1', 'I', '2014-10-29 00:00:00', '20132|1|2013|9|2013-09-01|2013-12-15|1', NULL),
(993, 'periodos', '1', 'I', '2014-10-29 00:00:00', '20121|1|2012|1|2013-01-01|2013-07-31|1', NULL),
(994, 'periodos', '1', 'I', '2014-10-29 00:00:00', '20122|1|2012|9|2014-09-01|2014-12-15|1', NULL),
(995, 'planestudio', '1', 'I', '2014-10-29 00:00:00', '20092|PLAN DE ESTUDIOS 2009-2|20|2009-01-01|2015-12-31|1', NULL),
(996, 'plan_programa', '1', 'I', '2014-10-29 00:00:00', '20092|2', NULL),
(997, 'plan_programa', '1', 'I', '2014-10-29 00:00:00', '20092|5', NULL),
(998, 'plan_programa', '1', 'I', '2014-10-29 00:00:00', '20092|6', NULL),
(1019, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '0|esto es una pruena|1|1|1|1|1|1|1|2014-07-01|esto es una prueba|2|1|1|20092', NULL),
(1020, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11236|COMUNICACION ORAL Y ESCRITA|1|0|2|0|0|0|4|0|1|21|20092', NULL),
(1021, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11237|CONTABILIDAD|2|0|3|0|0|0|7|0|1|1|20092', NULL),
(1022, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11238|DESARROLLO HUMANO|1|0|2|0|0|0|4|0|1|8|20092', NULL),
(1023, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11239|ENTORNO GLOBAL DE LOS NEGOCIOS|2|0|2|0|0|0|6|0|1|10|20092', NULL),
(1024, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11240|MATEMATICAS|2|0|2|0|0|0|6|0|1|22|20092', NULL),
(1025, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11241|RESPONSABILIDAD SOCIAL|2|0|1|0|0|0|5|0|1|21|20092', NULL),
(1026, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11242|TECNOLOGIAS DE LA INFORMACION|1|3|0|0|0|0|5|0|1|12|20092', NULL),
(1027, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11243|CONTABILIDAD APLICADA|2|0|3|0|0|0|7|0|1|1|20092', NULL),
(1028, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11244|DERECHO|3|0|0|0|0|0|6|0|1|19|20092', NULL),
(1029, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11245|ECONOMIA|2|0|2|0|0|0|6|0|1|17|20092', NULL),
(1030, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11246|LOGICA PARA LA TOMA DE DECISIONES|1|0|3|0|0|0|5|0|1|16|20092', NULL),
(1031, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11247|PROBABILIDAD Y ESTADISTICA|2|0|2|0|0|0|6|0|1|22|20092', NULL),
(1032, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11248|PROCESO ADMINISTRATIVO|2|0|2|0|0|0|6|0|1|10|20092', NULL),
(1033, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11249|SISTEMAS DE INFORMACION|2|0|2|0|0|0|6|0|1|15|20092', NULL),
(1034, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11733|MATEMATICAS FINANCIERAS|2|0|2|0|0|0|6|0|1|4|20092', NULL),
(1035, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11734|ENTORNO SOCIOECONOMICO DE MEXICO|2|0|2|0|0|0|6|0|1|17|20092', NULL),
(1036, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11737|DERECHO CORPORATIVO|3|0|1|0|0|0|7|0|1|19|20092', NULL),
(1037, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11755|DESARROLLO DE EMPRENDEDORES|1|0|3|0|0|0|5|0|1|20|20092', NULL),
(1038, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11761|ADMINISTRACION PUBLICA|3|0|0|0|0|0|6|0|2|11|20092', NULL),
(1039, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11843|METODOLOGIA DE LA INVESTIGACION|2|0|1|0|0|0|5|0|1|21|20092', NULL),
(1040, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11859|METODOS CUANTITATIVOS|2|0|2|0|0|0|6|0|1|9|20092', NULL),
(1041, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11862|MERCADOTECNIA|2|0|2|0|0|0|6|0|1|7|20092', NULL),
(1042, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12292|ADMINISTRACION ESTRATEGICA|2|0|2|0|0|0|6|0|1|11|20092', NULL),
(1043, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12345|preuba de bitacora|1|1|1|1|1|1|1|2014-08-01|prueba bita|2|1|1|20092', NULL),
(1044, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12456|ADMINISTRACION DE COMPRAS|2|0|1|0|0|0|5|0|1|10|20092', NULL),
(1045, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12457|DISEÃ‘O ORGANIZACIONAL|2|0|2|0|0|0|6|0|1|10|20092', NULL),
(1046, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12458|REGISTROS ESPECIALES|2|0|2|0|0|0|6|0|1|1|20092', NULL),
(1047, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12459|RELACIONES LABORALES|2|0|2|0|0|0|6|0|1|19|20092', NULL),
(1048, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12460|CONTABILIDAD ADMINISTRATIVA|2|0|2|0|0|0|6|0|1|3|20092', NULL),
(1049, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12461|DERECHO CORPORATIVO|2|0|1|0|0|0|5|0|1|1|20092', NULL),
(1050, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12462|DERECHO FISCAL|2|0|2|0|0|0|6|0|1|6|20092', NULL),
(1051, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12463|INTEGRACION Y DESARROLLO DEL TALENTO HUMANO|2|0|3|0|0|0|7|0|1|8|20092', NULL),
(1052, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12464|METODOS CUANTITATIVOS AVANZADOS|2|0|2|0|0|0|6|0|1|9|20092', NULL),
(1053, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12465|ADMINISTRACION DE OPERACIONES|2|0|2|0|0|0|6|0|1|9|20092', NULL),
(1054, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12466|ADMINISTRACION DE VENTAS|2|0|1|0|0|0|5|0|1|7|20092', NULL),
(1055, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12467|ANALISIS FINANCIERO|2|0|3|0|0|0|7|0|1|4|20092', NULL),
(1056, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12468|MERCADOTECNIA AVANZADA|2|0|2|0|0|0|6|0|1|7|20092', NULL),
(1057, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12469|SEGURIDAD E HIGIENE|2|0|2|0|0|0|6|0|1|8|20092', NULL),
(1058, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12470|ADMINISTRACION DEL CAPITAL DE TRABAJO|2|0|2|0|0|0|6|0|1|22|20092', NULL),
(1059, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12471|ADMINISTRACION DE SUELDOS Y SALARIOS|2|0|2|0|0|0|6|0|1|8|20092', NULL),
(1060, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12472|CONTRIBUCIONES DE SEGURIDAD SOCIAL|2|0|2|0|0|0|6|0|1|6|20092', NULL),
(1061, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12473|DIRECCION ESTRATEGICA|2|0|2|0|0|0|6|0|1|8|20092', NULL),
(1062, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12474|INVESTIGACION DE MERCADO|2|0|2|0|0|0|6|0|1|7|20092', NULL),
(1063, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12475|SI ESTRATEGICA EN LOS NEGOCIOS|1|0|3|0|0|0|5|0|1|15|20092', NULL),
(1064, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12476|ADMINISTRACION DE LA CALIDAD|2|0|2|0|0|0|6|0|1|22|20092', NULL),
(1065, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12477|AUDITORIA ADMINISTRATIVA|2|0|2|0|0|0|6|0|1|11|20092', NULL),
(1066, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12478|CONTROL PRESUPUESTAL|2|0|2|0|0|0|6|0|1|4|20092', NULL),
(1067, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12479|FUENTES DE FINANCIAMIENTO|2|0|2|0|0|0|6|0|1|4|20092', NULL),
(1068, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12480|COMPETITIVIDAD EN LOS MERCADOS|1|0|3|0|0|0|5|0|1|9|20092', NULL),
(1069, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12481|FORMULACION Y EVALUACION DE PROYECTOS DE INVERSION|1|0|3|0|0|0|5|0|1|4|20092', NULL),
(1070, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12482|PRACTICA PROFESIONAL|0|0|0|0|0|0|10|0|2|22|20092', NULL),
(1071, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12483|ADMON. DEL MEDIO AMBIENTE|3|0|0|0|0|0|6|0|2|22|20092', NULL),
(1072, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12484|ETICA|3|0|0|0|0|0|6|0|2|21|20092', NULL),
(1073, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12485|IDIOMA|3|0|0|0|0|0|6|0|2|22|20092', NULL),
(1074, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12486|SOCIOLOGIA DE LA EMPRESA|3|0|0|0|0|0|6|0|2|10|20092', NULL),
(1075, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12487|COMERCIO EXTERIOR|4|0|0|0|0|0|6|0|2|18|20092', NULL),
(1076, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12488|DESARROLLO DE HABILIDADES DOCENTES|4|0|0|0|0|0|6|0|2|21|20092', NULL),
(1077, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12489|DESARROLLO ORGANIZACIONAL|3|0|0|0|0|0|6|0|2|10|20092', NULL),
(1078, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12490|IMPUESTOS|4|0|0|0|0|0|7|0|2|6|20092', NULL),
(1079, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12491|MERCADOTECNIAS ESPECIALES|4|0|0|0|0|0|7|0|2|7|20092', NULL),
(1080, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12492|TECNICAS DE NEGOCIACION|2|0|1|0|0|0|5|0|2|11|20092', NULL),
(1081, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12493|ADMON. DE AGRONEGOCIOS|3|0|0|0|0|0|6|0|2|11|20092', NULL),
(1082, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12494|ADMON. Y COMERCIO ELECTRONICO|4|0|0|0|0|0|6|0|2|12|20092', NULL),
(1083, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12495|COMUNICACION ORGANIZACIONAL|4|0|0|0|0|0|6|0|2|11|20092', NULL),
(1084, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12496|CONSULTORIA|4|0|0|0|0|0|6|0|2|11|20092', NULL),
(1085, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12497|CREACION DE NEGOCIOS POR INTERNET|4|0|0|0|0|0|6|0|2|12|20092', NULL),
(1086, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12498|DESARROLLO DE HABILIDADES DIRECTIVAS|3|0|0|0|0|0|6|0|2|8|20092', NULL),
(1087, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12499|ETICA DE LOS NEGOCIOS|4|0|0|0|0|0|7|0|2|22|20092', NULL),
(1088, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12500|FINANZAS INTERNACIONALES|4|0|0|0|0|0|6|0|2|4|20092', NULL),
(1089, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12501|SISTEMAS ADMINISTRATIVOS ESPECIALES|3|0|0|0|0|0|6|0|2|22|20092', NULL),
(1090, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12559|DERECHO TRIBUTARIO|2|0|3|0|0|0|7|0|1|6|20092', NULL),
(1091, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12560|IMPUESTOS INDIRECTOS|2|0|2|0|0|0|6|0|1|6|20092', NULL),
(1092, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12561|NORMAS DE INFORMACION FINANCIERA|2|0|3|0|0|0|7|0|1|22|20092', NULL),
(1093, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12562|PROFESION CONTABLE|1|0|2|0|0|0|4|0|1|22|20092', NULL),
(1094, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12563|CONTABILIDAD DE SOCIEDADES|2|0|2|0|0|0|6|0|1|2|20092', NULL),
(1095, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12564|CONTROL|1|0|4|0|0|0|6|0|1|5|20092', NULL),
(1096, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12565|FUNDAMENTOS DE CONTABILIDAD DE COSTOS|2|0|3|0|0|0|7|0|1|3|20092', NULL),
(1097, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12566|NORMAS PARTICULARES|3|0|3|0|0|0|7|0|1|22|20092', NULL),
(1098, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12567|AUDITORIA|2|0|3|0|0|0|7|0|1|5|20092', NULL),
(1099, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12568|COSTOS PREDETERMINADOS|2|0|3|0|0|0|7|0|1|3|20092', NULL),
(1100, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12569|ESTADOS FINANCIEROS|1|2|0|0|0|0|4|0|1|2|20092', NULL),
(1101, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12570|ISR PERSONAS FISICAS|2|0|3|0|0|0|7|0|1|6|20092', NULL),
(1102, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12571|PLANEACION FINANCIERA|1|0|2|0|0|0|4|0|1|4|20092', NULL),
(1103, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12572|COSTOS PARA LA TOMA DE DECISIONES|2|0|2|0|0|0|6|0|1|3|20092', NULL),
(1104, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12573|ISR PERSONAS MORALES Y OTRAS CONTRIBUCIONES|2|0|3|0|0|0|7|0|1|6|20092', NULL),
(1105, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12574|PAQUETERIA NEGOCIOS|1|2|0|0|0|0|4|0|1|2|20092', NULL),
(1106, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12575|PRACTICA DE AUDITORIAS|1|0|3|0|0|0|5|0|1|5|20092', NULL),
(1107, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12576|PRACTICA FISCAL|1|2|0|0|0|0|4|0|1|6|20092', NULL),
(1108, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12578|INTEGRACION FISCAL|1|0|2|0|0|0|4|0|1|6|20092', NULL),
(1109, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12579|PLANEACION ESTRATEGICA|1|0|3|0|0|0|5|0|1|11|20092', NULL),
(1110, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12581|ANALISIS DE LA LEGISLACION ADUANERA|4|0|0|0|0|0|8|0|2|22|20092', NULL),
(1111, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12582|COSTOS Y PRODUCTIVIDAD|2|0|2|0|0|0|6|0|2|3|20092', NULL),
(1112, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12583|INVESTIGACION DE OPERACIONES|2|0|2|0|0|0|6|0|2|9|20092', NULL),
(1113, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12584|MERCADOTECNIA|2|0|2|0|0|0|6|0|2|7|20092', NULL),
(1114, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12585|PRODUCCION|1|0|2|0|0|0|4|0|2|9|20092', NULL),
(1115, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12586|AUDITORIAS ESPECIALES|2|0|2|0|0|0|6|0|2|5|20092', NULL),
(1116, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12587|CASOS PRACTICOS DE COSTOS|2|0|2|0|0|0|6|0|2|3|20092', NULL),
(1117, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12588|CONTABILIDAD INTERNACIONAL|2|0|1|0|0|0|5|0|2|2|20092', NULL),
(1118, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12589|CONTABILIDAD CONSOLIDADA|3|0|1|0|0|0|7|0|2|2|20092', NULL),
(1119, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12590|CONTABILIDADES ESPECIALES|2|0|2|0|0|0|6|0|2|2|20092', NULL),
(1120, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12591|DICTAMENES|4|0|0|0|0|0|8|0|2|5|20092', NULL),
(1121, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12592|FINANZAS INTERNACIONALES|3|0|1|0|0|0|7|0|2|4|20092', NULL),
(1122, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12593|INVESTIGACION CONTABLE|2|0|2|0|0|0|6|0|2|2|20092', NULL),
(1123, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12594|MERCADO DE VALORES|2|0|1|0|0|0|5|0|2|4|20092', NULL),
(1124, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '20000|prueba|1|1|1|1|1|1|1|2014-07-01|Esta ua es una prueba|12|1|1|20092', NULL),
(1125, 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '20001|prueba|1|1|1|1|1|1|1|2014-07-01|esto es una prueba|12|1|1|20092', NULL),
(1126, 'uaprendizaje', '9', 'I', '2014-10-29 00:00:00', '20002|esto es una prueba|1|1|1|1|1|1|1|esto es una prueba|9|1|1|20092', NULL),
(1127, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11236|1', NULL),
(1128, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11237|1', NULL),
(1129, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11238|1', NULL),
(1130, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11239|1', NULL),
(1131, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11240|1', NULL),
(1132, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11241|1', NULL),
(1133, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11242|1', NULL),
(1134, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11243|1', NULL),
(1135, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11244|1', NULL),
(1136, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11245|1', NULL),
(1137, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11246|1', NULL),
(1138, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11247|1', NULL),
(1139, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11248|1', NULL),
(1140, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11249|1', NULL),
(1141, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|11733|1', NULL),
(1142, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|11733|1', NULL),
(1143, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|11734|1', NULL),
(1144, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|11734|1', NULL),
(1145, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|11843|1', NULL),
(1146, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|11843|1', NULL),
(1147, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|11859|1', NULL),
(1148, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12456|1', NULL),
(1149, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12457|1', NULL),
(1150, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12457|1', NULL),
(1151, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12458|1', NULL),
(1152, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12458|1', NULL),
(1153, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12459|1', NULL),
(1154, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12459|1', NULL),
(1155, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12483|1', NULL),
(1156, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12484|1', NULL),
(1157, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12485|1', NULL),
(1158, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12486|1', NULL),
(1159, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12559|1', NULL),
(1160, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|11737|2', NULL),
(1161, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|11761|2', NULL),
(1162, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|11862|2', NULL),
(1163, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12460|2', NULL),
(1164, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12461|2', NULL),
(1165, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12462|2', NULL),
(1166, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12463|2', NULL),
(1167, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12464|2', NULL),
(1168, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12465|2', NULL),
(1169, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12466|2', NULL),
(1170, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12467|2', NULL),
(1171, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12467|2', NULL),
(1172, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12468|2', NULL),
(1173, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12469|2', NULL),
(1174, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12470|2', NULL),
(1175, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12470|2', NULL),
(1176, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12471|2', NULL),
(1177, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12472|2', NULL),
(1178, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12472|2', NULL),
(1179, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12473|2', NULL),
(1180, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12474|2', NULL),
(1181, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12475|2', NULL),
(1182, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12479|2', NULL),
(1183, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12479|2', NULL),
(1184, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12487|2', NULL),
(1185, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12488|2', NULL),
(1186, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12489|2', NULL),
(1187, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12490|2', NULL),
(1188, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12491|2', NULL),
(1189, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12492|2', NULL),
(1190, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12492|2', NULL),
(1191, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12560|2', NULL),
(1192, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12561|2', NULL),
(1193, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12562|2', NULL),
(1194, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12563|2', NULL),
(1195, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12564|2', NULL),
(1196, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12565|2', NULL),
(1197, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12566|2', NULL),
(1198, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12567|2', NULL),
(1199, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12568|2', NULL),
(1200, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12569|2', NULL),
(1201, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12570|2', NULL),
(1202, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12571|2', NULL),
(1203, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12581|2', NULL),
(1204, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12582|2', NULL),
(1205, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12583|2', NULL),
(1206, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12584|2', NULL),
(1207, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12585|2', NULL),
(1208, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|11755|3', NULL),
(1209, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|11755|3', NULL),
(1210, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12292|3', NULL),
(1211, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12476|3', NULL),
(1212, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12477|3', NULL),
(1213, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12478|3', NULL),
(1214, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12480|3', NULL),
(1215, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12481|3', NULL),
(1216, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12481|3', NULL),
(1217, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12482|3', NULL),
(1218, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12493|3', NULL),
(1219, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12494|3', NULL),
(1220, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12495|3', NULL),
(1221, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12496|3', NULL),
(1222, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12497|3', NULL),
(1223, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12498|3', NULL),
(1224, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12499|3', NULL),
(1225, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12500|3', NULL),
(1226, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12501|3', NULL),
(1227, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12572|3', NULL),
(1228, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12573|3', NULL),
(1229, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12574|3', NULL),
(1230, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12575|3', NULL),
(1231, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12576|3', NULL),
(1232, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12578|3', NULL),
(1233, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12579|3', NULL),
(1234, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12586|3', NULL),
(1235, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12587|3', NULL),
(1236, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12588|3', NULL),
(1237, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12589|3', NULL),
(1238, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12590|3', NULL),
(1239, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12591|3', NULL),
(1240, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12592|3', NULL),
(1241, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12593|3', NULL),
(1242, 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12594|3', NULL),
(1243, 'grupos', '1', 'I', '2014-10-29 00:00:00', '231|20132|20092|2|1', NULL),
(1244, 'grupos', '1', 'I', '2014-10-29 00:00:00', '232|20132|20092|2|1', NULL),
(1245, 'grupos', '1', 'I', '2014-10-29 00:00:00', '235|20132|20092|2|1', NULL),
(1246, 'grupos', '1', 'I', '2014-10-29 00:00:00', '241|20132|20092|2|1', NULL),
(1247, 'grupos', '1', 'I', '2014-10-29 00:00:00', '242|20132|20092|2|1', NULL),
(1248, 'grupos', '1', 'I', '2014-10-29 00:00:00', '245|20132|20092|2|1', NULL),
(1249, 'grupos', '1', 'I', '2014-10-29 00:00:00', '251|20132|20092|2|1', NULL),
(1250, 'grupos', '1', 'I', '2014-10-29 00:00:00', '252|20132|20092|2|1', NULL),
(1251, 'grupos', '1', 'I', '2014-10-29 00:00:00', '255|20132|20092|2|1', NULL),
(1252, 'grupos', '1', 'I', '2014-10-29 00:00:00', '261|20132|20092|2|1', NULL),
(1253, 'grupos', '1', 'I', '2014-10-29 00:00:00', '262|20132|20092|2|1', NULL),
(1254, 'grupos', '1', 'I', '2014-10-29 00:00:00', '265|20132|20092|2|1', NULL),
(1255, 'grupos', '1', 'I', '2014-10-29 00:00:00', '271|20132|20092|2|1', NULL),
(1256, 'grupos', '1', 'I', '2014-10-29 00:00:00', '272|20132|20092|2|1', NULL),
(1257, 'grupos', '1', 'I', '2014-10-29 00:00:00', '275|20132|20092|2|1', NULL),
(1258, 'grupos', '1', 'I', '2014-10-29 00:00:00', '281|20132|20092|2|1', NULL),
(1259, 'grupos', '1', 'I', '2014-10-29 00:00:00', '282|20132|20092|2|1', NULL),
(1260, 'grupos', '1', 'D', '2014-11-03 00:00:00', NULL, '282|20132|20092|2|1'),
(1261, 'grupos', '1', 'D', '2014-11-03 00:00:00', NULL, '281|20132|20092|2|1'),
(1262, 'grupos', '1', 'D', '2014-11-03 00:00:00', NULL, '275|20132|20092|2|1'),
(1263, 'grupos', '1', 'D', '2014-11-03 00:00:00', NULL, '272|20132|20092|2|1'),
(1264, 'grupos', '1', 'D', '2014-11-03 00:00:00', NULL, '271|20132|20092|2|1'),
(1265, 'grupos', '1', 'D', '2014-11-03 00:00:00', NULL, '265|20132|20092|2|1'),
(1266, 'grupos', '1', 'D', '2014-11-03 00:00:00', NULL, '262|20132|20092|2|1'),
(1267, 'grupos', '1', 'D', '2014-11-03 00:00:00', NULL, '261|20132|20092|2|1'),
(1268, 'grupos', '1', 'D', '2014-11-03 00:00:00', NULL, '255|20132|20092|2|1'),
(1269, 'grupos', '1', 'D', '2014-11-03 00:00:00', NULL, '252|20132|20092|2|1'),
(1270, 'grupos', '1', 'D', '2014-11-03 00:00:00', NULL, '251|20132|20092|2|1'),
(1271, 'grupos', '1', 'D', '2014-11-03 00:00:00', NULL, '245|20132|20092|2|1'),
(1272, 'grupos', '1', 'D', '2014-11-03 00:00:00', NULL, '242|20132|20092|2|1'),
(1273, 'grupos', '1', 'D', '2014-11-03 00:00:00', NULL, '241|20132|20092|2|1'),
(1274, 'grupos', '1', 'D', '2014-11-03 00:00:00', NULL, '235|20132|20092|2|1'),
(1275, 'grupos', '1', 'D', '2014-11-03 00:00:00', NULL, '232|20132|20092|2|1'),
(1276, 'grupos', '1', 'D', '2014-11-03 00:00:00', NULL, '231|20132|20092|2|1'),
(1277, 'grupos', '1', 'I', '2014-11-04 00:00:00', '231|20132|20092|2|1', NULL),
(1278, 'grupos', '1', 'I', '2014-11-04 00:00:00', '232|20132|20092|2|1', NULL),
(1279, 'grupos', '1', 'I', '2014-11-04 00:00:00', '235|20132|20092|2|1', NULL),
(1308, 'plan_programa', '1', 'I', '2014-11-04 00:00:00', '20092|3', NULL),
(1309, 'plan_programa', '1', 'I', '2014-11-04 00:00:00', '20092|4', NULL),
(1335, 'grupos', '1', 'I', '2014-11-04 00:00:00', '241|20132|20092|2|1', NULL),
(1336, 'grupos', '1', 'I', '2014-11-04 00:00:00', '242|20132|20092|2|1', NULL),
(1337, 'grupos', '1', 'I', '2014-11-04 00:00:00', '245|20132|20092|2|1', NULL),
(1338, 'grupos', '1', 'I', '2014-11-04 00:00:00', '251|20132|20092|2|1', NULL),
(1339, 'grupos', '1', 'I', '2014-11-04 00:00:00', '252|20132|20092|2|1', NULL),
(1340, 'grupos', '1', 'I', '2014-11-04 00:00:00', '255|20132|20092|2|1', NULL),
(1341, 'grupos', '1', 'I', '2014-11-04 00:00:00', '261|20132|20092|2|1', NULL),
(1342, 'grupos', '1', 'I', '2014-11-04 00:00:00', '262|20132|20092|2|1', NULL),
(1343, 'grupos', '1', 'I', '2014-11-04 00:00:00', '265|20132|20092|2|1', NULL),
(1344, 'grupos', '1', 'I', '2014-11-04 00:00:00', '271|20132|20092|2|1', NULL),
(1345, 'grupos', '1', 'I', '2014-11-04 00:00:00', '272|20132|20092|2|1', NULL),
(1346, 'grupos', '1', 'I', '2014-11-04 00:00:00', '275|20132|20092|2|1', NULL),
(1347, 'grupos', '1', 'I', '2014-11-04 00:00:00', '281|20132|20092|2|1', NULL),
(1348, 'grupos', '1', 'I', '2014-11-04 00:00:00', '282|20132|20092|2|1', NULL),
(1349, 'grupos', '1', 'I', '2014-11-04 00:00:00', '331|20132|20092|3|1', NULL),
(1350, 'grupos', '1', 'I', '2014-11-04 00:00:00', '341|20132|20092|3|1', NULL),
(1351, 'grupos', '1', 'I', '2014-11-04 00:00:00', '351|20132|20092|3|1', NULL),
(1352, 'grupos', '1', 'I', '2014-11-04 00:00:00', '361|20132|20092|3|1', NULL),
(1353, 'grupos', '1', 'I', '2014-11-04 00:00:00', '371|20132|20092|3|1', NULL),
(1354, 'grupos', '1', 'I', '2014-11-04 00:00:00', '431|20132|20092|4|1', NULL),
(1355, 'grupos', '1', 'I', '2014-11-04 00:00:00', '441|20132|20092|4|1', NULL),
(1356, 'grupos', '1', 'I', '2014-11-04 00:00:00', '451|20132|20092|4|1', NULL),
(1357, 'grupos', '1', 'I', '2014-11-04 00:00:00', '461|20132|20092|4|1', NULL),
(1358, 'grupos', '1', 'I', '2014-11-04 00:00:00', '471|20132|20092|4|1', NULL),
(1359, 'grupos', '1', 'I', '2014-11-04 00:00:00', '531|20132|20092|5|1', NULL),
(1360, 'grupos', '1', 'I', '2014-11-04 00:00:00', '532|20132|20092|5|1', NULL),
(1361, 'grupos', '1', 'I', '2014-11-04 00:00:00', '541|20132|20092|5|1', NULL),
(1362, 'grupos', '1', 'I', '2014-11-04 00:00:00', '542|20132|20092|5|1', NULL),
(1363, 'grupos', '1', 'I', '2014-11-04 00:00:00', '551|20132|20092|5|1', NULL),
(1364, 'grupos', '1', 'I', '2014-11-04 00:00:00', '552|20132|20092|5|1', NULL),
(1365, 'grupos', '1', 'I', '2014-11-04 00:00:00', '561|20132|20092|5|1', NULL),
(1366, 'grupos', '1', 'I', '2014-11-04 00:00:00', '562|20132|20092|5|1', NULL),
(1367, 'grupos', '1', 'I', '2014-11-04 00:00:00', '571|20132|20092|5|1', NULL),
(1368, 'grupos', '1', 'I', '2014-11-04 00:00:00', '572|20132|20092|5|1', NULL),
(1369, 'grupos', '1', 'I', '2014-11-04 00:00:00', '581|20132|20092|5|1', NULL),
(1370, 'grupos', '1', 'I', '2014-11-04 00:00:00', '582|20132|20092|5|1', NULL),
(1371, 'grupos', '1', 'I', '2014-11-04 00:00:00', '601|20132|20092|6|1', NULL),
(1372, 'grupos', '1', 'I', '2014-11-04 00:00:00', '602|20132|20092|6|1', NULL),
(1373, 'grupos', '1', 'I', '2014-11-04 00:00:00', '603|20132|20092|6|1', NULL),
(1374, 'grupos', '1', 'I', '2014-11-04 00:00:00', '604|20132|20092|6|1', NULL),
(1375, 'grupos', '1', 'I', '2014-11-04 00:00:00', '605|20132|20092|6|1', NULL),
(1376, 'grupos', '1', 'I', '2014-11-04 00:00:00', '606|20132|20092|6|1', NULL),
(1377, 'grupos', '1', 'I', '2014-11-04 00:00:00', '621|20132|20092|6|1', NULL),
(1378, 'grupos', '1', 'I', '2014-11-04 00:00:00', '622|20132|20092|6|1', NULL),
(1379, 'grupos', '1', 'I', '2014-11-04 00:00:00', '623|20132|20092|6|1', NULL),
(1380, 'grupos', '1', 'I', '2014-11-04 00:00:00', '624|20132|20092|6|1', NULL),
(1381, 'grupos', '1', 'I', '2014-11-04 00:00:00', '625|20132|20092|6|1', NULL),
(1382, 'grupos', '1', 'I', '2014-11-04 00:00:00', '626|20132|20092|6|1', NULL),
(1385, 'carga', '1', 'I', '2014-11-05 00:00:00', '601|20132|11238', NULL),
(1386, 'carga', '1', 'I', '2014-11-05 00:00:00', '601|20132|11239', NULL),
(1387, 'carga', '1', 'I', '2014-11-05 00:00:00', '601|20132|11240', NULL),
(1388, 'carga', '1', 'I', '2014-11-05 00:00:00', '601|20132|11236', NULL),
(1389, 'carga', '1', 'I', '2014-11-05 00:00:00', '601|20132|11237', NULL),
(1390, 'carga', '1', 'I', '2014-11-05 00:00:00', '601|20132|11242', NULL),
(1391, 'carga', '1', 'I', '2014-11-05 00:00:00', '601|20132|11241', NULL),
(1392, 'carga', '1', 'I', '2014-11-05 00:00:00', '603|20132|11238', NULL),
(1393, 'carga', '1', 'I', '2014-11-05 00:00:00', '603|20132|11239', NULL),
(1394, 'carga', '1', 'I', '2014-11-05 00:00:00', '603|20132|11240', NULL),
(1395, 'carga', '1', 'I', '2014-11-05 00:00:00', '603|20132|11236', NULL),
(1396, 'carga', '1', 'I', '2014-11-05 00:00:00', '603|20132|11237', NULL),
(1397, 'carga', '1', 'I', '2014-11-05 00:00:00', '603|20132|11242', NULL),
(1398, 'carga', '1', 'I', '2014-11-05 00:00:00', '603|20132|11241', NULL),
(1399, 'carga', '1', 'I', '2014-11-05 00:00:00', '602|20132|11238', NULL),
(1400, 'carga', '1', 'I', '2014-11-05 00:00:00', '602|20132|11239', NULL),
(1401, 'carga', '1', 'I', '2014-11-05 00:00:00', '602|20132|11240', NULL),
(1402, 'carga', '1', 'I', '2014-11-05 00:00:00', '602|20132|11236', NULL),
(1403, 'carga', '1', 'I', '2014-11-05 00:00:00', '602|20132|11237', NULL),
(1404, 'carga', '1', 'I', '2014-11-05 00:00:00', '602|20132|11242', NULL),
(1405, 'carga', '1', 'I', '2014-11-05 00:00:00', '602|20132|11241', NULL),
(1406, 'carga', '1', 'I', '2014-11-05 00:00:00', '604|20132|11238', NULL),
(1407, 'carga', '1', 'I', '2014-11-05 00:00:00', '604|20132|11239', NULL),
(1408, 'carga', '1', 'I', '2014-11-05 00:00:00', '604|20132|11240', NULL),
(1409, 'carga', '1', 'I', '2014-11-05 00:00:00', '604|20132|11236', NULL),
(1410, 'carga', '1', 'I', '2014-11-05 00:00:00', '604|20132|11237', NULL),
(1411, 'carga', '1', 'I', '2014-11-05 00:00:00', '604|20132|11242', NULL),
(1412, 'carga', '1', 'I', '2014-11-05 00:00:00', '604|20132|11241', NULL),
(1413, 'carga', '1', 'I', '2014-11-05 00:00:00', '605|20132|11238', NULL),
(1414, 'carga', '1', 'I', '2014-11-05 00:00:00', '605|20132|11239', NULL),
(1415, 'carga', '1', 'I', '2014-11-05 00:00:00', '605|20132|11240', NULL),
(1416, 'carga', '1', 'I', '2014-11-05 00:00:00', '605|20132|11236', NULL),
(1417, 'carga', '1', 'I', '2014-11-05 00:00:00', '605|20132|11237', NULL),
(1418, 'carga', '1', 'I', '2014-11-05 00:00:00', '605|20132|11242', NULL),
(1419, 'carga', '1', 'I', '2014-11-05 00:00:00', '605|20132|11241', NULL),
(1420, 'carga', '1', 'I', '2014-11-05 00:00:00', '606|20132|11238', NULL),
(1421, 'carga', '1', 'I', '2014-11-05 00:00:00', '606|20132|11239', NULL),
(1422, 'carga', '1', 'I', '2014-11-05 00:00:00', '606|20132|11240', NULL),
(1423, 'carga', '1', 'I', '2014-11-05 00:00:00', '606|20132|11236', NULL),
(1424, 'carga', '1', 'I', '2014-11-05 00:00:00', '606|20132|11237', NULL),
(1425, 'carga', '1', 'I', '2014-11-05 00:00:00', '606|20132|11242', NULL),
(1426, 'carga', '1', 'I', '2014-11-05 00:00:00', '606|20132|11241', NULL),
(1427, 'grupos', '1', 'I', '2014-11-05 00:00:00', '607|20132|20092|2|3', NULL),
(1428, 'grupos', '1', 'I', '2014-11-05 00:00:00', '608|20132|20092|2|3', NULL),
(1429, 'grupos', '1', 'I', '2014-11-05 00:00:00', '611|20132|20092|2|2', NULL),
(1430, 'grupos', '1', 'I', '2014-11-05 00:00:00', '612|20132|20092|2|2', NULL),
(1432, 'carga', '1', 'I', '2014-11-05 00:00:00', '607|20132|11236', NULL),
(1433, 'carga', '1', 'I', '2014-11-05 00:00:00', '607|20132|11237', NULL),
(1434, 'carga', '1', 'I', '2014-11-05 00:00:00', '607|20132|11238', NULL),
(1435, 'carga', '1', 'I', '2014-11-05 00:00:00', '607|20132|11239', NULL),
(1436, 'carga', '1', 'I', '2014-11-05 00:00:00', '607|20132|11240', NULL),
(1437, 'carga', '1', 'I', '2014-11-05 00:00:00', '607|20132|11241', NULL),
(1438, 'carga', '1', 'I', '2014-11-05 00:00:00', '607|20132|11242', NULL),
(1439, 'carga', '1', 'I', '2014-11-05 00:00:00', '608|20132|11236', NULL),
(1440, 'carga', '1', 'I', '2014-11-05 00:00:00', '608|20132|11237', NULL),
(1441, 'carga', '1', 'I', '2014-11-05 00:00:00', '608|20132|11238', NULL),
(1442, 'carga', '1', 'I', '2014-11-05 00:00:00', '608|20132|11239', NULL),
(1443, 'carga', '1', 'I', '2014-11-05 00:00:00', '608|20132|11240', NULL),
(1444, 'carga', '1', 'I', '2014-11-05 00:00:00', '608|20132|11241', NULL),
(1445, 'carga', '1', 'I', '2014-11-05 00:00:00', '608|20132|11242', NULL),
(1446, 'carga', '1', 'I', '2014-11-05 00:00:00', '611|20132|11236', NULL),
(1447, 'carga', '1', 'I', '2014-11-05 00:00:00', '611|20132|11237', NULL),
(1448, 'carga', '1', 'I', '2014-11-05 00:00:00', '611|20132|11238', NULL),
(1449, 'carga', '1', 'I', '2014-11-05 00:00:00', '611|20132|11239', NULL),
(1450, 'carga', '1', 'I', '2014-11-05 00:00:00', '611|20132|11240', NULL),
(1451, 'carga', '1', 'I', '2014-11-05 00:00:00', '611|20132|11241', NULL),
(1452, 'carga', '1', 'I', '2014-11-05 00:00:00', '611|20132|11242', NULL),
(1453, 'carga', '1', 'I', '2014-11-05 00:00:00', '612|20132|11236', NULL),
(1454, 'carga', '1', 'I', '2014-11-05 00:00:00', '612|20132|11237', NULL),
(1455, 'carga', '1', 'I', '2014-11-05 00:00:00', '612|20132|11238', NULL),
(1456, 'carga', '1', 'I', '2014-11-05 00:00:00', '612|20132|11239', NULL),
(1457, 'carga', '1', 'I', '2014-11-05 00:00:00', '612|20132|11240', NULL),
(1458, 'carga', '1', 'I', '2014-11-05 00:00:00', '612|20132|11241', NULL),
(1459, 'carga', '1', 'I', '2014-11-05 00:00:00', '612|20132|11242', NULL),
(1460, 'periodos', '1', 'I', '2014-11-05 00:00:00', '20151|1|2015|1|2015-01-01|2015-07-31|1', NULL),
(1461, 'periodos', '1', 'I', '2014-11-05 00:00:00', '20152|1|2015|7|2015-08-01|2014-12-31|1', NULL),
(1462, 'grupos', '1', 'I', '2014-11-05 00:00:00', '231|20151|20092|2|1', NULL),
(1463, 'grupos', '1', 'I', '2014-11-05 00:00:00', '232|20151|20092|2|1', NULL),
(1464, 'grupos', '1', 'I', '2014-11-05 00:00:00', '235|20151|20092|2|1', NULL),
(1465, 'grupos', '1', 'I', '2014-11-05 00:00:00', '233|20151|20092|2|1', NULL),
(1466, 'grupos', '1', 'I', '2014-11-05 00:00:00', '234|20151|20092|2|1', NULL),
(1467, 'grupos', '1', 'I', '2014-11-05 00:00:00', '236|20151|20092|2|2', NULL),
(1468, 'grupos', '1', 'I', '2014-11-05 00:00:00', '241|20151|20092|2|1', NULL),
(1469, 'grupos', '1', 'I', '2014-11-05 00:00:00', '242|20151|20092|2|1', NULL),
(1470, 'grupos', '1', 'I', '2014-11-05 00:00:00', '245|20151|20092|2|1', NULL),
(1471, 'grupos', '1', 'I', '2014-11-05 00:00:00', '243|20151|20092|2|2', NULL),
(1472, 'grupos', '1', 'I', '2014-11-05 00:00:00', '244|20151|20092|2|2', NULL),
(1473, 'grupos', '1', 'I', '2014-11-05 00:00:00', '246|20151|20092|2|2', NULL),
(1474, 'grupos', '1', 'I', '2014-11-05 00:00:00', '251|20151|20092|2|1', NULL),
(1475, 'grupos', '1', 'I', '2014-11-05 00:00:00', '252|20151|20092|2|1', NULL),
(1476, 'grupos', '1', 'I', '2014-11-05 00:00:00', '255|20151|20092|2|1', NULL),
(1477, 'grupos', '1', 'I', '2014-11-05 00:00:00', '253|20151|20092|2|2', NULL),
(1478, 'grupos', '1', 'I', '2014-11-05 00:00:00', '254|20151|20092|2|2', NULL),
(1479, 'grupos', '1', 'I', '2014-11-05 00:00:00', '256|20151|20092|2|2', NULL),
(1480, 'grupos', '1', 'I', '2014-11-05 00:00:00', '261|20151|20092|2|1', NULL),
(1481, 'grupos', '1', 'I', '2014-11-05 00:00:00', '262|20151|20092|2|1', NULL),
(1482, 'grupos', '1', 'I', '2014-11-05 00:00:00', '265|20151|20092|2|1', NULL),
(1483, 'grupos', '1', 'I', '2014-11-05 00:00:00', '263|20151|20092|2|2', NULL),
(1484, 'grupos', '1', 'I', '2014-11-05 00:00:00', '264|20151|20092|2|2', NULL),
(1485, 'grupos', '1', 'I', '2014-11-05 00:00:00', '266|20151|20092|2|2', NULL),
(1486, 'grupos', '1', 'I', '2014-11-05 00:00:00', '271|20151|20092|2|1', NULL),
(1487, 'grupos', '1', 'I', '2014-11-05 00:00:00', '272|20151|20092|2|1', NULL),
(1488, 'grupos', '1', 'I', '2014-11-05 00:00:00', '275|20151|20092|2|1', NULL),
(1489, 'grupos', '1', 'I', '2014-11-05 00:00:00', '273|20151|20092|2|2', NULL),
(1490, 'grupos', '1', 'I', '2014-11-05 00:00:00', '274|20151|20092|2|2', NULL),
(1491, 'grupos', '1', 'I', '2014-11-05 00:00:00', '276|20151|20092|2|2', NULL),
(1492, 'grupos', '1', 'I', '2014-11-05 00:00:00', '281|20151|20092|2|1', NULL),
(1493, 'grupos', '1', 'I', '2014-11-05 00:00:00', '282|20151|20092|2|1', NULL),
(1494, 'grupos', '1', 'I', '2014-11-05 00:00:00', '285|20151|20092|2|1', NULL),
(1495, 'grupos', '1', 'I', '2014-11-05 00:00:00', '283|20151|20092|2|2', NULL),
(1496, 'grupos', '1', 'I', '2014-11-05 00:00:00', '284|20151|20092|2|2', NULL),
(1497, 'grupos', '1', 'I', '2014-11-05 00:00:00', '286|20151|20092|2|2', NULL),
(1498, 'carga', '1', 'I', '2014-11-05 00:00:00', '231|20151|12456', NULL),
(1499, 'carga', '1', 'I', '2014-11-05 00:00:00', '231|20151|12457', NULL),
(1500, 'carga', '1', 'I', '2014-11-05 00:00:00', '231|20151|11859', NULL),
(1501, 'carga', '1', 'I', '2014-11-05 00:00:00', '231|20151|12458', NULL),
(1502, 'carga', '1', 'I', '2014-11-05 00:00:00', '231|20151|12459', NULL),
(1503, 'carga', '1', 'I', '2014-11-05 00:00:00', '231|20151|11843', NULL),
(1504, 'carga', '1', 'I', '2014-11-05 00:00:00', '231|20151|11734', NULL),
(1505, 'carga', '1', 'I', '2014-11-05 00:00:00', '232|20151|12456', NULL),
(1506, 'carga', '1', 'I', '2014-11-05 00:00:00', '232|20151|12457', NULL),
(1507, 'carga', '1', 'I', '2014-11-05 00:00:00', '232|20151|11859', NULL),
(1508, 'carga', '1', 'I', '2014-11-05 00:00:00', '232|20151|12458', NULL),
(1509, 'carga', '1', 'I', '2014-11-05 00:00:00', '232|20151|12459', NULL),
(1510, 'carga', '1', 'I', '2014-11-05 00:00:00', '232|20151|11843', NULL),
(1511, 'carga', '1', 'I', '2014-11-05 00:00:00', '232|20151|11734', NULL),
(1512, 'carga', '1', 'I', '2014-11-05 00:00:00', '235|20151|12456', NULL),
(1513, 'carga', '1', 'I', '2014-11-05 00:00:00', '235|20151|12457', NULL),
(1514, 'carga', '1', 'I', '2014-11-05 00:00:00', '235|20151|11859', NULL),
(1515, 'carga', '1', 'I', '2014-11-05 00:00:00', '235|20151|12458', NULL),
(1516, 'carga', '1', 'I', '2014-11-05 00:00:00', '235|20151|12459', NULL),
(1517, 'carga', '1', 'I', '2014-11-05 00:00:00', '235|20151|11843', NULL),
(1518, 'carga', '1', 'I', '2014-11-05 00:00:00', '235|20151|11734', NULL),
(1519, 'carga', '1', 'I', '2014-11-05 00:00:00', '233|20151|12456', NULL),
(1520, 'carga', '1', 'I', '2014-11-05 00:00:00', '233|20151|12457', NULL),
(1521, 'carga', '1', 'I', '2014-11-05 00:00:00', '233|20151|11859', NULL),
(1522, 'carga', '1', 'I', '2014-11-05 00:00:00', '233|20151|12458', NULL),
(1523, 'carga', '1', 'I', '2014-11-05 00:00:00', '233|20151|12459', NULL),
(1524, 'carga', '1', 'I', '2014-11-05 00:00:00', '233|20151|11843', NULL),
(1525, 'carga', '1', 'I', '2014-11-05 00:00:00', '233|20151|11734', NULL),
(1526, 'carga', '1', 'I', '2014-11-05 00:00:00', '234|20151|12456', NULL),
(1527, 'carga', '1', 'I', '2014-11-05 00:00:00', '234|20151|12457', NULL),
(1528, 'carga', '1', 'I', '2014-11-05 00:00:00', '234|20151|11859', NULL),
(1529, 'carga', '1', 'I', '2014-11-05 00:00:00', '234|20151|12458', NULL),
(1530, 'carga', '1', 'I', '2014-11-05 00:00:00', '234|20151|12459', NULL),
(1531, 'carga', '1', 'I', '2014-11-05 00:00:00', '234|20151|11843', NULL),
(1532, 'carga', '1', 'I', '2014-11-05 00:00:00', '234|20151|11734', NULL),
(1533, 'carga', '1', 'I', '2014-11-05 00:00:00', '236|20151|12456', NULL),
(1534, 'carga', '1', 'I', '2014-11-05 00:00:00', '236|20151|12457', NULL),
(1535, 'carga', '1', 'I', '2014-11-05 00:00:00', '236|20151|11859', NULL),
(1536, 'carga', '1', 'I', '2014-11-05 00:00:00', '236|20151|12458', NULL),
(1537, 'carga', '1', 'I', '2014-11-05 00:00:00', '236|20151|12459', NULL),
(1538, 'carga', '1', 'I', '2014-11-05 00:00:00', '236|20151|11843', NULL),
(1539, 'carga', '1', 'I', '2014-11-05 00:00:00', '236|20151|11734', NULL),
(1540, 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|11862', NULL),
(1541, 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|12463', NULL),
(1542, 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|12464', NULL),
(1543, 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|12462', NULL),
(1544, 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|12460', NULL),
(1545, 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|11733', NULL),
(1546, 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|12461', NULL),
(1547, 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|12487', NULL),
(1548, 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|11761', NULL),
(1549, 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|12492', NULL),
(1550, 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|11862', NULL),
(1551, 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|12463', NULL),
(1552, 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|12464', NULL),
(1553, 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|12462', NULL),
(1554, 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|12460', NULL),
(1555, 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|11733', NULL),
(1556, 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|12461', NULL),
(1557, 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|12487', NULL),
(1558, 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|11761', NULL),
(1559, 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|12492', NULL),
(1560, 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|11862', NULL),
(1561, 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|12463', NULL),
(1562, 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|12464', NULL),
(1563, 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|12462', NULL),
(1564, 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|12460', NULL),
(1565, 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|11733', NULL),
(1566, 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|12461', NULL),
(1567, 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|12487', NULL),
(1568, 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|11761', NULL),
(1569, 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|12492', NULL),
(1570, 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|11862', NULL),
(1571, 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|12463', NULL),
(1572, 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|12464', NULL),
(1573, 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|12462', NULL),
(1574, 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|12460', NULL),
(1575, 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|11733', NULL),
(1576, 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|12461', NULL),
(1577, 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|12487', NULL),
(1578, 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|11761', NULL),
(1579, 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|12492', NULL),
(1580, 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|11862', NULL),
(1581, 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|12463', NULL),
(1582, 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|12464', NULL),
(1583, 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|12462', NULL),
(1584, 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|12460', NULL),
(1585, 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|11733', NULL),
(1586, 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|12461', NULL),
(1587, 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|12487', NULL),
(1588, 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|11761', NULL),
(1589, 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|12492', NULL),
(1590, 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|11862', NULL),
(1591, 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|12463', NULL),
(1592, 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|12464', NULL),
(1593, 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|12462', NULL),
(1594, 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|12460', NULL),
(1595, 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|11733', NULL),
(1596, 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|12461', NULL),
(1597, 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|12487', NULL),
(1598, 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|11761', NULL),
(1599, 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|12492', NULL),
(1618, 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12468', NULL),
(1619, 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12469', NULL),
(1620, 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12465', NULL),
(1621, 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12466', NULL),
(1622, 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12467', NULL),
(1623, 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|11761', NULL),
(1624, 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12489', NULL),
(1625, 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12487', NULL),
(1626, 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12492', NULL),
(1627, 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12490', NULL),
(1628, 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12468', NULL),
(1629, 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12469', NULL),
(1630, 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12465', NULL),
(1631, 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12466', NULL),
(1632, 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12467', NULL),
(1633, 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|11761', NULL),
(1634, 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12489', NULL),
(1635, 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12487', NULL),
(1636, 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12492', NULL),
(1637, 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12490', NULL),
(1638, 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12468', NULL),
(1639, 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12469', NULL),
(1640, 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12465', NULL),
(1641, 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12466', NULL),
(1642, 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12467', NULL),
(1643, 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|11761', NULL),
(1644, 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12489', NULL),
(1645, 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12487', NULL),
(1646, 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12492', NULL),
(1647, 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12490', NULL),
(1648, 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12468', NULL),
(1649, 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12469', NULL),
(1650, 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12465', NULL),
(1651, 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12466', NULL),
(1652, 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12467', NULL),
(1653, 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|11761', NULL),
(1654, 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12489', NULL),
(1655, 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12487', NULL),
(1656, 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12492', NULL),
(1657, 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12490', NULL),
(1658, 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12468', NULL),
(1659, 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12469', NULL),
(1660, 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12465', NULL),
(1661, 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12466', NULL),
(1662, 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12467', NULL),
(1663, 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|11761', NULL),
(1664, 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12489', NULL),
(1665, 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12487', NULL),
(1666, 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12492', NULL),
(1667, 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12490', NULL),
(1668, 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12468', NULL),
(1669, 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12469', NULL),
(1670, 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12465', NULL),
(1671, 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12466', NULL),
(1672, 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12467', NULL),
(1673, 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|11761', NULL),
(1674, 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12489', NULL),
(1675, 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12487', NULL),
(1676, 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12492', NULL),
(1677, 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12490', NULL),
(1678, 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12473', NULL),
(1679, 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12475', NULL),
(1680, 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12474', NULL),
(1681, 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12472', NULL),
(1682, 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12470', NULL),
(1683, 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12471', NULL),
(1684, 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12487', NULL),
(1685, 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12491', NULL),
(1686, 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12490', NULL),
(1687, 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12489', NULL),
(1688, 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12473', NULL),
(1689, 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12475', NULL),
(1690, 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12474', NULL),
(1691, 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12472', NULL),
(1692, 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12470', NULL),
(1693, 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12471', NULL);
INSERT INTO `bitacora` (`id`, `tabla`, `usuario`, `operacion`, `fecha`, `registro`, `registro_old`) VALUES
(1694, 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12487', NULL),
(1695, 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12491', NULL),
(1696, 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12490', NULL),
(1697, 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12489', NULL),
(1698, 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12473', NULL),
(1699, 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12475', NULL),
(1700, 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12474', NULL),
(1701, 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12472', NULL),
(1702, 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12470', NULL),
(1703, 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12471', NULL),
(1704, 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12487', NULL),
(1705, 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12491', NULL),
(1706, 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12490', NULL),
(1707, 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12489', NULL),
(1708, 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12473', NULL),
(1709, 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12475', NULL),
(1710, 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12474', NULL),
(1711, 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12472', NULL),
(1712, 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12470', NULL),
(1713, 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12471', NULL),
(1714, 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12487', NULL),
(1715, 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12491', NULL),
(1716, 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12490', NULL),
(1717, 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12489', NULL),
(1718, 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12473', NULL),
(1719, 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12475', NULL),
(1720, 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12474', NULL),
(1721, 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12472', NULL),
(1722, 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12470', NULL),
(1723, 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12471', NULL),
(1724, 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12487', NULL),
(1725, 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12491', NULL),
(1726, 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12490', NULL),
(1727, 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12489', NULL),
(1728, 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12473', NULL),
(1729, 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12475', NULL),
(1730, 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12474', NULL),
(1731, 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12472', NULL),
(1732, 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12470', NULL),
(1733, 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12471', NULL),
(1734, 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12487', NULL),
(1735, 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12491', NULL),
(1736, 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12490', NULL),
(1737, 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12489', NULL),
(1738, 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12292', NULL),
(1739, 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12477', NULL),
(1740, 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12479', NULL),
(1741, 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12478', NULL),
(1742, 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12476', NULL),
(1743, 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|11755', NULL),
(1744, 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12495', NULL),
(1745, 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12496', NULL),
(1746, 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12497', NULL),
(1747, 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12501', NULL),
(1748, 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12292', NULL),
(1749, 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12477', NULL),
(1750, 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12479', NULL),
(1751, 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12478', NULL),
(1752, 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12476', NULL),
(1753, 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|11755', NULL),
(1754, 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12495', NULL),
(1755, 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12496', NULL),
(1756, 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12497', NULL),
(1757, 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12501', NULL),
(1758, 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12292', NULL),
(1759, 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12477', NULL),
(1760, 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12479', NULL),
(1761, 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12478', NULL),
(1762, 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12476', NULL),
(1763, 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|11755', NULL),
(1764, 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12495', NULL),
(1765, 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12496', NULL),
(1766, 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12497', NULL),
(1767, 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12501', NULL),
(1768, 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12292', NULL),
(1769, 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12477', NULL),
(1770, 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12479', NULL),
(1771, 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12478', NULL),
(1772, 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12476', NULL),
(1773, 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|11755', NULL),
(1774, 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12495', NULL),
(1775, 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12496', NULL),
(1776, 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12497', NULL),
(1777, 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12501', NULL),
(1778, 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12292', NULL),
(1779, 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12477', NULL),
(1780, 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12479', NULL),
(1781, 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12478', NULL),
(1782, 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12476', NULL),
(1783, 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|11755', NULL),
(1784, 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12495', NULL),
(1785, 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12496', NULL),
(1786, 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12497', NULL),
(1787, 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12501', NULL),
(1788, 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12292', NULL),
(1789, 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12477', NULL),
(1790, 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12479', NULL),
(1791, 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12478', NULL),
(1792, 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12476', NULL),
(1793, 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|11755', NULL),
(1794, 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12495', NULL),
(1795, 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12496', NULL),
(1796, 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12497', NULL),
(1797, 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12501', NULL),
(1798, 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12481', NULL),
(1799, 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12480', NULL),
(1800, 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12494', NULL),
(1801, 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12495', NULL),
(1802, 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12497', NULL),
(1803, 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12498', NULL),
(1804, 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12501', NULL),
(1805, 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12496', NULL),
(1806, 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12493', NULL),
(1807, 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12500', NULL),
(1808, 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12481', NULL),
(1809, 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12480', NULL),
(1810, 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12494', NULL),
(1811, 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12495', NULL),
(1812, 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12497', NULL),
(1813, 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12498', NULL),
(1814, 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12501', NULL),
(1815, 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12496', NULL),
(1816, 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12493', NULL),
(1817, 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12500', NULL),
(1818, 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12481', NULL),
(1819, 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12480', NULL),
(1820, 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12494', NULL),
(1821, 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12495', NULL),
(1822, 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12497', NULL),
(1823, 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12498', NULL),
(1824, 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12501', NULL),
(1825, 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12496', NULL),
(1826, 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12493', NULL),
(1827, 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12500', NULL),
(1828, 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12481', NULL),
(1829, 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12480', NULL),
(1830, 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12494', NULL),
(1831, 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12495', NULL),
(1832, 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12497', NULL),
(1833, 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12498', NULL),
(1834, 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12501', NULL),
(1835, 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12496', NULL),
(1836, 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12493', NULL),
(1837, 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12500', NULL),
(1838, 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12481', NULL),
(1839, 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12480', NULL),
(1840, 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12494', NULL),
(1841, 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12495', NULL),
(1842, 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12497', NULL),
(1843, 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12498', NULL),
(1844, 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12501', NULL),
(1845, 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12496', NULL),
(1846, 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12493', NULL),
(1847, 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12500', NULL),
(1848, 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12481', NULL),
(1849, 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12480', NULL),
(1850, 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12494', NULL),
(1851, 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12495', NULL),
(1852, 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12497', NULL),
(1853, 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12498', NULL),
(1854, 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12501', NULL),
(1855, 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12496', NULL),
(1856, 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12493', NULL),
(1857, 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12500', NULL),
(1858, 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12457|2|11248|2', NULL),
(1859, 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12468|2|11862|2', NULL),
(1860, 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12481|2|12479|2', NULL),
(1861, 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12463|2|12457|2', NULL),
(1862, 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12464|2|11859|2', NULL),
(1863, 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12479|2|12470|2', NULL),
(1864, 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12470|2|12467|2', NULL),
(1865, 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12467|2|11733|2', NULL),
(1866, 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12460|2|12458|2', NULL),
(1867, 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12458|2|11243|2', NULL),
(1868, 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '11243|2|11237|2', NULL),
(1869, 'grupos', '1', 'I', '2014-11-17 00:00:00', '601|20151|20092|2|1', NULL),
(1870, 'grupos', '1', 'I', '2014-11-17 00:00:00', '602|20151|20092|2|1', NULL),
(1871, 'grupos', '1', 'I', '2014-11-17 00:00:00', '603|20151|20092|2|1', NULL),
(1872, 'grupos', '1', 'I', '2014-11-17 00:00:00', '604|20151|20092|2|1', NULL),
(1873, 'grupos', '1', 'I', '2014-11-17 00:00:00', '605|20151|20092|2|1', NULL),
(1874, 'grupos', '1', 'I', '2014-11-17 00:00:00', '606|20151|20092|2|1', NULL),
(1875, 'grupos', '1', 'I', '2014-11-17 00:00:00', '607|20151|20092|2|3', NULL),
(1876, 'grupos', '1', 'I', '2014-11-17 00:00:00', '608|20151|20092|2|3', NULL),
(1877, 'grupos', '1', 'I', '2014-11-17 00:00:00', '611|20151|20092|2|2', NULL),
(1878, 'grupos', '1', 'I', '2014-11-17 00:00:00', '612|20151|20092|2|2', NULL),
(1879, 'grupos', '1', 'I', '2014-11-17 00:00:00', '613|20151|20092|2|2', NULL),
(1880, 'grupos', '1', 'I', '2014-11-17 00:00:00', '614|20151|20092|2|2', NULL),
(1881, 'grupos', '1', 'I', '2014-11-17 00:00:00', '615|20151|20092|2|2', NULL),
(1882, 'grupos', '1', 'I', '2014-11-17 00:00:00', '616|20151|20092|2|2', NULL),
(1883, 'grupos', '1', 'I', '2014-11-17 00:00:00', '621|20151|20092|2|1', NULL),
(1884, 'grupos', '1', 'I', '2014-11-17 00:00:00', '622|20151|20092|2|1', NULL),
(1885, 'grupos', '1', 'I', '2014-11-17 00:00:00', '623|20151|20092|2|1', NULL),
(1886, 'grupos', '1', 'I', '2014-11-17 00:00:00', '624|20151|20092|2|1', NULL),
(1887, 'grupos', '1', 'I', '2014-11-17 00:00:00', '625|20151|20092|2|1', NULL),
(1888, 'grupos', '1', 'I', '2014-11-17 00:00:00', '626|20151|20092|2|1', NULL),
(1889, 'grupos', '1', 'I', '2014-11-17 00:00:00', '627|20151|20092|2|3', NULL),
(1890, 'grupos', '1', 'I', '2014-11-17 00:00:00', '628|20151|20092|2|3', NULL),
(1891, 'grupos', '1', 'I', '2014-11-17 00:00:00', '629|20151|20092|2|3', NULL),
(1892, 'grupos', '1', 'I', '2014-11-17 00:00:00', '630|20151|20092|2|3', NULL),
(1893, 'grupos', '1', 'I', '2014-11-17 00:00:00', '631|20151|20092|2|2', NULL),
(1894, 'grupos', '1', 'I', '2014-11-17 00:00:00', '632|20151|20092|2|2', NULL),
(1895, 'grupos', '1', 'I', '2014-11-17 00:00:00', '633|20151|20092|2|2', NULL),
(1896, 'grupos', '1', 'I', '2014-11-17 00:00:00', '634|20151|20092|2|2', NULL),
(1897, 'grupos', '1', 'I', '2014-11-17 00:00:00', '635|20151|20092|2|2', NULL),
(1898, 'grupos', '1', 'I', '2014-11-17 00:00:00', '636|20151|20092|2|2', NULL),
(1899, 'grupos', '1', 'U', '2014-11-17 00:00:00', '601|20151|20092|6|1', '601|20151|20092|2|1'),
(1900, 'grupos', '1', 'U', '2014-11-17 00:00:00', '602|20151|20092|6|1', '602|20151|20092|2|1'),
(1901, 'grupos', '1', 'U', '2014-11-17 00:00:00', '603|20151|20092|6|1', '603|20151|20092|2|1'),
(1902, 'grupos', '1', 'U', '2014-11-17 00:00:00', '604|20151|20092|6|1', '604|20151|20092|2|1'),
(1903, 'grupos', '1', 'U', '2014-11-17 00:00:00', '605|20151|20092|6|1', '605|20151|20092|2|1'),
(1904, 'grupos', '1', 'U', '2014-11-17 00:00:00', '606|20151|20092|6|1', '606|20151|20092|2|1'),
(1905, 'grupos', '1', 'U', '2014-11-17 00:00:00', '607|20151|20092|6|3', '607|20151|20092|2|3'),
(1906, 'grupos', '1', 'U', '2014-11-17 00:00:00', '608|20151|20092|6|3', '608|20151|20092|2|3'),
(1907, 'grupos', '1', 'U', '2014-11-17 00:00:00', '611|20151|20092|6|2', '611|20151|20092|2|2'),
(1908, 'grupos', '1', 'U', '2014-11-17 00:00:00', '612|20151|20092|6|2', '612|20151|20092|2|2'),
(1909, 'grupos', '1', 'U', '2014-11-17 00:00:00', '613|20151|20092|6|2', '613|20151|20092|2|2'),
(1910, 'grupos', '1', 'U', '2014-11-17 00:00:00', '614|20151|20092|6|2', '614|20151|20092|2|2'),
(1911, 'grupos', '1', 'U', '2014-11-17 00:00:00', '615|20151|20092|6|2', '615|20151|20092|2|2'),
(1912, 'grupos', '1', 'U', '2014-11-17 00:00:00', '616|20151|20092|6|2', '616|20151|20092|2|2'),
(1913, 'grupos', '1', 'U', '2014-11-17 00:00:00', '621|20151|20092|6|1', '621|20151|20092|2|1'),
(1914, 'grupos', '1', 'U', '2014-11-17 00:00:00', '622|20151|20092|6|1', '622|20151|20092|2|1'),
(1915, 'grupos', '1', 'U', '2014-11-17 00:00:00', '623|20151|20092|6|1', '623|20151|20092|2|1'),
(1916, 'grupos', '1', 'U', '2014-11-17 00:00:00', '624|20151|20092|6|1', '624|20151|20092|2|1'),
(1917, 'grupos', '1', 'U', '2014-11-17 00:00:00', '625|20151|20092|6|1', '625|20151|20092|2|1'),
(1918, 'grupos', '1', 'U', '2014-11-17 00:00:00', '626|20151|20092|6|1', '626|20151|20092|2|1'),
(1919, 'grupos', '1', 'U', '2014-11-17 00:00:00', '627|20151|20092|6|3', '627|20151|20092|2|3'),
(1920, 'grupos', '1', 'U', '2014-11-17 00:00:00', '628|20151|20092|6|3', '628|20151|20092|2|3'),
(1921, 'grupos', '1', 'U', '2014-11-17 00:00:00', '629|20151|20092|6|3', '629|20151|20092|2|3'),
(1922, 'grupos', '1', 'U', '2014-11-17 00:00:00', '630|20151|20092|6|3', '630|20151|20092|2|3'),
(1923, 'grupos', '1', 'U', '2014-11-17 00:00:00', '631|20151|20092|6|2', '631|20151|20092|2|2'),
(1924, 'grupos', '1', 'U', '2014-11-17 00:00:00', '632|20151|20092|6|2', '632|20151|20092|2|2'),
(1925, 'grupos', '1', 'U', '2014-11-17 00:00:00', '633|20151|20092|6|2', '633|20151|20092|2|2'),
(1926, 'grupos', '1', 'U', '2014-11-17 00:00:00', '634|20151|20092|6|2', '634|20151|20092|2|2'),
(1927, 'grupos', '1', 'U', '2014-11-17 00:00:00', '635|20151|20092|6|2', '635|20151|20092|2|2'),
(1928, 'grupos', '1', 'U', '2014-11-17 00:00:00', '636|20151|20092|6|2', '636|20151|20092|2|2'),
(1929, 'carga', '1', 'I', '2014-11-17 00:00:00', '601|20151|11238|6|11238|1', NULL),
(1930, 'carga', '1', 'I', '2014-11-17 00:00:00', '601|20151|11239|6|11239|1', NULL),
(1931, 'carga', '1', 'I', '2014-11-17 00:00:00', '601|20151|11240|6|11240|1', NULL),
(1932, 'carga', '1', 'I', '2014-11-17 00:00:00', '601|20151|11236|6|11236|1', NULL),
(1933, 'carga', '1', 'I', '2014-11-17 00:00:00', '601|20151|11237|6|11237|1', NULL),
(1934, 'carga', '1', 'I', '2014-11-17 00:00:00', '601|20151|11241|6|11241|1', NULL),
(1935, 'carga', '1', 'I', '2014-11-17 00:00:00', '602|20151|11238|6|11238|1', NULL),
(1936, 'carga', '1', 'I', '2014-11-17 00:00:00', '602|20151|11239|6|11239|1', NULL),
(1937, 'carga', '1', 'I', '2014-11-17 00:00:00', '602|20151|11240|6|11240|1', NULL),
(1938, 'carga', '1', 'I', '2014-11-17 00:00:00', '602|20151|11236|6|11236|1', NULL),
(1939, 'carga', '1', 'I', '2014-11-17 00:00:00', '602|20151|11237|6|11237|1', NULL),
(1940, 'carga', '1', 'I', '2014-11-17 00:00:00', '602|20151|11241|6|11241|1', NULL),
(1941, 'carga', '1', 'I', '2014-11-17 00:00:00', '603|20151|11238|6|11238|1', NULL),
(1942, 'carga', '1', 'I', '2014-11-17 00:00:00', '603|20151|11239|6|11239|1', NULL),
(1943, 'carga', '1', 'I', '2014-11-17 00:00:00', '603|20151|11240|6|11240|1', NULL),
(1944, 'carga', '1', 'I', '2014-11-17 00:00:00', '603|20151|11236|6|11236|1', NULL),
(1945, 'carga', '1', 'I', '2014-11-17 00:00:00', '603|20151|11237|6|11237|1', NULL),
(1946, 'carga', '1', 'I', '2014-11-17 00:00:00', '603|20151|11241|6|11241|1', NULL),
(1947, 'carga', '1', 'I', '2014-11-17 00:00:00', '604|20151|11238|6|11238|1', NULL),
(1948, 'carga', '1', 'I', '2014-11-17 00:00:00', '604|20151|11239|6|11239|1', NULL),
(1949, 'carga', '1', 'I', '2014-11-17 00:00:00', '604|20151|11240|6|11240|1', NULL),
(1950, 'carga', '1', 'I', '2014-11-17 00:00:00', '604|20151|11236|6|11236|1', NULL),
(1951, 'carga', '1', 'I', '2014-11-17 00:00:00', '604|20151|11237|6|11237|1', NULL),
(1952, 'carga', '1', 'I', '2014-11-17 00:00:00', '604|20151|11241|6|11241|1', NULL),
(1953, 'carga', '1', 'I', '2014-11-17 00:00:00', '605|20151|11238|6|11238|1', NULL),
(1954, 'carga', '1', 'I', '2014-11-17 00:00:00', '605|20151|11239|6|11239|1', NULL),
(1955, 'carga', '1', 'I', '2014-11-17 00:00:00', '605|20151|11240|6|11240|1', NULL),
(1956, 'carga', '1', 'I', '2014-11-17 00:00:00', '605|20151|11236|6|11236|1', NULL),
(1957, 'carga', '1', 'I', '2014-11-17 00:00:00', '605|20151|11237|6|11237|1', NULL),
(1958, 'carga', '1', 'I', '2014-11-17 00:00:00', '605|20151|11241|6|11241|1', NULL),
(1959, 'carga', '1', 'I', '2014-11-17 00:00:00', '606|20151|11238|6|11238|1', NULL),
(1960, 'carga', '1', 'I', '2014-11-17 00:00:00', '606|20151|11239|6|11239|1', NULL),
(1961, 'carga', '1', 'I', '2014-11-17 00:00:00', '606|20151|11240|6|11240|1', NULL),
(1962, 'carga', '1', 'I', '2014-11-17 00:00:00', '606|20151|11236|6|11236|1', NULL),
(1963, 'carga', '1', 'I', '2014-11-17 00:00:00', '606|20151|11237|6|11237|1', NULL),
(1964, 'carga', '1', 'I', '2014-11-17 00:00:00', '606|20151|11241|6|11241|1', NULL),
(1965, 'carga', '1', 'I', '2014-11-17 00:00:00', '607|20151|11238|6|11238|1', NULL),
(1966, 'carga', '1', 'I', '2014-11-17 00:00:00', '607|20151|11239|6|11239|1', NULL),
(1967, 'carga', '1', 'I', '2014-11-17 00:00:00', '607|20151|11240|6|11240|1', NULL),
(1968, 'carga', '1', 'I', '2014-11-17 00:00:00', '607|20151|11236|6|11236|1', NULL),
(1969, 'carga', '1', 'I', '2014-11-17 00:00:00', '607|20151|11237|6|11237|1', NULL),
(1970, 'carga', '1', 'I', '2014-11-17 00:00:00', '607|20151|11241|6|11241|1', NULL),
(1971, 'carga', '1', 'I', '2014-11-17 00:00:00', '608|20151|11238|6|11238|1', NULL),
(1972, 'carga', '1', 'I', '2014-11-17 00:00:00', '608|20151|11239|6|11239|1', NULL),
(1973, 'carga', '1', 'I', '2014-11-17 00:00:00', '608|20151|11240|6|11240|1', NULL),
(1974, 'carga', '1', 'I', '2014-11-17 00:00:00', '608|20151|11236|6|11236|1', NULL),
(1975, 'carga', '1', 'I', '2014-11-17 00:00:00', '608|20151|11237|6|11237|1', NULL),
(1976, 'carga', '1', 'I', '2014-11-17 00:00:00', '608|20151|11241|6|11241|1', NULL),
(1977, 'carga', '1', 'I', '2014-11-17 00:00:00', '611|20151|11238|6|11238|1', NULL),
(1978, 'carga', '1', 'I', '2014-11-17 00:00:00', '611|20151|11239|6|11239|1', NULL),
(1979, 'carga', '1', 'I', '2014-11-17 00:00:00', '611|20151|11240|6|11240|1', NULL),
(1980, 'carga', '1', 'I', '2014-11-17 00:00:00', '611|20151|11236|6|11236|1', NULL),
(1981, 'carga', '1', 'I', '2014-11-17 00:00:00', '611|20151|11237|6|11237|1', NULL),
(1982, 'carga', '1', 'I', '2014-11-17 00:00:00', '611|20151|11241|6|11241|1', NULL),
(1983, 'carga', '1', 'I', '2014-11-17 00:00:00', '612|20151|11238|6|11238|1', NULL),
(1984, 'carga', '1', 'I', '2014-11-17 00:00:00', '612|20151|11239|6|11239|1', NULL),
(1985, 'carga', '1', 'I', '2014-11-17 00:00:00', '612|20151|11240|6|11240|1', NULL),
(1986, 'carga', '1', 'I', '2014-11-17 00:00:00', '612|20151|11236|6|11236|1', NULL),
(1987, 'carga', '1', 'I', '2014-11-17 00:00:00', '612|20151|11237|6|11237|1', NULL),
(1988, 'carga', '1', 'I', '2014-11-17 00:00:00', '612|20151|11241|6|11241|1', NULL),
(1989, 'carga', '1', 'I', '2014-11-17 00:00:00', '613|20151|11238|6|11238|1', NULL),
(1990, 'carga', '1', 'I', '2014-11-17 00:00:00', '613|20151|11239|6|11239|1', NULL),
(1991, 'carga', '1', 'I', '2014-11-17 00:00:00', '613|20151|11240|6|11240|1', NULL),
(1992, 'carga', '1', 'I', '2014-11-17 00:00:00', '613|20151|11236|6|11236|1', NULL),
(1993, 'carga', '1', 'I', '2014-11-17 00:00:00', '613|20151|11237|6|11237|1', NULL),
(1994, 'carga', '1', 'I', '2014-11-17 00:00:00', '613|20151|11241|6|11241|1', NULL),
(1995, 'carga', '1', 'I', '2014-11-17 00:00:00', '614|20151|11238|6|11238|1', NULL),
(1996, 'carga', '1', 'I', '2014-11-17 00:00:00', '614|20151|11239|6|11239|1', NULL),
(1997, 'carga', '1', 'I', '2014-11-17 00:00:00', '614|20151|11240|6|11240|1', NULL),
(1998, 'carga', '1', 'I', '2014-11-17 00:00:00', '614|20151|11236|6|11236|1', NULL),
(1999, 'carga', '1', 'I', '2014-11-17 00:00:00', '614|20151|11237|6|11237|1', NULL),
(2000, 'carga', '1', 'I', '2014-11-17 00:00:00', '614|20151|11241|6|11241|1', NULL),
(2001, 'carga', '1', 'I', '2014-11-17 00:00:00', '615|20151|11238|6|11238|1', NULL),
(2002, 'carga', '1', 'I', '2014-11-17 00:00:00', '615|20151|11239|6|11239|1', NULL),
(2003, 'carga', '1', 'I', '2014-11-17 00:00:00', '615|20151|11240|6|11240|1', NULL),
(2004, 'carga', '1', 'I', '2014-11-17 00:00:00', '615|20151|11236|6|11236|1', NULL),
(2005, 'carga', '1', 'I', '2014-11-17 00:00:00', '615|20151|11237|6|11237|1', NULL),
(2006, 'carga', '1', 'I', '2014-11-17 00:00:00', '615|20151|11241|6|11241|1', NULL),
(2007, 'carga', '1', 'I', '2014-11-17 00:00:00', '616|20151|11238|6|11238|1', NULL),
(2008, 'carga', '1', 'I', '2014-11-17 00:00:00', '616|20151|11239|6|11239|1', NULL),
(2009, 'carga', '1', 'I', '2014-11-17 00:00:00', '616|20151|11240|6|11240|1', NULL),
(2010, 'carga', '1', 'I', '2014-11-17 00:00:00', '616|20151|11236|6|11236|1', NULL),
(2011, 'carga', '1', 'I', '2014-11-17 00:00:00', '616|20151|11237|6|11237|1', NULL),
(2012, 'carga', '1', 'I', '2014-11-17 00:00:00', '616|20151|11241|6|11241|1', NULL),
(2013, 'carga', '1', 'I', '2014-11-17 00:00:00', '621|20151|11245|6|11245|2', NULL),
(2014, 'carga', '1', 'I', '2014-11-17 00:00:00', '621|20151|11248|6|11248|2', NULL),
(2015, 'carga', '1', 'I', '2014-11-17 00:00:00', '621|20151|11247|6|11247|2', NULL),
(2016, 'carga', '1', 'I', '2014-11-17 00:00:00', '621|20151|11246|6|11246|2', NULL),
(2017, 'carga', '1', 'I', '2014-11-17 00:00:00', '621|20151|11243|6|11243|2', NULL),
(2018, 'carga', '1', 'I', '2014-11-17 00:00:00', '621|20151|11249|6|11249|2', NULL),
(2019, 'carga', '1', 'I', '2014-11-17 00:00:00', '621|20151|11244|6|11244|2', NULL),
(2020, 'carga', '1', 'I', '2014-11-17 00:00:00', '622|20151|11245|6|11245|2', NULL),
(2021, 'carga', '1', 'I', '2014-11-17 00:00:00', '622|20151|11248|6|11248|2', NULL),
(2022, 'carga', '1', 'I', '2014-11-17 00:00:00', '622|20151|11247|6|11247|2', NULL),
(2023, 'carga', '1', 'I', '2014-11-17 00:00:00', '622|20151|11246|6|11246|2', NULL),
(2024, 'carga', '1', 'I', '2014-11-17 00:00:00', '622|20151|11243|6|11243|2', NULL),
(2025, 'carga', '1', 'I', '2014-11-17 00:00:00', '622|20151|11249|6|11249|2', NULL),
(2026, 'carga', '1', 'I', '2014-11-17 00:00:00', '622|20151|11244|6|11244|2', NULL),
(2027, 'carga', '1', 'I', '2014-11-17 00:00:00', '623|20151|11245|6|11245|2', NULL),
(2028, 'carga', '1', 'I', '2014-11-17 00:00:00', '623|20151|11248|6|11248|2', NULL),
(2029, 'carga', '1', 'I', '2014-11-17 00:00:00', '623|20151|11247|6|11247|2', NULL),
(2030, 'carga', '1', 'I', '2014-11-17 00:00:00', '623|20151|11246|6|11246|2', NULL),
(2031, 'carga', '1', 'I', '2014-11-17 00:00:00', '623|20151|11243|6|11243|2', NULL),
(2032, 'carga', '1', 'I', '2014-11-17 00:00:00', '623|20151|11249|6|11249|2', NULL),
(2033, 'carga', '1', 'I', '2014-11-17 00:00:00', '623|20151|11244|6|11244|2', NULL),
(2034, 'carga', '1', 'I', '2014-11-17 00:00:00', '624|20151|11245|6|11245|2', NULL),
(2035, 'carga', '1', 'I', '2014-11-17 00:00:00', '624|20151|11248|6|11248|2', NULL),
(2036, 'carga', '1', 'I', '2014-11-17 00:00:00', '624|20151|11247|6|11247|2', NULL),
(2037, 'carga', '1', 'I', '2014-11-17 00:00:00', '624|20151|11246|6|11246|2', NULL),
(2038, 'carga', '1', 'I', '2014-11-17 00:00:00', '624|20151|11243|6|11243|2', NULL),
(2039, 'carga', '1', 'I', '2014-11-17 00:00:00', '624|20151|11249|6|11249|2', NULL),
(2040, 'carga', '1', 'I', '2014-11-17 00:00:00', '624|20151|11244|6|11244|2', NULL),
(2041, 'carga', '1', 'I', '2014-11-17 00:00:00', '625|20151|11245|6|11245|2', NULL),
(2042, 'carga', '1', 'I', '2014-11-17 00:00:00', '625|20151|11248|6|11248|2', NULL),
(2043, 'carga', '1', 'I', '2014-11-17 00:00:00', '625|20151|11247|6|11247|2', NULL),
(2044, 'carga', '1', 'I', '2014-11-17 00:00:00', '625|20151|11246|6|11246|2', NULL),
(2045, 'carga', '1', 'I', '2014-11-17 00:00:00', '625|20151|11243|6|11243|2', NULL),
(2046, 'carga', '1', 'I', '2014-11-17 00:00:00', '625|20151|11249|6|11249|2', NULL),
(2047, 'carga', '1', 'I', '2014-11-17 00:00:00', '625|20151|11244|6|11244|2', NULL),
(2048, 'carga', '1', 'I', '2014-11-17 00:00:00', '626|20151|11245|6|11245|2', NULL),
(2049, 'carga', '1', 'I', '2014-11-17 00:00:00', '626|20151|11248|6|11248|2', NULL),
(2050, 'carga', '1', 'I', '2014-11-17 00:00:00', '626|20151|11247|6|11247|2', NULL),
(2051, 'carga', '1', 'I', '2014-11-17 00:00:00', '626|20151|11246|6|11246|2', NULL),
(2052, 'carga', '1', 'I', '2014-11-17 00:00:00', '626|20151|11243|6|11243|2', NULL),
(2053, 'carga', '1', 'I', '2014-11-17 00:00:00', '626|20151|11249|6|11249|2', NULL),
(2054, 'carga', '1', 'I', '2014-11-17 00:00:00', '626|20151|11244|6|11244|2', NULL),
(2055, 'carga', '1', 'I', '2014-11-17 00:00:00', '627|20151|11245|6|11245|2', NULL),
(2056, 'carga', '1', 'I', '2014-11-17 00:00:00', '627|20151|11248|6|11248|2', NULL),
(2057, 'carga', '1', 'I', '2014-11-17 00:00:00', '627|20151|11247|6|11247|2', NULL),
(2058, 'carga', '1', 'I', '2014-11-17 00:00:00', '627|20151|11246|6|11246|2', NULL),
(2059, 'carga', '1', 'I', '2014-11-17 00:00:00', '627|20151|11243|6|11243|2', NULL),
(2060, 'carga', '1', 'I', '2014-11-17 00:00:00', '627|20151|11249|6|11249|2', NULL),
(2061, 'carga', '1', 'I', '2014-11-17 00:00:00', '627|20151|11244|6|11244|2', NULL),
(2062, 'carga', '1', 'I', '2014-11-17 00:00:00', '628|20151|11245|6|11245|2', NULL),
(2063, 'carga', '1', 'I', '2014-11-17 00:00:00', '628|20151|11248|6|11248|2', NULL),
(2064, 'carga', '1', 'I', '2014-11-17 00:00:00', '628|20151|11247|6|11247|2', NULL),
(2065, 'carga', '1', 'I', '2014-11-17 00:00:00', '628|20151|11246|6|11246|2', NULL),
(2066, 'carga', '1', 'I', '2014-11-17 00:00:00', '628|20151|11243|6|11243|2', NULL),
(2067, 'carga', '1', 'I', '2014-11-17 00:00:00', '628|20151|11249|6|11249|2', NULL),
(2068, 'carga', '1', 'I', '2014-11-17 00:00:00', '628|20151|11244|6|11244|2', NULL),
(2069, 'carga', '1', 'I', '2014-11-17 00:00:00', '629|20151|11245|6|11245|2', NULL),
(2070, 'carga', '1', 'I', '2014-11-17 00:00:00', '629|20151|11248|6|11248|2', NULL),
(2071, 'carga', '1', 'I', '2014-11-17 00:00:00', '629|20151|11247|6|11247|2', NULL),
(2072, 'carga', '1', 'I', '2014-11-17 00:00:00', '629|20151|11246|6|11246|2', NULL),
(2073, 'carga', '1', 'I', '2014-11-17 00:00:00', '629|20151|11243|6|11243|2', NULL),
(2074, 'carga', '1', 'I', '2014-11-17 00:00:00', '629|20151|11249|6|11249|2', NULL),
(2075, 'carga', '1', 'I', '2014-11-17 00:00:00', '629|20151|11244|6|11244|2', NULL),
(2076, 'carga', '1', 'I', '2014-11-17 00:00:00', '630|20151|11245|6|11245|2', NULL),
(2077, 'carga', '1', 'I', '2014-11-17 00:00:00', '630|20151|11248|6|11248|2', NULL),
(2078, 'carga', '1', 'I', '2014-11-17 00:00:00', '630|20151|11247|6|11247|2', NULL),
(2079, 'carga', '1', 'I', '2014-11-17 00:00:00', '630|20151|11246|6|11246|2', NULL),
(2080, 'carga', '1', 'I', '2014-11-17 00:00:00', '630|20151|11243|6|11243|2', NULL),
(2081, 'carga', '1', 'I', '2014-11-17 00:00:00', '630|20151|11249|6|11249|2', NULL),
(2082, 'carga', '1', 'I', '2014-11-17 00:00:00', '630|20151|11244|6|11244|2', NULL),
(2083, 'carga', '1', 'I', '2014-11-17 00:00:00', '631|20151|11245|6|11245|2', NULL),
(2084, 'carga', '1', 'I', '2014-11-17 00:00:00', '631|20151|11248|6|11248|2', NULL),
(2085, 'carga', '1', 'I', '2014-11-17 00:00:00', '631|20151|11247|6|11247|2', NULL),
(2086, 'carga', '1', 'I', '2014-11-17 00:00:00', '631|20151|11246|6|11246|2', NULL),
(2087, 'carga', '1', 'I', '2014-11-17 00:00:00', '631|20151|11243|6|11243|2', NULL),
(2088, 'carga', '1', 'I', '2014-11-17 00:00:00', '631|20151|11249|6|11249|2', NULL),
(2089, 'carga', '1', 'I', '2014-11-17 00:00:00', '631|20151|11244|6|11244|2', NULL),
(2090, 'carga', '1', 'I', '2014-11-17 00:00:00', '632|20151|11245|6|11245|2', NULL),
(2091, 'carga', '1', 'I', '2014-11-17 00:00:00', '632|20151|11248|6|11248|2', NULL),
(2092, 'carga', '1', 'I', '2014-11-17 00:00:00', '632|20151|11247|6|11247|2', NULL),
(2093, 'carga', '1', 'I', '2014-11-17 00:00:00', '632|20151|11246|6|11246|2', NULL),
(2094, 'carga', '1', 'I', '2014-11-17 00:00:00', '632|20151|11243|6|11243|2', NULL),
(2095, 'carga', '1', 'I', '2014-11-17 00:00:00', '632|20151|11249|6|11249|2', NULL),
(2096, 'carga', '1', 'I', '2014-11-17 00:00:00', '632|20151|11244|6|11244|2', NULL),
(2097, 'carga', '1', 'I', '2014-11-17 00:00:00', '633|20151|11245|6|11245|2', NULL),
(2098, 'carga', '1', 'I', '2014-11-17 00:00:00', '633|20151|11248|6|11248|2', NULL),
(2099, 'carga', '1', 'I', '2014-11-17 00:00:00', '633|20151|11247|6|11247|2', NULL),
(2100, 'carga', '1', 'I', '2014-11-17 00:00:00', '633|20151|11246|6|11246|2', NULL),
(2101, 'carga', '1', 'I', '2014-11-17 00:00:00', '633|20151|11243|6|11243|2', NULL),
(2102, 'carga', '1', 'I', '2014-11-17 00:00:00', '633|20151|11249|6|11249|2', NULL),
(2103, 'carga', '1', 'I', '2014-11-17 00:00:00', '633|20151|11244|6|11244|2', NULL),
(2104, 'carga', '1', 'I', '2014-11-17 00:00:00', '634|20151|11245|6|11245|2', NULL),
(2105, 'carga', '1', 'I', '2014-11-17 00:00:00', '634|20151|11248|6|11248|2', NULL),
(2106, 'carga', '1', 'I', '2014-11-17 00:00:00', '634|20151|11247|6|11247|2', NULL),
(2107, 'carga', '1', 'I', '2014-11-17 00:00:00', '634|20151|11246|6|11246|2', NULL),
(2108, 'carga', '1', 'I', '2014-11-17 00:00:00', '634|20151|11243|6|11243|2', NULL),
(2109, 'carga', '1', 'I', '2014-11-17 00:00:00', '634|20151|11249|6|11249|2', NULL),
(2110, 'carga', '1', 'I', '2014-11-17 00:00:00', '634|20151|11244|6|11244|2', NULL),
(2111, 'carga', '1', 'I', '2014-11-17 00:00:00', '635|20151|11245|6|11245|2', NULL),
(2112, 'carga', '1', 'I', '2014-11-17 00:00:00', '635|20151|11248|6|11248|2', NULL),
(2113, 'carga', '1', 'I', '2014-11-17 00:00:00', '635|20151|11247|6|11247|2', NULL),
(2114, 'carga', '1', 'I', '2014-11-17 00:00:00', '635|20151|11246|6|11246|2', NULL),
(2115, 'carga', '1', 'I', '2014-11-17 00:00:00', '635|20151|11243|6|11243|2', NULL),
(2116, 'carga', '1', 'I', '2014-11-17 00:00:00', '635|20151|11249|6|11249|2', NULL),
(2117, 'carga', '1', 'I', '2014-11-17 00:00:00', '635|20151|11244|6|11244|2', NULL),
(2118, 'carga', '1', 'I', '2014-11-17 00:00:00', '636|20151|11245|6|11245|2', NULL),
(2119, 'carga', '1', 'I', '2014-11-17 00:00:00', '636|20151|11248|6|11248|2', NULL),
(2120, 'carga', '1', 'I', '2014-11-17 00:00:00', '636|20151|11247|6|11247|2', NULL),
(2121, 'carga', '1', 'I', '2014-11-17 00:00:00', '636|20151|11246|6|11246|2', NULL),
(2122, 'carga', '1', 'I', '2014-11-17 00:00:00', '636|20151|11243|6|11243|2', NULL),
(2123, 'carga', '1', 'I', '2014-11-17 00:00:00', '636|20151|11249|6|11249|2', NULL),
(2124, 'carga', '1', 'I', '2014-11-17 00:00:00', '636|20151|11244|6|11244|2', NULL),
(2125, 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', NULL, '12457|2|11248|2'),
(2126, 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', NULL, '12468|2|11862|2'),
(2127, 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', NULL, '12481|2|12479|2'),
(2128, 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', NULL, '12463|2|12457|2'),
(2129, 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', NULL, '12464|2|11859|2'),
(2130, 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', NULL, '12479|2|12470|2'),
(2131, 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', NULL, '12470|2|12467|2'),
(2132, 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', NULL, '12467|2|11733|2'),
(2133, 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', NULL, '12460|2|12458|2'),
(2134, 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', NULL, '12458|2|11243|2'),
(2135, 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', NULL, '11243|2|11237|2'),
(2136, 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12457|2|11248|2', NULL),
(2137, 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12468|2|11862|2', NULL),
(2138, 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12481|2|12479|2', NULL),
(2139, 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12463|2|12457|2', NULL),
(2140, 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12464|2|11859|2', NULL),
(2141, 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12479|2|12470|2', NULL),
(2142, 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12470|2|12467|2', NULL),
(2143, 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12467|2|11733|2', NULL),
(2144, 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12460|2|12458|2', NULL),
(2145, 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12458|2|11243|2', NULL),
(2146, 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '11243|2|11237|2', NULL),
(2147, 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12457|2|11843|1', NULL),
(2148, 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12479|2|11236|1', NULL),
(2149, 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12479|2|11248|1', NULL),
(2150, 'puesto', '1', 'I', '2014-12-08 00:00:00', '5|GERENTE GENERAL', NULL),
(2151, 'empresa_adic', '1', 'I', '2014-12-08 00:00:00', '1|LABOPAT', NULL),
(2152, 'trabadicional_emp', '1', 'I', '2014-12-08 00:00:00', '18|1|5', NULL),
(2153, 'trabadicional_emp', '1', 'U', '2014-12-09 00:00:00', '18|1|2005-12-01|5', '18|1|5'),
(2154, 'trabadicional_emp', '1', 'U', '2014-12-09 00:00:00', '18|1|2003-12-01|5', '18|1|2005-12-01|5'),
(2156, 'tipo_curso_emp', '1', 'I', '2014-12-10 00:00:00', '1|RECIBIDO', NULL),
(2157, 'tipo_curso_emp', '1', 'I', '2014-12-10 00:00:00', '2|IMPARTIDO', NULL),
(2158, 'tipo_curso_emp', '1', 'I', '2014-12-10 00:00:00', '3|DE INTERES', NULL),
(2159, 'caracteristica_cur', '1', 'I', '2014-12-10 00:00:00', '1|CURSO', NULL),
(2160, 'caracteristica_cur', '1', 'I', '2014-12-10 00:00:00', '2|CONGRESO', NULL),
(2161, 'caracteristica_cur', '1', 'I', '2014-12-10 00:00:00', '3|TALLER', NULL),
(2162, 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|1|ELABORACION DE MATERIAL DIDACTICO DIGITAL UTI|2014-07-21|25', NULL),
(2163, 'act_profesional_adic', '1', 'U', '2014-12-10 00:00:00', '10|1|ELABORACION DE MATERIAL DIDACTICO DIGITAL UTILIZANDO LAS HERRAMIENTAS DE POWER POINT Y "PREZI"|2014-07-21|25', '10|1|ELABORACION DE MATERIAL DIDACTICO DIGITAL UTI|2014-07-21|25'),
(2164, 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|2|GOOGLE SITES|2014-06-11|2', NULL),
(2165, 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|3|JAVA SCRIPT|2014-06-10|3', NULL),
(2166, 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|4|CONTPAQI: CONTABILIDAD ELECTRONICA Y EL TIMBRADO DE LA NOMINA|2014-06-10|3', NULL),
(2167, 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|5|DESARROLLO DE APPS PARA IOS|2014-06-09|1', NULL),
(2168, 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|6|UML Y DISENO DE SISTEMAS|2014-03-24|0', NULL),
(2169, 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '0|7|HERRAMIENTAS DIDACTICAS PARA LA DOCENCIA|2013-04-14|4', NULL),
(2170, 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|8|PRIMERA PARTE: PROYECT MANAGEMENT|2013-04-22|5', NULL),
(2171, 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|9|TALLER DE HERRAMIENTAS DE EVOLUCION EN BLACKBOARD|2013-06-04|25', NULL),
(2172, 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|10|DOCENCIA POYADA EN TECNOLOGIAS DE INF., COMUNICACION Y COLABORACION I (INTERMEDIO)|2013-06-10|25', NULL),
(2173, 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|1|18|1|1', NULL),
(2175, 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|2|18|2|1', NULL),
(2176, 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|3|18|3|1', NULL),
(2177, 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|4|18|4|1', NULL),
(2178, 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|5|18|5|1', NULL),
(2179, 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|6|18|6|1', NULL),
(2180, 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|7|18|7|1', NULL),
(2181, 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|8|18|8|1', NULL),
(2182, 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|9|18|9|1', NULL),
(2183, 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|10|18|10|1', NULL),
(2184, 'act_adicional_emp', '1', 'U', '2014-12-10 00:00:00', '1|6|18|6|2', '1|6|18|6|1'),
(2185, 'universidades_emp', '1', 'I', '2014-12-10 00:00:00', '1|UNIVERSIDAD AUTONOMA DE BAJA CALIFORNIA|16', NULL),
(2186, 'universidades_emp', '18', 'I', '2014-12-10 00:00:00', '2|INSTITUTO TECNOLOGICO DE TIJUANA|16', NULL),
(2187, 'carreras_emp', '1', 'I', '2014-12-10 00:00:00', '1|LICENCIADO EN INFORMATICA', NULL),
(2188, 'carreras_emp', '1', 'I', '2014-12-10 00:00:00', '2|LICENCIADO EN CONTADURIA', NULL),
(2189, 'carreras_emp', '18', 'I', '2014-12-10 00:00:00', '3|LICENCIADO EN NEGOCIOS INTERNACIONALES', NULL),
(2190, 'carreras_emp', '18', 'I', '2014-12-10 00:00:00', '4|LICENCIADO EN ADMINISTRACION DE EMPRESAS', NULL),
(2191, 'carga', '18', 'I', '2014-12-10 00:00:00', '1|8000054|18|1997-04-30|1|1|1', NULL),
(2192, 'carreras_emp', '1', 'I', '2014-12-10 00:00:00', '5|INGENIERO EN SISTEMAS', NULL),
(2193, 'carga', '1', 'I', '2014-12-10 00:00:00', '5|1|1|1|2', NULL),
(2194, 'carga', '1', 'I', '2014-12-10 00:00:00', '5|9|1|1|2', NULL),
(2195, 'carga', '1', 'I', '2014-12-10 00:00:00', '5|10|1|1|2', NULL),
(2196, 'carga', '1', 'I', '2014-12-10 00:00:00', '5|11|1|1|2', NULL),
(2197, 'carga', '1', 'I', '2014-12-10 00:00:00', '5|17|1|2|2', NULL),
(2198, 'universidades_emp', '1', 'U', '2014-12-11 00:00:00', '1|UNIVERSIDAD AUTONOMA DE BAJA CALIFORNIA|16', '1|UNIVERSIDAD AUTONOMA DE BAJA CALIFORNIA|16'),
(2199, 'universidades_emp', '18', 'U', '2014-12-11 00:00:00', '2|INSTITUTO TECNOLOGICO DE TIJUANA|16', '2|INSTITUTO TECNOLOGICO DE TIJUANA|16'),
(2200, 'act_profesional_adic', '1', 'U', '2014-12-11 00:00:00', '0|7|HERRAMIENTAS DIDACTICAS PARA LA DOCENCIA|2013-04-14|5', '0|7|HERRAMIENTAS DIDACTICAS PARA LA DOCENCIA|2013-04-14|4'),
(2201, 'act_profesional_adic', '1', 'U', '2014-12-11 00:00:00', '10|2|GOOGLE SITES|2014-06-11|3', '10|2|GOOGLE SITES|2014-06-11|2'),
(2202, 'act_profesional_adic', '1', 'U', '2014-12-11 00:00:00', '10|2|GOOGLE SITES|2014-06-11|2.50', '10|2|GOOGLE SITES|2014-06-11|3.00'),
(2203, 'carreras_emp', '9', 'I', '2014-12-15 00:00:00', '6|MAESTRIA EN TECNOLOGIAS DE LA INFORMACION Y LA COMUNICACION', NULL),
(2204, 'carga', '1', 'I', '2014-12-15 00:00:00', '6|9|2|1|1', NULL),
(2205, 'carga', '9', 'I', '2014-12-15 00:00:00', '6|17|2|1|1', NULL),
(2206, 'act_adicional_emp', '1', 'U', '2014-12-16 00:00:00', '3|1|18|1|1', '1|1|18|1|1'),
(2207, 'act_adicional_emp', '1', 'U', '2014-12-16 00:00:00', '1|1|18|1|1', '3|1|18|1|1'),
(2208, 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', NULL, '1|1|18|1|1'),
(2209, 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', NULL, '1|2|18|2|1'),
(2210, 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', NULL, '1|3|18|3|1'),
(2211, 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', NULL, '1|4|18|4|1'),
(2212, 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', NULL, '1|5|18|5|1'),
(2213, 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', NULL, '1|6|18|6|2'),
(2214, 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', NULL, '1|7|18|7|1'),
(2215, 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', NULL, '1|8|18|8|1'),
(2216, 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', NULL, '1|9|18|9|1'),
(2217, 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', NULL, '1|10|18|10|1'),
(2218, 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|1|ELABORACION DE MATERIAL DIDACTICO DIGITAL UTILIZANDO LAS HERRAMIENTAS DE POWER POINT Y "PREZI"|2014-07-21|25.00', '10|1|ELABORACION DE MATERIAL DIDACTICO DIGITAL UTILIZANDO LAS HERRAMIENTAS DE POWER POINT Y "PREZI"|2014-07-21|25.00'),
(2219, 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|2|GOOGLE SITES|2014-06-11|2.50', '10|2|GOOGLE SITES|2014-06-11|2.50'),
(2220, 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|3|JAVA SCRIPT|2014-06-10|3.00', '10|3|JAVA SCRIPT|2014-06-10|3.00'),
(2221, 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|1|ELABORACION DE MATERIAL DIDACTICO DIGITAL UTILIZANDO LAS HERRAMIENTAS DE POWER POINT Y "PREZI"|2014-07-21|25.00', '10|1|ELABORACION DE MATERIAL DIDACTICO DIGITAL UTILIZANDO LAS HERRAMIENTAS DE POWER POINT Y "PREZI"|2014-07-21|25.00'),
(2222, 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|2|GOOGLE SITES|2014-06-11|2.50', '10|2|GOOGLE SITES|2014-06-11|2.50'),
(2223, 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|3|JAVA SCRIPT|2014-06-10|3.00', '10|3|JAVA SCRIPT|2014-06-10|3.00'),
(2224, 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|4|CONTPAQI: CONTABILIDAD ELECTRONICA Y EL TIMBRADO DE LA NOMINA|2014-06-10|3.00', '10|4|CONTPAQI: CONTABILIDAD ELECTRONICA Y EL TIMBRADO DE LA NOMINA|2014-06-10|3.00'),
(2225, 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|5|DESARROLLO DE APPS PARA IOS|2014-06-09|1.00', '10|5|DESARROLLO DE APPS PARA IOS|2014-06-09|1.00'),
(2226, 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|6|UML Y DISENO DE SISTEMAS|2014-03-24|0.00', '10|6|UML Y DISENO DE SISTEMAS|2014-03-24|0.00'),
(2227, 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '0|7|HERRAMIENTAS DIDACTICAS PARA LA DOCENCIA|2013-04-14|5.00', '0|7|HERRAMIENTAS DIDACTICAS PARA LA DOCENCIA|2013-04-14|5.00'),
(2228, 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|8|PRIMERA PARTE: PROYECT MANAGEMENT|2013-04-22|5.00', '10|8|PRIMERA PARTE: PROYECT MANAGEMENT|2013-04-22|5.00'),
(2229, 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|9|TALLER DE HERRAMIENTAS DE EVOLUCION EN BLACKBOARD|2013-06-04|25.00', '10|9|TALLER DE HERRAMIENTAS DE EVOLUCION EN BLACKBOARD|2013-06-04|25.00'),
(2230, 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|10|DOCENCIA POYADA EN TECNOLOGIAS DE INF., COMUNICACION Y COLABORACION I (INTERMEDIO)|2013-06-10|25.00', '10|10|DOCENCIA POYADA EN TECNOLOGIAS DE INF., COMUNICACION Y COLABORACION I (INTERMEDIO)|2013-06-10|25.00'),
(2231, 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|1|18|1|1', NULL),
(2232, 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|2|18|2|1', NULL),
(2233, 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|3|18|3|1', NULL),
(2234, 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|4|18|4|1', NULL),
(2235, 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|5|18|5|1', NULL),
(2236, 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|6|18|6|2', NULL),
(2237, 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|7|18|7|1', NULL),
(2238, 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|8|18|8|1', NULL),
(2239, 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|9|18|9|1', NULL),
(2240, 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|10|18|10|1', NULL),
(2241, 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|2|GOOGLE SITES|2014-06-11|2.30', '10|2|GOOGLE SITES|2014-06-11|2.50'),
(2242, 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|5|DESARROLLO DE APPS PARA IOS|2014-06-09|2.30', '10|5|DESARROLLO DE APPS PARA IOS|2014-06-09|1.00'),
(2243, 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|5|DESARROLLO DE APPS PARA IOS|2014-06-09|1.30', '10|5|DESARROLLO DE APPS PARA IOS|2014-06-09|2.30'),
(2244, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11761|2', '2|11761|2'),
(2245, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12482|3', '2|12482|3'),
(2246, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12483|1', '2|12483|1'),
(2247, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12484|1', '2|12484|1'),
(2248, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12485|1', '2|12485|1'),
(2249, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12486|1', '2|12486|1'),
(2250, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12487|2', '2|12487|2'),
(2251, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12488|2', '2|12488|2'),
(2252, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12489|2', '2|12489|2'),
(2253, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12490|2', '2|12490|2'),
(2254, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12491|2', '2|12491|2'),
(2255, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12492|2', '2|12492|2'),
(2256, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12493|3', '2|12493|3'),
(2257, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12494|3', '2|12494|3'),
(2258, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12495|3', '2|12495|3'),
(2259, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12496|3', '2|12496|3'),
(2260, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12497|3', '2|12497|3'),
(2261, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12498|3', '2|12498|3'),
(2262, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12499|3', '2|12499|3'),
(2263, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12500|3', '2|12500|3'),
(2264, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12501|3', '2|12501|3'),
(2265, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12492|2', '5|12492|2'),
(2266, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12581|2', '5|12581|2'),
(2267, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12582|2', '5|12582|2'),
(2268, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12583|2', '5|12583|2'),
(2269, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12584|2', '5|12584|2'),
(2270, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12585|2', '5|12585|2'),
(2271, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12586|3', '5|12586|3'),
(2272, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12587|3', '5|12587|3'),
(2273, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12588|3', '5|12588|3'),
(2274, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12589|3', '5|12589|3'),
(2275, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12590|3', '5|12590|3'),
(2276, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12591|3', '5|12591|3'),
(2277, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12592|3', '5|12592|3'),
(2278, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12593|3', '5|12593|3'),
(2279, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12594|3', '5|12594|3'),
(2280, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11236|1', '6|11236|1'),
(2281, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11237|1', '6|11237|1'),
(2282, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11238|1', '6|11238|1'),
(2283, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11239|1', '6|11239|1'),
(2284, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11240|1', '6|11240|1'),
(2285, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11241|1', '6|11241|1'),
(2286, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11242|1', '6|11242|1');
INSERT INTO `bitacora` (`id`, `tabla`, `usuario`, `operacion`, `fecha`, `registro`, `registro_old`) VALUES
(2287, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11243|1', '6|11243|1'),
(2288, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11244|1', '6|11244|1'),
(2289, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11245|1', '6|11245|1'),
(2290, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11246|1', '6|11246|1'),
(2291, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11247|1', '6|11247|1'),
(2292, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11248|1', '6|11248|1'),
(2293, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11249|1', '6|11249|1'),
(2294, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11733|1', '2|11733|1'),
(2295, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11733|1', '5|11733|1'),
(2296, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11734|1', '2|11734|1'),
(2297, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11734|1', '5|11734|1'),
(2298, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11737|2', '5|11737|2'),
(2299, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11755|3', '2|11755|3'),
(2300, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11755|3', '5|11755|3'),
(2301, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11761|2', '2|11761|2'),
(2302, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11843|1', '2|11843|1'),
(2303, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11843|1', '5|11843|1'),
(2304, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11859|1', '2|11859|1'),
(2305, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11862|2', '2|11862|2'),
(2306, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12292|3', '2|12292|3'),
(2307, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12456|1', '2|12456|1'),
(2308, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12457|1', '2|12457|1'),
(2309, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12457|1', '5|12457|1'),
(2310, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12458|1', '2|12458|1'),
(2311, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12458|1', '5|12458|1'),
(2312, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12459|1', '2|12459|1'),
(2313, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12459|1', '5|12459|1'),
(2314, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12460|2', '2|12460|2'),
(2315, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12461|2', '2|12461|2'),
(2316, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12462|2', '2|12462|2'),
(2317, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12463|2', '2|12463|2'),
(2318, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12464|2', '2|12464|2'),
(2319, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12465|2', '2|12465|2'),
(2320, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12466|2', '2|12466|2'),
(2321, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12467|2', '2|12467|2'),
(2322, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12467|2', '5|12467|2'),
(2323, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12468|2', '2|12468|2'),
(2324, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12469|2', '2|12469|2'),
(2325, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12470|2', '2|12470|2'),
(2326, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12470|2', '5|12470|2'),
(2327, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12471|2', '2|12471|2'),
(2328, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12472|2', '2|12472|2'),
(2329, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12472|2', '5|12472|2'),
(2330, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12473|2', '2|12473|2'),
(2331, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12474|2', '2|12474|2'),
(2332, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12475|2', '2|12475|2'),
(2333, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12476|3', '2|12476|3'),
(2334, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12477|3', '2|12477|3'),
(2335, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12478|3', '2|12478|3'),
(2336, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12479|2', '2|12479|2'),
(2337, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12479|2', '5|12479|2'),
(2338, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12480|3', '2|12480|3'),
(2339, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12481|3', '2|12481|3'),
(2340, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12481|3', '5|12481|3'),
(2341, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12482|3', '2|12482|3'),
(2342, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12483|1', '2|12483|1'),
(2343, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12484|1', '2|12484|1'),
(2344, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12485|1', '2|12485|1'),
(2345, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12486|1', '2|12486|1'),
(2346, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12487|2', '2|12487|2'),
(2347, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12488|2', '2|12488|2'),
(2348, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12489|2', '2|12489|2'),
(2349, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12490|2', '2|12490|2'),
(2350, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12491|2', '2|12491|2'),
(2351, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12492|2', '2|12492|2'),
(2352, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12492|2', '5|12492|2'),
(2353, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12493|3', '2|12493|3'),
(2354, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12494|3', '2|12494|3'),
(2355, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12495|3', '2|12495|3'),
(2356, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12496|3', '2|12496|3'),
(2357, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12497|3', '2|12497|3'),
(2358, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12498|3', '2|12498|3'),
(2359, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12499|3', '2|12499|3'),
(2360, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12500|3', '2|12500|3'),
(2361, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12501|3', '2|12501|3'),
(2362, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12559|1', '5|12559|1'),
(2363, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12560|2', '5|12560|2'),
(2364, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12561|2', '5|12561|2'),
(2365, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12562|2', '5|12562|2'),
(2366, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12563|2', '5|12563|2'),
(2367, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12564|2', '5|12564|2'),
(2368, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12565|2', '5|12565|2'),
(2369, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12566|2', '5|12566|2'),
(2370, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12567|2', '5|12567|2'),
(2371, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12568|2', '5|12568|2'),
(2372, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12569|2', '5|12569|2'),
(2373, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12570|2', '5|12570|2'),
(2374, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12571|2', '5|12571|2'),
(2375, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12572|3', '5|12572|3'),
(2376, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12573|3', '5|12573|3'),
(2377, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12574|3', '5|12574|3'),
(2378, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12575|3', '5|12575|3'),
(2379, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12576|3', '5|12576|3'),
(2380, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12578|3', '5|12578|3'),
(2381, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12579|3', '5|12579|3'),
(2382, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12581|2', '5|12581|2'),
(2383, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12582|2', '5|12582|2'),
(2384, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12583|2', '5|12583|2'),
(2385, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12584|2', '5|12584|2'),
(2386, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12585|2', '5|12585|2'),
(2387, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12586|3', '5|12586|3'),
(2388, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12587|3', '5|12587|3'),
(2389, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12588|3', '5|12588|3'),
(2390, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12589|3', '5|12589|3'),
(2391, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12590|3', '5|12590|3'),
(2392, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12591|3', '5|12591|3'),
(2393, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12592|3', '5|12592|3'),
(2394, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12593|3', '5|12593|3'),
(2395, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12594|3', '5|12594|3'),
(2396, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11236|1', '6|11236|1'),
(2397, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11237|1', '6|11237|1'),
(2398, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11238|1', '6|11238|1'),
(2399, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11239|1', '6|11239|1'),
(2400, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11240|1', '6|11240|1'),
(2401, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11241|1', '6|11241|1'),
(2402, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11242|1', '6|11242|1'),
(2403, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11243|1', '6|11243|1'),
(2404, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11244|1', '6|11244|1'),
(2405, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11245|1', '6|11245|1'),
(2406, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11246|1', '6|11246|1'),
(2407, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11247|1', '6|11247|1'),
(2408, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11248|1', '6|11248|1'),
(2409, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11249|1', '6|11249|1'),
(2410, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11733|1', '2|11733|1'),
(2411, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11733|1', '5|11733|1'),
(2412, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11734|1', '2|11734|1'),
(2413, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11734|1', '5|11734|1'),
(2414, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11737|2', '5|11737|2'),
(2415, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11755|3', '2|11755|3'),
(2416, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11755|3', '5|11755|3'),
(2417, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11761|2', '2|11761|2'),
(2418, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11843|1', '2|11843|1'),
(2419, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11843|1', '5|11843|1'),
(2420, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11859|1', '2|11859|1'),
(2421, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11862|2', '2|11862|2'),
(2422, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12292|3', '2|12292|3'),
(2423, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12456|1', '2|12456|1'),
(2424, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12457|1', '2|12457|1'),
(2425, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12457|1', '5|12457|1'),
(2426, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12458|1', '2|12458|1'),
(2427, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12458|1', '5|12458|1'),
(2428, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12459|1', '2|12459|1'),
(2429, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12459|1', '5|12459|1'),
(2430, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12460|2', '2|12460|2'),
(2431, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12461|2', '2|12461|2'),
(2432, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12462|2', '2|12462|2'),
(2433, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12463|2', '2|12463|2'),
(2434, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12464|2', '2|12464|2'),
(2435, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12465|2', '2|12465|2'),
(2436, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12466|2', '2|12466|2'),
(2437, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12467|2', '2|12467|2'),
(2438, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12467|2', '5|12467|2'),
(2439, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12468|2', '2|12468|2'),
(2440, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12469|2', '2|12469|2'),
(2441, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12470|2', '2|12470|2'),
(2442, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12470|2', '5|12470|2'),
(2443, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12471|2', '2|12471|2'),
(2444, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12472|2', '2|12472|2'),
(2445, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12472|2', '5|12472|2'),
(2446, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12473|2', '2|12473|2'),
(2447, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12474|2', '2|12474|2'),
(2448, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12475|2', '2|12475|2'),
(2449, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12476|3', '2|12476|3'),
(2450, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12477|3', '2|12477|3'),
(2451, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12478|3', '2|12478|3'),
(2452, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12479|2', '2|12479|2'),
(2453, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12479|2', '5|12479|2'),
(2454, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12480|3', '2|12480|3'),
(2455, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12481|3', '2|12481|3'),
(2456, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12481|3', '5|12481|3'),
(2457, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12482|3', '2|12482|3'),
(2458, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12483|1', '2|12483|1'),
(2459, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12484|1', '2|12484|1'),
(2460, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12485|1', '2|12485|1'),
(2461, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12486|1', '2|12486|1'),
(2462, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12487|2', '2|12487|2'),
(2463, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12488|2', '2|12488|2'),
(2464, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12489|2', '2|12489|2'),
(2465, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12490|2', '2|12490|2'),
(2466, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12491|2', '2|12491|2'),
(2467, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12492|2', '2|12492|2'),
(2468, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12492|2', '5|12492|2'),
(2469, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12493|3', '2|12493|3'),
(2470, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12494|3', '2|12494|3'),
(2471, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12495|3', '2|12495|3'),
(2472, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12496|3', '2|12496|3'),
(2473, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12497|3', '2|12497|3'),
(2474, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12498|3', '2|12498|3'),
(2475, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12499|3', '2|12499|3'),
(2476, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12500|3', '2|12500|3'),
(2477, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12501|3', '2|12501|3'),
(2478, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12559|1', '5|12559|1'),
(2479, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12560|2', '5|12560|2'),
(2480, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12561|2', '5|12561|2'),
(2481, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12562|2', '5|12562|2'),
(2482, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12563|2', '5|12563|2'),
(2483, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12564|2', '5|12564|2'),
(2484, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12565|2', '5|12565|2'),
(2485, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12566|2', '5|12566|2'),
(2486, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12567|2', '5|12567|2'),
(2487, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12568|2', '5|12568|2'),
(2488, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12569|2', '5|12569|2'),
(2489, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12570|2', '5|12570|2'),
(2490, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12571|2', '5|12571|2'),
(2491, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12572|3', '5|12572|3'),
(2492, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12573|3', '5|12573|3'),
(2493, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12574|3', '5|12574|3'),
(2494, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12575|3', '5|12575|3'),
(2495, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12576|3', '5|12576|3'),
(2496, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12578|3', '5|12578|3'),
(2497, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12579|3', '5|12579|3'),
(2498, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12581|2', '5|12581|2'),
(2499, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12582|2', '5|12582|2'),
(2500, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12583|2', '5|12583|2'),
(2501, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12584|2', '5|12584|2'),
(2502, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12585|2', '5|12585|2'),
(2503, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12586|3', '5|12586|3'),
(2504, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12587|3', '5|12587|3'),
(2505, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12588|3', '5|12588|3'),
(2506, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12589|3', '5|12589|3'),
(2507, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12590|3', '5|12590|3'),
(2508, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12591|3', '5|12591|3'),
(2509, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12592|3', '5|12592|3'),
(2510, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12593|3', '5|12593|3'),
(2511, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12594|3', '5|12594|3'),
(2512, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11236|1', '6|11236|1'),
(2513, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11237|1', '6|11237|1'),
(2514, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11238|1', '6|11238|1'),
(2515, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11239|1', '6|11239|1'),
(2516, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11240|1', '6|11240|1'),
(2517, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11241|1', '6|11241|1'),
(2518, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11242|1', '6|11242|1'),
(2519, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11243|1', '6|11243|1'),
(2520, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11244|1', '6|11244|1'),
(2521, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11245|1', '6|11245|1'),
(2522, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11246|1', '6|11246|1'),
(2523, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11247|1', '6|11247|1'),
(2524, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11248|1', '6|11248|1'),
(2525, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11249|1', '6|11249|1'),
(2526, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11733|1', '2|11733|1'),
(2527, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11733|1', '5|11733|1'),
(2528, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11734|1', '2|11734|1'),
(2529, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11734|1', '5|11734|1'),
(2530, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11737|2', '5|11737|2'),
(2531, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11755|3', '2|11755|3'),
(2532, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11755|3', '5|11755|3'),
(2533, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11761|2', '2|11761|2'),
(2534, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11843|1', '2|11843|1'),
(2535, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11843|1', '5|11843|1'),
(2536, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11859|1', '2|11859|1'),
(2537, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11862|2', '2|11862|2'),
(2538, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12292|3', '2|12292|3'),
(2539, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12456|1', '2|12456|1'),
(2540, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12457|1', '2|12457|1'),
(2541, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12457|1', '5|12457|1'),
(2542, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12458|1', '2|12458|1'),
(2543, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12458|1', '5|12458|1'),
(2544, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12459|1', '2|12459|1'),
(2545, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12459|1', '5|12459|1'),
(2546, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12460|2', '2|12460|2'),
(2547, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12461|2', '2|12461|2'),
(2548, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12462|2', '2|12462|2'),
(2549, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12463|2', '2|12463|2'),
(2550, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12464|2', '2|12464|2'),
(2551, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12465|2', '2|12465|2'),
(2552, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12466|2', '2|12466|2'),
(2553, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12467|2', '2|12467|2'),
(2554, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12467|2', '5|12467|2'),
(2555, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12468|2', '2|12468|2'),
(2556, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12469|2', '2|12469|2'),
(2557, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12470|2', '2|12470|2'),
(2558, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12470|2', '5|12470|2'),
(2559, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12471|2', '2|12471|2'),
(2560, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12472|2', '2|12472|2'),
(2561, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12472|2', '5|12472|2'),
(2562, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12473|2', '2|12473|2'),
(2563, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12474|2', '2|12474|2'),
(2564, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12475|2', '2|12475|2'),
(2565, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12476|3', '2|12476|3'),
(2566, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12477|3', '2|12477|3'),
(2567, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12478|3', '2|12478|3'),
(2568, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12479|2', '2|12479|2'),
(2569, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12479|2', '5|12479|2'),
(2570, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12480|3', '2|12480|3'),
(2571, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12481|3', '2|12481|3'),
(2572, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12481|3', '5|12481|3'),
(2573, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12482|3', '2|12482|3'),
(2574, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12483|1', '2|12483|1'),
(2575, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12484|1', '2|12484|1'),
(2576, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12485|1', '2|12485|1'),
(2577, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12486|1', '2|12486|1'),
(2578, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12487|2', '2|12487|2'),
(2579, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12488|2', '2|12488|2'),
(2580, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12489|2', '2|12489|2'),
(2581, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12490|2', '2|12490|2'),
(2582, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12491|2', '2|12491|2'),
(2583, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12492|2', '2|12492|2'),
(2584, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12492|2', '5|12492|2'),
(2585, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12493|3', '2|12493|3'),
(2586, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12494|3', '2|12494|3'),
(2587, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12495|3', '2|12495|3'),
(2588, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12496|3', '2|12496|3'),
(2589, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12497|3', '2|12497|3'),
(2590, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12498|3', '2|12498|3'),
(2591, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12499|3', '2|12499|3'),
(2592, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12500|3', '2|12500|3'),
(2593, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12501|3', '2|12501|3'),
(2594, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12559|1', '5|12559|1'),
(2595, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12560|2', '5|12560|2'),
(2596, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12561|2', '5|12561|2'),
(2597, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12562|2', '5|12562|2'),
(2598, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12563|2', '5|12563|2'),
(2599, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12564|2', '5|12564|2'),
(2600, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12565|2', '5|12565|2'),
(2601, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12566|2', '5|12566|2'),
(2602, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12567|2', '5|12567|2'),
(2603, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12568|2', '5|12568|2'),
(2604, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12569|2', '5|12569|2'),
(2605, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12570|2', '5|12570|2'),
(2606, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12571|2', '5|12571|2'),
(2607, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12572|3', '5|12572|3'),
(2608, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12573|3', '5|12573|3'),
(2609, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12574|3', '5|12574|3'),
(2610, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12575|3', '5|12575|3'),
(2611, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12576|3', '5|12576|3'),
(2612, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12578|3', '5|12578|3'),
(2613, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12579|3', '5|12579|3'),
(2614, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12581|2', '5|12581|2'),
(2615, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12582|2', '5|12582|2'),
(2616, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12583|2', '5|12583|2'),
(2617, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12584|2', '5|12584|2'),
(2618, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12585|2', '5|12585|2'),
(2619, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12586|3', '5|12586|3'),
(2620, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12587|3', '5|12587|3'),
(2621, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12588|3', '5|12588|3'),
(2622, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12589|3', '5|12589|3'),
(2623, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12590|3', '5|12590|3'),
(2624, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12591|3', '5|12591|3'),
(2625, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12592|3', '5|12592|3'),
(2626, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12593|3', '5|12593|3'),
(2627, 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12594|3', '5|12594|3'),
(2628, 'uaprendizaje', '1', 'U', '2014-12-22 00:00:00', '11236|COMUNICACION ORAL Y ESCRITA|1|0|2|0|0|0|4|1|1|21|20092', '11236|COMUNICACION ORAL Y ESCRITA|1|0|2|0|0|0|4|0|1|21|20092'),
(2629, 'uaprendizaje', '1', 'U', '2014-12-22 00:00:00', '11237|CONTABILIDAD|2|0|3|0|0|0|7|1|1|1|20092', '11237|CONTABILIDAD|2|0|3|0|0|0|7|0|1|1|20092'),
(2630, 'uaprendizaje', '1', 'U', '2014-12-22 00:00:00', '11238|DESARROLLO HUMANO|1|0|2|0|0|0|4|1|1|8|20092', '11238|DESARROLLO HUMANO|1|0|2|0|0|0|4|0|1|8|20092'),
(2631, 'uaprendizaje', '1', 'U', '2014-12-22 00:00:00', '11239|ENTORNO GLOBAL DE LOS NEGOCIOS|2|0|2|0|0|0|6|1|1|10|20092', '11239|ENTORNO GLOBAL DE LOS NEGOCIOS|2|0|2|0|0|0|6|0|1|10|20092'),
(2632, 'uaprendizaje', '1', 'U', '2014-12-22 00:00:00', '11240|MATEMATICAS|2|0|2|0|0|0|6|1|1|22|20092', '11240|MATEMATICAS|2|0|2|0|0|0|6|0|1|22|20092'),
(2633, 'uaprendizaje', '1', 'U', '2014-12-22 00:00:00', '11241|RESPONSABILIDAD SOCIAL|2|0|1|0|0|0|5|1|1|21|20092', '11241|RESPONSABILIDAD SOCIAL|2|0|1|0|0|0|5|0|1|21|20092'),
(2634, 'uaprendizaje', '1', 'U', '2014-12-22 00:00:00', '11242|TECNOLOGIAS DE LA INFORMACION|1|3|0|0|0|0|5|1|1|12|20092', '11242|TECNOLOGIAS DE LA INFORMACION|1|3|0|0|0|0|5|0|1|12|20092'),
(2635, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11236|1', '6|11236|1'),
(2636, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11237|1', '6|11237|1'),
(2637, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11238|1', '6|11238|1'),
(2638, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11239|1', '6|11239|1'),
(2639, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11240|1', '6|11240|1'),
(2640, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11241|1', '6|11241|1'),
(2641, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11242|1', '6|11242|1'),
(2642, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11243|1', '6|11243|1'),
(2643, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11244|1', '6|11244|1'),
(2644, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11245|1', '6|11245|1'),
(2645, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11246|1', '6|11246|1'),
(2646, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11247|1', '6|11247|1'),
(2647, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11248|1', '6|11248|1'),
(2648, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11249|1', '6|11249|1'),
(2649, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11734|1', '2|11734|1'),
(2650, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|11734|1', '5|11734|1'),
(2651, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11843|1', '2|11843|1'),
(2652, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|11843|1', '5|11843|1'),
(2653, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11859|1', '2|11859|1'),
(2654, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12456|1', '2|12456|1'),
(2655, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12457|1', '2|12457|1'),
(2656, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12457|1', '5|12457|1'),
(2657, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12458|1', '2|12458|1'),
(2658, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12458|1', '5|12458|1'),
(2659, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12459|1', '2|12459|1'),
(2660, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12459|1', '5|12459|1'),
(2661, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11733|1', '2|11733|1'),
(2662, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|11733|1', '5|11733|1'),
(2663, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11761|2', '2|11761|2'),
(2664, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11862|2', '2|11862|2'),
(2665, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12460|2', '2|12460|2'),
(2666, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12461|2', '2|12461|2'),
(2667, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12462|2', '2|12462|2'),
(2668, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12463|2', '2|12463|2'),
(2669, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12464|2', '2|12464|2'),
(2670, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12487|2', '2|12487|2'),
(2671, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12492|2', '2|12492|2'),
(2672, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12492|2', '5|12492|2'),
(2673, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11761|2', '2|11761|2'),
(2674, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12465|2', '2|12465|2'),
(2675, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12466|2', '2|12466|2'),
(2676, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12467|2', '2|12467|2'),
(2677, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12467|2', '5|12467|2'),
(2678, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12468|2', '2|12468|2'),
(2679, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12469|2', '2|12469|2'),
(2680, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12487|2', '2|12487|2'),
(2681, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12489|2', '2|12489|2'),
(2682, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12490|2', '2|12490|2'),
(2683, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12492|2', '2|12492|2'),
(2684, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12492|2', '5|12492|2'),
(2685, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11761|2', '2|11761|2'),
(2686, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12465|2', '2|12465|2'),
(2687, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12466|2', '2|12466|2'),
(2688, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12467|2', '2|12467|2'),
(2689, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12467|2', '5|12467|2'),
(2690, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12468|2', '2|12468|2'),
(2691, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12469|2', '2|12469|2'),
(2692, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12487|2', '2|12487|2'),
(2693, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12489|2', '2|12489|2'),
(2694, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12490|2', '2|12490|2'),
(2695, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12492|2', '2|12492|2'),
(2696, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12492|2', '5|12492|2'),
(2697, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11761|2', '2|11761|2'),
(2698, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12465|2', '2|12465|2'),
(2699, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12466|2', '2|12466|2'),
(2700, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12467|2', '2|12467|2'),
(2701, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12467|2', '5|12467|2'),
(2702, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12468|2', '2|12468|2'),
(2703, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12469|2', '2|12469|2'),
(2704, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12487|2', '2|12487|2'),
(2705, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12489|2', '2|12489|2'),
(2706, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12490|2', '2|12490|2'),
(2707, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12492|2', '2|12492|2'),
(2708, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12492|2', '5|12492|2'),
(2709, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11761|2', '2|11761|2'),
(2710, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12465|2', '2|12465|2'),
(2711, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12466|2', '2|12466|2'),
(2712, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12467|2', '2|12467|2'),
(2713, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12467|2', '5|12467|2'),
(2714, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12468|2', '2|12468|2'),
(2715, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12469|2', '2|12469|2'),
(2716, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12487|2', '2|12487|2'),
(2717, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12489|2', '2|12489|2'),
(2718, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12490|2', '2|12490|2'),
(2719, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12492|2', '2|12492|2'),
(2720, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12492|2', '5|12492|2'),
(2721, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12470|2', '2|12470|2'),
(2722, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12470|2', '5|12470|2'),
(2723, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12471|2', '2|12471|2'),
(2724, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12472|2', '2|12472|2'),
(2725, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12472|2', '5|12472|2'),
(2726, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12473|2', '2|12473|2'),
(2727, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12474|2', '2|12474|2'),
(2728, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12475|2', '2|12475|2'),
(2729, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12491|2', '2|12491|2'),
(2730, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11755|3', '2|11755|3'),
(2731, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|11755|3', '5|11755|3'),
(2732, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12292|3', '2|12292|3'),
(2733, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12476|3', '2|12476|3'),
(2734, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12477|3', '2|12477|3'),
(2735, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12478|3', '2|12478|3'),
(2736, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12479|2', '2|12479|2'),
(2737, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12479|2', '5|12479|2'),
(2738, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12495|3', '2|12495|3'),
(2739, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12496|3', '2|12496|3'),
(2740, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12497|3', '2|12497|3'),
(2741, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12501|3', '2|12501|3'),
(2742, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12480|3', '2|12480|3'),
(2743, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12481|3', '2|12481|3'),
(2744, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12481|3', '5|12481|3'),
(2745, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12493|3', '2|12493|3'),
(2746, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12494|3', '2|12494|3'),
(2747, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12498|3', '2|12498|3'),
(2748, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12500|3', '2|12500|3'),
(2749, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12483|1', '2|12483|1'),
(2750, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12483|1', '2|12483|1'),
(2751, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12484|1', '2|12484|1'),
(2752, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12485|1', '2|12485|1'),
(2753, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12483|1', '2|12483|1'),
(2754, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12484|1', '2|12484|1'),
(2755, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12485|1', '2|12485|1'),
(2756, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12486|1', '2|12486|1'),
(2757, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12488|2', '2|12488|2'),
(2758, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12559|1', '5|12559|1'),
(2759, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|11737|2', '5|11737|2'),
(2760, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12560|2', '5|12560|2'),
(2761, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12561|2', '5|12561|2'),
(2762, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12562|2', '5|12562|2'),
(2763, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12563|2', '5|12563|2'),
(2764, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12564|2', '5|12564|2'),
(2765, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12565|2', '5|12565|2'),
(2766, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12566|2', '5|12566|2'),
(2767, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12567|2', '5|12567|2'),
(2768, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12568|2', '5|12568|2'),
(2769, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12569|2', '5|12569|2'),
(2770, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12570|2', '5|12570|2'),
(2771, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12571|2', '5|12571|2'),
(2772, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12581|2', '5|12581|2'),
(2773, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12582|2', '5|12582|2'),
(2774, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12583|2', '5|12583|2'),
(2775, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12584|2', '5|12584|2'),
(2776, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12585|2', '5|12585|2'),
(2777, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12482|3', '2|12482|3'),
(2778, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12499|3', '2|12499|3'),
(2779, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12572|3', '5|12572|3'),
(2780, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12573|3', '5|12573|3'),
(2781, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12574|3', '5|12574|3'),
(2782, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12575|3', '5|12575|3'),
(2783, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12576|3', '5|12576|3'),
(2784, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12578|3', '5|12578|3'),
(2785, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12579|3', '5|12579|3'),
(2786, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12586|3', '5|12586|3'),
(2787, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12587|3', '5|12587|3'),
(2788, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12588|3', '5|12588|3'),
(2789, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12589|3', '5|12589|3'),
(2790, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12590|3', '5|12590|3'),
(2791, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12591|3', '5|12591|3'),
(2792, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12592|3', '5|12592|3'),
(2793, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12593|3', '5|12593|3'),
(2794, 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12594|3', '5|12594|3'),
(2795, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11761|2', '2|11761|2'),
(2796, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12482|3', '2|12482|3'),
(2797, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12483|1', '2|12483|1'),
(2798, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12484|1', '2|12484|1'),
(2799, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12485|1', '2|12485|1'),
(2800, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12486|1', '2|12486|1'),
(2801, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12487|2', '2|12487|2'),
(2802, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12488|2', '2|12488|2'),
(2803, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12489|2', '2|12489|2'),
(2804, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12490|2', '2|12490|2'),
(2805, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12491|2', '2|12491|2'),
(2806, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12492|2', '2|12492|2'),
(2807, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12493|3', '2|12493|3'),
(2808, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12494|3', '2|12494|3'),
(2809, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12495|3', '2|12495|3'),
(2810, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12496|3', '2|12496|3'),
(2811, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12497|3', '2|12497|3'),
(2812, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12498|3', '2|12498|3'),
(2813, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12499|3', '2|12499|3'),
(2814, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12500|3', '2|12500|3'),
(2815, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12501|3', '2|12501|3'),
(2816, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12492|2', '5|12492|2'),
(2817, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12581|2', '5|12581|2'),
(2818, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12582|2', '5|12582|2'),
(2819, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12583|2', '5|12583|2'),
(2820, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12584|2', '5|12584|2'),
(2821, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12585|2', '5|12585|2'),
(2822, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12586|3', '5|12586|3'),
(2823, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12587|3', '5|12587|3'),
(2824, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12588|3', '5|12588|3'),
(2825, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12589|3', '5|12589|3'),
(2826, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12590|3', '5|12590|3'),
(2827, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12591|3', '5|12591|3'),
(2828, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12592|3', '5|12592|3'),
(2829, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12593|3', '5|12593|3'),
(2830, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12594|3', '5|12594|3'),
(2831, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11733|1', '2|11733|1'),
(2832, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11734|1', '2|11734|1'),
(2833, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11755|3', '2|11755|3'),
(2834, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11843|1', '2|11843|1'),
(2835, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11859|1', '2|11859|1'),
(2836, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11862|2', '2|11862|2'),
(2837, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12292|3', '2|12292|3'),
(2838, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12456|1', '2|12456|1'),
(2839, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12457|1', '2|12457|1'),
(2840, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12458|1', '2|12458|1'),
(2841, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12459|1', '2|12459|1'),
(2842, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12460|2', '2|12460|2'),
(2843, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12461|2', '2|12461|2'),
(2844, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12462|2', '2|12462|2'),
(2845, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12463|2', '2|12463|2'),
(2846, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12464|2', '2|12464|2'),
(2847, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12465|2', '2|12465|2'),
(2848, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12466|2', '2|12466|2'),
(2849, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12467|2', '2|12467|2'),
(2850, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12468|2', '2|12468|2'),
(2851, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12469|2', '2|12469|2'),
(2852, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12470|2', '2|12470|2'),
(2853, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12471|2', '2|12471|2'),
(2854, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12472|2', '2|12472|2'),
(2855, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12473|2', '2|12473|2'),
(2856, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12474|2', '2|12474|2'),
(2857, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12475|2', '2|12475|2'),
(2858, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12476|3', '2|12476|3'),
(2859, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12477|3', '2|12477|3'),
(2860, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12478|3', '2|12478|3'),
(2861, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12479|2', '2|12479|2'),
(2862, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12480|3', '2|12480|3'),
(2863, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12481|3', '2|12481|3'),
(2864, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11733|1', '5|11733|1'),
(2865, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11734|1', '5|11734|1'),
(2866, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11737|2', '5|11737|2'),
(2867, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11755|3', '5|11755|3'),
(2868, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11843|1', '5|11843|1'),
(2869, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12457|1', '5|12457|1'),
(2870, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12458|1', '5|12458|1'),
(2871, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12459|1', '5|12459|1'),
(2872, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12467|2', '5|12467|2'),
(2873, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12470|2', '5|12470|2'),
(2874, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12472|2', '5|12472|2'),
(2875, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12479|2', '5|12479|2'),
(2876, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12481|3', '5|12481|3'),
(2877, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12559|1', '5|12559|1'),
(2878, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12560|2', '5|12560|2'),
(2879, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12561|2', '5|12561|2'),
(2880, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12562|2', '5|12562|2'),
(2881, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12563|2', '5|12563|2'),
(2882, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12564|2', '5|12564|2'),
(2883, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12565|2', '5|12565|2'),
(2884, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12566|2', '5|12566|2'),
(2885, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12567|2', '5|12567|2'),
(2886, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12568|2', '5|12568|2'),
(2887, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12569|2', '5|12569|2'),
(2888, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12570|2', '5|12570|2'),
(2889, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12571|2', '5|12571|2'),
(2890, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12572|3', '5|12572|3'),
(2891, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12573|3', '5|12573|3'),
(2892, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12574|3', '5|12574|3'),
(2893, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12575|3', '5|12575|3'),
(2894, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12576|3', '5|12576|3'),
(2895, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12578|3', '5|12578|3'),
(2896, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12579|3', '5|12579|3'),
(2897, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11236|1', '6|11236|1'),
(2898, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11237|1', '6|11237|1'),
(2899, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11238|1', '6|11238|1'),
(2900, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11239|1', '6|11239|1'),
(2901, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11240|1', '6|11240|1'),
(2902, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11241|1', '6|11241|1'),
(2903, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11242|1', '6|11242|1'),
(2904, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11243|1', '6|11243|1'),
(2905, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11244|1', '6|11244|1'),
(2906, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11245|1', '6|11245|1'),
(2907, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11246|1', '6|11246|1'),
(2908, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11247|1', '6|11247|1'),
(2909, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11248|1', '6|11248|1'),
(2910, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11249|1', '6|11249|1'),
(2911, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11733|1', '2|11733|1'),
(2912, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11734|1', '2|11734|1'),
(2913, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11755|3', '2|11755|3'),
(2914, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11843|1', '2|11843|1'),
(2915, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11859|1', '2|11859|1'),
(2916, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11862|2', '2|11862|2'),
(2917, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12292|3', '2|12292|3'),
(2918, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12456|1', '2|12456|1'),
(2919, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12457|1', '2|12457|1'),
(2920, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12458|1', '2|12458|1'),
(2921, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12459|1', '2|12459|1'),
(2922, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12460|2', '2|12460|2'),
(2923, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12461|2', '2|12461|2'),
(2924, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12462|2', '2|12462|2'),
(2925, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12463|2', '2|12463|2'),
(2926, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12464|2', '2|12464|2'),
(2927, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12465|2', '2|12465|2'),
(2928, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12466|2', '2|12466|2'),
(2929, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12467|2', '2|12467|2'),
(2930, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12468|2', '2|12468|2'),
(2931, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12469|2', '2|12469|2'),
(2932, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12470|2', '2|12470|2'),
(2933, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12471|2', '2|12471|2'),
(2934, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12472|2', '2|12472|2'),
(2935, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12473|2', '2|12473|2'),
(2936, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12474|2', '2|12474|2'),
(2937, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12475|2', '2|12475|2'),
(2938, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12476|3', '2|12476|3'),
(2939, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12477|3', '2|12477|3'),
(2940, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12478|3', '2|12478|3'),
(2941, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12479|2', '2|12479|2'),
(2942, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12480|3', '2|12480|3'),
(2943, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12481|3', '2|12481|3'),
(2944, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11733|1', '5|11733|1'),
(2945, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11734|1', '5|11734|1'),
(2946, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11737|2', '5|11737|2'),
(2947, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11755|3', '5|11755|3'),
(2948, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11843|1', '5|11843|1'),
(2949, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12457|1', '5|12457|1'),
(2950, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12458|1', '5|12458|1'),
(2951, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12459|1', '5|12459|1'),
(2952, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12467|2', '5|12467|2'),
(2953, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12470|2', '5|12470|2'),
(2954, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12472|2', '5|12472|2'),
(2955, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12479|2', '5|12479|2'),
(2956, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12481|3', '5|12481|3'),
(2957, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12559|1', '5|12559|1'),
(2958, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12560|2', '5|12560|2'),
(2959, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12561|2', '5|12561|2'),
(2960, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12562|2', '5|12562|2');
INSERT INTO `bitacora` (`id`, `tabla`, `usuario`, `operacion`, `fecha`, `registro`, `registro_old`) VALUES
(2961, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12563|2', '5|12563|2'),
(2962, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12564|2', '5|12564|2'),
(2963, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12565|2', '5|12565|2'),
(2964, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12566|2', '5|12566|2'),
(2965, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12567|2', '5|12567|2'),
(2966, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12568|2', '5|12568|2'),
(2967, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12569|2', '5|12569|2'),
(2968, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12570|2', '5|12570|2'),
(2969, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12571|2', '5|12571|2'),
(2970, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12572|3', '5|12572|3'),
(2971, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12573|3', '5|12573|3'),
(2972, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12574|3', '5|12574|3'),
(2973, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12575|3', '5|12575|3'),
(2974, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12576|3', '5|12576|3'),
(2975, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12578|3', '5|12578|3'),
(2976, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12579|3', '5|12579|3'),
(2977, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11236|1', '6|11236|1'),
(2978, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11237|1', '6|11237|1'),
(2979, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11238|1', '6|11238|1'),
(2980, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11239|1', '6|11239|1'),
(2981, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11240|1', '6|11240|1'),
(2982, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11241|1', '6|11241|1'),
(2983, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11242|1', '6|11242|1'),
(2984, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11243|1', '6|11243|1'),
(2985, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11244|1', '6|11244|1'),
(2986, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11245|1', '6|11245|1'),
(2987, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11246|1', '6|11246|1'),
(2988, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11247|1', '6|11247|1'),
(2989, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11248|1', '6|11248|1'),
(2990, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11249|1', '6|11249|1'),
(2991, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11761|2', '2|11761|2'),
(2992, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12482|3', '2|12482|3'),
(2993, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12483|1', '2|12483|1'),
(2994, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12484|1', '2|12484|1'),
(2995, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12485|1', '2|12485|1'),
(2996, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12486|1', '2|12486|1'),
(2997, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12487|2', '2|12487|2'),
(2998, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12488|2', '2|12488|2'),
(2999, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12489|2', '2|12489|2'),
(3000, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12490|2', '2|12490|2'),
(3001, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12491|2', '2|12491|2'),
(3002, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12492|2', '2|12492|2'),
(3003, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12493|3', '2|12493|3'),
(3004, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12494|3', '2|12494|3'),
(3005, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12495|3', '2|12495|3'),
(3006, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12496|3', '2|12496|3'),
(3007, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12497|3', '2|12497|3'),
(3008, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12498|3', '2|12498|3'),
(3009, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12499|3', '2|12499|3'),
(3010, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12500|3', '2|12500|3'),
(3011, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12501|3', '2|12501|3'),
(3012, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12492|2', '5|12492|2'),
(3013, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12581|2', '5|12581|2'),
(3014, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12582|2', '5|12582|2'),
(3015, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12583|2', '5|12583|2'),
(3016, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12584|2', '5|12584|2'),
(3017, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12585|2', '5|12585|2'),
(3018, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12586|3', '5|12586|3'),
(3019, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12587|3', '5|12587|3'),
(3020, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12588|3', '5|12588|3'),
(3021, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12589|3', '5|12589|3'),
(3022, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12590|3', '5|12590|3'),
(3023, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12591|3', '5|12591|3'),
(3024, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12592|3', '5|12592|3'),
(3025, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12593|3', '5|12593|3'),
(3026, 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12594|3', '5|12594|3'),
(3027, 'programaedu', '10', 'U', '2015-01-15 00:00:00', '6|TRONCO COMUN|TC|1|9|1|1|1', '6|TRONCO COMUN||1|9|1|1|1'),
(3028, 'programaedu', '10', 'U', '2015-01-15 00:00:00', '2|LICENCIATURA EN ADMON. DE EMPRESAS|LAE|1|9|1|1|1', '2|LICENCIATURA EN ADMON. DE EMPRESAS||1|9|1|1|1'),
(3029, 'programaedu', '10', 'U', '2015-01-15 00:00:00', '3|LICENCIATURA EN INFORMATICA|LI|1|9|1|1|1', '3|LICENCIATURA EN INFORMATICA||1|9|1|1|1'),
(3030, 'programaedu', '10', 'U', '2015-01-15 00:00:00', '4|LICENCIATURA EN NEGOCIOS INTERNACIONALES|LNI|1|9|1|1|1', '4|LICENCIATURA EN NEGOCIOS INTERNACIONALES||1|9|1|1|1'),
(3031, 'programaedu', '10', 'U', '2015-01-15 00:00:00', '5|LICENCIATURA EN CONTADURIA|LC|1|9|1|1|1', '5|LICENCIATURA EN CONTADURIA||1|9|1|1|1'),
(3032, 'reqseriacion', '1', 'U', '2015-01-15 00:00:00', '1|OBLIGATORI', '1|SIN SERIACION'),
(3033, 'reqseriacion', '1', 'U', '2015-01-15 00:00:00', '2|CONVENIENTE', '2|OBLIGATORIA'),
(3034, 'reqseriacion', '1', 'D', '2015-01-15 00:00:00', NULL, '3|SUGERIDA'),
(3035, 'reqseriacion', '1', 'U', '2015-01-15 00:00:00', '1|OBLIGATORIA', '1|OBLIGATORI'),
(3036, 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', NULL, '12481|2|12479|2'),
(3037, 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', NULL, '12479|2|12470|2'),
(3038, 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', NULL, '12479|2|11248|1'),
(3039, 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', NULL, '12479|2|11236|1'),
(3040, 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', NULL, '12470|2|12467|2'),
(3041, 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', NULL, '12468|2|11862|2'),
(3042, 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', NULL, '12467|2|11733|2'),
(3043, 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', NULL, '12464|2|11859|2'),
(3044, 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', NULL, '12463|2|12457|2'),
(3045, 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', NULL, '12460|2|12458|2'),
(3046, 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', NULL, '12458|2|11243|2'),
(3047, 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', NULL, '12457|2|11843|1'),
(3048, 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', NULL, '12457|2|11248|2'),
(3049, 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', NULL, '11243|2|11237|2'),
(3050, 'programaedu', '10', 'I', '2015-01-15 00:00:00', '1|ARTES|LA|1|9|1|1|1', NULL),
(3051, 'programaedu', '10', 'U', '2015-01-15 00:00:00', '2|ADMON. DE EMPRESAS|LAE|1|1|1|1', '2|LICENCIATURA EN ADMON. DE EMPRESAS|LAE|1|1|1|1'),
(3052, 'programaedu', '10', 'U', '2015-01-15 00:00:00', '3|INFORMATICA|LI|1|1|1|1', '3|LICENCIATURA EN INFORMATICA|LI|1|1|1|1'),
(3053, 'programaedu', '10', 'U', '2015-01-15 00:00:00', '4|NEGOCIOS INTERNACIONALES|LNI|1|1|1|1', '4|LICENCIATURA EN NEGOCIOS INTERNACIONALES|LNI|1|1|1|1'),
(3054, 'programaedu', '10', 'U', '2015-01-15 00:00:00', '5|CONTADURIA|LC|1|1|1|1', '5|LICENCIATURA EN CONTADURIA|LC|1|1|1|1'),
(3055, 'programaedu', '1', 'I', '2015-01-15 00:00:00', '7|SISTEMAS COMPUTACIONALES|LSC|1|2|1|1', NULL),
(3056, 'programaedu', '1', 'U', '2015-01-15 00:00:00', '7|SISTEMAS COMPUTACIONALES|LSC|1|1|1|1', '7|SISTEMAS COMPUTACIONALES|LSC|1|2|1|1'),
(3057, 'uaprendizaje', '9', 'D', '2015-01-15 00:00:00', NULL, '20002|esto es una prueba|1|1|1|1|1|1|1|esto es una prueba|1|20092'),
(3058, 'uaprendizaje', '1', 'D', '2015-01-15 00:00:00', NULL, '20001|prueba|1|1|1|1|1|1|1|2014-07-01|esto es una prueba|1|20092'),
(3059, 'uaprendizaje', '1', 'D', '2015-01-15 00:00:00', NULL, '20000|prueba|1|1|1|1|1|1|1|2014-07-01|Esta ua es una prueba|1|20092'),
(3060, 'plan_programa', '1', 'I', '2015-01-15 00:00:00', '20092|1', NULL),
(3061, 'plan_programa', '1', 'I', '2015-01-15 00:00:00', '20092|7', NULL),
(3062, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '1|CONTABILIDAD BASICA|6', '1|COORD. CONTABILIDAD BASICA (LIC. EN CONTADURI|6'),
(3063, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '2|CONTABILIDAD AVANZADA|6', '2|COORD. CONTABILIDAD AVANZADA (LIC. EN CONTADU|6'),
(3064, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '3|CONTABILIDAD DE COSTOS|6', '3|COORD. CONTABILIDAD DE COSTOS (LIC. EN CONTAD|6'),
(3065, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '4|COORD. FINANZAS|6', '4|COORD. FINANZAS (LIC. EN CONTADURIA)|6'),
(3066, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '5|COORD. AIDITORIA|6', '5|COORD. AIDITORIA (LIC. EN CONTADURIA)|6'),
(3067, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '6|COORD. IMPUESTOS|6', '6|COORD. IMPUESTOS (LIC. EN CONTADURIA)|6'),
(3068, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '7|COORD. MERCADOTECNIA|6', '7|COORD. MERCADOTECNIA (LIC. EN ADMON. DE EMPRE|6'),
(3069, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '8|COORD. RECURSOS HUMANOS|6', '8|COORD. RECURSOS HUMANOS (LIC. EN ADMON. DE EM|6'),
(3070, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '9|COORD. PRODUCCION|6', '9|COORD. PRODUCCION (LIC. EN ADMON. DE EMPRESAS|6'),
(3071, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '10|COORD. ADMINISTRACION BASICA|6', '10|COORD. ADMINISTRACION BASICA (LIC. EN ADMON. |6'),
(3072, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '11|COORD. ADMINISTRACION AVANZADA|6', '11|COORD. ADMINISTRACION AVANZADA (LIC. EN ADMON|6'),
(3073, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '12|COORD. INFORMATICA|6', '12|COORD. INFORMATICA (LIC. EN INFORMATICA) |6'),
(3074, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '13|COORD. MATEMATICAS|6', '13|COORD. MATEMATICAS (LIC. EN INFORMATICA)|6'),
(3075, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '14|COORD. CIENCIAS COMPUTACIONALES|6', '14|COORD. CIENCIAS COMPUTACIONALES (LIC. EN INFO|6'),
(3076, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '15|COORD. SISTEMAS DE INFORMACION|6', '15|COORD. SISTEMAS DE INFORMACION (LIC. EN INFOR|6'),
(3077, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '16|COORD. PROGRAMACION|6', '16|COORD. PROGRAMACION (LIC. EN INFORMATICA)|6'),
(3078, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '17|COORD. ECONOMIA|6', '17|COORD. ECONOMIA (LIC. EN NEGOCIOS INTERNACION|6'),
(3079, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '18|COORD. COMERCIO EXTERIOR|6', '18|COORD. COMERCIO EXTERIOR (LIC. EN NEGOCIOS IN|6'),
(3080, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '19|COORD. DERECHO|6', '19|COORD. DERECHO (LIC. EN NEGOCIOS INTERNACIONA|6'),
(3081, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '20|COORD. EMPRENDEDORES|6', '20|COORD. EMPRENDEDORES(LIC. EN NEGOCIOS INTERNA|6'),
(3082, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '21|COORD. ASIGNATURAS DE APOYO|6', '21|COORD. ASIGNATURAS DE APOYO (LIC. EN NEGOCIOS|6'),
(3083, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '4|FINANZAS|6', '4|COORD. FINANZAS|6'),
(3084, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '5|AUDITORIA|6', '5|COORD. AIDITORIA|6'),
(3085, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '6|IMPUESTOS|6', '6|COORD. IMPUESTOS|6'),
(3086, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '7|MERCADOTECNIA|6', '7|COORD. MERCADOTECNIA|6'),
(3087, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '8|RECURSOS HUMANOS|6', '8|COORD. RECURSOS HUMANOS|6'),
(3088, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '9|PRODUCCION|6', '9|COORD. PRODUCCION|6'),
(3089, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '10|ADMINISTRACION BASICA|6', '10|COORD. ADMINISTRACION BASICA|6'),
(3090, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '11|ADMINISTRACION AVANZADA|6', '11|COORD. ADMINISTRACION AVANZADA|6'),
(3091, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '12|INFORMATICA|6', '12|COORD. INFORMATICA|6'),
(3092, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '13|MATEMATICAS|6', '13|COORD. MATEMATICAS|6'),
(3093, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '14|CIENCIAS COMPUTACIONALES|6', '14|COORD. CIENCIAS COMPUTACIONALES|6'),
(3094, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '15|SISTEMAS DE INFORMACION|6', '15|COORD. SISTEMAS DE INFORMACION|6'),
(3095, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '16|PROGRAMACION|6', '16|COORD. PROGRAMACION|6'),
(3096, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '17|ECONOMIA|6', '17|COORD. ECONOMIA|6'),
(3097, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '18|COMERCIO EXTERIOR|6', '18|COORD. COMERCIO EXTERIOR|6'),
(3098, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '19|DERECHO|6', '19|COORD. DERECHO|6'),
(3099, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '20|EMPRENDEDORES|6', '20|COORD. EMPRENDEDORES|6'),
(3100, 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '21|ASIGNATURAS DE APOYO|6', '21|COORD. ASIGNATURAS DE APOYO|6'),
(3101, 'programaedu', '10', 'U', '2015-01-15 00:00:00', '6|TRONCO COMÚN|TC|1|1|1|1', '6|TRONCO COMUN|TC|1|1|1|1'),
(3102, 'programaedu', '10', 'U', '2015-01-15 00:00:00', '3|INFORMÁTICA|LI|1|1|1|1', '3|INFORMATICA|LI|1|1|1|1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campus`
--

CREATE TABLE IF NOT EXISTS `campus` (
  `campus` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo campus (1,2,3,4)',
  `descripcion` varchar(100) NOT NULL COMMENT 'Descripcion CAMPUS ()',
  `direccion` varchar(60) DEFAULT NULL COMMENT 'Direccion CAMPUS',
  `ciudad` int(11) NOT NULL DEFAULT '16' COMMENT 'Codigo ciudad',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`campus`),
  UNIQUE KEY `CM_codigo_UNIQUE` (`campus`),
  KEY `fk_campus_ciudad1_idx` (`ciudad`),
  KEY `fk_campus_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `campus`
--

INSERT INTO `campus` (`campus`, `descripcion`, `direccion`, `ciudad`, `users_id`) VALUES
(1, 'TIJUANA UNIDAD OTAY', 'CALZADA UNIVERSIDAD 14418 PARQUE INDUSTRIAL INTERNACIONAL TI', 16, 1),
(2, 'TIJUANA UNIDAD TECATE', 'CALZADA UNIVERSIDAD NO.1 FRACC. SAN FERNANDO. C.P. 21460', 16, 1),
(3, 'TIJUANA UNIDAD ROSARITO', 'BLVD. MARIANO VERDUGO NORTE ENTRE CALLE ISLA LOBO VERACRUZ Y', 16, 1),
(4, 'TIJUANA UNIDAD VALLE DE LAS PALMAS', 'BLVD. UNIVERSITARIO #1000', 16, 1);

--
-- Disparadores `campus`
--
DROP TRIGGER IF EXISTS `bit_D_campus`;
DELIMITER //
CREATE TRIGGER `bit_D_campus` AFTER DELETE ON `campus`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *bit_D_campus*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'campus', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.campus,
OLD.descripcion,
OLD.direccion,
OLD.ciudad                                                      ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_campus`;
DELIMITER //
CREATE TRIGGER `bit_I_campus` AFTER INSERT ON `campus`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *bit_I_campus*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'campus', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.campus,
NEW.descripcion,
NEW.direccion,
NEW.ciudad                                                           ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_campus`;
DELIMITER //
CREATE TRIGGER `bit_U_campus` AFTER UPDATE ON `campus`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *campus*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,
registro_old
)
VALUES (
'campus', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.campus,
NEW.descripcion,
NEW.direccion,
NEW.ciudad), 
concat_WS( '|', 
OLD.campus,
OLD.descripcion,
OLD.direccion,
OLD.ciudad    )
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracter`
--

CREATE TABLE IF NOT EXISTS `caracter` (
  `caracter` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Caracter de materia uaprendizaje (1,2)',
  `descripcion` varchar(15) NOT NULL COMMENT 'Obligatoria, Optativa',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`caracter`),
  UNIQUE KEY `CAR_codigo_UNIQUE` (`caracter`),
  KEY `fk_caracter_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `caracter`
--

INSERT INTO `caracter` (`caracter`, `descripcion`, `users_id`) VALUES
(1, 'OBLIGATORIA', 1),
(2, 'OPTATIVA', 1);

--
-- Disparadores `caracter`
--
DROP TRIGGER IF EXISTS `bit_D_caracter`;
DELIMITER //
CREATE TRIGGER `bit_D_caracter` AFTER DELETE ON `caracter`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *caracter*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'caracter', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.caracter, OLD.descripcion 
));

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_caracter`;
DELIMITER //
CREATE TRIGGER `bit_I_caracter` AFTER INSERT ON `caracter`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *caracter*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'caracter', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.caracter, NEW.descripcion 
));

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_caracter`;
DELIMITER //
CREATE TRIGGER `bit_U_caracter` AFTER UPDATE ON `caracter`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *caracter*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,
registro_old
)
VALUES (
'caracter', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.caracter, NEW.descripcion ),
concat_WS( '|', OLD.caracter, OLD.descripcion )
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristica_cur`
--

CREATE TABLE IF NOT EXISTS `caracteristica_cur` (
  `caracteristica_cur` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consec Característica',
  `descripcion` varchar(45) NOT NULL COMMENT 'Desc Curso:',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`caracteristica_cur`),
  UNIQUE KEY `caracteristica_cur_UNIQUE` (`caracteristica_cur`),
  KEY `fk_caracteristica_cur_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `caracteristica_cur`
--

INSERT INTO `caracteristica_cur` (`caracteristica_cur`, `descripcion`, `users_id`) VALUES
(1, 'CURSO', 1),
(2, 'CONGRESO', 1),
(3, 'TALLER', 1);

--
-- Disparadores `caracteristica_cur`
--
DROP TRIGGER IF EXISTS `bit_D_caracteristica_cur`;
DELIMITER //
CREATE TRIGGER `bit_D_caracteristica_cur` AFTER DELETE ON `caracteristica_cur`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *caracteristica_cur*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'caracteristica_cur', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.caracteristica_cur,
OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_caracteristica_cur`;
DELIMITER //
CREATE TRIGGER `bit_I_caracteristica_cur` AFTER INSERT ON `caracteristica_cur`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *caracteristica_cur*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'caracteristica_cur', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.caracteristica_cur,
NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_caracteristica_cur`;
DELIMITER //
CREATE TRIGGER `bit_U_caracteristica_cur` AFTER UPDATE ON `caracteristica_cur`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *caracteristica_cur*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,
registro_old
)
VALUES (
'caracteristica_cur', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.caracteristica_cur,NEW.descripcion ), 
concat_WS( '|', OLD.caracteristica_cur,OLD.descripcion ) 
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carga`
--

CREATE TABLE IF NOT EXISTS `carga` (
  `grupo` int(11) NOT NULL COMMENT 'Código grupo',
  `periodo` int(11) NOT NULL COMMENT 'Periodo de trabajo(Año 4 digitos+ semestre o cuatrim) ej. 20091,20092',
  `programaedu` int(11) NOT NULL,
  `uaprendizaje` int(11) NOT NULL,
  `semestre` int(11) NOT NULL COMMENT 'Semestre',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`grupo`,`periodo`,`programaedu`,`uaprendizaje`),
  KEY `fk_carga_users1_idx` (`users_id`),
  KEY `fk_carga_p_ua1_idx` (`programaedu`,`uaprendizaje`),
  KEY `fk_carga_grupos1_idx` (`grupo`,`periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carga`
--

INSERT INTO `carga` (`grupo`, `periodo`, `programaedu`, `uaprendizaje`, `semestre`, `users_id`) VALUES
(231, 20151, 2, 11734, 3, 1),
(231, 20151, 2, 11843, 3, 1),
(231, 20151, 2, 11859, 3, 1),
(231, 20151, 2, 12456, 3, 1),
(231, 20151, 2, 12457, 3, 1),
(231, 20151, 2, 12458, 3, 1),
(231, 20151, 2, 12459, 3, 1),
(232, 20151, 2, 11734, 3, 1),
(232, 20151, 2, 11843, 3, 1),
(232, 20151, 2, 11859, 3, 1),
(232, 20151, 2, 12456, 3, 1),
(232, 20151, 2, 12457, 3, 1),
(232, 20151, 2, 12458, 3, 1),
(232, 20151, 2, 12459, 3, 1),
(233, 20151, 2, 11734, 3, 1),
(233, 20151, 2, 11843, 3, 1),
(233, 20151, 2, 11859, 3, 1),
(233, 20151, 2, 12456, 3, 1),
(233, 20151, 2, 12457, 3, 1),
(233, 20151, 2, 12458, 3, 1),
(233, 20151, 2, 12459, 3, 1),
(234, 20151, 2, 11734, 3, 1),
(234, 20151, 2, 11843, 3, 1),
(234, 20151, 2, 11859, 3, 1),
(234, 20151, 2, 12456, 3, 1),
(234, 20151, 2, 12457, 3, 1),
(234, 20151, 2, 12458, 3, 1),
(234, 20151, 2, 12459, 3, 1),
(235, 20151, 2, 11734, 3, 1),
(235, 20151, 2, 11843, 3, 1),
(235, 20151, 2, 11859, 3, 1),
(235, 20151, 2, 12456, 3, 1),
(235, 20151, 2, 12457, 3, 1),
(235, 20151, 2, 12458, 3, 1),
(235, 20151, 2, 12459, 3, 1),
(236, 20151, 2, 11734, 3, 1),
(236, 20151, 2, 11843, 3, 1),
(236, 20151, 2, 11859, 3, 1),
(236, 20151, 2, 12456, 3, 1),
(236, 20151, 2, 12457, 3, 1),
(236, 20151, 2, 12458, 3, 1),
(236, 20151, 2, 12459, 3, 1),
(241, 20151, 2, 11733, 4, 1),
(241, 20151, 2, 11761, 4, 1),
(241, 20151, 2, 11862, 4, 1),
(241, 20151, 2, 12460, 4, 1),
(241, 20151, 2, 12461, 4, 1),
(241, 20151, 2, 12462, 4, 1),
(241, 20151, 2, 12463, 4, 1),
(241, 20151, 2, 12464, 4, 1),
(241, 20151, 2, 12487, 4, 1),
(241, 20151, 2, 12492, 4, 1),
(242, 20151, 2, 11733, 4, 1),
(242, 20151, 2, 11761, 4, 1),
(242, 20151, 2, 11862, 4, 1),
(242, 20151, 2, 12460, 4, 1),
(242, 20151, 2, 12461, 4, 1),
(242, 20151, 2, 12462, 4, 1),
(242, 20151, 2, 12463, 4, 1),
(242, 20151, 2, 12464, 4, 1),
(242, 20151, 2, 12487, 4, 1),
(242, 20151, 2, 12492, 4, 1),
(243, 20151, 2, 11733, 4, 1),
(243, 20151, 2, 11761, 4, 1),
(243, 20151, 2, 11862, 4, 1),
(243, 20151, 2, 12460, 4, 1),
(243, 20151, 2, 12461, 4, 1),
(243, 20151, 2, 12462, 4, 1),
(243, 20151, 2, 12463, 4, 1),
(243, 20151, 2, 12464, 4, 1),
(243, 20151, 2, 12487, 4, 1),
(243, 20151, 2, 12492, 4, 1),
(244, 20151, 2, 11733, 4, 1),
(244, 20151, 2, 11761, 4, 1),
(244, 20151, 2, 11862, 4, 1),
(244, 20151, 2, 12460, 4, 1),
(244, 20151, 2, 12461, 4, 1),
(244, 20151, 2, 12462, 4, 1),
(244, 20151, 2, 12463, 4, 1),
(244, 20151, 2, 12464, 4, 1),
(244, 20151, 2, 12487, 4, 1),
(244, 20151, 2, 12492, 4, 1),
(245, 20151, 2, 11733, 4, 1),
(245, 20151, 2, 11761, 4, 1),
(245, 20151, 2, 11862, 4, 1),
(245, 20151, 2, 12460, 4, 1),
(245, 20151, 2, 12461, 4, 1),
(245, 20151, 2, 12462, 4, 1),
(245, 20151, 2, 12463, 4, 1),
(245, 20151, 2, 12464, 4, 1),
(245, 20151, 2, 12487, 4, 1),
(245, 20151, 2, 12492, 4, 1),
(246, 20151, 2, 11733, 4, 1),
(246, 20151, 2, 11761, 4, 1),
(246, 20151, 2, 11862, 4, 1),
(246, 20151, 2, 12460, 4, 1),
(246, 20151, 2, 12461, 4, 1),
(246, 20151, 2, 12462, 4, 1),
(246, 20151, 2, 12463, 4, 1),
(246, 20151, 2, 12464, 4, 1),
(246, 20151, 2, 12487, 4, 1),
(246, 20151, 2, 12492, 4, 1),
(251, 20151, 2, 11761, 5, 1),
(251, 20151, 2, 12465, 5, 1),
(251, 20151, 2, 12466, 5, 1),
(251, 20151, 2, 12467, 5, 1),
(251, 20151, 2, 12468, 5, 1),
(251, 20151, 2, 12469, 5, 1),
(251, 20151, 2, 12487, 5, 1),
(251, 20151, 2, 12489, 5, 1),
(251, 20151, 2, 12490, 5, 1),
(251, 20151, 2, 12492, 5, 1),
(252, 20151, 2, 11761, 5, 1),
(252, 20151, 2, 12465, 5, 1),
(252, 20151, 2, 12466, 5, 1),
(252, 20151, 2, 12467, 5, 1),
(252, 20151, 2, 12468, 5, 1),
(252, 20151, 2, 12469, 5, 1),
(252, 20151, 2, 12487, 5, 1),
(252, 20151, 2, 12489, 5, 1),
(252, 20151, 2, 12490, 5, 1),
(252, 20151, 2, 12492, 5, 1),
(253, 20151, 2, 11761, 5, 1),
(253, 20151, 2, 12465, 5, 1),
(253, 20151, 2, 12466, 5, 1),
(253, 20151, 2, 12467, 5, 1),
(253, 20151, 2, 12468, 5, 1),
(253, 20151, 2, 12469, 5, 1),
(253, 20151, 2, 12487, 5, 1),
(253, 20151, 2, 12489, 5, 1),
(253, 20151, 2, 12490, 5, 1),
(253, 20151, 2, 12492, 5, 1),
(254, 20151, 2, 11761, 5, 1),
(254, 20151, 2, 12465, 5, 1),
(254, 20151, 2, 12466, 5, 1),
(254, 20151, 2, 12467, 5, 1),
(254, 20151, 2, 12468, 5, 1),
(254, 20151, 2, 12469, 5, 1),
(254, 20151, 2, 12487, 5, 1),
(254, 20151, 2, 12489, 5, 1),
(254, 20151, 2, 12490, 5, 1),
(254, 20151, 2, 12492, 5, 1),
(255, 20151, 2, 11761, 5, 1),
(255, 20151, 2, 12465, 5, 1),
(255, 20151, 2, 12466, 5, 1),
(255, 20151, 2, 12467, 5, 1),
(255, 20151, 2, 12468, 5, 1),
(255, 20151, 2, 12469, 5, 1),
(255, 20151, 2, 12487, 5, 1),
(255, 20151, 2, 12489, 5, 1),
(255, 20151, 2, 12490, 5, 1),
(255, 20151, 2, 12492, 5, 1),
(256, 20151, 2, 11761, 5, 1),
(256, 20151, 2, 12465, 5, 1),
(256, 20151, 2, 12466, 5, 1),
(256, 20151, 2, 12467, 5, 1),
(256, 20151, 2, 12468, 5, 1),
(256, 20151, 2, 12469, 5, 1),
(256, 20151, 2, 12487, 5, 1),
(256, 20151, 2, 12489, 5, 1),
(256, 20151, 2, 12490, 5, 1),
(256, 20151, 2, 12492, 5, 1),
(261, 20151, 2, 12470, 6, 1),
(261, 20151, 2, 12471, 6, 1),
(261, 20151, 2, 12472, 6, 1),
(261, 20151, 2, 12473, 6, 1),
(261, 20151, 2, 12474, 6, 1),
(261, 20151, 2, 12475, 6, 1),
(261, 20151, 2, 12487, 6, 1),
(261, 20151, 2, 12489, 6, 1),
(261, 20151, 2, 12490, 6, 1),
(261, 20151, 2, 12491, 6, 1),
(262, 20151, 2, 12470, 6, 1),
(262, 20151, 2, 12471, 6, 1),
(262, 20151, 2, 12472, 6, 1),
(262, 20151, 2, 12473, 6, 1),
(262, 20151, 2, 12474, 6, 1),
(262, 20151, 2, 12475, 6, 1),
(262, 20151, 2, 12487, 6, 1),
(262, 20151, 2, 12489, 6, 1),
(262, 20151, 2, 12490, 6, 1),
(262, 20151, 2, 12491, 6, 1),
(263, 20151, 2, 12470, 6, 1),
(263, 20151, 2, 12471, 6, 1),
(263, 20151, 2, 12472, 6, 1),
(263, 20151, 2, 12473, 6, 1),
(263, 20151, 2, 12474, 6, 1),
(263, 20151, 2, 12475, 6, 1),
(263, 20151, 2, 12487, 6, 1),
(263, 20151, 2, 12489, 6, 1),
(263, 20151, 2, 12490, 6, 1),
(263, 20151, 2, 12491, 6, 1),
(264, 20151, 2, 12470, 6, 1),
(264, 20151, 2, 12471, 6, 1),
(264, 20151, 2, 12472, 6, 1),
(264, 20151, 2, 12473, 6, 1),
(264, 20151, 2, 12474, 6, 1),
(264, 20151, 2, 12475, 6, 1),
(264, 20151, 2, 12487, 6, 1),
(264, 20151, 2, 12489, 6, 1),
(264, 20151, 2, 12490, 6, 1),
(264, 20151, 2, 12491, 6, 1),
(265, 20151, 2, 12470, 6, 1),
(265, 20151, 2, 12471, 6, 1),
(265, 20151, 2, 12472, 6, 1),
(265, 20151, 2, 12473, 6, 1),
(265, 20151, 2, 12474, 6, 1),
(265, 20151, 2, 12475, 6, 1),
(265, 20151, 2, 12487, 6, 1),
(265, 20151, 2, 12489, 6, 1),
(265, 20151, 2, 12490, 6, 1),
(265, 20151, 2, 12491, 6, 1),
(266, 20151, 2, 12470, 6, 1),
(266, 20151, 2, 12471, 6, 1),
(266, 20151, 2, 12472, 6, 1),
(266, 20151, 2, 12473, 6, 1),
(266, 20151, 2, 12474, 6, 1),
(266, 20151, 2, 12475, 6, 1),
(266, 20151, 2, 12487, 6, 1),
(266, 20151, 2, 12489, 6, 1),
(266, 20151, 2, 12490, 6, 1),
(266, 20151, 2, 12491, 6, 1),
(271, 20151, 2, 11755, 7, 1),
(271, 20151, 2, 12292, 7, 1),
(271, 20151, 2, 12476, 7, 1),
(271, 20151, 2, 12477, 7, 1),
(271, 20151, 2, 12478, 7, 1),
(271, 20151, 2, 12479, 7, 1),
(271, 20151, 2, 12495, 7, 1),
(271, 20151, 2, 12496, 7, 1),
(271, 20151, 2, 12497, 7, 1),
(271, 20151, 2, 12501, 7, 1),
(272, 20151, 2, 11755, 7, 1),
(272, 20151, 2, 12292, 7, 1),
(272, 20151, 2, 12476, 7, 1),
(272, 20151, 2, 12477, 7, 1),
(272, 20151, 2, 12478, 7, 1),
(272, 20151, 2, 12479, 7, 1),
(272, 20151, 2, 12495, 7, 1),
(272, 20151, 2, 12496, 7, 1),
(272, 20151, 2, 12497, 7, 1),
(272, 20151, 2, 12501, 7, 1),
(273, 20151, 2, 11755, 7, 1),
(273, 20151, 2, 12292, 7, 1),
(273, 20151, 2, 12476, 7, 1),
(273, 20151, 2, 12477, 7, 1),
(273, 20151, 2, 12478, 7, 1),
(273, 20151, 2, 12479, 7, 1),
(273, 20151, 2, 12495, 7, 1),
(273, 20151, 2, 12496, 7, 1),
(273, 20151, 2, 12497, 7, 1),
(273, 20151, 2, 12501, 7, 1),
(274, 20151, 2, 11755, 7, 1),
(274, 20151, 2, 12292, 7, 1),
(274, 20151, 2, 12476, 7, 1),
(274, 20151, 2, 12477, 7, 1),
(274, 20151, 2, 12478, 7, 1),
(274, 20151, 2, 12479, 7, 1),
(274, 20151, 2, 12495, 7, 1),
(274, 20151, 2, 12496, 7, 1),
(274, 20151, 2, 12497, 7, 1),
(274, 20151, 2, 12501, 7, 1),
(275, 20151, 2, 11755, 7, 1),
(275, 20151, 2, 12292, 7, 1),
(275, 20151, 2, 12476, 7, 1),
(275, 20151, 2, 12477, 7, 1),
(275, 20151, 2, 12478, 7, 1),
(275, 20151, 2, 12479, 7, 1),
(275, 20151, 2, 12495, 7, 1),
(275, 20151, 2, 12496, 7, 1),
(275, 20151, 2, 12497, 7, 1),
(275, 20151, 2, 12501, 7, 1),
(276, 20151, 2, 11755, 7, 1),
(276, 20151, 2, 12292, 7, 1),
(276, 20151, 2, 12476, 7, 1),
(276, 20151, 2, 12477, 7, 1),
(276, 20151, 2, 12478, 7, 1),
(276, 20151, 2, 12479, 7, 1),
(276, 20151, 2, 12495, 7, 1),
(276, 20151, 2, 12496, 7, 1),
(276, 20151, 2, 12497, 7, 1),
(276, 20151, 2, 12501, 7, 1),
(281, 20151, 2, 12480, 8, 1),
(281, 20151, 2, 12481, 8, 1),
(281, 20151, 2, 12493, 8, 1),
(281, 20151, 2, 12494, 8, 1),
(281, 20151, 2, 12495, 8, 1),
(281, 20151, 2, 12496, 8, 1),
(281, 20151, 2, 12497, 8, 1),
(281, 20151, 2, 12498, 8, 1),
(281, 20151, 2, 12500, 8, 1),
(281, 20151, 2, 12501, 8, 1),
(282, 20151, 2, 12480, 8, 1),
(282, 20151, 2, 12481, 8, 1),
(282, 20151, 2, 12493, 8, 1),
(282, 20151, 2, 12494, 8, 1),
(282, 20151, 2, 12495, 8, 1),
(282, 20151, 2, 12496, 8, 1),
(282, 20151, 2, 12497, 8, 1),
(282, 20151, 2, 12498, 8, 1),
(282, 20151, 2, 12500, 8, 1),
(282, 20151, 2, 12501, 8, 1),
(283, 20151, 2, 12480, 8, 1),
(283, 20151, 2, 12481, 8, 1),
(283, 20151, 2, 12493, 8, 1),
(283, 20151, 2, 12494, 8, 1),
(283, 20151, 2, 12495, 8, 1),
(283, 20151, 2, 12496, 8, 1),
(283, 20151, 2, 12497, 8, 1),
(283, 20151, 2, 12498, 8, 1),
(283, 20151, 2, 12500, 8, 1),
(283, 20151, 2, 12501, 8, 1),
(284, 20151, 2, 12480, 8, 1),
(284, 20151, 2, 12481, 8, 1),
(284, 20151, 2, 12493, 8, 1),
(284, 20151, 2, 12494, 8, 1),
(284, 20151, 2, 12495, 8, 1),
(284, 20151, 2, 12496, 8, 1),
(284, 20151, 2, 12497, 8, 1),
(284, 20151, 2, 12498, 8, 1),
(284, 20151, 2, 12500, 8, 1),
(284, 20151, 2, 12501, 8, 1),
(285, 20151, 2, 12480, 8, 1),
(285, 20151, 2, 12481, 8, 1),
(285, 20151, 2, 12493, 8, 1),
(285, 20151, 2, 12494, 8, 1),
(285, 20151, 2, 12495, 8, 1),
(285, 20151, 2, 12496, 8, 1),
(285, 20151, 2, 12497, 8, 1),
(285, 20151, 2, 12498, 8, 1),
(285, 20151, 2, 12500, 8, 1),
(285, 20151, 2, 12501, 8, 1),
(286, 20151, 2, 12480, 8, 1),
(286, 20151, 2, 12481, 8, 1),
(286, 20151, 2, 12493, 8, 1),
(286, 20151, 2, 12494, 8, 1),
(286, 20151, 2, 12495, 8, 1),
(286, 20151, 2, 12496, 8, 1),
(286, 20151, 2, 12497, 8, 1),
(286, 20151, 2, 12498, 8, 1),
(286, 20151, 2, 12500, 8, 1),
(286, 20151, 2, 12501, 8, 1),
(601, 20132, 6, 11236, 1, 1),
(601, 20132, 6, 11237, 1, 1),
(601, 20132, 6, 11238, 1, 1),
(601, 20132, 6, 11239, 1, 1),
(601, 20132, 6, 11240, 1, 1),
(601, 20132, 6, 11241, 1, 1),
(601, 20132, 6, 11242, 1, 1),
(601, 20151, 6, 11236, 1, 1),
(601, 20151, 6, 11237, 1, 1),
(601, 20151, 6, 11238, 1, 1),
(601, 20151, 6, 11239, 1, 1),
(601, 20151, 6, 11240, 1, 1),
(601, 20151, 6, 11241, 1, 1),
(602, 20132, 6, 11236, 1, 1),
(602, 20132, 6, 11237, 1, 1),
(602, 20132, 6, 11238, 1, 1),
(602, 20132, 6, 11239, 1, 1),
(602, 20132, 6, 11240, 1, 1),
(602, 20132, 6, 11241, 1, 1),
(602, 20132, 6, 11242, 1, 1),
(602, 20151, 6, 11236, 1, 1),
(602, 20151, 6, 11237, 1, 1),
(602, 20151, 6, 11238, 1, 1),
(602, 20151, 6, 11239, 1, 1),
(602, 20151, 6, 11240, 1, 1),
(602, 20151, 6, 11241, 1, 1),
(603, 20132, 6, 11236, 1, 1),
(603, 20132, 6, 11237, 1, 1),
(603, 20132, 6, 11238, 1, 1),
(603, 20132, 6, 11239, 1, 1),
(603, 20132, 6, 11240, 1, 1),
(603, 20132, 6, 11241, 1, 1),
(603, 20132, 6, 11242, 1, 1),
(603, 20151, 6, 11236, 1, 1),
(603, 20151, 6, 11237, 1, 1),
(603, 20151, 6, 11238, 1, 1),
(603, 20151, 6, 11239, 1, 1),
(603, 20151, 6, 11240, 1, 1),
(603, 20151, 6, 11241, 1, 1),
(604, 20132, 6, 11236, 1, 1),
(604, 20132, 6, 11237, 1, 1),
(604, 20132, 6, 11238, 1, 1),
(604, 20132, 6, 11239, 1, 1),
(604, 20132, 6, 11240, 1, 1),
(604, 20132, 6, 11241, 1, 1),
(604, 20132, 6, 11242, 1, 1),
(604, 20151, 6, 11236, 1, 1),
(604, 20151, 6, 11237, 1, 1),
(604, 20151, 6, 11238, 1, 1),
(604, 20151, 6, 11239, 1, 1),
(604, 20151, 6, 11240, 1, 1),
(604, 20151, 6, 11241, 1, 1),
(605, 20132, 6, 11236, 1, 1),
(605, 20132, 6, 11237, 1, 1),
(605, 20132, 6, 11238, 1, 1),
(605, 20132, 6, 11239, 1, 1),
(605, 20132, 6, 11240, 1, 1),
(605, 20132, 6, 11241, 1, 1),
(605, 20132, 6, 11242, 1, 1),
(605, 20151, 6, 11236, 1, 1),
(605, 20151, 6, 11237, 1, 1),
(605, 20151, 6, 11238, 1, 1),
(605, 20151, 6, 11239, 1, 1),
(605, 20151, 6, 11240, 1, 1),
(605, 20151, 6, 11241, 1, 1),
(606, 20132, 6, 11236, 1, 1),
(606, 20132, 6, 11237, 1, 1),
(606, 20132, 6, 11238, 1, 1),
(606, 20132, 6, 11239, 1, 1),
(606, 20132, 6, 11240, 1, 1),
(606, 20132, 6, 11241, 1, 1),
(606, 20132, 6, 11242, 1, 1),
(606, 20151, 6, 11236, 1, 1),
(606, 20151, 6, 11237, 1, 1),
(606, 20151, 6, 11238, 1, 1),
(606, 20151, 6, 11239, 1, 1),
(606, 20151, 6, 11240, 1, 1),
(606, 20151, 6, 11241, 1, 1),
(607, 20132, 6, 11236, 1, 1),
(607, 20132, 6, 11237, 1, 1),
(607, 20132, 6, 11238, 1, 1),
(607, 20132, 6, 11239, 1, 1),
(607, 20132, 6, 11240, 1, 1),
(607, 20132, 6, 11241, 1, 1),
(607, 20132, 6, 11242, 1, 1),
(607, 20151, 6, 11236, 1, 1),
(607, 20151, 6, 11237, 1, 1),
(607, 20151, 6, 11238, 1, 1),
(607, 20151, 6, 11239, 1, 1),
(607, 20151, 6, 11240, 1, 1),
(607, 20151, 6, 11241, 1, 1),
(608, 20132, 6, 11236, 1, 1),
(608, 20132, 6, 11237, 1, 1),
(608, 20132, 6, 11238, 1, 1),
(608, 20132, 6, 11239, 1, 1),
(608, 20132, 6, 11240, 1, 1),
(608, 20132, 6, 11241, 1, 1),
(608, 20132, 6, 11242, 1, 1),
(608, 20151, 6, 11236, 1, 1),
(608, 20151, 6, 11237, 1, 1),
(608, 20151, 6, 11238, 1, 1),
(608, 20151, 6, 11239, 1, 1),
(608, 20151, 6, 11240, 1, 1),
(608, 20151, 6, 11241, 1, 1),
(611, 20132, 6, 11236, 1, 1),
(611, 20132, 6, 11237, 1, 1),
(611, 20132, 6, 11238, 1, 1),
(611, 20132, 6, 11239, 1, 1),
(611, 20132, 6, 11240, 1, 1),
(611, 20132, 6, 11241, 1, 1),
(611, 20132, 6, 11242, 1, 1),
(611, 20151, 6, 11236, 1, 1),
(611, 20151, 6, 11237, 1, 1),
(611, 20151, 6, 11238, 1, 1),
(611, 20151, 6, 11239, 1, 1),
(611, 20151, 6, 11240, 1, 1),
(611, 20151, 6, 11241, 1, 1),
(612, 20132, 6, 11236, 1, 1),
(612, 20132, 6, 11237, 1, 1),
(612, 20132, 6, 11238, 1, 1),
(612, 20132, 6, 11239, 1, 1),
(612, 20132, 6, 11240, 1, 1),
(612, 20132, 6, 11241, 1, 1),
(612, 20132, 6, 11242, 1, 1),
(612, 20151, 6, 11236, 1, 1),
(612, 20151, 6, 11237, 1, 1),
(612, 20151, 6, 11238, 1, 1),
(612, 20151, 6, 11239, 1, 1),
(612, 20151, 6, 11240, 1, 1),
(612, 20151, 6, 11241, 1, 1),
(613, 20151, 6, 11236, 1, 1),
(613, 20151, 6, 11237, 1, 1),
(613, 20151, 6, 11238, 1, 1),
(613, 20151, 6, 11239, 1, 1),
(613, 20151, 6, 11240, 1, 1),
(613, 20151, 6, 11241, 1, 1),
(614, 20151, 6, 11236, 1, 1),
(614, 20151, 6, 11237, 1, 1),
(614, 20151, 6, 11238, 1, 1),
(614, 20151, 6, 11239, 1, 1),
(614, 20151, 6, 11240, 1, 1),
(614, 20151, 6, 11241, 1, 1),
(615, 20151, 6, 11236, 1, 1),
(615, 20151, 6, 11237, 1, 1),
(615, 20151, 6, 11238, 1, 1),
(615, 20151, 6, 11239, 1, 1),
(615, 20151, 6, 11240, 1, 1),
(615, 20151, 6, 11241, 1, 1),
(616, 20151, 6, 11236, 1, 1),
(616, 20151, 6, 11237, 1, 1),
(616, 20151, 6, 11238, 1, 1),
(616, 20151, 6, 11239, 1, 1),
(616, 20151, 6, 11240, 1, 1),
(616, 20151, 6, 11241, 1, 1),
(621, 20151, 6, 11243, 2, 1),
(621, 20151, 6, 11244, 2, 1),
(621, 20151, 6, 11245, 2, 1),
(621, 20151, 6, 11246, 2, 1),
(621, 20151, 6, 11247, 2, 1),
(621, 20151, 6, 11248, 2, 1),
(621, 20151, 6, 11249, 2, 1),
(622, 20151, 6, 11243, 2, 1),
(622, 20151, 6, 11244, 2, 1),
(622, 20151, 6, 11245, 2, 1),
(622, 20151, 6, 11246, 2, 1),
(622, 20151, 6, 11247, 2, 1),
(622, 20151, 6, 11248, 2, 1),
(622, 20151, 6, 11249, 2, 1),
(623, 20151, 6, 11243, 2, 1),
(623, 20151, 6, 11244, 2, 1),
(623, 20151, 6, 11245, 2, 1),
(623, 20151, 6, 11246, 2, 1),
(623, 20151, 6, 11247, 2, 1),
(623, 20151, 6, 11248, 2, 1),
(623, 20151, 6, 11249, 2, 1),
(624, 20151, 6, 11243, 2, 1),
(624, 20151, 6, 11244, 2, 1),
(624, 20151, 6, 11245, 2, 1),
(624, 20151, 6, 11246, 2, 1),
(624, 20151, 6, 11247, 2, 1),
(624, 20151, 6, 11248, 2, 1),
(624, 20151, 6, 11249, 2, 1),
(625, 20151, 6, 11243, 2, 1),
(625, 20151, 6, 11244, 2, 1),
(625, 20151, 6, 11245, 2, 1),
(625, 20151, 6, 11246, 2, 1),
(625, 20151, 6, 11247, 2, 1),
(625, 20151, 6, 11248, 2, 1),
(625, 20151, 6, 11249, 2, 1),
(626, 20151, 6, 11243, 2, 1),
(626, 20151, 6, 11244, 2, 1),
(626, 20151, 6, 11245, 2, 1),
(626, 20151, 6, 11246, 2, 1),
(626, 20151, 6, 11247, 2, 1),
(626, 20151, 6, 11248, 2, 1),
(626, 20151, 6, 11249, 2, 1),
(627, 20151, 6, 11243, 2, 1),
(627, 20151, 6, 11244, 2, 1),
(627, 20151, 6, 11245, 2, 1),
(627, 20151, 6, 11246, 2, 1),
(627, 20151, 6, 11247, 2, 1),
(627, 20151, 6, 11248, 2, 1),
(627, 20151, 6, 11249, 2, 1),
(628, 20151, 6, 11243, 2, 1),
(628, 20151, 6, 11244, 2, 1),
(628, 20151, 6, 11245, 2, 1),
(628, 20151, 6, 11246, 2, 1),
(628, 20151, 6, 11247, 2, 1),
(628, 20151, 6, 11248, 2, 1),
(628, 20151, 6, 11249, 2, 1),
(629, 20151, 6, 11243, 2, 1),
(629, 20151, 6, 11244, 2, 1),
(629, 20151, 6, 11245, 2, 1),
(629, 20151, 6, 11246, 2, 1),
(629, 20151, 6, 11247, 2, 1),
(629, 20151, 6, 11248, 2, 1),
(629, 20151, 6, 11249, 2, 1),
(630, 20151, 6, 11243, 2, 1),
(630, 20151, 6, 11244, 2, 1),
(630, 20151, 6, 11245, 2, 1),
(630, 20151, 6, 11246, 2, 1),
(630, 20151, 6, 11247, 2, 1),
(630, 20151, 6, 11248, 2, 1),
(630, 20151, 6, 11249, 2, 1),
(631, 20151, 6, 11243, 2, 1),
(631, 20151, 6, 11244, 2, 1),
(631, 20151, 6, 11245, 2, 1),
(631, 20151, 6, 11246, 2, 1),
(631, 20151, 6, 11247, 2, 1),
(631, 20151, 6, 11248, 2, 1),
(631, 20151, 6, 11249, 2, 1),
(632, 20151, 6, 11243, 2, 1),
(632, 20151, 6, 11244, 2, 1),
(632, 20151, 6, 11245, 2, 1),
(632, 20151, 6, 11246, 2, 1),
(632, 20151, 6, 11247, 2, 1),
(632, 20151, 6, 11248, 2, 1),
(632, 20151, 6, 11249, 2, 1),
(633, 20151, 6, 11243, 2, 1),
(633, 20151, 6, 11244, 2, 1),
(633, 20151, 6, 11245, 2, 1),
(633, 20151, 6, 11246, 2, 1),
(633, 20151, 6, 11247, 2, 1),
(633, 20151, 6, 11248, 2, 1),
(633, 20151, 6, 11249, 2, 1),
(634, 20151, 6, 11243, 2, 1),
(634, 20151, 6, 11244, 2, 1),
(634, 20151, 6, 11245, 2, 1),
(634, 20151, 6, 11246, 2, 1),
(634, 20151, 6, 11247, 2, 1),
(634, 20151, 6, 11248, 2, 1),
(634, 20151, 6, 11249, 2, 1),
(635, 20151, 6, 11243, 2, 1),
(635, 20151, 6, 11244, 2, 1),
(635, 20151, 6, 11245, 2, 1),
(635, 20151, 6, 11246, 2, 1),
(635, 20151, 6, 11247, 2, 1),
(635, 20151, 6, 11248, 2, 1),
(635, 20151, 6, 11249, 2, 1),
(636, 20151, 6, 11243, 2, 1),
(636, 20151, 6, 11244, 2, 1),
(636, 20151, 6, 11245, 2, 1),
(636, 20151, 6, 11246, 2, 1),
(636, 20151, 6, 11247, 2, 1),
(636, 20151, 6, 11248, 2, 1),
(636, 20151, 6, 11249, 2, 1);

--
-- Disparadores `carga`
--
DROP TRIGGER IF EXISTS `bit_D_carga`;
DELIMITER //
CREATE TRIGGER `bit_D_carga` AFTER DELETE ON `carga`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *carga*
-- Uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Julio 2014 
-- -----------------------------------------------------
	INSERT INTO  `bitacora`
		(tabla, usuario, operacion, fecha,registro_old) 
	VALUES 
		('carga', OLD.users_id, 'D',curdate(),concat_WS('|',
          	OLD.grupo,
          	OLD.periodo,
          	OLD.programaedu,
			OLD.uaprendizaje,
			OLD.semestre
        ));   
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_carga`;
DELIMITER //
CREATE TRIGGER `bit_I_carga` AFTER INSERT ON `carga`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *carga*
-- Uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Julio 2014 
-- -----------------------------------------------------
	INSERT INTO  `bitacora`
		(tabla, usuario, operacion, fecha,registro) 
	VALUES 
		('carga', NEW.users_id, 'I',curdate(),concat_WS('|',
          	NEW.grupo,
          	NEW.periodo,
          	NEW.programaedu,
			NEW.uaprendizaje,
			NEW.semestre
        ));   
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_carga`;
DELIMITER //
CREATE TRIGGER `bit_U_carga` AFTER UPDATE ON `carga`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *carga*
-- Uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Oct 2014 
-- -----------------------------------------------------
	INSERT INTO  `bitacora`
		(tabla, usuario, operacion, fecha,registro,registro_old) 
	VALUES 
		('carga', NEW.users_id, 'U',curdate(),concat_WS('|',
          	OLD.grupo,
          	OLD.periodo,
          	OLD.programaedu,
			OLD.uaprendizaje,
			OLD.semestre
        ),
        concat_WS('|',
          	OLD.grupo,
          	OLD.periodo,
          	OLD.programaedu,
			OLD.uaprendizaje,
			OLD.semestre
        ));   
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras_emp`
--

CREATE TABLE IF NOT EXISTS `carreras_emp` (
  `carrera` int(11) NOT NULL COMMENT 'Carrera emp',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripcion carrera emp',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`carrera`),
  KEY `fk_carreras_emp_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carreras_emp`
--

INSERT INTO `carreras_emp` (`carrera`, `descripcion`, `users_id`) VALUES
(1, 'LICENCIADO EN INFORMATICA', 1),
(2, 'LICENCIADO EN CONTADURIA', 1),
(3, 'LICENCIADO EN NEGOCIOS INTERNACIONALES', 18),
(4, 'LICENCIADO EN ADMINISTRACION DE EMPRESAS', 18),
(5, 'INGENIERO EN SISTEMAS', 1),
(6, 'MAESTRIA EN TECNOLOGIAS DE LA INFORMACION Y LA COMUNICACION', 9);

--
-- Disparadores `carreras_emp`
--
DROP TRIGGER IF EXISTS `bit_D_carreras_emp`;
DELIMITER //
CREATE TRIGGER `bit_D_carreras_emp` AFTER DELETE ON `carreras_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *carreras_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'carreras_emp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.carrera, 
OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_carreras_emp`;
DELIMITER //
CREATE TRIGGER `bit_I_carreras_emp` AFTER INSERT ON `carreras_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *carreras_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'carreras_emp', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.carrera, 
NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_carreras_emp`;
DELIMITER //
CREATE TRIGGER `bit_U_carreras_emp` AFTER UPDATE ON `carreras_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *carreras_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'carreras_emp', NEW.users_id, 'U', curdate( ) , concat_WS( '|',NEW.carrera, NEW.descripcion ),
concat_WS( '|',OLD.carrera, OLD.descripcion ) 
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `categoria` int(11) NOT NULL COMMENT 'Categoria contrato',
  `descripcion` varchar(45) NOT NULL COMMENT 'Descripcion (Tiempo Completo, Asignatura)',
  `nivel` char(1) DEFAULT NULL COMMENT 'Nivel',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`categoria`),
  KEY `fk_categorias_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categoria`, `descripcion`, `nivel`, `users_id`) VALUES
(101, 'PROFESOR ORDINARIO DE ASIGNATURA NIVEL A', NULL, 1),
(102, 'PROFESOR ORDINARIO DE ASIGNATURA NIVEL B', NULL, 1),
(103, 'PROFESOR ORDINARIO DE ASIGNATURA NIVEL C', NULL, 1),
(104, 'PROFESOR ORDINARIO DE CARRERA NIVEL A', NULL, 1),
(105, 'PROFESOR ORDINARIO DE CARRERA NIVEL B', NULL, 1);

--
-- Disparadores `categorias`
--
DROP TRIGGER IF EXISTS `bit_D_categorias`;
DELIMITER //
CREATE TRIGGER `bit_D_categorias` AFTER DELETE ON `categorias`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *categorias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'categoria', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.categoria, 
OLD.descripcion, 
OLD.nivel ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_categorias`;
DELIMITER //
CREATE TRIGGER `bit_I_categorias` AFTER INSERT ON `categorias`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *categorias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'categoria', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.categoria, 
NEW.descripcion, 
NEW.nivel ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_categorias`;
DELIMITER //
CREATE TRIGGER `bit_U_categorias` AFTER UPDATE ON `categorias`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *categorias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'categoria', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.categoria, 
NEW.descripcion, 
NEW.nivel ),
concat_WS( '|', 
OLD.categoria, 
OLD.descripcion, 
OLD.nivel )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE IF NOT EXISTS `ciudad` (
  `ciudad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo Ciudad',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripcion Ciudad',
  `estado` int(11) NOT NULL DEFAULT '2' COMMENT 'Codigo estado',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`ciudad`),
  UNIQUE KEY `CD_codigo_UNIQUE` (`ciudad`),
  KEY `fk_ciudad_estado1_idx` (`estado`),
  KEY `fk_ciudad_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=651 ;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`ciudad`, `descripcion`, `estado`, `users_id`) VALUES
(1, 'AGUASCALIENTES', 1, 1),
(2, 'ASIENTOS', 1, 1),
(3, 'CALVILLO', 1, 1),
(4, 'COSÍO', 1, 1),
(5, 'JESÚS MARÍA', 1, 1),
(6, 'PABELLÓN DE ARTEAGA', 1, 1),
(7, 'RINCÓN DE ROMOS', 1, 1),
(8, 'SAN FRANCISCO DE LOS ROMO', 1, 1),
(9, 'TEPEZALÁ', 1, 1),
(10, 'ENSENADA', 2, 1),
(11, 'MEXICALI', 2, 1),
(12, 'PLAYAS DE ROSARITO', 2, 1),
(13, 'RODOLFO SÁNCHEZ T. (MANEADERO)', 2, 1),
(14, 'SAN FELIPE', 2, 1),
(15, 'TECATE', 2, 1),
(16, 'TIJUANA', 2, 1),
(17, 'CABO SAN LUCAS', 3, 1),
(18, 'CIUDAD CONSTITUCIÓN', 3, 1),
(19, 'GUERRERO NEGRO', 3, 1),
(20, 'HEROICA MULEGÉ', 3, 1),
(21, 'LA PAZ', 3, 1),
(22, 'LORETO', 3, 1),
(23, 'PUERTO ADOLFO LÓPEZ MATEOS', 3, 1),
(24, 'SAN IGNACIO', 3, 1),
(25, 'SAN JOSÉ DEL CABO', 3, 1),
(26, 'TODOS SANTOS', 3, 1),
(27, 'VILLA ALBERTO ANDRÉS ALVARADO ARÁMBURO', 3, 1),
(28, 'CALKINI', 4, 1),
(29, 'CANDELARIA', 4, 1),
(30, 'CHAMPOTÓN', 4, 1),
(31, 'CIUDAD DEL CARMEN', 4, 1),
(32, 'ESCÁRCEGA', 4, 1),
(33, 'HECELCHAKÁN', 4, 1),
(34, 'HOPELCHÉN', 4, 1),
(35, 'POMUCH', 4, 1),
(36, 'SABANCUY', 4, 1),
(37, 'SAN FRANCISCO DE CAMPECHE', 4, 1),
(38, 'ALLENDE', 5, 1),
(39, 'ARTEAGA', 5, 1),
(40, 'CASTAÑOS', 5, 1),
(41, 'CIUDAD ACUÑA', 5, 1),
(42, 'CIUDAD MELCHOR MÚZQUIZ', 5, 1),
(43, 'CUATRO CIÉNEGAS DE CARRANZA', 5, 1),
(44, 'FRANCISCO I. MADERO (CHÁVEZ)', 5, 1),
(45, 'FRONTERA', 5, 1),
(46, 'MATAMOROS', 5, 1),
(47, 'MONCLOVA', 5, 1),
(48, 'MORELOS', 5, 1),
(49, 'NADADORES', 5, 1),
(50, 'NAVA', 5, 1),
(51, 'NUEVA ROSITA', 5, 1),
(52, 'PARRAS DE LA FUENTE', 5, 1),
(53, 'PIEDRAS NEGRAS', 5, 1),
(54, 'RAMOS ARIZPE', 5, 1),
(55, 'SABINAS', 5, 1),
(56, 'SALTILLO', 5, 1),
(57, 'SAN BUENAVENTURA', 5, 1),
(58, 'SAN PEDRO', 5, 1),
(59, 'TORREÓN', 5, 1),
(60, 'VIESCA', 5, 1),
(61, 'ZARAGOZA', 5, 1),
(62, 'CIUDAD DE ARMERÍA', 6, 1),
(63, 'CIUDAD DE VILLA DE ÁLVAREZ', 6, 1),
(64, 'CIUDAD DE VILLA DE ÁLVAREZ', 6, 1),
(65, 'COLIMA', 6, 1),
(66, 'MANZANILLO', 6, 1),
(67, 'TECOMAN', 6, 1),
(68, 'ACALA', 7, 1),
(69, 'ARRIAGA', 7, 1),
(70, 'CACAHOATÁN', 7, 1),
(71, 'CHIAPA DE CORZO', 7, 1),
(72, 'CINTALAPA DE FIGUEROA', 7, 1),
(73, 'COMITÁN DE DOMÍNGUEZ', 7, 1),
(74, 'HUIXTLA', 7, 1),
(75, 'JIQUIPILAS', 7, 1),
(76, 'LAS MARGARITAS', 7, 1),
(77, 'LAS ROSAS', 7, 1),
(78, 'MAPASTEPEC', 7, 1),
(79, 'MOTOZINTLA DE MENDOZA', 7, 1),
(80, 'OCOSINGO', 7, 1),
(81, 'OCOZOCOAUTLA DE ESPINOSA', 7, 1),
(82, 'PALENQUE', 7, 1),
(83, 'PICHUCALCO', 7, 1),
(84, 'PIJIJIAPAN', 7, 1),
(85, 'PUERTO MADERO (SAN BENITO)', 7, 1),
(86, 'REFORMA', 7, 1),
(87, 'SAN CRISTÓBAL DE LAS CASAS', 7, 1),
(88, 'TAPACHULA DE CÓRDOVA Y ORDÓÑEZ', 7, 1),
(89, 'TONALÁ', 7, 1),
(90, 'TUXTLA GUTIÉRREZ', 7, 1),
(91, 'VENUSTIANO CARRANZA', 7, 1),
(92, 'VILLAFLORES', 7, 1),
(93, 'BACHÍNIVA', 8, 1),
(94, 'CHIHUAHUA', 8, 1),
(95, 'COLONIA ANÁHUAC', 8, 1),
(96, 'CUAUHTÉMOC', 8, 1),
(97, 'DELICIAS', 8, 1),
(98, 'HIDALGO DEL PARRAL', 8, 1),
(99, 'JOSÉ MARIANO JIMÉNEZ', 8, 1),
(100, 'JUAN ALDAMA', 8, 1),
(101, 'JUÁREZ', 8, 1),
(102, 'MADERA', 8, 1),
(103, 'MANUEL OJINAGA', 8, 1),
(104, 'NUEVO CASAS GRANDES', 8, 1),
(105, 'SANTA ROSALÍA DE CAMARGO', 8, 1),
(106, 'SAUCILLO', 8, 1),
(107, 'CIUDAD DE MÉXICO', 9, 1),
(108, 'CANATLÁN', 10, 1),
(109, 'CIUDAD LERDO', 10, 1),
(110, 'EL SALTO', 10, 1),
(111, 'FRANCISCO I. MADERO', 10, 1),
(112, 'GÓMEZ PALACIO', 10, 1),
(113, 'NOMBRE DE DIOS', 10, 1),
(114, 'PEÑÓN BLANCO', 10, 1),
(115, 'SAN JUAN DEL RÍO DEL CENTAURO DEL NORTE', 10, 1),
(116, 'SANTA MARÍA DEL ORO', 10, 1),
(117, 'SANTIAGO PAPASQUIARO', 10, 1),
(118, 'VICENTE GUERRERO', 10, 1),
(119, 'VICTORIA DE DURANGO', 10, 1),
(120, 'ABASOLO', 11, 1),
(121, 'ACÁMBARO', 11, 1),
(122, 'APASEO EL ALTO', 11, 1),
(123, 'APASEO EL GRANDE', 11, 1),
(124, 'CELAYA', 11, 1),
(125, 'CIUDAD MANUEL DOBLADO', 11, 1),
(126, 'COMONFORT', 11, 1),
(127, 'CORTAZAR', 11, 1),
(128, 'CUERÁMARO', 11, 1),
(129, 'DOCTOR MORA', 11, 1),
(130, 'DOLORES HIDALGO CUNA DE LA INDEPENDENCIA NACIONAL', 11, 1),
(131, 'EMPALME ESCOBEDO (ESCOBEDO)', 11, 1),
(132, 'GUANAJUATO', 11, 1),
(133, 'HUANÍMARO', 11, 1),
(134, 'IRAPUATO', 11, 1),
(135, 'JARAL DEL PROGRESO', 11, 1),
(136, 'JERÉCUARO', 11, 1),
(137, 'LEÓN DE LOS ALDAMA', 11, 1),
(138, 'MARFIL', 11, 1),
(139, 'MOROLEÓN', 11, 1),
(140, 'PÉNJAMO', 11, 1),
(141, 'PURÍSIMA DE BUSTOS', 11, 1),
(142, 'RINCÓN DE TAMAYO', 11, 1),
(143, 'ROMITA', 11, 1),
(144, 'SALAMANCA', 11, 1),
(145, 'SALVATIERRA', 11, 1),
(146, 'SAN DIEGO DE LA UNIÓN', 11, 1),
(147, 'SAN FRANCISCO DEL RINCÓN', 11, 1),
(148, 'SAN JOSÉ ITURBIDE', 11, 1),
(149, 'SAN LUIS DE LA PAZ', 11, 1),
(150, 'SAN MIGUEL DE ALLENDE', 11, 1),
(151, 'SANTA CRUZ JUVENTINO ROSAS', 11, 1),
(152, 'SANTIAGO MARAVATÍO', 11, 1),
(153, 'SILAO', 11, 1),
(154, 'TARANDACUAO', 11, 1),
(155, 'URIANGATO', 11, 1),
(156, 'VALLE DE SANTIAGO', 11, 1),
(157, 'VILLAGRÁN', 11, 1),
(158, 'YURIRIA', 11, 1),
(159, 'ACAPULCO DE JUÁREZ', 12, 1),
(160, 'ARCELIA', 12, 1),
(161, 'ATOYAC DE ÁLVAREZ', 12, 1),
(162, 'AYUTLA DE LOS LIBRES', 12, 1),
(163, 'AZOYÚ', 12, 1),
(164, 'BUENAVISTA DE CUELLAR', 12, 1),
(165, 'CHILAPA DE ÁLVAREZ', 12, 1),
(166, 'CHILPANCINGO DE LOS BRAVO', 12, 1),
(167, 'CIUDAD ALTAMIRANO', 12, 1),
(168, 'CIUDAD APAXTLA DE CASTREJÓN', 12, 1),
(169, 'COPALA', 12, 1),
(170, 'COYUCA DE BENÍTEZ', 12, 1),
(171, 'COYUCA DE CATALÁN', 12, 1),
(172, 'CRUZ GRANDE', 12, 1),
(173, 'CUAJINICUILAPA', 12, 1),
(174, 'CUTZAMALA DE PINZÓN', 12, 1),
(175, 'HUAMUXTITLAN', 12, 1),
(176, 'HUITZUCO', 12, 1),
(177, 'IGUALA DE LA INDEPENDENCIA', 12, 1),
(178, 'LA UNIÓN', 12, 1),
(179, 'MARQUELIA', 12, 1),
(180, 'OCOTITO', 12, 1),
(181, 'OLINALÁ', 12, 1),
(182, 'PETATLÁN', 12, 1),
(183, 'SAN JERÓNIMO DE JUÁREZ', 12, 1),
(184, 'SAN LUIS ACATLÁN', 12, 1),
(185, 'SAN LUIS DE LA LOMA', 12, 1),
(186, 'SAN LUIS SAN PEDRO', 12, 1),
(187, 'SAN MARCOS', 12, 1),
(188, 'TAXCO DE ALARCÓN', 12, 1),
(189, 'TÉCPAN DE GALEANA', 12, 1),
(190, 'TELOLOAPAN', 12, 1),
(191, 'TEPECOACUILCO DE TRUJANO', 12, 1),
(192, 'TIERRA COLORADA', 12, 1),
(193, 'TIXTLA DE GUERRERO', 12, 1),
(194, 'TLALIXTAQUILLA', 12, 1),
(195, 'TLAPA DE COMONFORT', 12, 1),
(196, 'TLAPEHUALA', 12, 1),
(197, 'ZIHUATANEJO', 12, 1),
(198, 'ZUMPANGO DEL RÍO', 12, 1),
(199, 'ACTOPAN', 13, 1),
(200, 'APAN', 13, 1),
(201, 'CIUDAD DE FRAY BERNARDINO DE SAHAGÚN', 13, 1),
(202, 'CRUZ AZUL', 13, 1),
(203, 'HUEJUTLA DE REYES', 13, 1),
(204, 'IXMIQUILPAN', 13, 1),
(205, 'PACHUCA DE SOTO', 13, 1),
(206, 'SANTIAGO TULANTEPEC', 13, 1),
(207, 'TEPEAPULCO', 13, 1),
(208, 'TEPEJI DEL RIO', 13, 1),
(209, 'TIZAYUCA', 13, 1),
(210, 'TLAXCOAPAN', 13, 1),
(211, 'TULA DE ALLENDE', 13, 1),
(212, 'TULANCINGO', 13, 1),
(213, 'ZIMAPAN', 13, 1),
(214, 'ACATLÁN DE JUÁREZ', 14, 1),
(215, 'AHUALULCO DE MERCADO', 14, 1),
(216, 'AJIJIC', 14, 1),
(217, 'AMECA', 14, 1),
(218, 'ARANDAS', 14, 1),
(219, 'ATOTONILCO EL ALTO', 14, 1),
(220, 'AUTLÁN DE NAVARRO', 14, 1),
(221, 'CHAPALA', 14, 1),
(222, 'CIHUATLÁN', 14, 1),
(223, 'CIUDAD GUZMÁN', 14, 1),
(224, 'COCULA', 14, 1),
(225, 'COLOTLÁN', 14, 1),
(226, 'EL GRULLO', 14, 1),
(227, 'EL QUINCE (SAN JOSÉ EL QUINCE)', 14, 1),
(228, 'ETZATLÁN', 14, 1),
(229, 'GUADALAJARA', 14, 1),
(230, 'HUEJUQUILLA EL ALTO', 14, 1),
(231, 'JALOSTOTITLÁN', 14, 1),
(232, 'JAMAY', 14, 1),
(233, 'JOCOTEPEC', 14, 1),
(234, 'LA BARCA', 14, 1),
(235, 'LA RESOLANA', 14, 1),
(236, 'LAGOS DE MORENO', 14, 1),
(237, 'LAS PINTITAS', 14, 1),
(238, 'MAGDALENA', 14, 1),
(239, 'OCOTLÁN', 14, 1),
(240, 'PONCITLÁN', 14, 1),
(241, 'PUERTO VALLARTA', 14, 1),
(242, 'SAN DIEGO DE ALEJANDRÍA', 14, 1),
(243, 'SAN IGNACIO CERRO GORDO', 14, 1),
(244, 'SAN JOSÉ EL VERDE (EL VERDE)', 14, 1),
(245, 'SAN JUAN DE LOS LAGOS', 14, 1),
(246, 'SAN JULIÁN', 14, 1),
(247, 'SAN MIGUEL EL ALTO', 14, 1),
(248, 'SAYULA', 14, 1),
(249, 'TALA', 14, 1),
(250, 'TALPA DE ALLENDE', 14, 1),
(251, 'TAMAZULA DE GORDIANO', 14, 1),
(252, 'TECALITLÁN', 14, 1),
(253, 'TEOCALTICHE', 14, 1),
(254, 'TEPATITLÁN DE MORELOS', 14, 1),
(255, 'TEQUILA', 14, 1),
(256, 'TLAJOMULCO DE ZÚÑIGA', 14, 1),
(257, 'TLAQUEPAQUE', 14, 1),
(258, 'TONALÁ', 14, 1),
(259, 'TOTOTLÁN', 14, 1),
(260, 'TUXPAN', 14, 1),
(261, 'UNIÓN DE SAN ANTONIO', 14, 1),
(262, 'VALLE DE GUADALUPE', 14, 1),
(263, 'VILLA CORONA', 14, 1),
(264, 'VILLA HIDALGO', 14, 1),
(265, 'YAHUALICA DE GONZÁLEZ GALLO', 14, 1),
(266, 'ZACOALCO DE TORRES', 14, 1),
(267, 'ZAPOPAN', 14, 1),
(268, 'ZAPOTILTIC', 14, 1),
(269, 'ALMOLOYA DE JUÁREZ', 15, 1),
(270, 'AMATEPEC', 15, 1),
(271, 'CAPULHUAC', 15, 1),
(272, 'CHALCO DE DÍAZ COVARRUBIAS', 15, 1),
(273, 'CHICONCUAC', 15, 1),
(274, 'CHIMALHUACÁN', 15, 1),
(275, 'CIUDAD ADOLFO LÓPEZ MATEOS', 15, 1),
(276, 'CIUDAD NEZAHUALCOYOTL', 15, 1),
(277, 'COACALCO DE BERRIOZABAL', 15, 1),
(278, 'CUAUTITLÁN', 15, 1),
(279, 'CUAUTITLÁN IZCALLI', 15, 1),
(280, 'ECATEPEC DE MORELOS', 15, 1),
(281, 'HUIXQUILUCAN DE DEGOLLADO', 15, 1),
(282, 'IXTAPALUCA', 15, 1),
(283, 'JUCHITEPEC DE MARIANO RIVA PALACIO', 15, 1),
(284, 'LOS REYES ACAQUILPAN (LA PAZ)', 15, 1),
(285, 'MELCHOR OCAMPO', 15, 1),
(286, 'METEPEC', 15, 1),
(287, 'NAUCALPAN DE JUÁREZ', 15, 1),
(288, 'OCOYOACAC', 15, 1),
(289, 'SAN MATEO ATENCO', 15, 1),
(290, 'SAN VICENTE CHICOLOAPAN DE JUÁREZ', 15, 1),
(291, 'SANTA MARIA TULTEPEC', 15, 1),
(292, 'TECAMAC DE FELIPE VILLANUEVA', 15, 1),
(293, 'TEJUPILCO DE HIDALGO', 15, 1),
(294, 'TEPOTZOTLÁN', 15, 1),
(295, 'TEQUIXQUIAC', 15, 1),
(296, 'TEXCOCO DE MORA', 15, 1),
(297, 'TLALNEPANTLA DE BAZ', 15, 1),
(298, 'TOLUCA DE LERDO', 15, 1),
(299, 'TULTITLÁN DE MARIANO ESCOBEDO', 15, 1),
(300, 'VALLE DE CHALCO SOLIDARIDAD', 15, 1),
(301, 'VILLA NICOLÁS ROMERO', 15, 1),
(302, 'XONACATLÁN', 15, 1),
(303, 'ZUMPANGO', 15, 1),
(304, 'APATZINGÁN DE LA CONSTITUCIÓN', 16, 1),
(305, 'CIUDAD HIDALGO', 16, 1),
(306, 'CIUDAD LÁZARO CÁRDENAS', 16, 1),
(307, 'COTIJA DE LA PAZ', 16, 1),
(308, 'CUITZEO DEL PORVENIR', 16, 1),
(309, 'HEROICA ZITÁCUARO', 16, 1),
(310, 'HUETAMO DE NÚÑEZ', 16, 1),
(311, 'JACONA DE PLANCARTE', 16, 1),
(312, 'JIQUILPAN DE JUÁREZ', 16, 1),
(313, 'LA PIEDAD DE CABADAS', 16, 1),
(314, 'LAS GUACAMAYAS', 16, 1),
(315, 'LOS REYES DE SALGADO', 16, 1),
(316, 'MARAVATÍO DE OCAMPO', 16, 1),
(317, 'MORELIA', 16, 1),
(318, 'NUEVA ITALIA DE RUIZ', 16, 1),
(319, 'PARACHO DE VERDUZCO', 16, 1),
(320, 'PÁTZCUARO', 16, 1),
(321, 'PURUÁNDIRO', 16, 1),
(322, 'SAHUAYO DE MORELOS', 16, 1),
(323, 'TACÁMBARO DE CODALLOS', 16, 1),
(324, 'TANGANCÍCUARO DE ARISTA', 16, 1),
(325, 'TUXPAN', 16, 1),
(326, 'URUAPAN', 16, 1),
(327, 'YURÉCUARO', 16, 1),
(328, 'ZACAPU', 16, 1),
(329, 'ZAMORA DE HIDALGO', 16, 1),
(330, 'ZINAPÉCUARO DE FIGUEROA', 16, 1),
(331, 'CUAUTLA (CUAUTLA DE MORELOS)', 17, 1),
(332, 'CUERNAVACA', 17, 1),
(333, 'GALEANA', 17, 1),
(334, 'JOJUTLA', 17, 1),
(335, 'PUENTE DE IXTLA', 17, 1),
(336, 'SANTA ROSA TREINTA', 17, 1),
(337, 'TLAQUILTENANGO', 17, 1),
(338, 'ZACATEPEC DE HIDALGO', 17, 1),
(339, 'ACAPONETA', 18, 1),
(340, 'AHUACATLÁN', 18, 1),
(341, 'BUCERÍAS', 18, 1),
(342, 'COMPOSTELA', 18, 1),
(343, 'FRANCISCO I. MADERO (PUGA)', 18, 1),
(344, 'IXTLÁN DEL RÍO', 18, 1),
(345, 'JALA', 18, 1),
(346, 'LA PEÑITA DE JALTEMBA', 18, 1),
(347, 'LAS VARAS', 18, 1),
(348, 'RUIZ', 18, 1),
(349, 'SAN BLAS', 18, 1),
(350, 'SAN PEDRO LAGUNILLAS', 18, 1),
(351, 'SANTIAGO IXCUINTLA', 18, 1),
(352, 'TECUALA', 18, 1),
(353, 'TEPIC', 18, 1),
(354, 'TUXPAN', 18, 1),
(355, 'VILLA HIDALGO (EL NUEVO)', 18, 1),
(356, 'XALISCO', 18, 1),
(357, 'ANÁHUAC', 19, 1),
(358, 'CADEREYTA JIMÉNEZ', 19, 1),
(359, 'CIÉNEGA DE FLORES', 19, 1),
(360, 'CIUDAD APODACA', 19, 1),
(361, 'CIUDAD BENITO JUÁREZ', 19, 1),
(362, 'CIUDAD GENERAL ESCOBEDO', 19, 1),
(363, 'CIUDAD SABINAS HIDALGO', 19, 1),
(364, 'CIUDAD SANTA CATARINA', 19, 1),
(365, 'CIUDAD SANTA CATARINA', 19, 1),
(366, 'DOCTOR ARROYO', 19, 1),
(367, 'EL CERCADO', 19, 1),
(368, 'GARCÍA', 19, 1),
(369, 'GUADALUPE', 19, 1),
(370, 'HUALAHUISES', 19, 1),
(371, 'LINARES', 19, 1),
(372, 'MONTEMORELOS', 19, 1),
(373, 'MONTERREY', 19, 1),
(374, 'SAN NICOLÁS DE LOS GARZA', 19, 1),
(375, 'SAN PEDRO GARZA GARCÍA', 19, 1),
(376, 'SANTIAGO', 19, 1),
(377, 'ASUNCIÓN NOCHIXTLÁN', 20, 1),
(378, 'BAHIAS DE HUATULCO', 20, 1),
(379, 'CHAHUITES', 20, 1),
(380, 'CIUDAD IXTEPEC', 20, 1),
(381, 'COSOLAPA', 20, 1),
(382, 'CUILÁPAM DE GUERRERO', 20, 1),
(383, 'EL CAMARÓN', 20, 1),
(384, 'EL ROSARIO', 20, 1),
(385, 'HEROICA CIUDAD DE EJUTLA DE CRESPO', 20, 1),
(386, 'HEROICA CIUDAD DE HUAJUAPAN DE LEÓN', 20, 1),
(387, 'HEROICA CIUDAD DE TLAXIACO', 20, 1),
(388, 'JUCHITÁN (JUCHITÁN DE ZARAGOZA)', 20, 1),
(389, 'LAGUNAS', 20, 1),
(390, 'LOMA BONITA', 20, 1),
(391, 'MARISCALA DE JUÁREZ', 20, 1),
(392, 'MATÍAS ROMERO AVENDAÑO', 20, 1),
(393, 'MIAHUATLÁN DE PORFIRIO DÍAZ', 20, 1),
(394, 'NATIVIDAD', 20, 1),
(395, 'OAXACA DE JUÁREZ', 20, 1),
(396, 'OCOTLÁN DE MORELOS', 20, 1),
(397, 'PUERTO ESCONDIDO', 20, 1),
(398, 'PUTLA VILLA DE GUERRERO', 20, 1),
(399, 'RÍO GRANDE O PIEDRA PARADA', 20, 1),
(400, 'SALINA CRUZ', 20, 1),
(401, 'SAN ANTONIO DE LA CAL', 20, 1),
(402, 'SAN BLAS ATEMPA', 20, 1),
(403, 'SAN FELIPE JALAPA DE DÍAZ', 20, 1),
(404, 'SAN FRANCISCO IXHUATÁN', 20, 1),
(405, 'SAN FRANCISCO TELIXTLAHUACA', 20, 1),
(406, 'SAN JUAN BAUTISTA CUICATLÁN', 20, 1),
(407, 'SAN JUAN BAUTISTA LO DE SOTO', 20, 1),
(408, 'SAN JUAN BAUTISTA TUXTEPEC', 20, 1),
(409, 'SAN JUAN BAUTISTA VALLE NACIONAL', 20, 1),
(410, 'SAN JUAN CACAHUATEPEC', 20, 1),
(411, 'SAN MIGUEL EL GRANDE', 20, 1),
(412, 'SAN PABLO HUITZO', 20, 1),
(413, 'SAN PABLO VILLA DE MITLA', 20, 1),
(414, 'SAN PEDRO MIXTEPEC -DTO. 22-', 20, 1),
(415, 'SAN PEDRO POCHUTLA', 20, 1),
(416, 'SAN PEDRO TAPANATEPEC', 20, 1),
(417, 'SAN PEDRO TOTOLAPA', 20, 1),
(418, 'SAN SEBASTIÁN TECOMAXTLAHUACA', 20, 1),
(419, 'SANTA CRUZ ITUNDUJIA', 20, 1),
(420, 'SANTA LUCIA DEL CAMINO', 20, 1),
(421, 'SANTA MARÍA HUATULCO', 20, 1),
(422, 'SANTIAGO JAMILTEPEC', 20, 1),
(423, 'SANTIAGO JUXTLAHUACA', 20, 1),
(424, 'SANTIAGO PINOTEPA NACIONAL', 20, 1),
(425, 'SANTIAGO SUCHILQUITONGO', 20, 1),
(426, 'SANTO DOMINGO TEHUANTEPEC', 20, 1),
(427, 'TEOTITLÁN DE FLORES MAGÓN', 20, 1),
(428, 'TLACOLULA DE MATAMOROS', 20, 1),
(429, 'UNIÓN HIDALGO', 20, 1),
(430, 'VICENTE CAMALOTE', 20, 1),
(431, 'VILLA DE TAMAZULÁPAM DEL PROGRESO', 20, 1),
(432, 'VILLA DE ZAACHILA', 20, 1),
(433, 'VILLA SOLA DE VEGA', 20, 1),
(434, 'ZIMATLÁN DE ÁLVAREZ', 20, 1),
(435, 'ACATLÁN DE OSORIO', 21, 1),
(436, 'AMOZOC', 21, 1),
(437, 'ATLIXCO', 21, 1),
(438, 'CIUDAD SERDÁN', 21, 1),
(439, 'CUAUTLANCINGO', 21, 1),
(440, 'HUAUCHINANGO', 21, 1),
(441, 'IZÚCAR DE MATAMOROS', 21, 1),
(442, 'PUEBLA (HEROICA PUEBLA)', 21, 1),
(443, 'SAN ANDRÉS CHOLULA', 21, 1),
(444, 'SAN MARTÍN TEXMELUCAN DE LABASTIDA', 21, 1),
(445, 'SAN PEDRO CHOLULA', 21, 1),
(446, 'TECAMACHALCO', 21, 1),
(447, 'TEHUACAN', 21, 1),
(448, 'TEPEACA', 21, 1),
(449, 'TEZIUTLAN', 21, 1),
(450, 'XICOTEPEC', 21, 1),
(451, 'ZACATLÁN', 21, 1),
(452, 'EL PUEBLITO', 22, 1),
(453, 'QUERÉTARO', 22, 1),
(454, 'SAN JUAN DEL RIO', 22, 1),
(455, 'BACALAR', 23, 1),
(456, 'CANCÚN', 23, 1),
(457, 'CHETUMAL', 23, 1),
(458, 'COZUMEL', 23, 1),
(459, 'FELIPE CARRILLO PUERTO', 23, 1),
(460, 'ISLA MUJERES', 23, 1),
(461, 'KANTUNILKÍN', 23, 1),
(462, 'PLAYA DEL CARMEN', 23, 1),
(463, 'CÁRDENAS', 24, 1),
(464, 'CEDRAL', 24, 1),
(465, 'CERRITOS', 24, 1),
(466, 'CHARCAS', 24, 1),
(467, 'CIUDAD DEL MAÍZ', 24, 1),
(468, 'CIUDAD VALLES', 24, 1),
(469, 'ÉBANO', 24, 1),
(470, 'EL NARANJO', 24, 1),
(471, 'FRACCIÓN EL REFUGIO', 24, 1),
(472, 'MATEHUALA', 24, 1),
(473, 'RIOVERDE', 24, 1),
(474, 'SALINAS DE HIDALGO', 24, 1),
(475, 'SAN LUIS POTOSÍ', 24, 1),
(476, 'SANTA MARÍA DEL RÍO', 24, 1),
(477, 'SOLEDAD DE GRACIANO SÁNCHEZ', 24, 1),
(478, 'TAMASOPO', 24, 1),
(479, 'TAMAZUNCHALE', 24, 1),
(480, 'TAMUIN', 24, 1),
(481, 'TIERRA NUEVA', 24, 1),
(482, 'VILLA DE REYES', 24, 1),
(483, 'AGUARUTO', 25, 1),
(484, 'AHOME', 25, 1),
(485, 'ANGOSTURA', 25, 1),
(486, 'CHOIX', 25, 1),
(487, 'COSALÁ', 25, 1),
(488, 'CULIACÁN ROSALES', 25, 1),
(489, 'EL ROSARIO', 25, 1),
(490, 'ESCUINAPA DE HIDALGO', 25, 1),
(491, 'ESTACIÓN NARANJO', 25, 1),
(492, 'GUAMÚCHIL', 25, 1),
(493, 'GUASAVE', 25, 1),
(494, 'HIGUERA DE ZARAGOZA', 25, 1),
(495, 'LA CRUZ', 25, 1),
(496, 'LIC. BENITO JUÁREZ (CAMPO GOBIERNO)', 25, 1),
(497, 'LOS MOCHIS', 25, 1),
(498, 'MAZATLÁN', 25, 1),
(499, 'MOCORITO', 25, 1),
(500, 'NAVOLATO', 25, 1),
(501, 'QUILA', 25, 1),
(502, 'SAN BLAS', 25, 1),
(503, 'SAN IGNACIO', 25, 1),
(504, 'SINALOA DE LEYVA', 25, 1),
(505, 'TOPOLOBAMPO', 25, 1),
(506, 'VILLA UNIÓN', 25, 1),
(507, 'AGUA PRIETA', 26, 1),
(508, 'CIUDAD OBREGÓN', 26, 1),
(509, 'EMPALME', 26, 1),
(510, 'HERMOSILLO', 26, 1),
(511, 'HEROICA CABORCA', 26, 1),
(512, 'HEROICA CIUDAD DE CANANEA', 26, 1),
(513, 'HEROICA GUAYMAS', 26, 1),
(514, 'HEROICA NOGALES', 26, 1),
(515, 'HUATABAMPO', 26, 1),
(516, 'MAGDALENA DE KINO', 26, 1),
(517, 'NAVOJOA', 26, 1),
(518, 'PUERTO PEÑASCO', 26, 1),
(519, 'SAN LUIS RÍO COLORADO', 26, 1),
(520, 'SONOITA', 26, 1),
(521, 'CÁRDENAS', 27, 1),
(522, 'COMALCALCO', 27, 1),
(523, 'CUNDUACÁN', 27, 1),
(524, 'EMILIANO ZAPATA', 27, 1),
(525, 'FRONTERA', 27, 1),
(526, 'HUIMANGUILLO', 27, 1),
(527, 'JALPA DE MÉNDEZ', 27, 1),
(528, 'MACUSPANA', 27, 1),
(529, 'PARAÍSO', 27, 1),
(530, 'TEAPA', 27, 1),
(531, 'TENOSIQUE DE PINO SUÁREZ', 27, 1),
(532, 'VILLAHERMOSA', 27, 1),
(533, 'ALTAMIRA', 28, 1),
(534, 'CIUDAD CAMARGO', 28, 1),
(535, 'CIUDAD GUSTAVO DÍAZ ORDAZ', 28, 1),
(536, 'CIUDAD MADERO', 28, 1),
(537, 'CIUDAD MANTE', 28, 1),
(538, 'CIUDAD MIGUEL ALEMÁN', 28, 1),
(539, 'CIUDAD RÍO BRAVO', 28, 1),
(540, 'CIUDAD TULA', 28, 1),
(541, 'CIUDAD VICTORIA', 28, 1),
(542, 'ESTACIÓN MANUEL (ÚRSULO GALVÁN)', 28, 1),
(543, 'GONZÁLEZ', 28, 1),
(544, 'HEROICA MATAMOROS', 28, 1),
(545, 'JAUMAVE', 28, 1),
(546, 'NUEVA CIUDAD GUERRERO', 28, 1),
(547, 'NUEVO LAREDO', 28, 1),
(548, 'REYNOSA', 28, 1),
(549, 'SAN FERNANDO', 28, 1),
(550, 'SOTO LA MARINA', 28, 1),
(551, 'TAMPICO', 28, 1),
(552, 'VALLE HERMOSO', 28, 1),
(553, 'XICOTÉNCATL', 28, 1),
(554, 'APIZACO', 29, 1),
(555, 'CALPULALPAN', 29, 1),
(556, 'CHIAUTEMPAN', 29, 1),
(557, 'HUAMANTLA', 29, 1),
(558, 'TLAXCALA (TLAXCALA DE XICOTENCATL)', 29, 1),
(559, 'VILLA VICENTE GUERRERO', 29, 1),
(560, 'ACAYUCAN', 30, 1),
(561, 'AGUA DULCE', 30, 1),
(562, 'ALTOTONGA', 30, 1),
(563, 'ALVARADO', 30, 1),
(564, 'ÁNGEL R. CABADA', 30, 1),
(565, 'ATOYAC', 30, 1),
(566, 'BANDERILLA', 30, 1),
(567, 'BOCA DEL RÍO', 30, 1),
(568, 'CARLOS A. CARRILLO', 30, 1),
(569, 'CATEMACO', 30, 1),
(570, 'CAZONES DE HERRERA', 30, 1),
(571, 'CERRO AZUL', 30, 1),
(572, 'COATEPEC', 30, 1),
(573, 'COATZACOALCOS', 30, 1),
(574, 'COATZINTLA', 30, 1),
(575, 'CÓRDOBA', 30, 1),
(576, 'COSAMALOAPAN', 30, 1),
(577, 'COSOLEACAQUE', 30, 1),
(578, 'CUICHAPA', 30, 1),
(579, 'CUITLÁHUAC', 30, 1),
(580, 'EL HIGO', 30, 1),
(581, 'FORTÍN DE LAS FLORES', 30, 1),
(582, 'GENERAL MIGUEL ALEMÁN (POTRERO NUEVO)', 30, 1),
(583, 'GUTIÉRREZ ZAMORA', 30, 1),
(584, 'HUATUSCO DE CHICUELLAR', 30, 1),
(585, 'HUAYACOCOTLA', 30, 1),
(586, 'HUILOAPAN DE CUAUHTÉMOC', 30, 1),
(587, 'ISLA', 30, 1),
(588, 'IXTACZOQUITLÁN', 30, 1),
(589, 'JÁLTIPAN DE MORELOS', 30, 1),
(590, 'JOSÉ CARDEL', 30, 1),
(591, 'JUAN DÍAZ COVARRUBIAS', 30, 1),
(592, 'JUAN RODRÍGUEZ CLARA', 30, 1),
(593, 'LAS CHOAPAS', 30, 1),
(594, 'LERDO DE TEJADA', 30, 1),
(595, 'MINATITLÁN', 30, 1),
(596, 'NARANJOS', 30, 1),
(597, 'NOGALES', 30, 1),
(598, 'ORIZABA', 30, 1),
(599, 'PÁNUCO', 30, 1),
(600, 'PAPANTLA DE OLARTE', 30, 1),
(601, 'PARAJE NUEVO', 30, 1),
(602, 'PASO DE OVEJAS', 30, 1),
(603, 'PASO DEL MACHO', 30, 1),
(604, 'PLATÓN SÁNCHEZ', 30, 1),
(605, 'PLAYA VICENTE', 30, 1),
(606, 'POZA RICA DE HIDALGO', 30, 1),
(607, 'RÍO BLANCO', 30, 1),
(608, 'SAN ANDRÉS TUXTLA', 30, 1),
(609, 'SAN RAFAEL', 30, 1),
(610, 'SANTIAGO TUXTLA', 30, 1),
(611, 'SIHUAPAN', 30, 1),
(612, 'SOLEDAD DE DOBLADO', 30, 1),
(613, 'TAMPICO ALTO', 30, 1),
(614, 'TANTOYUCA', 30, 1),
(615, 'TEMPOAL DE SÁNCHEZ', 30, 1),
(616, 'TEZONAPA', 30, 1),
(617, 'TIERRA BLANCA', 30, 1),
(618, 'TIHUATLÁN', 30, 1),
(619, 'TLACOJALPAN', 30, 1),
(620, 'TLAPACOYAN', 30, 1),
(621, 'TRES VALLES', 30, 1),
(622, 'TÚXPAM DE RODRÍGUEZ CANO', 30, 1),
(623, 'VERACRUZ', 30, 1),
(624, 'XALAPA-ENRÍQUEZ', 30, 1),
(625, 'YECUATLA', 30, 1),
(626, 'KANASÍN', 31, 1),
(627, 'MÉRIDA', 31, 1),
(628, 'MOTUL DE CARRILLO PUERTO', 31, 1),
(629, 'TICUL', 31, 1),
(630, 'TIZIMÍN', 31, 1),
(631, 'VALLADOLID', 31, 1),
(632, 'CIUDAD CUAUHTÉMOC', 32, 1),
(633, 'FRESNILLO', 32, 1),
(634, 'GUADALUPE', 32, 1),
(635, 'JALPA', 32, 1),
(636, 'JEREZ DE GARCÍA SALINAS', 32, 1),
(637, 'JUAN ALDAMA', 32, 1),
(638, 'LORETO', 32, 1),
(639, 'LUIS MOYA', 32, 1),
(640, 'MOYAHUA DE ESTRADA', 32, 1),
(641, 'NOCHISTLÁN DE MEJÍA', 32, 1),
(642, 'OJOCALIENTE', 32, 1),
(643, 'RÍO GRANDE', 32, 1),
(644, 'SOMBRERETE', 32, 1),
(645, 'VALPARAÍSO', 32, 1),
(646, 'VÍCTOR ROSALES', 32, 1),
(647, 'VILLA DE COS', 32, 1),
(648, 'VILLA HIDALGO', 32, 1),
(649, 'VILLANUEVA', 32, 1),
(650, 'ZACATECAS', 32, 1);

--
-- Disparadores `ciudad`
--
DROP TRIGGER IF EXISTS `bit_D_ciudad`;
DELIMITER //
CREATE TRIGGER `bit_D_ciudad` AFTER DELETE ON `ciudad`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *ciudad*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'ciudad', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.ciudad, 
OLD.descripcion, 
OLD.estado ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_ciudad`;
DELIMITER //
CREATE TRIGGER `bit_I_ciudad` AFTER INSERT ON `ciudad`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *ciudad*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'ciudad', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.ciudad, 
NEW.descripcion, 
NEW.estado ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_ciudad`;
DELIMITER //
CREATE TRIGGER `bit_U_ciudad` AFTER UPDATE ON `ciudad`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *ciudad*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,
registro_old
)
VALUES (
'ciudad', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.ciudad, NEW.descripcion, NEW.estado),
concat_WS( '|', OLD.ciudad, OLD.descripcion, OLD.estado)  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordinaciona`
--

CREATE TABLE IF NOT EXISTS `coordinaciona` (
  `coordinaciona` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id Coordinación',
  `descripcion` varchar(70) NOT NULL COMMENT 'Descripción Coordinación',
  `programaedu` int(11) NOT NULL COMMENT 'Codigo carrera',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`coordinaciona`),
  UNIQUE KEY `CO_codigo_UNIQUE` (`coordinaciona`) USING BTREE,
  KEY `fk_coordinaciona_programaedu1_idx` (`programaedu`),
  KEY `fk_coordinaciona_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `coordinaciona`
--

INSERT INTO `coordinaciona` (`coordinaciona`, `descripcion`, `programaedu`, `users_id`) VALUES
(1, 'CONTABILIDAD BASICA', 6, 11),
(2, 'CONTABILIDAD AVANZADA', 6, 11),
(3, 'CONTABILIDAD DE COSTOS', 6, 11),
(4, 'FINANZAS', 6, 11),
(5, 'AUDITORIA', 6, 11),
(6, 'IMPUESTOS', 6, 11),
(7, 'MERCADOTECNIA', 6, 11),
(8, 'RECURSOS HUMANOS', 6, 11),
(9, 'PRODUCCION', 6, 11),
(10, 'ADMINISTRACION BASICA', 6, 11),
(11, 'ADMINISTRACION AVANZADA', 6, 11),
(12, 'INFORMATICA', 6, 11),
(13, 'MATEMATICAS', 6, 11),
(14, 'CIENCIAS COMPUTACIONALES', 6, 11),
(15, 'SISTEMAS DE INFORMACION', 6, 11),
(16, 'PROGRAMACION', 6, 11),
(17, 'ECONOMIA', 6, 11),
(18, 'COMERCIO EXTERIOR', 6, 11),
(19, 'DERECHO', 6, 11),
(20, 'EMPRENDEDORES', 6, 11),
(21, 'ASIGNATURAS DE APOYO', 6, 11),
(22, 'SIN COORDINACION', 6, 11);

--
-- Disparadores `coordinaciona`
--
DROP TRIGGER IF EXISTS `bit_D_coordinaciona`;
DELIMITER //
CREATE TRIGGER `bit_D_coordinaciona` AFTER DELETE ON `coordinaciona`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *coordinaciona*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'coordinaciona', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.coordinaciona, 
OLD.descripcion, 
OLD.programaedu ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_coordinaciona`;
DELIMITER //
CREATE TRIGGER `bit_I_coordinaciona` AFTER INSERT ON `coordinaciona`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *coordinaciona*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'coordinaciona', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.coordinaciona, 
NEW.descripcion, 
NEW.programaedu ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_coordinaciona`;
DELIMITER //
CREATE TRIGGER `bit_U_coordinaciona` AFTER UPDATE ON `coordinaciona`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *coordinaciona*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'coordinaciona', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.coordinaciona, NEW.descripcion, NEW.programaedu ),
 concat_WS( '|', OLD.coordinaciona, OLD.descripcion, OLD.programaedu )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleseriacion`
--

CREATE TABLE IF NOT EXISTS `detalleseriacion` (
  `programaedu` int(11) NOT NULL COMMENT 'prog edu',
  `uaprendizaje` int(11) NOT NULL COMMENT 'U aprendizaje',
  `reqseriacion` int(11) NOT NULL COMMENT 'Reqseriación',
  `uaprequisito` int(11) NOT NULL COMMENT 'Uap requisito',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`programaedu`,`uaprendizaje`,`uaprequisito`),
  KEY `fk_detalleseriacion_uaprendizaje2_idx` (`uaprequisito`),
  KEY `fk_detalleseriacion_users1_idx` (`users_id`),
  KEY `fk_detalleseriacion_reqseriacion1_idx` (`reqseriacion`),
  KEY `fk_detalleseriacion_pua_idx` (`programaedu`,`uaprendizaje`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `detalleseriacion`
--
DROP TRIGGER IF EXISTS `bit_D_detalleseriacion`;
DELIMITER //
CREATE TRIGGER `bit_D_detalleseriacion` AFTER DELETE ON `detalleseriacion`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *detalleseriacion*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'detalleseriacion', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
  OLD.uaprendizaje,
  OLD.programaedu,
  OLD.uaprequisito,
  OLD.reqseriacion) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_detalleseriacion`;
DELIMITER //
CREATE TRIGGER `bit_I_detalleseriacion` AFTER INSERT ON `detalleseriacion`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *detalleseriacion*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'detalleseriacion', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
  NEW.uaprendizaje,
  NEW.programaedu,
  NEW.uaprequisito,
  NEW.reqseriacion) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_detalleseriacion`;
DELIMITER //
CREATE TRIGGER `bit_U_detalleseriacion` AFTER UPDATE ON `detalleseriacion`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *detalleseriacion*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'detalleseriacion', NEW.users_id, 'U', curdate( ) , concat_WS( '|',
  NEW.uaprendizaje,
  NEW.programaedu,
  NEW.uaprequisito,
  NEW.reqseriacion),
concat_WS( '|',
  OLD.uaprendizaje,
  OLD.programaedu,
  OLD.uaprequisito,
  OLD.reqseriacion));

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias`
--

CREATE TABLE IF NOT EXISTS `dias` (
  `dia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consec Dia',
  `descripcion` varchar(9) NOT NULL COMMENT 'Descripcion Dia (Lun,Mar,Mier..)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`dia`),
  UNIQUE KEY `DI_dia_UNIQUE` (`dia`),
  KEY `fk_dias_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Disparadores `dias`
--
DROP TRIGGER IF EXISTS `bit_D_dias`;
DELIMITER //
CREATE TRIGGER `bit_D_dias` AFTER DELETE ON `dias`
 FOR EACH ROW BEGIN -- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *dias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'dias', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.dia, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_dias`;
DELIMITER //
CREATE TRIGGER `bit_I_dias` AFTER INSERT ON `dias`
 FOR EACH ROW BEGIN -- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *dias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'dias', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
 NEW.dia, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_dias`;
DELIMITER //
CREATE TRIGGER `bit_U_dias` AFTER UPDATE ON `dias`
 FOR EACH ROW BEGIN -- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *dias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'dias', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|',  NEW.dia, NEW.descripcion ),
concat_WS( '|',  OLD.dia, OLD.descripcion )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disp_hrs_dias`
--

CREATE TABLE IF NOT EXISTS `disp_hrs_dias` (
  `periodo` int(11) NOT NULL COMMENT 'Periodo escolar',
  `id` int(11) NOT NULL COMMENT 'Docente Disponible',
  `dia` int(11) NOT NULL COMMENT 'Dia disponible',
  `hora` int(11) NOT NULL COMMENT 'Hora Disponible',
  `status` int(11) NOT NULL DEFAULT '3',
  `observaciones` varchar(255) DEFAULT NULL,
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`periodo`,`id`,`dia`,`hora`),
  KEY `fk_disp_hrs_dias_periodos1_idx` (`periodo`),
  KEY `fk_disp_hrs_dias_users2_idx` (`id`),
  KEY `fk_disp_hrs_dias_dias2_idx` (`dia`),
  KEY `fk_disp_hrs_dias_horas1_idx` (`hora`),
  KEY `fk_disp_hrs_dias_users1_idx` (`users_id`),
  KEY `fk_disp_hrs_dias_status1` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `disp_hrs_dias`
--
DROP TRIGGER IF EXISTS `bit_D_disp_hrs_dias`;
DELIMITER //
CREATE TRIGGER `bit_D_disp_hrs_dias` AFTER DELETE ON `disp_hrs_dias`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *disp_hrs_dias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'disp_hrs_dias', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.periodo, 
OLD.id, 
OLD.dia, 
OLD.hora,
OLD.status,
OLD.observaciones) 
);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_disp_hrs_dias`;
DELIMITER //
CREATE TRIGGER `bit_I_disp_hrs_dias` AFTER INSERT ON `disp_hrs_dias`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *disp_hrs_dias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'disp_hrs_dias', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.periodo, 
NEW.id, 
NEW.dia, 
NEW.hora,
NEW.status,
NEW.observaciones ) 
);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_disp_hrs_dias`;
DELIMITER //
CREATE TRIGGER `bit_U_disp_hrs_dias` AFTER UPDATE ON `disp_hrs_dias`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *disp_hrs_dias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'disp_hrs_dias', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.periodo, 
NEW.id, 
NEW.dia, 
NEW.hora,
NEW.status,
NEW.observaciones),
concat_WS( '|', 
OLD.periodo, 
OLD.id, 
OLD.dia, 
OLD.hora,
OLD.status,
OLD.observaciones)  
);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disp_ua`
--

CREATE TABLE IF NOT EXISTS `disp_ua` (
  `periodo` int(11) NOT NULL COMMENT 'Periodo escolar',
  `id` int(11) NOT NULL COMMENT 'Docente disponible',
  `uaprendizaje` int(11) NOT NULL COMMENT 'uac disponible',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`periodo`,`id`,`uaprendizaje`),
  KEY `fk_disp_ua_periodos1_idx` (`periodo`),
  KEY `fk_disp_ua_uaprendizaje1_idx` (`uaprendizaje`),
  KEY `fk_disp_ua_users1_idx` (`users_id`),
  KEY `fk_disp_ua_users2_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `disp_ua`
--
DROP TRIGGER IF EXISTS `bit_D_disp_ua`;
DELIMITER //
CREATE TRIGGER `bit_D_disp_ua` AFTER DELETE ON `disp_ua`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *disp_ua*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'disp_ua', OLD.users_id, 'D', curdate( ) , concat_WS( '|',OLD.periodo, OLD.id, OLD.uaprendizaje ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_disp_ua`;
DELIMITER //
CREATE TRIGGER `bit_I_disp_ua` AFTER INSERT ON `disp_ua`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *disp_ua*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'disp_ua', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.periodo, NEW.id, NEW.uaprendizaje ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_disp_ua`;
DELIMITER //
CREATE TRIGGER `bit_U_disp_ua` AFTER UPDATE ON `disp_ua`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *disp_ua*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'disp_ua', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.periodo, NEW.id, NEW.uaprendizaje ),
concat_WS( '|', OLD.periodo, OLD.id, OLD.uaprendizaje )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctos`
--

CREATE TABLE IF NOT EXISTS `doctos` (
  `docto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo documento',
  `descripcion` varchar(45) NOT NULL COMMENT 'Descripcion documento (cedula, foto, certificado, curso, etc)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`docto`),
  KEY `fk_doctos_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Disparadores `doctos`
--
DROP TRIGGER IF EXISTS `bit_D_doctos`;
DELIMITER //
CREATE TRIGGER `bit_D_doctos` AFTER DELETE ON `doctos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *doctos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'doctos', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.docto, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_doctos`;
DELIMITER //
CREATE TRIGGER `bit_I_doctos` AFTER INSERT ON `doctos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *doctos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'doctos', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.docto, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_doctos`;
DELIMITER //
CREATE TRIGGER `bit_U_doctos` AFTER UPDATE ON `doctos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *doctos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'doctos', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.docto, NEW.descripcion ) ,
concat_WS( '|', OLD.docto, OLD.descripcion ) 
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_emp`
--

CREATE TABLE IF NOT EXISTS `documentos_emp` (
  `docto` int(11) NOT NULL COMMENT 'Codigo documento',
  `id` int(11) NOT NULL COMMENT 'Codigo Empleado',
  `ruta` varchar(60) NOT NULL COMMENT 'Ruta fisica docto',
  `observaciones` varchar(60) DEFAULT NULL COMMENT 'Observaciones documento',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`docto`,`id`),
  KEY `fk_documentos_emp_users1_idx` (`users_id`),
  KEY `fk_documentos_emp_users2_idx` (`id`),
  KEY `fk_documentos_emp_doctos1_idx` (`docto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `documentos_emp`
--
DROP TRIGGER IF EXISTS `bit_D_documentos_emp`;
DELIMITER //
CREATE TRIGGER `bit_D_documentos_emp` AFTER DELETE ON `documentos_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *documentos_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'documentos_emp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.docto, OLD.id, OLD.ruta, OLD.observaciones ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_documentos_emp`;
DELIMITER //
CREATE TRIGGER `bit_I_documentos_emp` AFTER INSERT ON `documentos_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *documentos_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'documentos_emp', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.docto, NEW.id, NEW.ruta, NEW.observaciones ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_documentos_emp`;
DELIMITER //
CREATE TRIGGER `bit_U_documentos_emp` AFTER UPDATE ON `documentos_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *documentos_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'documentos_emp', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.docto, NEW.id, NEW.observaciones,NEW.ruta ) ,
 concat_WS( '|', OLD.docto, OLD.id, OLD.ruta, OLD.observaciones ) 
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_adic`
--

CREATE TABLE IF NOT EXISTS `empresa_adic` (
  `empresa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Empresa TrabAdic a UABC',
  `descripcion` varchar(45) NOT NULL COMMENT 'Desc TrabAdic a UABC',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`empresa`),
  KEY `fk_empresa_adic_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `empresa_adic`
--

INSERT INTO `empresa_adic` (`empresa`, `descripcion`, `users_id`) VALUES
(1, 'LABOPAT', 1);

--
-- Disparadores `empresa_adic`
--
DROP TRIGGER IF EXISTS `bit_D_empresa_adic`;
DELIMITER //
CREATE TRIGGER `bit_D_empresa_adic` AFTER DELETE ON `empresa_adic`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *carga*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES ('empresa_adic', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.empresa, OLD.descripcion));
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_empresa_adic`;
DELIMITER //
CREATE TRIGGER `bit_I_empresa_adic` AFTER INSERT ON `empresa_adic`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *carga*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES ('empresa_adic', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.empresa, NEW.descripcion));
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_empresa_adic`;
DELIMITER //
CREATE TRIGGER `bit_U_empresa_adic` AFTER UPDATE ON `empresa_adic`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *carga*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES ('empresa_adic', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.empresa, NEW.descripcion),
concat_WS( '|', OLD.empresa, OLD.descripcion));
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `esp_prog_edu`
--

CREATE TABLE IF NOT EXISTS `esp_prog_edu` (
  `especialidad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo Especificación Nivel Programa (SOLO POSTGRADO)',
  `descripcion` varchar(45) NOT NULL COMMENT 'Descripción Especificación Nivel Programa',
  `status` char(1) NOT NULL COMMENT 'Status esp nivel programa\n1=Activo',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`especialidad`),
  UNIQUE KEY `ENP_codigo_UNIQUE` (`especialidad`),
  KEY `fk_esp_prog_edu_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `esp_prog_edu`
--

INSERT INTO `esp_prog_edu` (`especialidad`, `descripcion`, `status`, `users_id`) VALUES
(1, 'MTIC', '1', 1),
(2, 'MC', '1', 1);

--
-- Disparadores `esp_prog_edu`
--
DROP TRIGGER IF EXISTS `bit_D_esp_prog_edu`;
DELIMITER //
CREATE TRIGGER `bit_D_esp_prog_edu` AFTER DELETE ON `esp_prog_edu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *esp_prog_edu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'esp_prog_edu', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.especialidad, OLD.descripcion, OLD.status ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_esp_prog_edu`;
DELIMITER //
CREATE TRIGGER `bit_I_esp_prog_edu` AFTER INSERT ON `esp_prog_edu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *esp_prog_edu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'esp_prog_edu', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.especialidad, NEW.descripcion, NEW.status ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_esp_prog_edu`;
DELIMITER //
CREATE TRIGGER `bit_U_esp_prog_edu` AFTER UPDATE ON `esp_prog_edu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *esp_prog_edu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'esp_prog_edu', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.especialidad, NEW.descripcion, NEW.status ),
concat_WS( '|', OLD.especialidad, OLD.descripcion, OLD.status )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `estado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo estado',
  `descripcion` char(30) NOT NULL COMMENT 'Descripcion estado',
  `pais` int(11) NOT NULL DEFAULT '144' COMMENT 'Codigo pais',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`estado`),
  UNIQUE KEY `ES_codigo_UNIQUE` (`estado`),
  KEY `fk_estado_pais1_idx` (`pais`),
  KEY `fk_estado_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=33 ;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`estado`, `descripcion`, `pais`, `users_id`) VALUES
(1, 'AGUASCALIENTES', 144, 1),
(2, 'BAJA CALIFORNIA', 144, 1),
(3, 'BAJA CALIFORNIA SUR', 144, 1),
(4, 'CAMPECHE', 144, 1),
(5, 'COAHUILA DE ZARAGOZA', 144, 1),
(6, 'COLIMA', 144, 1),
(7, 'CHIAPAS', 144, 1),
(8, 'CHIHUAHUA', 144, 1),
(9, 'DISTRITO FEDERAL', 144, 1),
(10, 'DURANGO', 144, 1),
(11, 'GUANAJUATO', 144, 1),
(12, 'GUERRERO', 144, 1),
(13, 'HIDALGO', 144, 1),
(14, 'JALISCO', 144, 1),
(15, 'MEXICO', 144, 1),
(16, 'MICHOACAN DE OCAMPO', 144, 1),
(17, 'MORELOS', 144, 1),
(18, 'NAYARIT', 144, 1),
(19, 'NUEVO LEON', 144, 1),
(20, 'OAXACA', 144, 1),
(21, 'PUEBLA', 144, 1),
(22, 'QUERETARO', 144, 1),
(23, 'QUINTANA ROO', 144, 1),
(24, 'SAN LUIS POTOSI', 144, 1),
(25, 'SINALOA', 144, 1),
(26, 'SONORA', 144, 1),
(27, 'TABASCO', 144, 1),
(28, 'TAMAULIPAS', 144, 1),
(29, 'TLAXCALA', 144, 1),
(30, 'VERACRUZ', 144, 1),
(31, 'YUCATAN', 144, 1),
(32, 'ZACATECAS', 144, 1);

--
-- Disparadores `estado`
--
DROP TRIGGER IF EXISTS `bit_D_estado`;
DELIMITER //
CREATE TRIGGER `bit_D_estado` AFTER DELETE ON `estado`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *estado*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'estado', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.estado, OLD.descripcion, OLD.pais ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_estado`;
DELIMITER //
CREATE TRIGGER `bit_I_estado` AFTER INSERT ON `estado`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *estado*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'estado', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.estado, NEW.descripcion, NEW.pais ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_estado`;
DELIMITER //
CREATE TRIGGER `bit_U_estado` AFTER UPDATE ON `estado`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *estado*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'estado', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.estado, NEW.descripcion, NEW.pais ),
concat_WS( '|', OLD.estado, OLD.descripcion, OLD.pais )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etapas`
--

CREATE TABLE IF NOT EXISTS `etapas` (
  `etapa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código Etapa (1,2,3)',
  `descripcion` varchar(20) NOT NULL COMMENT 'Descripció Et (Básica, disciplinaria, terminal)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`etapa`),
  UNIQUE KEY `ET_codigo_UNIQUE` (`etapa`),
  KEY `fk_etapas_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `etapas`
--

INSERT INTO `etapas` (`etapa`, `descripcion`, `users_id`) VALUES
(1, 'BASICA', 1),
(2, 'DISCIPLINARIA', 1),
(3, 'TERMINAL', 1);

--
-- Disparadores `etapas`
--
DROP TRIGGER IF EXISTS `bit_D_etapas`;
DELIMITER //
CREATE TRIGGER `bit_D_etapas` AFTER DELETE ON `etapas`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *etapas*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'etapas', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.etapa, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_etapas`;
DELIMITER //
CREATE TRIGGER `bit_I_etapas` AFTER INSERT ON `etapas`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *etapas*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'etapas', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.etapa, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_etapas`;
DELIMITER //
CREATE TRIGGER `bit_U_etapas` AFTER UPDATE ON `etapas`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *etapas*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'etapas', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.etapa, NEW.descripcion ),
concat_WS( '|', OLD.etapa, OLD.descripcion )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE IF NOT EXISTS `grupos` (
  `grupo` int(11) NOT NULL COMMENT 'Código Grup',
  `periodo` int(11) NOT NULL COMMENT 'Periodo de trabajo(Año 4 digitos+ semestre o cuatrim) ej. 20091,20092',
  `plan` int(11) NOT NULL COMMENT 'Código Plan (Año+Semestre)',
  `programaedu` int(11) NOT NULL COMMENT 'Código Programa Educativo( Carrera)',
  `turno` int(11) NOT NULL COMMENT 'Turno',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`grupo`,`periodo`),
  KEY `fk_grupos_periodos1_idx` (`periodo`),
  KEY `fk_grupos_turnos1_idx` (`turno`),
  KEY `fk_grupos_planestudio1_idx` (`plan`,`programaedu`),
  KEY `fk_grupos_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`grupo`, `periodo`, `plan`, `programaedu`, `turno`, `users_id`) VALUES
(231, 20132, 20092, 2, 1, 1),
(231, 20151, 20092, 2, 1, 1),
(232, 20132, 20092, 2, 1, 1),
(232, 20151, 20092, 2, 1, 1),
(233, 20151, 20092, 2, 1, 1),
(234, 20151, 20092, 2, 1, 1),
(235, 20132, 20092, 2, 1, 1),
(235, 20151, 20092, 2, 1, 1),
(236, 20151, 20092, 2, 2, 1),
(241, 20132, 20092, 2, 1, 1),
(241, 20151, 20092, 2, 1, 1),
(242, 20132, 20092, 2, 1, 1),
(242, 20151, 20092, 2, 1, 1),
(243, 20151, 20092, 2, 2, 1),
(244, 20151, 20092, 2, 2, 1),
(245, 20132, 20092, 2, 1, 1),
(245, 20151, 20092, 2, 1, 1),
(246, 20151, 20092, 2, 2, 1),
(251, 20132, 20092, 2, 1, 1),
(251, 20151, 20092, 2, 1, 1),
(252, 20132, 20092, 2, 1, 1),
(252, 20151, 20092, 2, 1, 1),
(253, 20151, 20092, 2, 2, 1),
(254, 20151, 20092, 2, 2, 1),
(255, 20132, 20092, 2, 1, 1),
(255, 20151, 20092, 2, 1, 1),
(256, 20151, 20092, 2, 2, 1),
(261, 20132, 20092, 2, 1, 1),
(261, 20151, 20092, 2, 1, 1),
(262, 20132, 20092, 2, 1, 1),
(262, 20151, 20092, 2, 1, 1),
(263, 20151, 20092, 2, 2, 1),
(264, 20151, 20092, 2, 2, 1),
(265, 20132, 20092, 2, 1, 1),
(265, 20151, 20092, 2, 1, 1),
(266, 20151, 20092, 2, 2, 1),
(271, 20132, 20092, 2, 1, 1),
(271, 20151, 20092, 2, 1, 1),
(272, 20132, 20092, 2, 1, 1),
(272, 20151, 20092, 2, 1, 1),
(273, 20151, 20092, 2, 2, 1),
(274, 20151, 20092, 2, 2, 1),
(275, 20132, 20092, 2, 1, 1),
(275, 20151, 20092, 2, 1, 1),
(276, 20151, 20092, 2, 2, 1),
(281, 20132, 20092, 2, 1, 1),
(281, 20151, 20092, 2, 1, 1),
(282, 20132, 20092, 2, 1, 1),
(282, 20151, 20092, 2, 1, 1),
(283, 20151, 20092, 2, 2, 1),
(284, 20151, 20092, 2, 2, 1),
(285, 20151, 20092, 2, 1, 1),
(286, 20151, 20092, 2, 2, 1),
(331, 20132, 20092, 3, 1, 1),
(341, 20132, 20092, 3, 1, 1),
(351, 20132, 20092, 3, 1, 1),
(361, 20132, 20092, 3, 1, 1),
(371, 20132, 20092, 3, 1, 1),
(431, 20132, 20092, 4, 1, 1),
(441, 20132, 20092, 4, 1, 1),
(451, 20132, 20092, 4, 1, 1),
(461, 20132, 20092, 4, 1, 1),
(471, 20132, 20092, 4, 1, 1),
(531, 20132, 20092, 5, 1, 1),
(532, 20132, 20092, 5, 1, 1),
(541, 20132, 20092, 5, 1, 1),
(542, 20132, 20092, 5, 1, 1),
(551, 20132, 20092, 5, 1, 1),
(552, 20132, 20092, 5, 1, 1),
(561, 20132, 20092, 5, 1, 1),
(562, 20132, 20092, 5, 1, 1),
(571, 20132, 20092, 5, 1, 1),
(572, 20132, 20092, 5, 1, 1),
(581, 20132, 20092, 5, 1, 1),
(582, 20132, 20092, 5, 1, 1),
(601, 20132, 20092, 6, 1, 1),
(601, 20151, 20092, 6, 1, 1),
(602, 20132, 20092, 6, 1, 1),
(602, 20151, 20092, 6, 1, 1),
(603, 20132, 20092, 6, 1, 1),
(603, 20151, 20092, 6, 1, 1),
(604, 20132, 20092, 6, 1, 1),
(604, 20151, 20092, 6, 1, 1),
(605, 20132, 20092, 6, 1, 1),
(605, 20151, 20092, 6, 1, 1),
(606, 20132, 20092, 6, 1, 1),
(606, 20151, 20092, 6, 1, 1),
(607, 20132, 20092, 2, 3, 1),
(607, 20151, 20092, 6, 3, 1),
(608, 20132, 20092, 2, 3, 1),
(608, 20151, 20092, 6, 3, 1),
(611, 20132, 20092, 2, 2, 1),
(611, 20151, 20092, 6, 2, 1),
(612, 20132, 20092, 2, 2, 1),
(612, 20151, 20092, 6, 2, 1),
(613, 20151, 20092, 6, 2, 1),
(614, 20151, 20092, 6, 2, 1),
(615, 20151, 20092, 6, 2, 1),
(616, 20151, 20092, 6, 2, 1),
(621, 20132, 20092, 6, 1, 1),
(621, 20151, 20092, 6, 1, 1),
(622, 20132, 20092, 6, 1, 1),
(622, 20151, 20092, 6, 1, 1),
(623, 20132, 20092, 6, 1, 1),
(623, 20151, 20092, 6, 1, 1),
(624, 20132, 20092, 6, 1, 1),
(624, 20151, 20092, 6, 1, 1),
(625, 20132, 20092, 6, 1, 1),
(625, 20151, 20092, 6, 1, 1),
(626, 20132, 20092, 6, 1, 1),
(626, 20151, 20092, 6, 1, 1),
(627, 20151, 20092, 6, 3, 1),
(628, 20151, 20092, 6, 3, 1),
(629, 20151, 20092, 6, 3, 1),
(630, 20151, 20092, 6, 3, 1),
(631, 20151, 20092, 6, 2, 1),
(632, 20151, 20092, 6, 2, 1),
(633, 20151, 20092, 6, 2, 1),
(634, 20151, 20092, 6, 2, 1),
(635, 20151, 20092, 6, 2, 1),
(636, 20151, 20092, 6, 2, 1);

--
-- Disparadores `grupos`
--
DROP TRIGGER IF EXISTS `bit_D_grupos`;
DELIMITER //
CREATE TRIGGER `bit_D_grupos` AFTER DELETE ON `grupos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *grupos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'grupos', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.grupo, OLD.periodo, OLD.plan, OLD.programaedu,OLD.turno ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_grupos`;
DELIMITER //
CREATE TRIGGER `bit_I_grupos` AFTER INSERT ON `grupos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *grupos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'grupos', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.grupo, NEW.periodo, NEW.plan, NEW.programaedu,NEW.turno ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_grupos`;
DELIMITER //
CREATE TRIGGER `bit_U_grupos` AFTER UPDATE ON `grupos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *grupos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'grupos', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.grupo, NEW.periodo, NEW.plan, NEW.programaedu,NEW.turno ),
concat_WS( '|', OLD.grupo, OLD.periodo, OLD.plan, OLD.programaedu,OLD.turno )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE IF NOT EXISTS `horarios` (
  `grupo` int(11) NOT NULL COMMENT 'Gpo',
  `periodo` int(11) NOT NULL COMMENT 'Periodo',
  `uaprendizaje` int(11) NOT NULL COMMENT 'codigo uap',
  `id` int(11) NOT NULL COMMENT 'Docente',
  `dia` int(11) NOT NULL COMMENT 'Dia asignado',
  `hora` int(11) NOT NULL COMMENT 'Horario asignado',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  KEY `fk_horarios_horas1_idx` (`hora`),
  KEY `fk_horarios_dias1_idx` (`dia`),
  KEY `fk_horarios_users1_idx` (`users_id`),
  KEY `fk_horarios_uaprendizaje1_idx` (`uaprendizaje`),
  KEY `fk_horarios_grupos1_idx` (`grupo`,`periodo`),
  KEY `fk_horarios_users2_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `horarios`
--
DROP TRIGGER IF EXISTS `bit_D_horarios`;
DELIMITER //
CREATE TRIGGER `bit_D_horarios` AFTER DELETE ON `horarios`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *horarios*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'horarios', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.grupo, OLD.periodo, OLD.uaprendizaje, OLD.id, OLD.dia, OLD.hora ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_horarios`;
DELIMITER //
CREATE TRIGGER `bit_I_horarios` AFTER INSERT ON `horarios`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *horarios*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'horarios', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.grupo, NEW.periodo, NEW.uaprendizaje, NEW.id, NEW.dia, NEW.hora ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_horarios`;
DELIMITER //
CREATE TRIGGER `bit_U_horarios` AFTER UPDATE ON `horarios`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *horarios*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'horarios', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.grupo, NEW.periodo, NEW.uaprendizaje, NEW.id, NEW.dia, NEW.hora ),
concat_WS( '|', OLD.grupo, OLD.periodo, OLD.uaprendizaje, OLD.id, OLD.dia, OLD.hora ) 
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horas`
--

CREATE TABLE IF NOT EXISTS `horas` (
  `hora` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo hora (1,2,3,4)',
  `horaini` char(5) NOT NULL COMMENT 'Hr exacta inicio (0800)',
  `horafin` char(5) NOT NULL COMMENT 'Hr exacta fin (0859)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`hora`),
  UNIQUE KEY `HR_hora_UNIQUE` (`hora`),
  KEY `fk_horas_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Disparadores `horas`
--
DROP TRIGGER IF EXISTS `bit_D_horas`;
DELIMITER //
CREATE TRIGGER `bit_D_horas` AFTER DELETE ON `horas`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *horas*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'horas', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.hora, 
OLD.horaini,
OLD.horafin ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_horas`;
DELIMITER //
CREATE TRIGGER `bit_I_horas` AFTER INSERT ON `horas`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *horas*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'horas', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.hora, 
NEW.horaini,
NEW.horafin ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_horas`;
DELIMITER //
CREATE TRIGGER `bit_U_horas` AFTER UPDATE ON `horas`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *horas*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'horas', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.hora, 
NEW.horaini,
NEW.horafin ),
concat_WS( '|', 
OLD.hora, 
OLD.horaini,
OLD.horafin )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `levels`
--

CREATE TABLE IF NOT EXISTS `levels` (
  `level` int(11) NOT NULL COMMENT 'Nivel',
  `descrip_level` varchar(45) NOT NULL COMMENT 'Descripcion Nivel',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`level`),
  KEY `fk_levels_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `levels`
--

INSERT INTO `levels` (`level`, `descrip_level`, `users_id`) VALUES
(1, 'Administrador_general', 1),
(2, 'Administrador_auxiliar', 1),
(3, 'Coordinador Carrera', 1),
(4, 'Coordinador de Area', 1),
(5, 'Docente', 1);

--
-- Disparadores `levels`
--
DROP TRIGGER IF EXISTS `bit_D_levels`;
DELIMITER //
CREATE TRIGGER `bit_D_levels` AFTER DELETE ON `levels`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *levels*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Dic 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'levels', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.level, 
OLD.descrip_level ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_levels`;
DELIMITER //
CREATE TRIGGER `bit_I_levels` AFTER INSERT ON `levels`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *levels*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Dic 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'levels', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.level, 
NEW.descrip_level ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_levels`;
DELIMITER //
CREATE TRIGGER `bit_U_levels` AFTER UPDATE ON `levels`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *levels*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Dic 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'levels', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.level, 
NEW.descrip_level),
concat_WS( '|', 
OLD.level, 
OLD.descrip_level )  
);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nvprograma`
--

CREATE TABLE IF NOT EXISTS `nvprograma` (
  `nivel` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Nivel (1,2,3)',
  `descripcion` varchar(15) NOT NULL COMMENT 'Licenciatura/Postgrado',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`nivel`),
  UNIQUE KEY `NV_codigo_UNIQUE` (`nivel`),
  KEY `fk_nvprograma_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `nvprograma`
--

INSERT INTO `nvprograma` (`nivel`, `descripcion`, `users_id`) VALUES
(1, 'LICENCIATURA', 1),
(2, 'POSTGRADO', 1),
(3, 'TECNICO', 1);

--
-- Disparadores `nvprograma`
--
DROP TRIGGER IF EXISTS `bit_D_nvprograma`;
DELIMITER //
CREATE TRIGGER `bit_D_nvprograma` AFTER DELETE ON `nvprograma`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *nvprograma*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'nvprograma', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.nivel, OLD.descripcion) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_nvprograma`;
DELIMITER //
CREATE TRIGGER `bit_I_nvprograma` AFTER INSERT ON `nvprograma`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *nvprograma*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'nvprograma', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.nivel, NEW.descripcion) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_nvprograma`;
DELIMITER //
CREATE TRIGGER `bit_U_nvprograma` AFTER UPDATE ON `nvprograma`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *nvprograma*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'nvprograma', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.nivel, NEW.descripcion),
concat_WS( '|', OLD.nivel, OLD.descripcion)  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `pais` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo pais',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripción pais',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`pais`),
  UNIQUE KEY `PA_codigo_UNIQUE` (`pais`),
  KEY `fk_pais_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=238 ;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`pais`, `descripcion`, `users_id`) VALUES
(1, 'AFGANISTAN', 1),
(2, 'ALBANIA', 1),
(3, 'ALEMANIA', 1),
(4, 'ANDORRA', 1),
(5, 'ANGOLA', 1),
(6, 'ANGUILLA', 1),
(7, 'ANTIGUA Y BARBUDA', 1),
(8, 'ANTILLAS HOLANDESAS', 1),
(9, 'ARABIA SAUDI', 1),
(10, 'ARGELIA', 1),
(11, 'ARGENTINA', 1),
(12, 'ARMENIA', 1),
(13, 'ARUBA', 1),
(14, 'AUSTRALIA', 1),
(15, 'AUSTRIA', 1),
(16, 'AZERBAIYAN', 1),
(17, 'BAHAMAS', 1),
(18, 'BAHREIN', 1),
(19, 'BANGLADESH', 1),
(20, 'BARBADOS', 1),
(22, 'BELGICA', 1),
(23, 'BELICE', 1),
(25, 'BERMUDAS', 1),
(27, 'BOLIVIA', 1),
(28, 'BOSNIA Y HERZEGOVINA', 1),
(29, 'BOTSWANA', 1),
(30, 'BRASIL', 1),
(31, 'BRUNEI', 1),
(32, 'BULGARIA', 1),
(34, 'BURUNDI', 1),
(35, 'CABO VERDE', 1),
(36, 'CAMBOYA', 1),
(37, 'CAMERUN', 1),
(38, 'CANADA', 1),
(40, 'CHILE', 1),
(41, 'CHINA', 1),
(42, 'CHIPRE', 1),
(43, 'COLOMBIA', 1),
(45, 'CONGO', 1),
(46, 'COREA', 1),
(47, 'COREA DEL NORTE ', 1),
(48, 'COSTA DE MARFIL', 1),
(49, 'COSTA RICA', 1),
(50, 'CROACIA', 1),
(51, 'CUBA', 1),
(52, 'DINAMARCA', 1),
(54, 'DOMINICA', 1),
(55, 'ECUADOR', 1),
(56, 'EGIPTO', 1),
(57, 'EL SALVADOR', 1),
(58, 'EMIRATOS ARABES UNIDOS', 1),
(60, 'ESLOVENIA', 1),
(61, 'ESPAÂ¥A', 1),
(62, 'ESTADOS UNIDOS DE AMERICA', 1),
(63, 'ESTONIA', 1),
(64, 'ETIOPIA', 1),
(65, 'FIJI', 1),
(66, 'FILIPINAS', 1),
(67, 'FINLANDIA', 1),
(68, 'FRANCIA', 1),
(69, 'GABON', 1),
(70, 'GAMBIA', 1),
(71, 'GEORGIA', 1),
(72, 'GHANA', 1),
(73, 'GIBRALTAR', 1),
(74, 'GRANADA', 1),
(75, 'GRECIA', 1),
(76, 'GROENLANDIA', 1),
(78, 'GUAM', 1),
(79, 'GUATEMALA', 1),
(80, 'GUAYANA FRANCESA', 1),
(81, 'GUERNESEY', 1),
(82, 'GUINEA', 1),
(83, 'GUINEA ECUATORIAL', 1),
(84, 'GUINEA-BISSAU', 1),
(85, 'GUYANA', 1),
(86, 'HAITI', 1),
(87, 'HONDURAS', 1),
(88, 'HONG KONG', 1),
(89, 'HUNGRIA', 1),
(90, 'INDIA', 1),
(91, 'INDONESIA', 1),
(92, 'IRAN', 1),
(93, 'IRAQ', 1),
(94, 'IRLANDA', 1),
(95, 'ISLA DE MAN', 1),
(96, 'ISLA NORFOLK', 1),
(97, 'ISLANDIA', 1),
(98, 'ISLAS ALAND', 1),
(99, 'ISLAS CAIM?N', 1),
(100, 'ISLAS COOK', 1),
(101, 'ISLAS DEL CANAL', 1),
(102, 'ISLAS FEROE', 1),
(103, 'ISLAS MALVINAS', 1),
(104, 'ISLAS MARIANAS DEL NORTE', 1),
(105, 'ISLAS MARSHALL', 1),
(106, 'ISLAS PITCAIRN', 1),
(107, 'ISLAS SALOMON', 1),
(108, 'ISLAS TURCAS Y CAICOS', 1),
(109, 'ISLAS VIRGENES BRITANICAS', 1),
(110, 'ISLAS V?RGENES DE LOS ESTADOS UNIDOS', 1),
(111, 'ISRAEL', 1),
(112, 'ITALIA', 1),
(113, 'JAMAICA', 1),
(114, 'JAPON', 1),
(115, 'JERSEY', 1),
(116, 'JORDANIA', 1),
(117, 'KAZAJSTAN', 1),
(118, 'KENIA', 1),
(119, 'KIRGUISTAN', 1),
(120, 'KIRIBATI', 1),
(121, 'KUWAIT', 1),
(122, 'LAOS', 1),
(123, 'LESOTHO', 1),
(124, 'LETONIA', 1),
(125, 'LIBANO', 1),
(126, 'LIBERIA', 1),
(127, 'LIBIA', 1),
(128, 'LIECHTENSTEIN', 1),
(129, 'LITUANIA', 1),
(130, 'LUXEMBURGO', 1),
(131, 'MACAO', 1),
(132, 'MACEDONIA ', 1),
(133, 'MADAGASCAR', 1),
(134, 'MALASIA', 1),
(135, 'MALAWI', 1),
(136, 'MALDIVAS', 1),
(137, 'MALI', 1),
(138, 'MALTA', 1),
(139, 'MARRUECOS', 1),
(140, 'MARTINICA', 1),
(141, 'MAURICIO', 1),
(142, 'MAURITANIA', 1),
(143, 'MAYOTTE', 1),
(144, 'MEXICO', 1),
(145, 'MICRONESIA', 1),
(146, 'MOLDAVIA', 1),
(147, 'MONACO', 1),
(148, 'MONGOLIA', 1),
(149, 'MONTENEGRO', 1),
(150, 'MONTSERRAT', 1),
(151, 'MOZAMBIQUE', 1),
(152, 'MYANMAR', 1),
(153, 'NAMIBIA', 1),
(154, 'NAURU', 1),
(155, 'NEPAL', 1),
(156, 'NICARAGUA', 1),
(157, 'NIGER', 1),
(158, 'NIGERIA', 1),
(159, 'NIUE', 1),
(160, 'NORUEGA', 1),
(161, 'NUEVA CALEDONIA', 1),
(162, 'NUEVA ZELANDA', 1),
(163, 'OMAN', 1),
(164, 'PAISES BAJOS', 1),
(165, 'PAKISTAN', 1),
(166, 'PALAOS', 1),
(167, 'PALESTINA', 1),
(168, 'PANAMA', 1),
(169, 'PAPUA NUEVA GUINEA', 1),
(170, 'PARAGUAY', 1),
(171, 'PERU', 1),
(172, 'POLINESIA FRANCESA', 1),
(173, 'POLONIA', 1),
(174, 'PORTUGAL', 1),
(175, 'PUERTO RICO', 1),
(176, 'QATAR', 1),
(177, 'REINO UNIDO', 1),
(178, 'REP.DEMOCRATICA DEL CONGO', 1),
(179, 'REPUBLICA CENTROAFRICANA', 1),
(180, 'REPUBLICA CHECA', 1),
(181, 'REPUBLICA DOMINICANA', 1),
(182, 'REPUBLICA ESLOVACA', 1),
(183, 'REUNION', 1),
(184, 'RUANDA', 1),
(185, 'RUMANIA', 1),
(186, 'RUSIA', 1),
(187, 'SAHARA OCCIDENTAL', 1),
(188, 'SAMOA', 1),
(189, 'SAMOA AMERICANA', 1),
(190, 'SAN BARTOLOME', 1),
(191, 'SAN CRISTOBAL Y NIEVES', 1),
(192, 'SAN MARINO', 1),
(193, 'SAN MARTIN (PARTE FRANCESA)', 1),
(194, 'SAN PEDRO Y MIQUELON ', 1),
(195, 'SAN VICENTE Y LAS GRANADINAS', 1),
(196, 'SANTA HELENA', 1),
(197, 'SANTA LUCIA', 1),
(198, 'SANTA SEDE', 1),
(199, 'SANTO TOME Y PRINCIPE', 1),
(200, 'SENEGAL', 1),
(201, 'SERBIA', 1),
(202, 'SEYCHELLES', 1),
(203, 'SIERRA LEONA', 1),
(204, 'SINGAPUR', 1),
(205, 'SIRIA', 1),
(206, 'SOMALIA', 1),
(207, 'SRI LANKA', 1),
(208, 'SUDAFRICA', 1),
(209, 'SUDAN', 1),
(210, 'SUECIA', 1),
(211, 'SUIZA', 1),
(212, 'SURINAM', 1),
(213, 'SVALBARD Y JAN MAYEN', 1),
(214, 'SWAZILANDIA', 1),
(215, 'TADYIKISTAN', 1),
(216, 'TAILANDIA', 1),
(217, 'TANZANIA', 1),
(218, 'TIMOR ORIENTAL', 1),
(219, 'TOGO', 1),
(220, 'TOKELAU', 1),
(221, 'TONGA', 1),
(222, 'TRINIDAD Y TOBAGO', 1),
(223, 'TUNEZ', 1),
(224, 'TURKMENISTAN', 1),
(225, 'TURQUIA', 1),
(226, 'TUVALU', 1),
(227, 'UCRANIA', 1),
(228, 'UGANDA', 1),
(229, 'URUGUAY', 1),
(230, 'UZBEKISTAN', 1),
(231, 'VANUATU', 1),
(232, 'VENEZUELA', 1),
(233, 'VIETNAM', 1),
(234, 'WALLIS Y FORTUNA', 1),
(235, 'YEMEN', 1),
(236, 'ZAMBIA', 1),
(237, 'ZIMBABWE', 1);

--
-- Disparadores `pais`
--
DROP TRIGGER IF EXISTS `bit_D_pais`;
DELIMITER //
CREATE TRIGGER `bit_D_pais` AFTER DELETE ON `pais`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *pais*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'pais', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.pais, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_pais`;
DELIMITER //
CREATE TRIGGER `bit_I_pais` AFTER INSERT ON `pais`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *pais*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'pais', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.pais, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_pais`;
DELIMITER //
CREATE TRIGGER `bit_U_pais` AFTER UPDATE ON `pais`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al ACTUALIZAR REGISTRO en *pais*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,
registro_old
)
VALUES (
'pais', NEW.users_id, 'U', curdate( ),
concat_WS( '|', NEW.pais, NEW.descripcion),
concat_WS( '|', OLD.pais, OLD.descripcion) 
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE IF NOT EXISTS `periodos` (
  `periodo` int(11) NOT NULL COMMENT 'Periodo de trabajo(Año 4 digitos+ semestre o cuatrim) ej. 20091,20092',
  `periodo_pedu` int(11) NOT NULL DEFAULT '1' COMMENT 'Tipo: 1=semestral/2=cuatrimestral',
  `year` int(11) NOT NULL COMMENT 'Año preriodo',
  `mes` int(11) NOT NULL COMMENT 'Mes periodo',
  `descripcion` varchar(40) NOT NULL COMMENT 'Descripción',
  `inicio` date NOT NULL COMMENT 'Fecha inicio periodo',
  `fin` date DEFAULT NULL COMMENT 'Fecha fin periodo ',
  `status_periodo` int(11) NOT NULL DEFAULT '1' COMMENT 'Status 1,2 (1=Abierto, 2=Cerrado) ',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`periodo`),
  UNIQUE KEY `PR_periodo_UNIQUE` (`periodo`),
  KEY `fk_periodos_periodo_prog_edu1_idx` (`periodo_pedu`),
  KEY `fk_periodos_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `periodos`
--

INSERT INTO `periodos` (`periodo`, `periodo_pedu`, `year`, `mes`, `descripcion`, `inicio`, `fin`, `status_periodo`, `users_id`) VALUES
(20121, 1, 2012, 1, 'Período Enero-Julio 2012', '2013-01-01', '2013-07-31', 1, 1),
(20122, 1, 2012, 9, 'Período Septiembre-Diciembre 2012', '2014-09-01', '2014-12-15', 1, 1),
(20131, 1, 2013, 1, 'Período Enero-Julio 2013', '2013-01-01', '2013-07-31', 1, 1),
(20132, 1, 2013, 9, 'Período Septiembre-Dciembre 2013', '2013-09-01', '2013-12-15', 1, 1),
(20141, 1, 2014, 1, 'Período Enero-Julio 2014 ', '2014-01-01', '2014-07-31', 1, 1),
(20142, 1, 2014, 7, 'Período Septiembre-Diciembre 2014 ', '2014-09-01', '2014-12-15', 1, 1),
(20151, 1, 2015, 1, 'Período Enero-Julio 2014 ', '2015-01-01', '2015-07-31', 1, 1),
(20152, 1, 2015, 7, 'Período Agosto-diciembre 2015', '2015-08-01', '2014-12-31', 1, 1);

--
-- Disparadores `periodos`
--
DROP TRIGGER IF EXISTS `bit_D_periodos`;
DELIMITER //
CREATE TRIGGER `bit_D_periodos` AFTER DELETE ON `periodos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *periodos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'periodos', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
    OLD.periodo,
    OLD.periodo_pedu, 
    OLD.year,
    OLD.mes,
    OLD.descripcion,
    OLD.inicio,                                                 
    OLD.fin,
    OLD.status_periodo)
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_periodos`;
DELIMITER //
CREATE TRIGGER `bit_I_periodos` AFTER INSERT ON `periodos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *periodos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'periodos', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
    NEW.periodo,
    NEW.periodo_pedu, 
    NEW.year,
    NEW.mes,
    NEW.descripcion,
    NEW.inicio,                                                 
    NEW.fin,
    NEW.status_periodo)
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_periodos`;
DELIMITER //
CREATE TRIGGER `bit_U_periodos` AFTER UPDATE ON `periodos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *periodos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'periodos', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
    NEW.periodo,
    NEW.periodo_pedu, 
    NEW.year,
    NEW.mes,
    NEW.descripcion,
    NEW.inicio,                                                 
    NEW.fin,
    NEW.status_periodo),
    concat_WS( '|', 
    OLD.periodo,
    OLD.periodo_pedu, 
    OLD.year,
    OLD.mes,
    OLD.descripcion,
    OLD.inicio,                                                 
    OLD.fin,
    OLD.status_periodo)
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo_prog_edu`
--

CREATE TABLE IF NOT EXISTS `periodo_prog_edu` (
  `periodo_pedu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tipo: 1=semestral/2=cuatrimestral',
  `descripcion` varchar(15) NOT NULL COMMENT 'Descripcion: semestral, cuatrimestral',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`periodo_pedu`),
  UNIQUE KEY `TP_codigo_UNIQUE` (`periodo_pedu`),
  KEY `fk_periodo_prog_edu_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `periodo_prog_edu`
--

INSERT INTO `periodo_prog_edu` (`periodo_pedu`, `descripcion`, `users_id`) VALUES
(1, 'SEMESTRAL', 1),
(2, 'CUATRIMESTRAL', 1),
(3, 'TRIMESTRAL', 1),
(4, 'SABATINO', 1);

--
-- Disparadores `periodo_prog_edu`
--
DROP TRIGGER IF EXISTS `bit_D_periodo_prog_edu`;
DELIMITER //
CREATE TRIGGER `bit_D_periodo_prog_edu` AFTER DELETE ON `periodo_prog_edu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *periodo_prog_edu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'periodo_prog_edu', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.periodo_pedu,
OLD.descripcion) 
);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_periodo_prog_edu`;
DELIMITER //
CREATE TRIGGER `bit_I_periodo_prog_edu` AFTER INSERT ON `periodo_prog_edu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *periodo_prog_edu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'periodo_prog_edu', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.periodo_pedu,
NEW.descripcion) 
);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_periodo_prog_edu`;
DELIMITER //
CREATE TRIGGER `bit_U_periodo_prog_edu` AFTER UPDATE ON `periodo_prog_edu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *periodo_prog_edu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'periodo_prog_edu', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.periodo_pedu,
NEW.descripcion),
concat_WS( '|', 
OLD.periodo_pedu,
OLD.descripcion)  
);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio`
--

CREATE TABLE IF NOT EXISTS `planestudio` (
  `plan` int(11) NOT NULL COMMENT 'Código Plan (Año+Semestre)',
  `descripcion` varchar(35) NOT NULL COMMENT 'Descripción plan  ("PLAN DE ESTUDIOS "+Año+" "+Semestre)',
  `credpracticas` int(11) NOT NULL COMMENT 'Total Créditos practicas',
  `feciniciovig` date NOT NULL COMMENT 'Fecha inicio Vigencia',
  `fecfinvig` date NOT NULL COMMENT 'Fecha Fin Vigencia',
  `nivel` int(11) NOT NULL COMMENT 'Lic, post',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`plan`),
  KEY `fk_planestudiodesc_users1_idx` (`users_id`),
  KEY `fk_planestudiodesc_nvprograma1_idx` (`nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `planestudio`
--

INSERT INTO `planestudio` (`plan`, `descripcion`, `credpracticas`, `feciniciovig`, `fecfinvig`, `nivel`, `users_id`) VALUES
(20092, 'PLAN DE ESTUDIOS 2009-2', 20, '2009-01-01', '2015-12-31', 1, 1);

--
-- Disparadores `planestudio`
--
DROP TRIGGER IF EXISTS `bit_D_planestudio`;
DELIMITER //
CREATE TRIGGER `bit_D_planestudio` AFTER DELETE ON `planestudio`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *planestudio*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'planestudio', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.plan, 
OLD.descripcion, 
OLD.credpracticas, 
OLD.feciniciovig, 
OLD.fecfinvig,
OLD.nivel                                                       ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_planestudio`;
DELIMITER //
CREATE TRIGGER `bit_I_planestudio` AFTER INSERT ON `planestudio`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *planestudio*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'planestudio', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.plan, 
NEW.descripcion, 
NEW.credpracticas, 
NEW.feciniciovig, 
NEW.fecfinvig,
NEW.nivel                                                       ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_planestudio`;
DELIMITER //
CREATE TRIGGER `bit_U_planestudio` AFTER UPDATE ON `planestudio`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *planestudio*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'planestudio', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.plan, 
NEW.descripcion, 
NEW.credpracticas, 
NEW.feciniciovig, 
NEW.fecfinvig,
NEW.nivel), 
concat_WS( '|', 
OLD.plan, 
OLD.descripcion, 
OLD.credpracticas, 
OLD.feciniciovig, 
OLD.fecfinvig,
OLD.nivel) 
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_programa`
--

CREATE TABLE IF NOT EXISTS `plan_programa` (
  `plan` int(11) NOT NULL COMMENT 'Código Plan (Año+Semestre)',
  `programaedu` int(11) NOT NULL COMMENT 'Código Programa Educativo( Carrera)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`plan`,`programaedu`),
  KEY `fk_planestudio_planestudiodesc1_idx` (`plan`),
  KEY `fk_planestudio_programaedu1_idx` (`programaedu`),
  KEY `fk_planestudio_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plan_programa`
--

INSERT INTO `plan_programa` (`plan`, `programaedu`, `users_id`) VALUES
(20092, 1, 1),
(20092, 2, 1),
(20092, 3, 1),
(20092, 4, 1),
(20092, 5, 1),
(20092, 6, 1),
(20092, 7, 1);

--
-- Disparadores `plan_programa`
--
DROP TRIGGER IF EXISTS `bit_D_plan_programa`;
DELIMITER //
CREATE TRIGGER `bit_D_plan_programa` AFTER DELETE ON `plan_programa`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *plan_programa*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'plan_programa', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.plan, OLD.programaedu) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_plan_programa`;
DELIMITER //
CREATE TRIGGER `bit_I_plan_programa` AFTER INSERT ON `plan_programa`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *plan_programa*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'plan_programa', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.plan, NEW.programaedu) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_plan_programa`;
DELIMITER //
CREATE TRIGGER `bit_U_plan_programa` AFTER UPDATE ON `plan_programa`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *plan_programa*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'plan_programa', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.plan, NEW.programaedu),
concat_WS( '|', OLD.plan, OLD.programaedu)  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programaedu`
--

CREATE TABLE IF NOT EXISTS `programaedu` (
  `programaedu` int(11) NOT NULL COMMENT 'Código Programa Educativo( Carrera)',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripción detallenivprog (carrera)',
  `siglas` varchar(10) NOT NULL COMMENT 'Descripcion (FCQ, FCA)',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1=Activa/0=Baja',
  `uacademica` int(11) NOT NULL COMMENT 'Uacademica',
  `especialidad` int(11) DEFAULT NULL COMMENT 'Especialidad programa educativo',
  `nivel` int(11) NOT NULL DEFAULT '1' COMMENT 'Codigo nivel (Lic, post)',
  `periodo_pedu` int(11) NOT NULL DEFAULT '1' COMMENT 'Codigo periodo pe para especificar 1=semestral/2=cuatrimestral',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`programaedu`),
  UNIQUE KEY `DNP_codigo_UNIQUE` (`programaedu`),
  KEY `fk_programaedu_uacademica1_idx` (`uacademica`),
  KEY `fk_programaedu_esp_prog_edu1_idx` (`especialidad`),
  KEY `fk_programaedu_nvprograma1_idx` (`nivel`),
  KEY `fk_programaedu_periodo_prog_edu1_idx` (`periodo_pedu`),
  KEY `fk_programaedu_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `programaedu`
--

INSERT INTO `programaedu` (`programaedu`, `descripcion`, `siglas`, `status`, `uacademica`, `especialidad`, `nivel`, `periodo_pedu`, `users_id`) VALUES
(1, 'ARTES', 'LA', 1, 1, NULL, 1, 1, 10),
(2, 'ADMON. DE EMPRESAS', 'LAE', 1, 1, NULL, 1, 1, 10),
(3, 'INFORMÁTICA', 'LI', 1, 1, NULL, 1, 1, 10),
(4, 'NEGOCIOS INTERNACIONALES', 'LNI', 1, 1, NULL, 1, 1, 10),
(5, 'CONTADURIA', 'LC', 1, 1, NULL, 1, 1, 10),
(6, 'TRONCO COMÚN', 'TC', 1, 1, NULL, 1, 1, 10),
(7, 'SISTEMAS COMPUTACIONALES', 'LSC', 1, 1, NULL, 1, 1, 1);

--
-- Disparadores `programaedu`
--
DROP TRIGGER IF EXISTS `bit_D_programaedu`;
DELIMITER //
CREATE TRIGGER `bit_D_programaedu` AFTER DELETE ON `programaedu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *programaedu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'programaedu', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.programaedu, OLD.descripcion, OLD.siglas, OLD.status,OLD.uacademica,OLD.especialidad,OLD.nivel,OLD.periodo_pedu ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_programaedu`;
DELIMITER //
CREATE TRIGGER `bit_I_programaedu` AFTER INSERT ON `programaedu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *programaedu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'programaedu', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.programaedu, NEW.descripcion, NEW.siglas, NEW.status,NEW.uacademica,NEW.especialidad,NEW.nivel,NEW.periodo_pedu ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_programaedu`;
DELIMITER //
CREATE TRIGGER `bit_U_programaedu` AFTER UPDATE ON `programaedu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *programaedu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'programaedu', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.programaedu, NEW.descripcion, NEW.siglas, NEW.status,NEW.uacademica,NEW.especialidad,NEW.nivel,NEW.periodo_pedu ),
concat_WS( '|', OLD.programaedu, OLD.descripcion, OLD.siglas, OLD.status,OLD.uacademica,OLD.especialidad,OLD.nivel,OLD.periodo_pedu )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

CREATE TABLE IF NOT EXISTS `puesto` (
  `puesto` int(11) NOT NULL AUTO_INCREMENT COMMENT '1,2,3',
  `descripcion` varchar(15) NOT NULL COMMENT 'Director, subd., adm., docente, etc.',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`puesto`),
  UNIQUE KEY `DI_directivopuesto_UNIQUE` (`puesto`),
  KEY `fk_directivopuesto_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `puesto`
--

INSERT INTO `puesto` (`puesto`, `descripcion`, `users_id`) VALUES
(1, 'DIRECTOR', 1),
(2, 'SUBDIRECTOR', 1),
(3, 'ADMINISTRADOR', 1),
(4, 'DOCENTE', 1),
(5, 'GERENTE GENERAL', 1);

--
-- Disparadores `puesto`
--
DROP TRIGGER IF EXISTS `bit_D_puesto`;
DELIMITER //
CREATE TRIGGER `bit_D_puesto` AFTER DELETE ON `puesto`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *puesto*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'puesto', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.puesto, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_puesto`;
DELIMITER //
CREATE TRIGGER `bit_I_puesto` AFTER INSERT ON `puesto`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *puesto*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'puesto', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.puesto, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_puesto`;
DELIMITER //
CREATE TRIGGER `bit_U_puesto` AFTER UPDATE ON `puesto`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *puesto*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'puesto', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.puesto, NEW.descripcion ),
concat_WS( '|', OLD.puesto, OLD.descripcion )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestosemp`
--

CREATE TABLE IF NOT EXISTS `puestosemp` (
  `id` int(11) NOT NULL COMMENT 'No. Empleado',
  `uacademica` int(11) NOT NULL COMMENT 'Codigo uacademica (FCQ, FCA)',
  `puesto` int(11) NOT NULL COMMENT 'Codigo puesto',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  KEY `fk_directivosua_uacademica1_idx` (`uacademica`),
  KEY `fk_directivosua_directivopuesto1_idx` (`puesto`),
  KEY `fk_directivosua_users1_idx` (`users_id`),
  KEY `fk_puestosemp_users2_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `puestosemp`
--

INSERT INTO `puestosemp` (`id`, `uacademica`, `puesto`, `users_id`) VALUES
(1, 1, 1, 1);

--
-- Disparadores `puestosemp`
--
DROP TRIGGER IF EXISTS `bit_D_puestosemp`;
DELIMITER //
CREATE TRIGGER `bit_D_puestosemp` AFTER DELETE ON `puestosemp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *puestosemp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'puestosemp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.id, OLD.uacademica, OLD.puesto ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_puestosemp`;
DELIMITER //
CREATE TRIGGER `bit_I_puestosemp` AFTER INSERT ON `puestosemp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *puestosemp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'puestosemp', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.id, NEW.uacademica, NEW.puesto ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_puestosemp`;
DELIMITER //
CREATE TRIGGER `bit_U_puestosemp` AFTER UPDATE ON `puestosemp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *puestosemp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'puestosemp', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.id, NEW.uacademica, NEW.puesto ) ,
concat_WS( '|', OLD.id, OLD.uacademica, OLD.puesto ) 
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_ua`
--

CREATE TABLE IF NOT EXISTS `p_ua` (
  `programaedu` int(11) NOT NULL COMMENT 'Programa educativo',
  `uaprendizaje` int(11) NOT NULL COMMENT 'U Aprend',
  `etapa` int(11) NOT NULL COMMENT 'Etapa',
  `caracter` int(11) NOT NULL,
  `semestre_sug` int(11) NOT NULL,
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`programaedu`,`uaprendizaje`),
  KEY `fk_p_ua_programaedu1_idx` (`programaedu`),
  KEY `fk_p_ua_uaprendizaje1_idx` (`uaprendizaje`),
  KEY `fk_p_ua_users1_idx` (`users_id`),
  KEY `fk_p_ua_etapas1_idx` (`etapa`),
  KEY `fk_p_ua_caracter1_idx` (`caracter`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>';

--
-- Volcado de datos para la tabla `p_ua`
--

INSERT INTO `p_ua` (`programaedu`, `uaprendizaje`, `etapa`, `caracter`, `semestre_sug`, `users_id`) VALUES
(2, 11733, 1, 1, 4, 1),
(2, 11734, 1, 1, 3, 1),
(2, 11755, 3, 1, 7, 1),
(2, 11761, 2, 2, 5, 1),
(2, 11843, 1, 1, 3, 1),
(2, 11859, 1, 1, 3, 1),
(2, 11862, 2, 1, 4, 1),
(2, 12292, 3, 1, 7, 1),
(2, 12456, 1, 1, 3, 1),
(2, 12457, 1, 1, 3, 1),
(2, 12458, 1, 1, 3, 1),
(2, 12459, 1, 1, 3, 1),
(2, 12460, 2, 1, 4, 1),
(2, 12461, 2, 1, 4, 1),
(2, 12462, 2, 1, 4, 1),
(2, 12463, 2, 1, 4, 1),
(2, 12464, 2, 1, 4, 1),
(2, 12465, 2, 1, 5, 1),
(2, 12466, 2, 1, 5, 1),
(2, 12467, 2, 1, 5, 1),
(2, 12468, 2, 1, 5, 1),
(2, 12469, 2, 1, 5, 1),
(2, 12470, 2, 1, 6, 1),
(2, 12471, 2, 1, 6, 1),
(2, 12472, 2, 1, 6, 1),
(2, 12473, 2, 1, 6, 1),
(2, 12474, 2, 1, 6, 1),
(2, 12475, 2, 1, 6, 1),
(2, 12476, 3, 1, 7, 1),
(2, 12477, 3, 1, 7, 1),
(2, 12478, 3, 1, 7, 1),
(2, 12479, 2, 1, 7, 1),
(2, 12480, 3, 1, 8, 1),
(2, 12481, 3, 1, 8, 1),
(2, 12482, 3, 2, 7, 1),
(2, 12483, 1, 2, 2, 1),
(2, 12484, 1, 2, 2, 1),
(2, 12485, 1, 2, 2, 1),
(2, 12486, 1, 2, 2, 1),
(2, 12487, 2, 2, 5, 1),
(2, 12488, 2, 2, 5, 1),
(2, 12489, 2, 2, 5, 1),
(2, 12490, 2, 2, 5, 1),
(2, 12491, 2, 2, 6, 1),
(2, 12492, 2, 2, 5, 1),
(2, 12493, 3, 2, 8, 1),
(2, 12494, 3, 2, 8, 1),
(2, 12495, 3, 2, 7, 1),
(2, 12496, 3, 2, 7, 1),
(2, 12497, 3, 2, 7, 1),
(2, 12498, 3, 2, 8, 1),
(2, 12499, 3, 2, 7, 1),
(2, 12500, 3, 2, 8, 1),
(2, 12501, 3, 2, 7, 1),
(5, 11733, 1, 1, 4, 1),
(5, 11734, 1, 1, 3, 1),
(5, 11737, 2, 1, 5, 1),
(5, 11755, 3, 1, 7, 1),
(5, 11843, 1, 1, 3, 1),
(5, 12457, 1, 1, 3, 1),
(5, 12458, 1, 1, 3, 1),
(5, 12459, 1, 1, 3, 1),
(5, 12467, 2, 1, 5, 1),
(5, 12470, 2, 1, 6, 1),
(5, 12472, 2, 1, 6, 1),
(5, 12479, 2, 1, 7, 1),
(5, 12481, 3, 1, 8, 1),
(5, 12492, 2, 2, 5, 1),
(5, 12559, 1, 1, 2, 1),
(5, 12560, 2, 1, 5, 1),
(5, 12561, 2, 1, 5, 1),
(5, 12562, 2, 1, 5, 1),
(5, 12563, 2, 1, 5, 1),
(5, 12564, 2, 1, 5, 1),
(5, 12565, 2, 1, 5, 1),
(5, 12566, 2, 1, 5, 1),
(5, 12567, 2, 1, 5, 1),
(5, 12568, 2, 1, 5, 1),
(5, 12569, 2, 1, 5, 1),
(5, 12570, 2, 1, 5, 1),
(5, 12571, 2, 1, 5, 1),
(5, 12572, 3, 1, 7, 1),
(5, 12573, 3, 1, 7, 1),
(5, 12574, 3, 1, 7, 1),
(5, 12575, 3, 1, 7, 1),
(5, 12576, 3, 1, 7, 1),
(5, 12578, 3, 1, 7, 1),
(5, 12579, 3, 1, 7, 1),
(5, 12581, 2, 2, 5, 1),
(5, 12582, 2, 2, 5, 1),
(5, 12583, 2, 2, 5, 1),
(5, 12584, 2, 2, 5, 1),
(5, 12585, 2, 2, 5, 1),
(5, 12586, 3, 2, 7, 1),
(5, 12587, 3, 2, 7, 1),
(5, 12588, 3, 2, 7, 1),
(5, 12589, 3, 2, 7, 1),
(5, 12590, 3, 2, 7, 1),
(5, 12591, 3, 2, 7, 1),
(5, 12592, 3, 2, 7, 1),
(5, 12593, 3, 2, 7, 1),
(5, 12594, 3, 2, 7, 1),
(6, 11236, 1, 1, 1, 1),
(6, 11237, 1, 1, 1, 1),
(6, 11238, 1, 1, 1, 1),
(6, 11239, 1, 1, 1, 1),
(6, 11240, 1, 1, 1, 1),
(6, 11241, 1, 1, 1, 1),
(6, 11242, 1, 1, 1, 1),
(6, 11243, 1, 1, 2, 1),
(6, 11244, 1, 1, 2, 1),
(6, 11245, 1, 1, 2, 1),
(6, 11246, 1, 1, 2, 1),
(6, 11247, 1, 1, 2, 1),
(6, 11248, 1, 1, 2, 1),
(6, 11249, 1, 1, 2, 1);

--
-- Disparadores `p_ua`
--
DROP TRIGGER IF EXISTS `bit_D_p_ua`;
DELIMITER //
CREATE TRIGGER `bit_D_p_ua` AFTER DELETE ON `p_ua`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *p_ua*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'p_ua', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.programaedu, OLD.uaprendizaje, OLD.etapa, OLD.caracter, OLD.semestre_sug ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_p_ua`;
DELIMITER //
CREATE TRIGGER `bit_I_p_ua` AFTER INSERT ON `p_ua`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *p_ua*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'p_ua', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.programaedu, NEW.uaprendizaje, NEW.etapa, NEW.caracter, NEW.semestre_sug ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_p_ua`;
DELIMITER //
CREATE TRIGGER `bit_U_p_ua` AFTER UPDATE ON `p_ua`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *p_ua*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'p_ua', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.programaedu, NEW.uaprendizaje, NEW.etapa, NEW.caracter, NEW.semestre_sug ),
concat_WS( '|', OLD.programaedu, OLD.uaprendizaje, OLD.etapa, OLD.caracter, OLD.semestre_sug)  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reqseriacion`
--

CREATE TABLE IF NOT EXISTS `reqseriacion` (
  `reqseriacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Reqseriacion (1,2,3)',
  `descripcion` varchar(15) NOT NULL COMMENT 'Obligada, Sugerida, Sin seriación',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`reqseriacion`),
  UNIQUE KEY `RS_codigo_UNIQUE` (`reqseriacion`),
  KEY `fk_reqseriacion_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `reqseriacion`
--

INSERT INTO `reqseriacion` (`reqseriacion`, `descripcion`, `users_id`) VALUES
(1, 'OBLIGATORIA', 1),
(2, 'CONVENIENTE', 1);

--
-- Disparadores `reqseriacion`
--
DROP TRIGGER IF EXISTS `bit_D_reqseriacion`;
DELIMITER //
CREATE TRIGGER `bit_D_reqseriacion` AFTER DELETE ON `reqseriacion`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *reqseriacion*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'reqseriacion', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.reqseriacion, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_reqseriacion`;
DELIMITER //
CREATE TRIGGER `bit_I_reqseriacion` AFTER INSERT ON `reqseriacion`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *reqseriacion*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'reqseriacion', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.reqseriacion, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_reqseriacion`;
DELIMITER //
CREATE TRIGGER `bit_U_reqseriacion` AFTER UPDATE ON `reqseriacion`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *reqseriacion*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'reqseriacion', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.reqseriacion, NEW.descripcion ),
concat_WS( '|', OLD.reqseriacion, OLD.descripcion )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `status` int(11) NOT NULL COMMENT 'status (1,2,3)',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Status: 1=Completado 2=Capturado 3=En proceso',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`status`),
  KEY `fk_status_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`status`, `descripcion`, `users_id`) VALUES
(1, 'CAPTURADO', 10),
(2, 'COMPLETADO', 10),
(3, 'EN PROCESO', 10);

--
-- Disparadores `status`
--
DROP TRIGGER IF EXISTS `bit_D_status`;
DELIMITER //
CREATE TRIGGER `bit_D_status` AFTER DELETE ON `status`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *status*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'status', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.status, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_status`;
DELIMITER //
CREATE TRIGGER `bit_I_status` AFTER INSERT ON `status`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *status*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'status', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.status, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_status`;
DELIMITER //
CREATE TRIGGER `bit_U_status` AFTER UPDATE ON `status`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *status*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'status', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.status, NEW.descripcion ),
concat_WS( '|', OLD.status, OLD.descripcion )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_horarios`
--

CREATE TABLE IF NOT EXISTS `status_horarios` (
  `periodo` int(11) NOT NULL COMMENT 'Período',
  `id` int(11) NOT NULL COMMENT 'Docente',
  `status` int(11) NOT NULL COMMENT 'Status Hor Docen 1=Compl 2=Capt 3=En proc',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`periodo`,`id`),
  KEY `fk_status_horarios_status1_idx` (`status`),
  KEY `fk_status_horarios_users1_idx` (`users_id`),
  KEY `fk_status_horarios_users2_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `status_horarios`
--
DROP TRIGGER IF EXISTS `bit_D_status_horarios`;
DELIMITER //
CREATE TRIGGER `bit_D_status_horarios` AFTER DELETE ON `status_horarios`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *status_horarios*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'status_horarios', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.periodo, OLD.id, OLD.status ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_status_horarios`;
DELIMITER //
CREATE TRIGGER `bit_I_status_horarios` AFTER INSERT ON `status_horarios`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *status_horarios*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'status_horarios', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.periodo, NEW.id, NEW.status ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_status_horarios`;
DELIMITER //
CREATE TRIGGER `bit_U_status_horarios` AFTER UPDATE ON `status_horarios`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *status_horarios*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'status_horarios', NEW.users_id, 'U', curdate( ) , 
 concat_WS( '|', NEW.periodo, NEW.id, NEW.status ),
 concat_WS( '|', OLD.periodo, OLD.id, OLD.status )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_procesos`
--

CREATE TABLE IF NOT EXISTS `status_procesos` (
  `idstatus` int(11) NOT NULL COMMENT 'No Status',
  `periodo` int(11) NOT NULL COMMENT 'Período',
  `programaedu` int(11) NOT NULL COMMENT 'Carrera',
  `status_carga` int(11) NOT NULL COMMENT 'Status Carga',
  `status_plan` int(11) NOT NULL COMMENT 'Status Horario',
  `users_id` int(11) NOT NULL,
  KEY `fk_status_procesos_periodos1_idx` (`periodo`),
  KEY `fk_status_procesos_programaedu1_idx` (`programaedu`),
  KEY `fk_status_procesos_users1_idx` (`users_id`),
  KEY `fk_status_procesos_status1_idx` (`status_carga`),
  KEY `fk_status_procesos_status2_idx` (`status_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `status_procesos`
--
DROP TRIGGER IF EXISTS `bit_D_status_procesos`;
DELIMITER //
CREATE TRIGGER `bit_D_status_procesos` AFTER DELETE ON `status_procesos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *status_procesos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'status_procesos', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.idstatus,
OLD.periodo,
OLD.programaedu,
OLD.status_carga,
OLD.status_plan
));

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_status_procesos`;
DELIMITER //
CREATE TRIGGER `bit_I_status_procesos` AFTER INSERT ON `status_procesos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *status_procesos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'status_procesos', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.idstatus,
NEW.periodo,
NEW.programaedu,
NEW.status_carga,
NEW.status_plan
));

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_status_procesos`;
DELIMITER //
CREATE TRIGGER `bit_U_status_procesos` AFTER UPDATE ON `status_procesos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *status_procesos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'status_procesos', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.idstatus,
NEW.periodo,
NEW.programaedu,
NEW.status_carga,
NEW.status_plan
),
concat_WS( '|', 
OLD.idstatus,
OLD.periodo,
OLD.programaedu,
OLD.status_carga,
OLD.status_plan
));

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_curso_emp`
--

CREATE TABLE IF NOT EXISTS `tipo_curso_emp` (
  `tipo_curso_emp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tipo curso',
  `descripcion` varchar(45) NOT NULL COMMENT 'Descipción: Impartido, recibido, interés',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`tipo_curso_emp`),
  KEY `fk_tipo_curso_emp_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tipo_curso_emp`
--

INSERT INTO `tipo_curso_emp` (`tipo_curso_emp`, `descripcion`, `users_id`) VALUES
(1, 'RECIBIDO', 1),
(2, 'IMPARTIDO', 1),
(3, 'DE INTERES', 1);

--
-- Disparadores `tipo_curso_emp`
--
DROP TRIGGER IF EXISTS `bit_D_tipo_curso_emp`;
DELIMITER //
CREATE TRIGGER `bit_D_tipo_curso_emp` AFTER DELETE ON `tipo_curso_emp`
 FOR EACH ROW BEGIN -- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *tipo_curso_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'tipo_curso_emp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.tipo_curso_emp, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_tipo_curso_emp`;
DELIMITER //
CREATE TRIGGER `bit_I_tipo_curso_emp` AFTER INSERT ON `tipo_curso_emp`
 FOR EACH ROW BEGIN -- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *tipo_curso_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'tipo_curso_emp', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.tipo_curso_emp, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_tipo_curso_emp`;
DELIMITER //
CREATE TRIGGER `bit_U_tipo_curso_emp` AFTER UPDATE ON `tipo_curso_emp`
 FOR EACH ROW BEGIN -- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *tipo_curso_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'tipo_curso_emp', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.tipo_curso_emp, NEW.descripcion ),
concat_WS( '|', OLD.tipo_curso_emp, OLD.descripcion )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabadicional_emp`
--

CREATE TABLE IF NOT EXISTS `trabadicional_emp` (
  `empresa` int(11) NOT NULL,
  `id` int(11) NOT NULL COMMENT 'Num empleado UABC',
  `fec_ing` date DEFAULT NULL COMMENT 'Fecha ingreso',
  `puesto` int(11) NOT NULL COMMENT 'puesto',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`id`,`empresa`),
  KEY `fk_trabadicional_emp_empresa_adic1_idx` (`empresa`),
  KEY `fk_trabadicional_emp_users1_idx` (`users_id`),
  KEY `fk_trabadicional_emp_puesto1_idx` (`puesto`),
  KEY `fk_trabadicional_emp_users2_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `trabadicional_emp`
--

INSERT INTO `trabadicional_emp` (`empresa`, `id`, `fec_ing`, `puesto`, `users_id`) VALUES
(1, 18, '2003-12-01', 5, 1);

--
-- Disparadores `trabadicional_emp`
--
DROP TRIGGER IF EXISTS `bit_D_trabadicional_emp`;
DELIMITER //
CREATE TRIGGER `bit_D_trabadicional_emp` AFTER DELETE ON `trabadicional_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *trabadicional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'trabadicional_emp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.empresa, OLD.id, OLD.fec_ing,OLD.puesto ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_trabadicional_emp`;
DELIMITER //
CREATE TRIGGER `bit_I_trabadicional_emp` AFTER INSERT ON `trabadicional_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *trabadicional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'trabadicional_emp', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.empresa, NEW.id, NEW.fec_ing,NEW.puesto ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_trabadicional_emp`;
DELIMITER //
CREATE TRIGGER `bit_U_trabadicional_emp` AFTER UPDATE ON `trabadicional_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *trabadicional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'trabadicional_emp', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.empresa, NEW.id, NEW.fec_ing,NEW.puesto ),
concat_WS( '|', OLD.empresa, OLD.id, OLD.fec_ing,OLD.puesto )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE IF NOT EXISTS `turnos` (
  `turno` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Turno  (1,2,3)',
  `descripcion` varchar(20) NOT NULL COMMENT 'Descripción: Matutino, Vespertino, Interturnos',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`turno`),
  UNIQUE KEY `codigo_UNIQUE` (`turno`),
  KEY `fk_turnos_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`turno`, `descripcion`, `users_id`) VALUES
(1, 'MATUTINO', 10),
(2, 'VESPERTINO', 10),
(3, 'INTERTURNO', 10);

--
-- Disparadores `turnos`
--
DROP TRIGGER IF EXISTS `bit_D_turnos`;
DELIMITER //
CREATE TRIGGER `bit_D_turnos` AFTER DELETE ON `turnos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *turnos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'turnos', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.turno, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_turnos`;
DELIMITER //
CREATE TRIGGER `bit_I_turnos` AFTER INSERT ON `turnos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *turnos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'turnos', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.turno, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_turnos`;
DELIMITER //
CREATE TRIGGER `bit_U_turnos` AFTER UPDATE ON `turnos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *turnos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'turnos', NEW.users_id, 'U', curdate( ) , 
 concat_WS( '|', NEW.turno, NEW.descripcion ),
 concat_WS( '|', OLD.turno, OLD.descripcion )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uacademica`
--

CREATE TABLE IF NOT EXISTS `uacademica` (
  `uacademica` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo Facultad',
  `descripshort` varchar(10) NOT NULL COMMENT 'Descripcion (FCQ, FCA)',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripcion Facultad',
  `campus` int(11) NOT NULL DEFAULT '1' COMMENT 'Codigo campus',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`uacademica`),
  UNIQUE KEY `UAC_codigo_UNIQUE` (`uacademica`),
  KEY `fk_uacademica_campus1_idx` (`campus`),
  KEY `fk_uacademica_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `uacademica`
--

INSERT INTO `uacademica` (`uacademica`, `descripshort`, `descripcion`, `campus`, `users_id`) VALUES
(1, 'FCA', 'FACULTAD DE CONTADURIA Y ADMINISTRACION', 1, 1),
(2, 'FCQI', 'FACULTAD DE CIENCIAS QUIMICAS E INGENIERIA', 1, 1),
(3, 'FHCS', 'FACULTAD DE HUMANIDADES Y CIENCIAS SOCIALES', 1, 1),
(4, 'FD', 'FACULTAD DE DERECHO', 1, 1),
(5, 'FERI', 'FACULTAD DE ECONOMIA Y RELACIONES INTERNACIONALES', 1, 1),
(6, 'FIN', 'FACULTAD DE INGENIERIA Y NEGOCIOS', 1, 1),
(7, 'FMP', 'FACULTAD DE MEDICINA Y PSICOLOGIA', 1, 1),
(8, 'FO', 'FACULTAD DE ODONTOLOGIA', 1, 1),
(9, 'FTM', 'FACULTAD DE TURISMO Y MERCADOTECNIA', 1, 1),
(10, 'FA', 'FACULTAD DE ARTES', 1, 1);

--
-- Disparadores `uacademica`
--
DROP TRIGGER IF EXISTS `bit_D_uacademica`;
DELIMITER //
CREATE TRIGGER `bit_D_uacademica` AFTER DELETE ON `uacademica`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *uacademica*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'uacademica', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.uacademica, OLD.descripshort, OLD.descripcion,OLD.campus 
));
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_uacademica`;
DELIMITER //
CREATE TRIGGER `bit_I_uacademica` AFTER INSERT ON `uacademica`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *uacademica*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'uacademica', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.uacademica, NEW.descripshort, NEW.descripcion,NEW.campus 
));
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_uacademica`;
DELIMITER //
CREATE TRIGGER `bit_U_uacademica` AFTER UPDATE ON `uacademica`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *uacademica*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'uacademica', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.uacademica, NEW.descripshort, NEW.descripcion,NEW.campus),
concat_WS( '|', OLD.uacademica, OLD.descripshort, OLD.descripcion,OLD.campus)
);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uaprendizaje`
--

CREATE TABLE IF NOT EXISTS `uaprendizaje` (
  `uaprendizaje` int(11) NOT NULL COMMENT 'Código uaprendizaje (SOLO NUMERICOS)',
  `descripcionmat` varchar(100) NOT NULL COMMENT 'Descripción  uaprendizaje',
  `HC` int(11) NOT NULL COMMENT 'Horas Clase',
  `HL` int(11) NOT NULL COMMENT 'Horas Laboratorio',
  `HT` int(11) NOT NULL COMMENT 'Horas Taller',
  `HPC` int(11) NOT NULL COMMENT 'Horas',
  `HCL` int(11) NOT NULL COMMENT 'Horas Clinica',
  `HE` int(11) NOT NULL COMMENT 'Horas Extra',
  `creditos` int(11) NOT NULL COMMENT 'Numero de Créditos\n1Hr Clase= 2c',
  `fec_aut` date DEFAULT NULL COMMENT 'Fecha autorización',
  `observa` varchar(60) DEFAULT NULL COMMENT 'Observaciones',
  `coordinaciona` int(11) NOT NULL COMMENT 'Codigo coordinacion area',
  `plan` int(11) NOT NULL COMMENT 'Codigo plan estudio',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`uaprendizaje`),
  UNIQUE KEY `UA_clave_UNIQUE` (`uaprendizaje`),
  KEY `fk_uaprendizaje_coordinaciona1_idx` (`coordinaciona`),
  KEY `fk_uaprendizaje_planestudio1_idx` (`plan`),
  KEY `fk_uaprendizaje_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>';

--
-- Volcado de datos para la tabla `uaprendizaje`
--

INSERT INTO `uaprendizaje` (`uaprendizaje`, `descripcionmat`, `HC`, `HL`, `HT`, `HPC`, `HCL`, `HE`, `creditos`, `fec_aut`, `observa`, `coordinaciona`, `plan`, `users_id`) VALUES
(0, 'esto es una pruena', 1, 1, 1, 1, 1, 1, 1, '2014-07-01', 'esto es una prueba', 1, 20092, 1),
(11236, 'COMUNICACION ORAL Y ESCRITA', 1, 0, 2, 0, 0, 0, 4, NULL, NULL, 21, 20092, 1),
(11237, 'CONTABILIDAD', 2, 0, 3, 0, 0, 0, 7, NULL, NULL, 1, 20092, 1),
(11238, 'DESARROLLO HUMANO', 1, 0, 2, 0, 0, 0, 4, NULL, NULL, 8, 20092, 1),
(11239, 'ENTORNO GLOBAL DE LOS NEGOCIOS', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 10, 20092, 1),
(11240, 'MATEMATICAS', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 22, 20092, 1),
(11241, 'RESPONSABILIDAD SOCIAL', 2, 0, 1, 0, 0, 0, 5, NULL, NULL, 21, 20092, 1),
(11242, 'TECNOLOGIAS DE LA INFORMACION', 1, 3, 0, 0, 0, 0, 5, NULL, NULL, 12, 20092, 1),
(11243, 'CONTABILIDAD APLICADA', 2, 0, 3, 0, 0, 0, 7, NULL, NULL, 1, 20092, 1),
(11244, 'DERECHO', 3, 0, 0, 0, 0, 0, 6, NULL, NULL, 19, 20092, 1),
(11245, 'ECONOMIA', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 17, 20092, 1),
(11246, 'LOGICA PARA LA TOMA DE DECISIONES', 1, 0, 3, 0, 0, 0, 5, NULL, NULL, 16, 20092, 1),
(11247, 'PROBABILIDAD Y ESTADISTICA', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 22, 20092, 1),
(11248, 'PROCESO ADMINISTRATIVO', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 10, 20092, 1),
(11249, 'SISTEMAS DE INFORMACION', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 15, 20092, 1),
(11733, 'MATEMATICAS FINANCIERAS', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 4, 20092, 1),
(11734, 'ENTORNO SOCIOECONOMICO DE MEXICO', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 17, 20092, 1),
(11737, 'DERECHO CORPORATIVO', 3, 0, 1, 0, 0, 0, 7, NULL, NULL, 19, 20092, 1),
(11755, 'DESARROLLO DE EMPRENDEDORES', 1, 0, 3, 0, 0, 0, 5, NULL, NULL, 20, 20092, 1),
(11761, 'ADMINISTRACION PUBLICA', 3, 0, 0, 0, 0, 0, 6, NULL, NULL, 11, 20092, 1),
(11843, 'METODOLOGIA DE LA INVESTIGACION', 2, 0, 1, 0, 0, 0, 5, NULL, NULL, 21, 20092, 1),
(11859, 'METODOS CUANTITATIVOS', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 9, 20092, 1),
(11862, 'MERCADOTECNIA', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 7, 20092, 1),
(12292, 'ADMINISTRACION ESTRATEGICA', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 11, 20092, 1),
(12345, 'preuba de bitacora', 1, 1, 1, 1, 1, 1, 1, '2014-08-01', 'prueba bita', 1, 20092, 1),
(12456, 'ADMINISTRACION DE COMPRAS', 2, 0, 1, 0, 0, 0, 5, NULL, NULL, 10, 20092, 1),
(12457, 'DISEÃ‘O ORGANIZACIONAL', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 10, 20092, 1),
(12458, 'REGISTROS ESPECIALES', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 1, 20092, 1),
(12459, 'RELACIONES LABORALES', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 19, 20092, 1),
(12460, 'CONTABILIDAD ADMINISTRATIVA', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 3, 20092, 1),
(12461, 'DERECHO CORPORATIVO', 2, 0, 1, 0, 0, 0, 5, NULL, NULL, 1, 20092, 1),
(12462, 'DERECHO FISCAL', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 6, 20092, 1),
(12463, 'INTEGRACION Y DESARROLLO DEL TALENTO HUMANO', 2, 0, 3, 0, 0, 0, 7, NULL, NULL, 8, 20092, 1),
(12464, 'METODOS CUANTITATIVOS AVANZADOS', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 9, 20092, 1),
(12465, 'ADMINISTRACION DE OPERACIONES', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 9, 20092, 1),
(12466, 'ADMINISTRACION DE VENTAS', 2, 0, 1, 0, 0, 0, 5, NULL, NULL, 7, 20092, 1),
(12467, 'ANALISIS FINANCIERO', 2, 0, 3, 0, 0, 0, 7, NULL, NULL, 4, 20092, 1),
(12468, 'MERCADOTECNIA AVANZADA', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 7, 20092, 1),
(12469, 'SEGURIDAD E HIGIENE', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 8, 20092, 1),
(12470, 'ADMINISTRACION DEL CAPITAL DE TRABAJO', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 22, 20092, 1),
(12471, 'ADMINISTRACION DE SUELDOS Y SALARIOS', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 8, 20092, 1),
(12472, 'CONTRIBUCIONES DE SEGURIDAD SOCIAL', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 6, 20092, 1),
(12473, 'DIRECCION ESTRATEGICA', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 8, 20092, 1),
(12474, 'INVESTIGACION DE MERCADO', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 7, 20092, 1),
(12475, 'SI ESTRATEGICA EN LOS NEGOCIOS', 1, 0, 3, 0, 0, 0, 5, NULL, NULL, 15, 20092, 1),
(12476, 'ADMINISTRACION DE LA CALIDAD', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 22, 20092, 1),
(12477, 'AUDITORIA ADMINISTRATIVA', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 11, 20092, 1),
(12478, 'CONTROL PRESUPUESTAL', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 4, 20092, 1),
(12479, 'FUENTES DE FINANCIAMIENTO', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 4, 20092, 1),
(12480, 'COMPETITIVIDAD EN LOS MERCADOS', 1, 0, 3, 0, 0, 0, 5, NULL, NULL, 9, 20092, 1),
(12481, 'FORMULACION Y EVALUACION DE PROYECTOS DE INVERSION', 1, 0, 3, 0, 0, 0, 5, NULL, NULL, 4, 20092, 1),
(12482, 'PRACTICA PROFESIONAL', 0, 0, 0, 0, 0, 0, 10, NULL, NULL, 22, 20092, 1),
(12483, 'ADMON. DEL MEDIO AMBIENTE', 3, 0, 0, 0, 0, 0, 6, NULL, NULL, 22, 20092, 1),
(12484, 'ETICA', 3, 0, 0, 0, 0, 0, 6, NULL, NULL, 21, 20092, 1),
(12485, 'IDIOMA', 3, 0, 0, 0, 0, 0, 6, NULL, NULL, 22, 20092, 1),
(12486, 'SOCIOLOGIA DE LA EMPRESA', 3, 0, 0, 0, 0, 0, 6, NULL, NULL, 10, 20092, 1),
(12487, 'COMERCIO EXTERIOR', 4, 0, 0, 0, 0, 0, 6, NULL, NULL, 18, 20092, 1),
(12488, 'DESARROLLO DE HABILIDADES DOCENTES', 4, 0, 0, 0, 0, 0, 6, NULL, NULL, 21, 20092, 1),
(12489, 'DESARROLLO ORGANIZACIONAL', 3, 0, 0, 0, 0, 0, 6, NULL, NULL, 10, 20092, 1),
(12490, 'IMPUESTOS', 4, 0, 0, 0, 0, 0, 7, NULL, NULL, 6, 20092, 1),
(12491, 'MERCADOTECNIAS ESPECIALES', 4, 0, 0, 0, 0, 0, 7, NULL, NULL, 7, 20092, 1),
(12492, 'TECNICAS DE NEGOCIACION', 2, 0, 1, 0, 0, 0, 5, NULL, NULL, 11, 20092, 1),
(12493, 'ADMON. DE AGRONEGOCIOS', 3, 0, 0, 0, 0, 0, 6, NULL, NULL, 11, 20092, 1),
(12494, 'ADMON. Y COMERCIO ELECTRONICO', 4, 0, 0, 0, 0, 0, 6, NULL, NULL, 12, 20092, 1),
(12495, 'COMUNICACION ORGANIZACIONAL', 4, 0, 0, 0, 0, 0, 6, NULL, NULL, 11, 20092, 1),
(12496, 'CONSULTORIA', 4, 0, 0, 0, 0, 0, 6, NULL, NULL, 11, 20092, 1),
(12497, 'CREACION DE NEGOCIOS POR INTERNET', 4, 0, 0, 0, 0, 0, 6, NULL, NULL, 12, 20092, 1),
(12498, 'DESARROLLO DE HABILIDADES DIRECTIVAS', 3, 0, 0, 0, 0, 0, 6, NULL, NULL, 8, 20092, 1),
(12499, 'ETICA DE LOS NEGOCIOS', 4, 0, 0, 0, 0, 0, 7, NULL, NULL, 22, 20092, 1),
(12500, 'FINANZAS INTERNACIONALES', 4, 0, 0, 0, 0, 0, 6, NULL, NULL, 4, 20092, 1),
(12501, 'SISTEMAS ADMINISTRATIVOS ESPECIALES', 3, 0, 0, 0, 0, 0, 6, NULL, NULL, 22, 20092, 1),
(12559, 'DERECHO TRIBUTARIO', 2, 0, 3, 0, 0, 0, 7, NULL, NULL, 6, 20092, 1),
(12560, 'IMPUESTOS INDIRECTOS', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 6, 20092, 1),
(12561, 'NORMAS DE INFORMACION FINANCIERA', 2, 0, 3, 0, 0, 0, 7, NULL, NULL, 22, 20092, 1),
(12562, 'PROFESION CONTABLE', 1, 0, 2, 0, 0, 0, 4, NULL, NULL, 22, 20092, 1),
(12563, 'CONTABILIDAD DE SOCIEDADES', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 2, 20092, 1),
(12564, 'CONTROL', 1, 0, 4, 0, 0, 0, 6, NULL, NULL, 5, 20092, 1),
(12565, 'FUNDAMENTOS DE CONTABILIDAD DE COSTOS', 2, 0, 3, 0, 0, 0, 7, NULL, NULL, 3, 20092, 1),
(12566, 'NORMAS PARTICULARES', 3, 0, 3, 0, 0, 0, 7, NULL, NULL, 22, 20092, 1),
(12567, 'AUDITORIA', 2, 0, 3, 0, 0, 0, 7, NULL, NULL, 5, 20092, 1),
(12568, 'COSTOS PREDETERMINADOS', 2, 0, 3, 0, 0, 0, 7, NULL, NULL, 3, 20092, 1),
(12569, 'ESTADOS FINANCIEROS', 1, 2, 0, 0, 0, 0, 4, NULL, NULL, 2, 20092, 1),
(12570, 'ISR PERSONAS FISICAS', 2, 0, 3, 0, 0, 0, 7, NULL, NULL, 6, 20092, 1),
(12571, 'PLANEACION FINANCIERA', 1, 0, 2, 0, 0, 0, 4, NULL, NULL, 4, 20092, 1),
(12572, 'COSTOS PARA LA TOMA DE DECISIONES', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 3, 20092, 1),
(12573, 'ISR PERSONAS MORALES Y OTRAS CONTRIBUCIONES', 2, 0, 3, 0, 0, 0, 7, NULL, NULL, 6, 20092, 1),
(12574, 'PAQUETERIA NEGOCIOS', 1, 2, 0, 0, 0, 0, 4, NULL, NULL, 2, 20092, 1),
(12575, 'PRACTICA DE AUDITORIAS', 1, 0, 3, 0, 0, 0, 5, NULL, NULL, 5, 20092, 1),
(12576, 'PRACTICA FISCAL', 1, 2, 0, 0, 0, 0, 4, NULL, NULL, 6, 20092, 1),
(12578, 'INTEGRACION FISCAL', 1, 0, 2, 0, 0, 0, 4, NULL, NULL, 6, 20092, 1),
(12579, 'PLANEACION ESTRATEGICA', 1, 0, 3, 0, 0, 0, 5, NULL, NULL, 11, 20092, 1),
(12581, 'ANALISIS DE LA LEGISLACION ADUANERA', 4, 0, 0, 0, 0, 0, 8, NULL, NULL, 22, 20092, 1),
(12582, 'COSTOS Y PRODUCTIVIDAD', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 3, 20092, 1),
(12583, 'INVESTIGACION DE OPERACIONES', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 9, 20092, 1),
(12584, 'MERCADOTECNIA', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 7, 20092, 1),
(12585, 'PRODUCCION', 1, 0, 2, 0, 0, 0, 4, NULL, NULL, 9, 20092, 1),
(12586, 'AUDITORIAS ESPECIALES', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 5, 20092, 1),
(12587, 'CASOS PRACTICOS DE COSTOS', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 3, 20092, 1),
(12588, 'CONTABILIDAD INTERNACIONAL', 2, 0, 1, 0, 0, 0, 5, NULL, NULL, 2, 20092, 1),
(12589, 'CONTABILIDAD CONSOLIDADA', 3, 0, 1, 0, 0, 0, 7, NULL, NULL, 2, 20092, 1),
(12590, 'CONTABILIDADES ESPECIALES', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 2, 20092, 1),
(12591, 'DICTAMENES', 4, 0, 0, 0, 0, 0, 8, NULL, NULL, 5, 20092, 1),
(12592, 'FINANZAS INTERNACIONALES', 3, 0, 1, 0, 0, 0, 7, NULL, NULL, 4, 20092, 1),
(12593, 'INVESTIGACION CONTABLE', 2, 0, 2, 0, 0, 0, 6, NULL, NULL, 2, 20092, 1),
(12594, 'MERCADO DE VALORES', 2, 0, 1, 0, 0, 0, 5, NULL, NULL, 4, 20092, 1);

--
-- Disparadores `uaprendizaje`
--
DROP TRIGGER IF EXISTS `bit_D_uaprendizaje`;
DELIMITER //
CREATE TRIGGER `bit_D_uaprendizaje` AFTER DELETE ON `uaprendizaje`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *uaprendizaje*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Dic 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'uaprendizaje', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.uaprendizaje, 
OLD.descripcionmat, 
OLD.HC,
OLD.HL,
OLD.HT,
OLD.HPC,
OLD.HCL,
OLD.HE,
OLD.creditos,
OLD.fec_aut,
OLD.observa,
OLD.coordinaciona,
OLD.plan ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_uaprendizaje`;
DELIMITER //
CREATE TRIGGER `bit_I_uaprendizaje` AFTER INSERT ON `uaprendizaje`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *uaprendizaje*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Dic 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'uaprendizaje', NEW.users_id, 'I', curdate( ) , 
concat_WS( '|', NEW.uaprendizaje, NEW.descripcionmat, NEW.HC,NEW.HL,NEW.HT,NEW.HPC,NEW.HCL,NEW.HE,NEW.creditos,NEW.fec_aut,NEW.observa,NEW.coordinaciona,NEW.plan )
);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_uaprendizaje`;
DELIMITER //
CREATE TRIGGER `bit_U_uaprendizaje` AFTER UPDATE ON `uaprendizaje`
 FOR EACH ROW -- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *uaprendizaje*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'uaprendizaje', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.uaprendizaje, NEW.descripcionmat, NEW.HC,NEW.HL,NEW.HT,NEW.HPC,NEW.HCL,NEW.HE,NEW.creditos,NEW.fec_aut,NEW.observa,NEW.coordinaciona,NEW.plan ),
concat_WS( '|', OLD.uaprendizaje, OLD.descripcionmat, OLD.HC,OLD.HL,OLD.HT,OLD.HPC,OLD.HCL,OLD.HE,OLD.creditos,OLD.fec_aut,OLD.observa,OLD.coordinaciona,OLD.plan )  
)
;
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `universidades_emp`
--

CREATE TABLE IF NOT EXISTS `universidades_emp` (
  `universidad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Universidad empleados',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripcion Universidad',
  `descripshort` varchar(10) NOT NULL,
  `ciudad` int(11) NOT NULL COMMENT 'Ciudad',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`universidad`),
  KEY `fk_universidades_emp_ciudad1_idx` (`ciudad`),
  KEY `fk_universidades_emp_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `universidades_emp`
--

INSERT INTO `universidades_emp` (`universidad`, `descripcion`, `descripshort`, `ciudad`, `users_id`) VALUES
(1, 'UNIVERSIDAD AUTONOMA DE BAJA CALIFORNIA', 'UABC', 16, 1),
(2, 'INSTITUTO TECNOLOGICO DE TIJUANA', 'ITT', 16, 18);

--
-- Disparadores `universidades_emp`
--
DROP TRIGGER IF EXISTS `bit_D_universidades_emp`;
DELIMITER //
CREATE TRIGGER `bit_D_universidades_emp` AFTER DELETE ON `universidades_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *universidades_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'universidades_emp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.universidad, 
OLD.descripcion,
OLD.descripshort,
OLD.ciudad ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_universidades_emp`;
DELIMITER //
CREATE TRIGGER `bit_I_universidades_emp` AFTER INSERT ON `universidades_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *universidades_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'universidades_emp', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.universidad, 
NEW.descripcion,
NEW.descripshort,
NEW.ciudad ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_universidades_emp`;
DELIMITER //
CREATE TRIGGER `bit_U_universidades_emp` AFTER UPDATE ON `universidades_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *universidades_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'universidades_emp', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.universidad, 
NEW.descripcion,
NEW.descripshort,
NEW.ciudad),
concat_WS( '|',
OLD.universidad, 
OLD.descripcion,
OLD.descripshort,
OLD.ciudad)  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_materno` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `campus` int(11) NOT NULL,
  `uacademica` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sexo` char(1) DEFAULT NULL COMMENT 'Sexo',
  `rfc` varchar(13) DEFAULT NULL COMMENT 'RFC empleado',
  `fec_nac` date DEFAULT NULL COMMENT 'Fecha nacimiento',
  `fec_ing` date DEFAULT NULL COMMENT 'Fecha ingreso a UABC',
  `email_alternat` varchar(45) DEFAULT NULL COMMENT 'email alternativo',
  `ciudad` int(11) DEFAULT NULL COMMENT 'cd',
  `calle` varchar(45) DEFAULT NULL COMMENT 'Calle',
  `no_ext` int(11) DEFAULT NULL COMMENT 'No int',
  `no_int` varchar(3) DEFAULT NULL COMMENT 'No ext',
  `colonia` varchar(45) DEFAULT NULL COMMENT 'Colonia',
  `cp` int(11) DEFAULT NULL COMMENT 'cp',
  `telofna` varchar(45) DEFAULT NULL COMMENT 'Tel ofna',
  `telcel` varchar(45) DEFAULT NULL COMMENT 'Cel',
  `categoria` int(11) DEFAULT NULL COMMENT 'categoria',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  `unidad` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ua` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `programaedu` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `fk_users_uacademica1_idx` (`uacademica`),
  KEY `fk_users_campus1_idx` (`campus`),
  KEY `fk_users_categorias1_idx` (`categoria`),
  KEY `fk_users_users1_idx` (`users_id`),
  KEY `fk_users_ciudad1_idx` (`ciudad`),
  KEY `fk_users_levels1_idx` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `last_materno`, `email`, `address`, `phone`, `campus`, `uacademica`, `username`, `password`, `level`, `created_at`, `updated_at`, `remember_token`, `sexo`, `rfc`, `fec_nac`, `fec_ing`, `email_alternat`, `ciudad`, `calle`, `no_ext`, `no_int`, `colonia`, `cp`, `telofna`, `telcel`, `categoria`, `users_id`, `unidad`, `ua`, `programaedu`) VALUES
(1, 'Ivan', 'Duarte', '', 'wolfogan@gmail.com', 'Real de Calacoaya 7810-3B', 6450706, 1, 1, 'LoganX', '$2y$10$k8fT0GW/Obx8KgZU4hVufOt/stcuq3Y9Z8/9StZEMuLWOCmjfK1hO', 1, '2014-04-19 19:30:58', '2014-04-19 19:30:58', '', 'M', NULL, '1985-12-01', '2014-12-02', 'iavila85@uabc.edu.mx', 16, 'CALLE SERRADILLA', 500, 'A', 'MONTGOMERY', 22310, '664-9740000', '664-9740000', 101, 1, 'ENSENADA', 'FCA', 1),
(9, 'Cynthia', 'Duarte', '', 'zyntya@hotmail.com', 'Col. Nueva Tijuana', 6233987, 1, 1, 'Tikita', '$2y$10$9qAw9XKA/BtqYRg5WS087.3WjqG.eH0P8.JiLsY7BF4nBAZAPJ752', 2, '2014-04-19 19:30:58', '2014-05-14 22:29:32', 'E4uGco0FtNqNTuFFvxq4mSIrfA2qWORYIkt7KDU3SCMzLG90S3AlIhNIIUY8', 'F', NULL, '1990-12-02', '2014-12-31', 'luz.lugo@uabc.edu.mx', 16, 'DE LOS LAURELES', 600, '1', 'EL CIRCULO', 22450, '664-1236789', '664''1236789', 101, 1, 'VALLE DE LA TRINIDAD', 'FD', 0),
(10, 'Ra', 'Contreras', '', 'Raulito21@gmail.com', 'Calle 9 de julio #244', 52224799, 1, 1, 'ra21', '$2y$10$BCYlojviBdFVCG4jfpdcluYJWLW/2/gGIjDsgxPcKWRx09DpE1Oce', 2, '2014-04-19 19:31:10', '2014-04-19 19:31:10', '', 'M', NULL, '2000-12-17', '2014-12-31', 'raul.suchilt@uabc.edu.mx', 16, 'DE LOS REMEDIOS', 35, NULL, 'EL REMEDIO', 22345, '664-234677', '664-34589/', 104, 1, 'VALLE DE LA TRINIDAD', 'FD', 1),
(11, 'Juanelon', 'Rosado de la colina', '', 'paquito@gmail.com', 'Real de patito 50', 6457896, 1, 1, 'paquito', '$2y$10$NFJnp7SweU./sBw/YqBuM.Fg1mHuVjngo2e55Z/p9w.JxpliC6QlC', 2, '2014-04-21 15:08:27', '2014-04-21 17:03:15', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'VALLE DE LA TRINIDAD', 'FD', 0),
(17, 'unice', 'unice', '', 'unice@gmail.com', 'nose donde vive', 2147483647, 1, 1, 'uni', '$2y$10$T3ztXBdUMPxZGvOSyNk8wuSKCiX2gYu7WSLZ9ANkm5XVBda2Rm2Ye', 2, '2014-04-25 09:42:07', '2014-04-25 09:42:07', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'ENSENADA', 'FCA', 1),
(18, 'EMMA SOFIA', 'CASTILLEJOS', 'CABALLERO', 'emma.castillejos@uabc.edu.mx', 'CICLÓN', 2147483647, 1, 1, 'emma', 'sofia', 1, '2014-12-08 00:00:00', '2014-12-08 00:00:00', '', 'F', 'CACE7210142V1', '1972-10-14', '2005-09-23', NULL, 16, 'CICLÓN', 758, NULL, 'PLAYAS DE TIJUANA', NULL, '664-686-5679 ', '664-188-92-21', 101, 1, '1', '1', 3);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_carga`
--
CREATE TABLE IF NOT EXISTS `vw_carga` (
`carrera` int(11)
,`desc_carr` varchar(60)
,`semestre` int(11)
,`periodo` int(11)
,`desc_periodo` varchar(40)
,`uaprendizaje` int(11)
,`descripcionmat` varchar(100)
,`creditos` int(11)
,`HC` int(11)
,`ETAPA` int(11)
,`desc_etapa` varchar(20)
,`grupo` int(11)
,`requisito` varchar(256)
,`tunros` varchar(341)
,`grupos` varchar(256)
);
-- --------------------------------------------------------

--
-- Estructura para la vista `vw_carga`
--
DROP TABLE IF EXISTS `vw_carga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_carga` AS select max(`cr`.`programaedu`) AS `carrera`,max(`pre`.`descripcion`) AS `desc_carr`,max(`cr`.`semestre`) AS `semestre`,max(`cr`.`periodo`) AS `periodo`,max(`pe`.`descripcion`) AS `desc_periodo`,max(`cr`.`uaprendizaje`) AS `uaprendizaje`,max(`uap`.`descripcionmat`) AS `descripcionmat`,max(`uap`.`creditos`) AS `creditos`,max(`uap`.`HC`) AS `HC`,max(`pua`.`etapa`) AS `ETAPA`,max(`et`.`descripcion`) AS `desc_etapa`,max(`cr`.`grupo`) AS `grupo`,(select group_concat(`ds`.`uaprequisito` separator ',') from `detalleseriacion` `ds` where ((`ds`.`uaprendizaje` = `cr`.`uaprendizaje`) and (`ds`.`programaedu` = `gr`.`programaedu`))) AS `requisito`,(select group_concat(`turnos`.`descripcion` separator ',') from (`grupos` left join `turnos` on((`grupos`.`turno` = `turnos`.`turno`))) where (`grupos`.`grupo` = `cr`.`grupo`)) AS `tunros`,(select group_concat(`carga`.`grupo` separator ',') from `carga` where ((`carga`.`uaprendizaje` = `cr`.`uaprendizaje`) and (`carga`.`periodo` = `cr`.`periodo`) and (`carga`.`semestre` = `cr`.`semestre`))) AS `grupos` from ((((((((`carga` `cr` left join `uaprendizaje` `uap` on((`cr`.`uaprendizaje` = `uap`.`uaprendizaje`))) join `p_ua` `pua` on(((`pua`.`programaedu` = `cr`.`programaedu`) and (`pua`.`uaprendizaje` = `cr`.`uaprendizaje`)))) left join `grupos` `gr` on(((`gr`.`grupo` = `cr`.`grupo`) and (`gr`.`periodo` = `cr`.`periodo`) and (`gr`.`programaedu` = `cr`.`programaedu`)))) left join `programaedu` `pre` on((`pre`.`programaedu` = `pua`.`programaedu`))) left join `periodos` `pe` on(((`pe`.`periodo` = `cr`.`periodo`) and (`pe`.`periodo` = `pe`.`periodo`)))) left join `turnos` `tu` on((`tu`.`turno` = `gr`.`turno`))) left join `detalleseriacion` `ds` on(((`ds`.`uaprendizaje` = `cr`.`uaprendizaje`) and (`ds`.`programaedu` = `gr`.`programaedu`)))) left join `etapas` `et` on((`et`.`etapa` = `pua`.`etapa`))) group by `cr`.`periodo`,`cr`.`programaedu`,`cr`.`semestre`,`pua`.`uaprendizaje`;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `campus`
--
ALTER TABLE `campus`
  ADD CONSTRAINT `fk_campus_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`ciudad`),
  ADD CONSTRAINT `fk_campus_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `caracter`
--
ALTER TABLE `caracter`
  ADD CONSTRAINT `fk_caracter_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `caracteristica_cur`
--
ALTER TABLE `caracteristica_cur`
  ADD CONSTRAINT `fk_caracteristica_cur_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `carga`
--
ALTER TABLE `carga`
  ADD CONSTRAINT `fk_carga_grupos1` FOREIGN KEY (`grupo`, `periodo`) REFERENCES `grupos` (`grupo`, `periodo`),
  ADD CONSTRAINT `fk_carga_p_ua1` FOREIGN KEY (`programaedu`, `uaprendizaje`) REFERENCES `p_ua` (`programaedu`, `uaprendizaje`),
  ADD CONSTRAINT `fk_carga_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `carreras_emp`
--
ALTER TABLE `carreras_emp`
  ADD CONSTRAINT `fk_carreras_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `fk_categorias_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `fk_ciudad_estado1` FOREIGN KEY (`estado`) REFERENCES `estado` (`estado`),
  ADD CONSTRAINT `fk_ciudad_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `coordinaciona`
--
ALTER TABLE `coordinaciona`
  ADD CONSTRAINT `fk_coordinaciona_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  ADD CONSTRAINT `fk_coordinaciona_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `detalleseriacion`
--
ALTER TABLE `detalleseriacion`
  ADD CONSTRAINT `fk_detalleseriacion_pua` FOREIGN KEY (`programaedu`, `uaprendizaje`) REFERENCES `p_ua` (`programaedu`, `uaprendizaje`),
  ADD CONSTRAINT `fk_detalleseriacion_reqseriacion1` FOREIGN KEY (`reqseriacion`) REFERENCES `reqseriacion` (`reqseriacion`),
  ADD CONSTRAINT `fk_detalleseriacion_uaprendizaje2` FOREIGN KEY (`uaprequisito`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  ADD CONSTRAINT `fk_detalleseriacion_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `dias`
--
ALTER TABLE `dias`
  ADD CONSTRAINT `fk_dias_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `disp_hrs_dias`
--
ALTER TABLE `disp_hrs_dias`
  ADD CONSTRAINT `fk_disp_hrs_dias_dias2` FOREIGN KEY (`dia`) REFERENCES `dias` (`dia`),
  ADD CONSTRAINT `fk_disp_hrs_dias_horas1` FOREIGN KEY (`hora`) REFERENCES `horas` (`hora`),
  ADD CONSTRAINT `fk_disp_hrs_dias_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  ADD CONSTRAINT `fk_disp_hrs_dias_status1` FOREIGN KEY (`status`) REFERENCES `status` (`status`),
  ADD CONSTRAINT `fk_disp_hrs_dias_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_disp_hrs_dias_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `disp_ua`
--
ALTER TABLE `disp_ua`
  ADD CONSTRAINT `fk_disp_ua_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  ADD CONSTRAINT `fk_disp_ua_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  ADD CONSTRAINT `fk_disp_ua_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_disp_ua_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `doctos`
--
ALTER TABLE `doctos`
  ADD CONSTRAINT `fk_doctos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `documentos_emp`
--
ALTER TABLE `documentos_emp`
  ADD CONSTRAINT `fk_documentos_emp_doctos1` FOREIGN KEY (`docto`) REFERENCES `doctos` (`docto`),
  ADD CONSTRAINT `fk_documentos_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_documentos_emp_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `empresa_adic`
--
ALTER TABLE `empresa_adic`
  ADD CONSTRAINT `fk_empresa_adic_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `esp_prog_edu`
--
ALTER TABLE `esp_prog_edu`
  ADD CONSTRAINT `fk_esp_prog_edu_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `fk_estado_pais1` FOREIGN KEY (`pais`) REFERENCES `pais` (`pais`),
  ADD CONSTRAINT `fk_estado_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `etapas`
--
ALTER TABLE `etapas`
  ADD CONSTRAINT `fk_etapas_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `fk_grupos_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  ADD CONSTRAINT `fk_grupos_planestudio1` FOREIGN KEY (`plan`, `programaedu`) REFERENCES `plan_programa` (`plan`, `programaedu`),
  ADD CONSTRAINT `fk_grupos_turnos1` FOREIGN KEY (`turno`) REFERENCES `turnos` (`turno`),
  ADD CONSTRAINT `fk_grupos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `fk_horarios_dias1` FOREIGN KEY (`dia`) REFERENCES `dias` (`dia`),
  ADD CONSTRAINT `fk_horarios_grupos1` FOREIGN KEY (`grupo`, `periodo`) REFERENCES `grupos` (`grupo`, `periodo`),
  ADD CONSTRAINT `fk_horarios_horas1` FOREIGN KEY (`hora`) REFERENCES `horas` (`hora`),
  ADD CONSTRAINT `fk_horarios_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  ADD CONSTRAINT `fk_horarios_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_horarios_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `horas`
--
ALTER TABLE `horas`
  ADD CONSTRAINT `fk_horas_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `levels`
--
ALTER TABLE `levels`
  ADD CONSTRAINT `fk_levels_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `nvprograma`
--
ALTER TABLE `nvprograma`
  ADD CONSTRAINT `fk_nvprograma_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `pais`
--
ALTER TABLE `pais`
  ADD CONSTRAINT `fk_pais_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD CONSTRAINT `fk_periodos_periodo_prog_edu1` FOREIGN KEY (`periodo_pedu`) REFERENCES `periodo_prog_edu` (`periodo_pedu`),
  ADD CONSTRAINT `fk_periodos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `periodo_prog_edu`
--
ALTER TABLE `periodo_prog_edu`
  ADD CONSTRAINT `fk_periodo_prog_edu_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `planestudio`
--
ALTER TABLE `planestudio`
  ADD CONSTRAINT `fk_planestudiodesc_nvprograma1` FOREIGN KEY (`nivel`) REFERENCES `nvprograma` (`nivel`),
  ADD CONSTRAINT `fk_planestudiodesc_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `plan_programa`
--
ALTER TABLE `plan_programa`
  ADD CONSTRAINT `fk_planestudio_planestudiodesc1` FOREIGN KEY (`plan`) REFERENCES `planestudio` (`plan`),
  ADD CONSTRAINT `fk_planestudio_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  ADD CONSTRAINT `fk_planestudio_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `programaedu`
--
ALTER TABLE `programaedu`
  ADD CONSTRAINT `fk_programaedu_esp_prog_edu1` FOREIGN KEY (`especialidad`) REFERENCES `esp_prog_edu` (`especialidad`),
  ADD CONSTRAINT `fk_programaedu_nvprograma1` FOREIGN KEY (`nivel`) REFERENCES `nvprograma` (`nivel`),
  ADD CONSTRAINT `fk_programaedu_periodo_prog_edu1` FOREIGN KEY (`periodo_pedu`) REFERENCES `periodo_prog_edu` (`periodo_pedu`),
  ADD CONSTRAINT `fk_programaedu_uacademica1` FOREIGN KEY (`uacademica`) REFERENCES `uacademica` (`uacademica`),
  ADD CONSTRAINT `fk_programaedu_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD CONSTRAINT `fk_puesto_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `puestosemp`
--
ALTER TABLE `puestosemp`
  ADD CONSTRAINT `fk_puestosemp_puesto1` FOREIGN KEY (`puesto`) REFERENCES `puesto` (`puesto`),
  ADD CONSTRAINT `fk_puestosemp_uacademica1` FOREIGN KEY (`uacademica`) REFERENCES `uacademica` (`uacademica`),
  ADD CONSTRAINT `fk_puestosemp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_puestosemp_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `p_ua`
--
ALTER TABLE `p_ua`
  ADD CONSTRAINT `fk_p_ua_caracter1` FOREIGN KEY (`caracter`) REFERENCES `caracter` (`caracter`),
  ADD CONSTRAINT `fk_p_ua_etapas1` FOREIGN KEY (`etapa`) REFERENCES `etapas` (`etapa`),
  ADD CONSTRAINT `fk_p_ua_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  ADD CONSTRAINT `fk_p_ua_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  ADD CONSTRAINT `fk_p_ua_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `reqseriacion`
--
ALTER TABLE `reqseriacion`
  ADD CONSTRAINT `fk_reqseriacion_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `fk_status_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `status_horarios`
--
ALTER TABLE `status_horarios`
  ADD CONSTRAINT `fk_status_horarios_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  ADD CONSTRAINT `fk_status_horarios_status1` FOREIGN KEY (`status`) REFERENCES `status` (`status`),
  ADD CONSTRAINT `fk_status_horarios_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_status_horarios_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `status_procesos`
--
ALTER TABLE `status_procesos`
  ADD CONSTRAINT `fk_status_procesos_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  ADD CONSTRAINT `fk_status_procesos_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  ADD CONSTRAINT `fk_status_procesos_status1` FOREIGN KEY (`status_carga`) REFERENCES `status` (`status`),
  ADD CONSTRAINT `fk_status_procesos_status2` FOREIGN KEY (`status_plan`) REFERENCES `status` (`status`),
  ADD CONSTRAINT `fk_status_procesos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `tipo_curso_emp`
--
ALTER TABLE `tipo_curso_emp`
  ADD CONSTRAINT `fk_tipo_curso_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `trabadicional_emp`
--
ALTER TABLE `trabadicional_emp`
  ADD CONSTRAINT `fk_trabadicional_emp_empresa_adic1` FOREIGN KEY (`empresa`) REFERENCES `empresa_adic` (`empresa`),
  ADD CONSTRAINT `fk_trabadicional_emp_puesto1` FOREIGN KEY (`puesto`) REFERENCES `puesto` (`puesto`),
  ADD CONSTRAINT `fk_trabadicional_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_trabadicional_emp_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD CONSTRAINT `fk_turnos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `uacademica`
--
ALTER TABLE `uacademica`
  ADD CONSTRAINT `fk_uacademica_campus1` FOREIGN KEY (`campus`) REFERENCES `campus` (`campus`),
  ADD CONSTRAINT `fk_uacademica_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `uaprendizaje`
--
ALTER TABLE `uaprendizaje`
  ADD CONSTRAINT `fk_uaprendizaje_planestudio1` FOREIGN KEY (`plan`) REFERENCES `planestudio` (`plan`),
  ADD CONSTRAINT `fk_uaprendizaje_coordinaciona1` FOREIGN KEY (`coordinaciona`) REFERENCES `coordinaciona` (`coordinaciona`),
  ADD CONSTRAINT `fk_uaprendizaje_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `universidades_emp`
--
ALTER TABLE `universidades_emp`
  ADD CONSTRAINT `fk_universidades_emp_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`ciudad`),
  ADD CONSTRAINT `fk_universidades_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_campus1` FOREIGN KEY (`campus`) REFERENCES `campus` (`campus`),
  ADD CONSTRAINT `fk_users_categorias1` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`categoria`),
  ADD CONSTRAINT `fk_users_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`ciudad`),
  ADD CONSTRAINT `fk_users_levels1` FOREIGN KEY (`level`) REFERENCES `levels` (`level`),
  ADD CONSTRAINT `fk_users_uacademica1` FOREIGN KEY (`uacademica`) REFERENCES `uacademica` (`uacademica`),
  ADD CONSTRAINT `fk_users_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;