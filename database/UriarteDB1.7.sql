-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: uriarte
-- ------------------------------------------------------
-- Server version	8.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

SET NAMES utf8mb4;



-- Crear base de datos: `uriarte`
CREATE DATABASE IF NOT EXISTS `uriarte` 
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;
USE `uriarte`;

-- ------------------------------------------------------
-- Sección Inicio de Sesión / Register

--
-- Table structure for table `inicio sesion`
--

CREATE TABLE `inicio sesion` (
  `usuario` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contraseña` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`usuario`(30))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `usuario` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `correo_electronico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contraseña` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `confirmar_contraseña` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`usuario`(30))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `recuperar_contraseña`
--

CREATE TABLE `recuperar_contraseña` (
  `correo_electronico` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`correo_electronico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ------------------------------------------------------
-- Resto de funciones

--
-- Table structure for table `formulario_registro_paciente`
--

CREATE TABLE `formulario_registro_paciente` (
  `nombre` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apellido` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dni` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `genero` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `obra_social` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefono` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `correo_electronico` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'habilitado',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `consulta_paciente`
--

CREATE TABLE `consulta_paciente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NOT NULL,
  `fecha` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `peso` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `altura` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `presion_arterial` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `diagnostico` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tratamiento` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `estudios_a_realizar` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `motivo_visita` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_paciente` (`id_paciente`),
  CONSTRAINT `consulta_paciente_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `formulario_registro_paciente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `tabla_paciente`
--

CREATE TABLE `tabla_paciente` (
  `buscar` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `consulta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `historial` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modificar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`buscar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `anotaciones_extra`
--

CREATE TABLE `anotaciones_extra` (
  `idAnotacion` int NOT NULL AUTO_INCREMENT,
  `idPaciente` int DEFAULT NULL,
  `anotacion` text,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idAnotacion`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `modificar`
--

CREATE TABLE `modificar` (
  `telefono` int NOT NULL,
  `correo_electronico` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `direccion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `anotaciones_extra`
ADD CONSTRAINT `anotaciones_extra_ibfk_1` FOREIGN KEY (`idPaciente`) REFERENCES `formulario_registro_paciente` (`id`);