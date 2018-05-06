-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: May 02, 2018 at 12:24 PM
-- Server version: 5.5.49-log
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teste`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_clinica`
--

CREATE TABLE IF NOT EXISTS `tb_clinica` (
  `codigo` int(11) NOT NULL,
  `ativo` int(1) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `sigla` varchar(45) NOT NULL,
  `cor` varchar(45) NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  `modificado_por` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_clinica`
--

INSERT INTO `tb_clinica` (`codigo`, `ativo`, `nome`, `sigla`, `cor`, `data_modificacao`, `modificado_por`) VALUES
(1, 1, 'Clínica 01', 'CLIN01', '#e3b6d3', '2017-11-22 15:05:41', 3),
(3, 1, 'Clínica 02', 'CLIN02', '#ad7484', '2018-04-26 15:12:17', 2),
(4, 1, 'Clínica 03', 'CLIN03', '#7ee854', '2018-04-26 15:05:12', 2);

--
-- Triggers `tb_clinica`
--
DELIMITER $$
CREATE TRIGGER `I_Clinica` AFTER INSERT ON `tb_clinica`
 FOR EACH ROW BEGIN
  INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
  VALUES
      ('tb_Clinica', NEW.codigo, 'INSERT', 'ativo', '', NEW.ativo, NOW(), NEW.modificado_por),
      ('tb_Clinica', NEW.codigo, 'INSERT', 'nome', '', NEW.nome, NOW(), NEW.modificado_por),
      ('tb_Clinica', NEW.codigo, 'INSERT', 'sigla', '', NEW.sigla, NOW(), NEW.modificado_por),
      ('tb_Clinica', NEW.codigo, 'INSERT', 'cor', '', NEW.cor, NOW(), NEW.modificado_por);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `U_Clinica` AFTER UPDATE ON `tb_clinica`
 FOR EACH ROW BEGIN
  IF (NEW.ativo <> OLD.ativo) THEN  
    INSERT INTO tb_Log 
      VALUES ('tb_Clinica', OLD.codigo, 'UPDATE', 'ativo', OLD.ativo, NEW.ativo, NOW(), NEW.modificado_por);
  END IF;
  IF (NEW.nome <> OLD.nome) THEN  
      INSERT INTO tb_Log 
        VALUES ('tb_Clinica', OLD.codigo, 'UPDATE', 'nome', OLD.nome, NEW.nome, NOW(), NEW.modificado_por);
  END IF;
  IF (NEW.sigla <> OLD.sigla) THEN  
      INSERT INTO tb_Log 
        VALUES ('tb_Clinica', OLD.codigo, 'UPDATE', 'sigla', OLD.sigla, NEW.sigla, NOW(), NEW.modificado_por);
  END IF;
  IF (NEW.cor <> OLD.cor) THEN  
      INSERT INTO tb_Log 
        VALUES ('tb_Clinica', OLD.codigo, 'UPDATE', 'cor', OLD.cor, NEW.cor, NOW(), NEW.modificado_por);
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_clinicaendereco`
--

CREATE TABLE IF NOT EXISTS `tb_clinicaendereco` (
  `codigo` int(11) NOT NULL,
  `clinica` int(11) NOT NULL,
  `ativo` int(1) NOT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `logradouro` varchar(255) DEFAULT NULL,
  `numero` varchar(40) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  `modificado_por` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_clinicaendereco`
--

INSERT INTO `tb_clinicaendereco` (`codigo`, `clinica`, `ativo`, `cep`, `logradouro`, `numero`, `complemento`, `bairro`, `estado`, `cidade`, `data_modificacao`, `modificado_por`) VALUES
(1, 1, 1, '11310-061', 'Rua Frei Gaspar', '931', '', 'Centro', 'SP', 'São Vicente', '2018-04-05 16:40:46', 3),
(3, 3, 1, '89164-063', 'Rua Joinville ', '', '', 'Canoas ', 'SC', 'Rio do Sul', '2018-04-26 15:13:18', 2);

--
-- Triggers `tb_clinicaendereco`
--
DELIMITER $$
CREATE TRIGGER `I_ClinicaEndereco` AFTER INSERT ON `tb_clinicaendereco`
 FOR EACH ROW BEGIN
 INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
  VALUES
      ('tb_ClinicaEndereco', NEW.codigo, 'INSERT', 'clinica', '', NEW.clinica, NOW(), NEW.modificado_por),
      ('tb_ClinicaEndereco', NEW.codigo, 'INSERT', 'ativo', '', NEW.ativo, NOW(), NEW.modificado_por),
      ('tb_ClinicaEndereco', NEW.codigo, 'INSERT', 'cep', '', NEW.cep, NOW(), NEW.modificado_por),
      ('tb_ClinicaEndereco', NEW.codigo, 'INSERT', 'logradouro', '', NEW.logradouro, NOW(), NEW.modificado_por),
      ('tb_ClinicaEndereco', NEW.codigo, 'INSERT', 'numero', '', NEW.numero, NOW(), NEW.modificado_por),
      ('tb_ClinicaEndereco', NEW.codigo, 'INSERT', 'complemento', '', NEW.complemento, NOW(), NEW.modificado_por),
      ('tb_ClinicaEndereco', NEW.codigo, 'INSERT', 'bairro', '', NEW.bairro, NOW(), NEW.modificado_por),
      ('tb_ClinicaEndereco', NEW.codigo, 'INSERT', 'estado', '', NEW.estado, NOW(), NEW.modificado_por),
      ('tb_ClinicaEndereco', NEW.codigo, 'INSERT', 'cidade', '', NEW.cidade, NOW(), NEW.modificado_por);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `U_ClinicaEndereco` AFTER UPDATE ON `tb_clinicaendereco`
 FOR EACH ROW BEGIN
  IF (NEW.clinica <> OLD.clinica) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ClinicaEndereco', OLD.codigo, 'UPDATE', 'clinica', OLD.clinica, NEW.clinica, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.ativo <> OLD.ativo) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ClinicaEndereco', OLD.codigo, 'UPDATE', 'ativo', OLD.ativo, NEW.ativo, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.cep <> OLD.cep) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ClinicaEndereco', OLD.codigo, 'UPDATE', 'cep', OLD.cep, NEW.cep, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.logradouro <> OLD.logradouro) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ClinicaEndereco', OLD.codigo, 'UPDATE', 'logradouro', OLD.logradouro, NEW.logradouro, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.numero <> OLD.numero) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ClinicaEndereco', OLD.codigo, 'UPDATE', 'numero', OLD.numero, NEW.numero, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.complemento <> OLD.complemento) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ClinicaEndereco', OLD.codigo, 'UPDATE', 'complemento', OLD.complemento, NEW.complemento, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.bairro <> OLD.bairro) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ClinicaEndereco', OLD.codigo, 'UPDATE', 'bairro', OLD.bairro, NEW.bairro, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.estado <> OLD.estado) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ClinicaEndereco', OLD.codigo, 'UPDATE', 'estado', OLD.estado, NEW.estado, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.cidade <> OLD.cidade) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ClinicaEndereco', OLD.codigo, 'UPDATE', 'cidade', OLD.cidade, NEW.cidade, NOW(), NEW.modificado_por);
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_clinicaprofissional`
--

CREATE TABLE IF NOT EXISTS `tb_clinicaprofissional` (
  `codigo` int(11) NOT NULL,
  `clinica` int(11) NOT NULL,
  `profissional` int(11) NOT NULL,
  `proprietario` int(1) NOT NULL,
  `editar` int(1) NOT NULL,
  `ativo` int(1) DEFAULT NULL,
  `valor_consulta` float(8,2) NOT NULL DEFAULT '0.00',
  `valor_consulta_subsequente` float(8,2) NOT NULL DEFAULT '0.00',
  `tempo_retorno` int(11) DEFAULT NULL,
  `tempo_consulta` varchar(45) NOT NULL,
  `valor_consulta_convenio` float(8,2) NOT NULL,
  `valor_consulta_subsequente_convenio` float(8,2) NOT NULL,
  `tempo_retorno_convenio` int(11) NOT NULL,
  `tempo_consulta_convenio` varchar(45) NOT NULL,
  `observacao` text NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  `modificado_por` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_clinicaprofissional`
--

INSERT INTO `tb_clinicaprofissional` (`codigo`, `clinica`, `profissional`, `proprietario`, `editar`, `ativo`, `valor_consulta`, `valor_consulta_subsequente`, `tempo_retorno`, `tempo_consulta`, `valor_consulta_convenio`, `valor_consulta_subsequente_convenio`, `tempo_retorno_convenio`, `tempo_consulta_convenio`, `observacao`, `data_modificacao`, `modificado_por`) VALUES
(1, 1, 2, 0, 1, 1, 600.00, 300.00, 30, 'PT30M', 300.00, 150.00, 15, 'PT15M', '', '2017-11-22 15:05:41', 3),
(2, 3, 2, 1, 1, 1, 150.00, 75.00, 30, 'PT30M', 35.00, 35.00, 15, 'PT15M', 'Lorem Ipsum ', '2018-04-26 15:12:17', 2),
(3, 4, 2, 1, 1, 1, 270.00, 170.00, 20, 'PT20M', 25.00, 25.00, 10, 'PT10M', 'L', '2018-04-26 15:05:12', 2);

--
-- Triggers `tb_clinicaprofissional`
--
DELIMITER $$
CREATE TRIGGER `I_ClinicaProfissional` AFTER INSERT ON `tb_clinicaprofissional`
 FOR EACH ROW BEGIN
 INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
  VALUES
  	  ('tb_ClinicaProfissional', NEW.codigo, 'INSERT', 'clinica', '', NEW.clinica, NOW(), NEW.modificado_por),
      ('tb_ClinicaProfissional', NEW.codigo, 'INSERT', 'profissional', '', NEW.profissional, NOW(), NEW.modificado_por),
      ('tb_ClinicaProfissional', NEW.codigo, 'INSERT', 'proprietario', '', NEW.proprietario, NOW(), NEW.modificado_por),
      ('tb_ClinicaProfissional', NEW.codigo, 'INSERT', 'editar', '', NEW.editar, NOW(), NEW.modificado_por),
      ('tb_ClinicaProfissional', NEW.codigo, 'INSERT', 'valor_consulta', '', NEW.valor_consulta, NOW(), NEW.modificado_por),
      ('tb_ClinicaProfissional', NEW.codigo, 'INSERT', 'valor_consulta_subsequente', '', NEW.valor_consulta_subsequente, NOW(), NEW.modificado_por),
      ('tb_ClinicaProfissional', NEW.codigo, 'INSERT', 'tempo_retorno', '', NEW.tempo_retorno, NOW(), NEW.modificado_por),
      ('tb_ClinicaProfissional', NEW.codigo, 'INSERT', 'tempo_consulta', '', NEW.tempo_consulta, NOW(), NEW.modificado_por),
      ('tb_ClinicaProfissional', NEW.codigo, 'INSERT', 'valor_consulta_convenio', '', NEW.valor_consulta_convenio, NOW(), NEW.modificado_por),
      ('tb_ClinicaProfissional', NEW.codigo, 'INSERT', 'valor_consulta_subsequente_convenio', '', NEW.valor_consulta_subsequente_convenio, NOW(), NEW.modificado_por),
      ('tb_ClinicaProfissional', NEW.codigo, 'INSERT', 'tempo_retorno_convenio', '', NEW.tempo_retorno_convenio, NOW(), NEW.modificado_por),
      ('tb_ClinicaProfissional', NEW.codigo, 'INSERT', 'tempo_consulta_convenio', '', NEW.tempo_consulta_convenio, NOW(), NEW.modificado_por),
      ('tb_ClinicaProfissional', NEW.codigo, 'INSERT', 'observacao', '', NEW.observacao, NOW(), NEW.modificado_por);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `U_ClinicaProfissional` AFTER UPDATE ON `tb_clinicaprofissional`
 FOR EACH ROW BEGIN
  IF (NEW.clinica <> OLD.clinica) THEN  
      INSERT INTO tb_Log 
        VALUES ('tb_ClinicaProfissional', OLD.codigo, 'UPDATE', 'clinica', OLD.clinica, NEW.clinica, NOW(), NEW.modificado_por);
  END IF;
  IF (NEW.profissional <> OLD.profissional) THEN  
      INSERT INTO tb_Log 
        VALUES ('tb_ClinicaProfissional', OLD.codigo, 'UPDATE', 'profissional', OLD.profissional, NEW.profissional, NOW(), NEW.modificado_por);
  END IF;
  IF (NEW.proprietario <> OLD.proprietario) THEN  
      INSERT INTO tb_Log 
        VALUES ('tb_ClinicaProfissional', OLD.codigo, 'UPDATE', 'proprietario', OLD.proprietario, NEW.proprietario, NOW(), NEW.modificado_por);
  END IF;
  IF (NEW.editar <> OLD.editar) THEN  
      INSERT INTO tb_Log 
        VALUES ('tb_ClinicaProfissional', OLD.codigo, 'UPDATE', 'editar', OLD.editar, NEW.editar, NOW(), NEW.modificado_por);
  END IF;
  IF (NEW.valor_consulta <> OLD.valor_consulta) THEN  
      INSERT INTO tb_Log 
        VALUES ('tb_ClinicaProfissional', OLD.codigo, 'UPDATE', 'valor_consulta', OLD.valor_consulta, NEW.valor_consulta, NOW(), NEW.modificado_por);
  END IF;
  IF (NEW.valor_consulta_subsequente <> OLD.valor_consulta_subsequente) THEN  
      INSERT INTO tb_Log 
        VALUES ('tb_ClinicaProfissional', OLD.codigo, 'UPDATE', 'valor_consulta_subsequente', OLD.valor_consulta_subsequente, NEW.valor_consulta_subsequente, NOW(), NEW.modificado_por);
  END IF;
  IF (NEW.tempo_retorno <> OLD.tempo_retorno) THEN  
      INSERT INTO tb_Log 
        VALUES ('tb_ClinicaProfissional', OLD.codigo, 'UPDATE', 'tempo_retorno', OLD.tempo_retorno, NEW.tempo_retorno, NOW(), NEW.modificado_por);
  END IF;
  IF (NEW.tempo_consulta <> OLD.tempo_consulta) THEN  
      INSERT INTO tb_Log 
        VALUES ('tb_ClinicaProfissional', OLD.codigo, 'UPDATE', 'tempo_consulta', OLD.tempo_consulta, NEW.tempo_consulta, NOW(), NEW.modificado_por);
  END IF;
  IF (NEW.valor_consulta_convenio <> OLD.valor_consulta_convenio) THEN  
      INSERT INTO tb_Log 
        VALUES ('tb_ClinicaProfissional', OLD.codigo, 'UPDATE', 'valor_consulta_convenio', OLD.valor_consulta_convenio, NEW.valor_consulta_convenio, NOW(), NEW.modificado_por);
  END IF;
  IF (NEW.valor_consulta_subsequente_convenio <> OLD.valor_consulta_subsequente_convenio) THEN  
      INSERT INTO tb_Log 
        VALUES ('tb_ClinicaProfissional', OLD.codigo, 'UPDATE', 'valor_consulta_subsequente_convenio', OLD.valor_consulta_subsequente_convenio, NEW.valor_consulta_subsequente_convenio, NOW(), NEW.modificado_por);
  END IF;
  IF (NEW.tempo_retorno_convenio <> OLD.tempo_retorno_convenio) THEN  
      INSERT INTO tb_Log 
        VALUES ('tb_ClinicaProfissional', OLD.codigo, 'UPDATE', 'tempo_retorno_convenio', OLD.tempo_retorno_convenio, NEW.tempo_retorno_convenio, NOW(), NEW.modificado_por);
  END IF;
  IF (NEW.tempo_consulta_convenio <> OLD.tempo_consulta_convenio) THEN  
      INSERT INTO tb_Log 
        VALUES ('tb_ClinicaProfissional', OLD.codigo, 'UPDATE', 'tempo_consulta_convenio', OLD.tempo_consulta_convenio, NEW.tempo_consulta_convenio, NOW(), NEW.modificado_por);
  END IF;
  IF (NEW.observacao <> OLD.observacao) THEN  
      INSERT INTO tb_Log 
        VALUES ('tb_ClinicaProfissional', OLD.codigo, 'UPDATE', 'observacao', OLD.observacao, NEW.observacao, NOW(), NEW.modificado_por);
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_log`
--

CREATE TABLE IF NOT EXISTS `tb_log` (
  `tabela` varchar(255) NOT NULL,
  `codigo` int(11) NOT NULL,
  `operacao` varchar(255) NOT NULL,
  `campo` varchar(255) NOT NULL,
  `valor_antigo` varchar(255) NOT NULL,
  `valor_novo` varchar(255) NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `modificado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `tb_menu`
--

CREATE TABLE IF NOT EXISTS `tb_menu` (
  `codigo` int(11) NOT NULL,
  `modulo` int(11) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `ativo` int(1) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `posicionamento` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_menu`
--

INSERT INTO `tb_menu` (`codigo`, `modulo`, `data_cadastro`, `ativo`, `nome`, `posicionamento`) VALUES
(1, 1, '2017-05-22 14:05:24', 0, 'Índice', 99),
(2, 2, '2017-05-22 14:05:28', 1, 'Índice', 3),
(5, 5, '2017-05-25 16:32:52', 1, 'Índice', 6),
(6, 3, '2017-05-26 11:46:49', 1, 'Índice', 5),
(7, 4, '2017-05-26 11:46:59', 1, 'Índice', 4),
(8, 6, '2017-05-26 11:47:23', 1, 'Índice', 8),
(9, 7, '2017-05-26 11:47:30', 1, 'Índice', 7),
(10, 8, '2017-05-26 11:51:06', 1, 'Índice', 1),
(13, 9, '2017-08-18 10:06:42', 1, 'Índice', 9),
(14, 10, '2017-09-22 11:33:27', 1, 'índice', 2),
(15, 11, '2018-05-04 11:15:03' ,1 , 'Índice' , 10),
(16, 12, '2018-05-04 11:15:03' ,1, 'Índice' , 11),
(17, 13, '2018-05-04 11:48:03', 1, 'Índice' , 12 ),
(18, 14, '2018-05-04 11:48:03', 1, 'Índice' , 13 ),
(19, 15, '2018-05-04 11:48:03', 1, 'Índice' , 14 );

-- --------------------------------------------------------

--
-- Table structure for table `tb_modulo`
--

CREATE TABLE IF NOT EXISTS `tb_modulo` (
  `codigo` int(11) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `ativo` int(1) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_modulo`
--

INSERT INTO `tb_modulo` (`codigo`, `data_cadastro`, `ativo`, `nome`) VALUES
(1, '2017-05-22 13:58:49', 0, 'Usuário'),
(2, '2017-05-23 15:04:29', 1, 'Paciente'),
(3, '2017-05-23 15:04:37', 1, 'Clínica'),
(4, '2017-05-23 15:05:10', 1, 'Secretária'),
(5, '2017-05-25 16:32:39', 1, 'Convênio'),
(6, '2017-05-26 11:44:50', 1, 'Configuração'),
(7, '2017-05-26 11:45:02', 1, 'Prontuário'),
(8, '2017-05-26 11:50:50', 1, 'Agenda'),
(9, '2017-08-17 17:12:45', 1, 'Profissional'),
(10, '2017-09-22 11:32:49', 1, 'Avançado'),
(11,'2018-05-04 10:58:45 ',1 ,'Voucher'),
(12,'2018-05-04 10:58:45 ',1 ,'Representante'),
(13, '2018-05-04 11:39:25',1, 'Serviços'), 
(14, '2018-05-04 11:39:45', 1, 'Pacotes'),
(15, '2018-05-04 11:41:23', 1, 'Contato');

-- --------------------------------------------------------

--
-- Table structure for table `tb_perfil`
--

CREATE TABLE IF NOT EXISTS `tb_perfil` (
  `codigo` int(11) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `ativo` int(1) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_perfil`
--

INSERT INTO `tb_perfil` (`codigo`, `data_cadastro`, `ativo`, `nome`) VALUES
(1, '2017-05-15 11:19:56', 1, 'Administrador'),
(2, '2017-05-15 11:57:20', 1, 'Profissional da Saúde'),
(3, '2017-05-15 11:57:28', 1, 'Secretária'),
(4, '2017-06-28 10:25:13', 1, 'Teleatendente'),
(5, '2017-09-19 09:24:56', 1, 'Teleatendente + Administrador'),
(6, '2018-05-04 11:03:23', 1, 'Representante');
-- --------------------------------------------------------

--
-- Table structure for table `tb_permissao`
--

CREATE TABLE IF NOT EXISTS `tb_permissao` (
  `codigo` int(11) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `ativo` int(1) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_permissao`
--

INSERT INTO `tb_permissao` (`codigo`, `data_cadastro`, `ativo`, `nome`) VALUES
(1, '2017-05-22 14:15:06', 1, 'Cadastrar'),
(2, '2017-05-22 14:15:17', 1, 'Editar'),
(3, '2017-05-22 14:15:25', 1, 'Consultar'),
(4, '2017-05-22 14:15:34', 1, 'Excluir');

-- --------------------------------------------------------

--
-- Table structure for table `tb_permissaousuario`
--

CREATE TABLE IF NOT EXISTS `tb_permissaousuario` (
  `usuario` int(11) NOT NULL,
  `modulo` int(11) NOT NULL,
  `permissao` int(11) NOT NULL,
  `ativo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_permissaousuario`
--

INSERT INTO `tb_permissaousuario` (`usuario`, `modulo`, `permissao`, `ativo`) VALUES
(1, 1, 1, 1),
(1, 1, 2, 1),
(1, 1, 3, 1),
(1, 1, 4, 1),
(1, 2, 1, 0),
(1, 2, 2, 0),
(1, 2, 3, 0),
(1, 2, 4, 0),
(1, 3, 1, 0),
(1, 3, 2, 0),
(1, 3, 3, 0),
(1, 3, 4, 0),
(1, 4, 1, 1),
(1, 4, 2, 1),
(1, 4, 3, 1),
(1, 4, 4, 1),
(1, 5, 1, 0),
(1, 5, 2, 0),
(1, 5, 3, 0),
(1, 5, 4, 0),
(1, 6, 1, 0),
(1, 6, 2, 0),
(1, 6, 3, 0),
(1, 6, 4, 0),
(1, 7, 1, 0),
(1, 7, 2, 0),
(1, 7, 3, 0),
(1, 7, 4, 0),
(1, 8, 1, 0),
(1, 8, 2, 0),
(1, 8, 3, 0),
(1, 8, 4, 0),
(1, 9, 1, 1),
(1, 9, 2, 1),
(1, 9, 3, 1),
(1, 9, 4, 1),
(1, 10, 1, 1),
(1, 10, 2, 1),
(1, 10, 3, 1),
(1, 10, 4, 1),
(1, 11, 1, 1),
(1, 11, 2, 0),
(1, 11, 3, 1),
(1, 11, 4, 1),
(1, 12, 1, 1),
(1, 12, 2, 1),
(1, 12, 3, 1),
(1, 12, 4, 1),
(1, 13, 1, 1),
(1, 13, 2, 1),
(1, 13, 3, 1),
(1, 13, 4, 1),
(1, 14, 1, 1),
(1, 14, 2, 1),
(1, 14, 3, 1),
(1, 14, 4, 1),
(1, 15, 1, 0),
(1, 15, 2, 0),
(1, 15, 3, 1),
(1, 15, 4, 0),

(2, 1, 1, 0),
(2, 1, 2, 0),
(2, 1, 3, 0),
(2, 1, 4, 0),
(2, 2, 1, 1),
(2, 2, 2, 1),
(2, 2, 3, 1),
(2, 2, 4, 1),
(2, 3, 1, 1),
(2, 3, 2, 1),
(2, 3, 3, 1),
(2, 3, 4, 1),
(2, 4, 1, 1),
(2, 4, 2, 1),
(2, 4, 3, 1),
(2, 4, 4, 1),
(2, 5, 1, 1),
(2, 5, 2, 1),
(2, 5, 3, 1),
(2, 5, 4, 1),
(2, 6, 1, 1),
(2, 6, 2, 1),
(2, 6, 3, 1),
(2, 6, 4, 1),
(2, 7, 1, 1),
(2, 7, 2, 1),
(2, 7, 3, 1),
(2, 7, 4, 1),
(2, 8, 1, 1),
(2, 8, 2, 1),
(2, 8, 3, 1),
(2, 8, 4, 1),
(2, 9, 1, 0),
(2, 9, 2, 1),
(2, 9, 3, 1),
(2, 9, 4, 0),
(2, 10, 1, 1),
(2, 10, 2, 1),
(2, 10, 3, 1),
(2, 10, 4, 1),
(2, 11, 1, 0),
(2, 11, 2 ,0),
(2, 11, 3, 0),
(2, 11, 4, 0),
(2, 12, 1, 0),
(2, 12, 2, 0),
(2, 12, 3, 0),
(2, 12, 4, 0),
(2, 13, 1, 0),
(2, 13, 2, 0),
(2, 13, 3, 0),
(2, 13, 4, 0),
(2, 14, 1, 0),
(2, 14, 2, 0),
(2, 14 ,3, 0),
(2, 14 ,4 ,0),
(2, 15, 1, 0),
(2, 15, 2, 0),
(2, 15 ,3, 0),
(2, 15 ,4 ,0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_profissao`
--

CREATE TABLE IF NOT EXISTS `tb_profissao` (
  `codigo` int(11) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `ativo` int(1) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_profissao`
--

INSERT INTO `tb_profissao` (`codigo`, `data_cadastro`, `ativo`, `nome`) VALUES
(1, '2017-08-28 13:45:14', 1, 'Médico'),
(2, '2017-11-27 16:43:37', 1, 'Psicólogo'),
(3, '2017-11-27 16:43:57', 1, 'Fonoaudiólogo'),
(4, '2017-11-27 16:44:21', 1, 'Terapeuta Ocupacional'),
(5, '2017-11-27 16:44:31', 1, 'Fisoterapeuta'),
(6, '2017-11-27 16:44:44', 1, 'Dentista'),
(7, '2017-11-27 16:44:56', 1, 'Nutricionista'),
(8, '2017-11-27 16:45:15', 1, 'Biomédica Estética'),
(9, '2017-11-27 16:45:23', 1, 'Psiquiatra');

-- --------------------------------------------------------

--
-- Table structure for table `tb_profissionaldadosgerais`
--

CREATE TABLE IF NOT EXISTS `tb_profissionaldadosgerais` (
  `usuario` int(11) NOT NULL,
  `profissao` int(11) NOT NULL,
  `data_nascimento` datetime DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `nacionalidade` varchar(255) DEFAULT NULL,
  `naturalidade` varchar(255) DEFAULT NULL,
  `estado_civil` varchar(255) DEFAULT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `especialidade` varchar(255) DEFAULT NULL,
  `conselho` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `conselho_estado` varchar(45) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `sobre` text,
  `data_modificacao` datetime DEFAULT NULL,
  `modificado_por` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_profissionaldadosgerais`
--

INSERT INTO `tb_profissionaldadosgerais` (`usuario`, `profissao`, `data_nascimento`, `sexo`, `nacionalidade`, `naturalidade`, `estado_civil`, `rg`, `cpf`, `especialidade`, `conselho`, `numero`, `conselho_estado`, `telefone`, `celular`, `site`, `sobre`, `data_modificacao`, `modificado_por`) VALUES
(2, 1, '0000-00-00 00:00:00', '', 'Brasileira', '', '', '', '83878586760', '', '', '', '', '(13) 9852.2366', '(13) 98444.1252', '', '', '0000-00-00 00:00:00', 1);

--
-- Triggers `tb_profissionaldadosgerais`
--
DELIMITER $$
CREATE TRIGGER `I_ProfissionalDadosGerais` AFTER INSERT ON `tb_profissionaldadosgerais`
 FOR EACH ROW BEGIN
  INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
  VALUES
      ('tb_ProfissionalDadosGerais', NEW.usuario, 'INSERT', 'profissao', '', NEW.profissao, NOW(), NEW.modificado_por),
      ('tb_ProfissionalDadosGerais', NEW.usuario, 'INSERT', 'data_nascimento', '', NEW.data_nascimento, NOW(), NEW.modificado_por),
      ('tb_ProfissionalDadosGerais', NEW.usuario, 'INSERT', 'sexo', '', NEW.sexo, NOW(), NEW.modificado_por),
      ('tb_ProfissionalDadosGerais', NEW.usuario, 'INSERT', 'nacionalidade', '', NEW.nacionalidade, NOW(), NEW.modificado_por),
      ('tb_ProfissionalDadosGerais', NEW.usuario, 'INSERT', 'naturalidade', '', NEW.naturalidade, NOW(), NEW.modificado_por),
      ('tb_ProfissionalDadosGerais', NEW.usuario, 'INSERT', 'estado_civil', '', NEW.estado_civil, NOW(), NEW.modificado_por),
      ('tb_ProfissionalDadosGerais', NEW.usuario, 'INSERT', 'rg', '', NEW.rg, NOW(), NEW.modificado_por),
      ('tb_ProfissionalDadosGerais', NEW.usuario, 'INSERT', 'cpf', '', NEW.cpf, NOW(), NEW.modificado_por),
      ('tb_ProfissionalDadosGerais', NEW.usuario, 'INSERT', 'especialidade', '', NEW.especialidade, NOW(), NEW.modificado_por),
      ('tb_ProfissionalDadosGerais', NEW.usuario, 'INSERT', 'conselho', '', NEW.conselho, NOW(), NEW.modificado_por),
      ('tb_ProfissionalDadosGerais', NEW.usuario, 'INSERT', 'numero', '', NEW.numero, NOW(), NEW.modificado_por),
      ('tb_ProfissionalDadosGerais', NEW.usuario, 'INSERT', 'conselho_estado', '', NEW.conselho_estado, NOW(), NEW.modificado_por),
      ('tb_ProfissionalDadosGerais', NEW.usuario, 'INSERT', 'telefone', '', NEW.telefone, NOW(), NEW.modificado_por),
      ('tb_ProfissionalDadosGerais', NEW.usuario, 'INSERT', 'celular', '', NEW.celular, NOW(), NEW.modificado_por),
      ('tb_ProfissionalDadosGerais', NEW.usuario, 'INSERT', 'site', '', NEW.site, NOW(), NEW.modificado_por),
      ('tb_ProfissionalDadosGerais', NEW.usuario, 'INSERT', 'sobre', '', NEW.sobre, NOW(), NEW.modificado_por);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `U_ProfissionalDadosGerais` AFTER UPDATE ON `tb_profissionaldadosgerais`
 FOR EACH ROW BEGIN
  IF (NEW.profissao <> OLD.profissao) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalDadosGerais', OLD.usuario, 'UPDATE', 'profissao', OLD.profissao, NEW.profissao, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.data_nascimento <> OLD.data_nascimento) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalDadosGerais', OLD.usuario, 'UPDATE', 'data_nascimento', OLD.data_nascimento, NEW.data_nascimento, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.sexo <> OLD.sexo) THEN  
	    INSERT INTO tb_LogProfissionalDadosGerais 
	      VALUES ('tb_ProfissionalDadosGerais', OLD.usuario, 'UPDATE', 'sexo', OLD.sexo, NEW.sexo, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.nacionalidade <> OLD.nacionalidade) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalDadosGerais', OLD.usuario, 'UPDATE', 'nacionalidade', OLD.nacionalidade, NEW.nacionalidade, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.naturalidade <> OLD.naturalidade) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalDadosGerais', OLD.usuario, 'UPDATE', 'naturalidade', OLD.naturalidade, NEW.naturalidade, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.estado_civil <> OLD.estado_civil) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalDadosGerais', OLD.usuario, 'UPDATE', 'estado_civil', OLD.estado_civil, NEW.estado_civil, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.rg <> OLD.rg) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalDadosGerais', OLD.usuario, 'UPDATE', 'rg', OLD.rg, NEW.rg, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.cpf <> OLD.cpf) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalDadosGerais', OLD.usuario, 'UPDATE', 'cpf', OLD.cpf, NEW.cpf, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.especialidade <> OLD.especialidade) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalDadosGerais', OLD.usuario, 'UPDATE', 'especialidade', OLD.especialidade, NEW.especialidade, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.conselho <> OLD.conselho) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalDadosGerais', OLD.usuario, 'UPDATE', 'conselho', OLD.conselho, NEW.conselho, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.numero <> OLD.numero) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalDadosGerais', OLD.usuario, 'UPDATE', 'numero', OLD.numero, NEW.numero, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.conselho_estado <> OLD.conselho_estado) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalDadosGerais', OLD.usuario, 'UPDATE', 'conselho_estado', OLD.conselho_estado, NEW.conselho_estado, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.telefone <> OLD.telefone) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalDadosGerais', OLD.usuario, 'UPDATE', 'telefone', OLD.telefone, NEW.telefone, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.celular <> OLD.celular) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalDadosGerais', OLD.usuario, 'UPDATE', 'celular', OLD.celular, NEW.celular, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.site <> OLD.site) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalDadosGerais', OLD.usuario, 'UPDATE', 'site', OLD.site, NEW.site, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.sobre <> OLD.sobre) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalDadosGerais', OLD.usuario, 'UPDATE', 'sobre', OLD.sobre, NEW.sobre, NOW(), NEW.modificado_por);
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_profissionalendereco`
--

CREATE TABLE IF NOT EXISTS `tb_profissionalendereco` (
  `codigo` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `ativo` int(1) NOT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `logradouro` varchar(255) DEFAULT NULL,
  `numero` varchar(40) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  `modificado_por` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_profissionalendereco`
--

INSERT INTO `tb_profissionalendereco` (`codigo`, `usuario`, `ativo`, `cep`, `logradouro`, `numero`, `complemento`, `bairro`, `estado`, `cidade`, `data_modificacao`, `modificado_por`) VALUES
(1, 2, 1, '11310-061', 'Rua Frei Gaspar', '', '', 'Centro', 'SP', 'São Vicente', '2018-04-05 16:38:15', 2);

--
-- Triggers `tb_profissionalendereco`
--
DELIMITER $$
CREATE TRIGGER `I_ProfissionalEndereco` AFTER INSERT ON `tb_profissionalendereco`
 FOR EACH ROW BEGIN
 INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
  VALUES
	  ('tb_ProfissionalEndereco', NEW.codigo, 'INSERT', 'usuario', '', NEW.usuario, NOW(), NEW.modificado_por),
	  ('tb_ProfissionalEndereco', NEW.codigo, 'INSERT', 'ativo', '', NEW.ativo, NOW(), NEW.modificado_por),
    ('tb_ProfissionalEndereco', NEW.codigo, 'INSERT', 'cep', '', NEW.cep, NOW(), NEW.modificado_por),
    ('tb_ProfissionalEndereco', NEW.codigo, 'INSERT', 'logradouro', '', NEW.logradouro, NOW(), NEW.modificado_por),
    ('tb_ProfissionalEndereco', NEW.codigo, 'INSERT', 'numero', '', NEW.numero, NOW(), NEW.modificado_por),
    ('tb_ProfissionalEndereco', NEW.codigo, 'INSERT', 'complemento', '', NEW.complemento, NOW(), NEW.modificado_por),
    ('tb_ProfissionalEndereco', NEW.codigo, 'INSERT', 'bairro', '', NEW.bairro, NOW(), NEW.modificado_por),
    ('tb_ProfissionalEndereco', NEW.codigo, 'INSERT', 'estado', '', NEW.estado, NOW(), NEW.modificado_por),
    ('tb_ProfissionalEndereco', NEW.codigo, 'INSERT', 'cidade', '', NEW.cidade, NOW(), NEW.modificado_por);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `U_ProfissionalEndereco` AFTER UPDATE ON `tb_profissionalendereco`
 FOR EACH ROW BEGIN
  IF (NEW.usuario <> OLD.usuario) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalEndereco', OLD.codigo, 'UPDATE', 'usuario', OLD.usuario, NEW.usuario, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.ativo <> OLD.ativo) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalEndereco', OLD.codigo, 'UPDATE', 'ativo', OLD.ativo, NEW.ativo, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.cep <> OLD.cep) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalEndereco', OLD.codigo, 'UPDATE', 'cep', OLD.cep, NEW.cep, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.logradouro <> OLD.logradouro) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalEndereco', OLD.codigo, 'UPDATE', 'logradouro', OLD.logradouro, NEW.logradouro, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.numero <> OLD.numero) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalEndereco', OLD.codigo, 'UPDATE', 'numero', OLD.numero, NEW.numero, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.complemento <> OLD.complemento) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalEndereco', OLD.codigo, 'UPDATE', 'complemento', OLD.complemento, NEW.complemento, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.bairro <> OLD.bairro) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalEndereco', OLD.codigo, 'UPDATE', 'bairro', OLD.bairro, NEW.bairro, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.estado <> OLD.estado) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalEndereco', OLD.codigo, 'UPDATE', 'estado', OLD.estado, NEW.estado, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.cidade <> OLD.cidade) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_ProfissionalEndereco', OLD.codigo, 'UPDATE', 'cidade', OLD.cidade, NEW.cidade, NOW(), NEW.modificado_por);
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_usuario`
--

CREATE TABLE IF NOT EXISTS `tb_usuario` (
  `codigo` int(11) NOT NULL,
  `perfil` int(11) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `ativo` int(1) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `suspenso` int(1) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  `modificado_por` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_usuario`
--

INSERT INTO `tb_usuario` (`codigo`, `perfil`, `data_cadastro`, `ativo`, `nome`, `email`, `senha`, `suspenso`, `foto`, `data_modificacao`, `modificado_por`) VALUES
(1, 1, '2017-11-21 18:02:53', 1, 'Administrador', 'adm@adm.com.br', '5f41069f4d41a8acca9bd05c3f14b1ea', 0, '', '2018-04-03 14:53:52', 0),
(2, 2, '2018-04-05 11:06:28', 1, 'Médico', 'medico@medico.com.br', '5f41069f4d41a8acca9bd05c3f14b1ea', 0, 'fotos/b81b752fe1bb2a9ceda53eb2ef5b4913.png', '2018-04-05 16:38:09', 2);

INSERT INTO `tb_usuario` (`codigo`, `perfil`, `data_cadastro`, `ativo`, `nome`, `email`, `senha`, `suspenso`, `foto`, `data_modificacao`, `modificado_por`) VALUES
(3, 6, '2018-05-05 22:25:13', 1, 'Representante', 'rep@rep.com.br', '5f41069f4d41a8acca9bd05c3f14b1ea', 0, '', '2018-05-05 22:25:52', 0);


--
-- Triggers `tb_usuario`
--
DELIMITER $$
CREATE TRIGGER `I_Usuario` AFTER INSERT ON `tb_usuario`
 FOR EACH ROW BEGIN
  INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por )
  VALUES
      ('tb_Usuario', NEW.codigo, 'INSERT', 'perfil', '', NEW.perfil, NOW(), NEW.modificado_por),
      ('tb_Usuario', NEW.codigo, 'INSERT', 'nome', '', NEW.nome, NOW(), NEW.modificado_por),
      ('tb_Usuario', NEW.codigo, 'INSERT', 'email', '', NEW.email, NOW(), NEW.modificado_por),
      ('tb_Usuario', NEW.codigo, 'INSERT', 'senha', '', NEW.senha, NOW(), NEW.modificado_por),
      ('tb_Usuario', NEW.codigo, 'INSERT', 'suspenso', '', NEW.suspenso, NOW(), NEW.modificado_por),
      ('tb_Usuario', NEW.codigo, 'INSERT', 'foto', '', NEW.foto, NOW(), NEW.modificado_por);

   IF (NEW.perfil = 1) THEN
    INSERT INTO tb_PermissaoUsuario (usuario, modulo, permissao, ativo)
     VALUES
         (NEW.codigo, 1, 1 ,1),
         (NEW.codigo, 1, 2, 1),
         (NEW.codigo, 1, 3, 1),
         (NEW.codigo, 1, 4, 1),
         (NEW.codigo, 2, 1, 0),
         (NEW.codigo, 2, 2, 0),
         (NEW.codigo, 2, 3, 0),
         (NEW.codigo, 2, 4, 0),
         (NEW.codigo, 3, 1, 0),
         (NEW.codigo, 3, 2, 0),
         (NEW.codigo, 3, 3, 0),
         (NEW.codigo, 3, 4, 0),
         (NEW.codigo, 4, 1, 1),
         (NEW.codigo, 4, 2, 1),
         (NEW.codigo, 4, 3, 1),
         (NEW.codigo, 4, 4, 1),
         (NEW.codigo, 5, 1, 0),
         (NEW.codigo, 5, 2, 0),
         (NEW.codigo, 5, 3, 0),
         (NEW.codigo, 5, 4, 0),
         (NEW.codigo, 6, 1, 0),
         (NEW.codigo, 6, 2, 0),
         (NEW.codigo, 6, 3, 0),
         (NEW.codigo, 6, 4, 0),
         (NEW.codigo, 7, 1, 0),
         (NEW.codigo, 7, 2, 0),
         (NEW.codigo, 7, 3, 0),
         (NEW.codigo, 7, 4, 0),
         (NEW.codigo, 8, 1, 0),
         (NEW.codigo, 8, 2, 0),
         (NEW.codigo, 8, 3, 0),
         (NEW.codigo, 8, 4, 0),
         (NEW.codigo, 9, 1, 1),
         (NEW.codigo, 9, 2, 1),
         (NEW.codigo, 9, 3, 1),
         (NEW.codigo, 9, 4, 1),
         (NEW.codigo, 10, 1, 1),
         (NEW.codigo, 10, 2, 1),
         (NEW.codigo, 10, 3, 1),
         (NEW.codigo, 10, 4, 1);
   END IF;

   IF (NEW.perfil = 2) THEN
    INSERT INTO tb_PermissaoUsuario (usuario, modulo, permissao, ativo)
      VALUES
         (NEW.codigo, 1, 1, 0),
         (NEW.codigo, 1, 2, 0),
         (NEW.codigo, 1, 3, 0),
         (NEW.codigo, 1, 4, 0),
         (NEW.codigo, 2, 1, 1),
         (NEW.codigo, 2, 2, 1),
         (NEW.codigo, 2, 3, 1),
         (NEW.codigo, 2, 4, 1),
         (NEW.codigo, 3, 1, 1),
         (NEW.codigo, 3, 2, 1),
         (NEW.codigo, 3, 3, 1),
         (NEW.codigo, 3, 4, 1),
         (NEW.codigo, 4, 1, 1),
         (NEW.codigo, 4, 2, 1),
         (NEW.codigo, 4, 3, 1),
         (NEW.codigo, 4, 4, 1),
         (NEW.codigo, 5, 1, 1),
         (NEW.codigo, 5, 2, 1),
         (NEW.codigo, 5, 3, 1),
         (NEW.codigo, 5, 4, 1),
         (NEW.codigo, 6, 1, 1),
         (NEW.codigo, 6, 2, 1),
         (NEW.codigo, 6, 3, 1),
         (NEW.codigo, 6, 4, 1),
         (NEW.codigo, 7, 1, 1),
         (NEW.codigo, 7, 2, 1),
         (NEW.codigo, 7, 3, 1),
         (NEW.codigo, 7, 4, 1),
         (NEW.codigo, 8, 1, 1),
         (NEW.codigo, 8, 2, 1),
         (NEW.codigo, 8, 3, 1),
         (NEW.codigo, 8, 4, 1),
         (NEW.codigo, 9, 1, 0),
         (NEW.codigo, 9, 2, 1),
         (NEW.codigo, 9, 3, 1),
         (NEW.codigo, 9, 4, 0),
         (NEW.codigo, 10, 1, 1),
         (NEW.codigo, 10, 2, 1),
         (NEW.codigo, 10, 3, 1),
         (NEW.codigo, 10, 4, 1);
   END IF;

    IF (NEW.perfil = 6) THEN -- representante
    INSERT INTO tb_PermissaoUsuario (usuario, modulo, permissao, ativo)
     VALUES
         (NEW.codigo, 1, 1 ,0),
         (NEW.codigo, 1, 2, 0),
         (NEW.codigo, 1, 3, 0),
         (NEW.codigo, 1, 4, 0),
         (NEW.codigo, 2, 1, 0),
         (NEW.codigo, 2, 2, 0),
         (NEW.codigo, 2, 3, 0),
         (NEW.codigo, 2, 4, 0),
         (NEW.codigo, 3, 1, 0),
         (NEW.codigo, 3, 2, 0),
         (NEW.codigo, 3, 3, 0),
         (NEW.codigo, 3, 4, 0),
         (NEW.codigo, 4, 1, 0),
         (NEW.codigo, 4, 2, 0),
         (NEW.codigo, 4, 3, 0),
         (NEW.codigo, 4, 4, 0),
         (NEW.codigo, 5, 1, 0),
         (NEW.codigo, 5, 2, 0),
         (NEW.codigo, 5, 3, 0),
         (NEW.codigo, 5, 4, 0),
         (NEW.codigo, 6, 1, 0), -- configuração
         (NEW.codigo, 6, 2, 0),
         (NEW.codigo, 6, 3, 0),
         (NEW.codigo, 6, 4, 0),
         (NEW.codigo, 7, 1, 0),
         (NEW.codigo, 7, 2, 0),
         (NEW.codigo, 7, 3, 0),
         (NEW.codigo, 7, 4, 0),
         (NEW.codigo, 8, 1, 0),
         (NEW.codigo, 8, 2, 0),
         (NEW.codigo, 8, 3, 0),
         (NEW.codigo, 8, 4, 0),
         (NEW.codigo, 9, 1, 0),
         (NEW.codigo, 9, 2, 0),
         (NEW.codigo, 9, 3, 0),
         (NEW.codigo, 9, 4, 0),
         (NEW.codigo, 10, 1,0),
         (NEW.codigo, 10, 2,0),
         (NEW.codigo, 10, 3,0),
         (NEW.codigo, 10, 4,0),
         (NEW.codigo, 11, 1,0), -- voucher
		 (NEW.codigo, 11 ,2,0),
		 (NEW.codigo, 11, 3,1),
		 (NEW.codigo, 11, 4,0),
		 (NEW.codigo, 12, 1,0),-- representante
		 (NEW.codigo, 12, 2,1),
		 (NEW.codigo, 12, 3,1),
		 (NEW.codigo, 12, 4,0),
		 (NEW.codigo, 13, 1,1), -- contato
		 (NEW.codigo, 13, 2,1),
		 (NEW.codigo, 13, 3,1),
		 (NEW.codigo, 13, 4,1),
		 (NEW.codigo, 14, 1,0), -- serviço
		 (NEW.codigo, 14, 2,0),
		 (NEW.codigo, 14 ,3,0),
		 (NEW.codigo, 14 ,4,0),
		 (NEW.codigo, 15, 1,0), -- pacote
		 (NEW.codigo, 15, 2,0),
		 (NEW.codigo, 15 ,3,0),
		 (NEW.codigo, 15 ,4,0);
         
   END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `U_Usuario` AFTER UPDATE ON `tb_usuario`
 FOR EACH ROW BEGIN
  IF (NEW.ativo <> OLD.ativo) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_Usuario', OLD.codigo, 'UPDATE', 'ativo', OLD.ativo, NEW.ativo, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.perfil <> OLD.perfil) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_Usuario', OLD.codigo, 'UPDATE', 'perfil', OLD.perfil, NEW.perfil, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.nome <> OLD.nome) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_Usuario', OLD.codigo, 'UPDATE', 'nome', OLD.nome, NEW.nome, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.email <> OLD.email) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_Usuario', OLD.codigo, 'UPDATE', 'email', OLD.email, NEW.email, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.senha <> OLD.senha) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_Usuario', OLD.codigo, 'UPDATE', 'senha', OLD.senha, NEW.senha, NOW(), NEW.modificado_por);
	END IF;
	IF (NEW.suspenso <> OLD.suspenso) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_Usuario', OLD.codigo, 'UPDATE', 'suspenso', OLD.suspenso, NEW.suspenso, NOW(), NEW.modificado_por);
	END IF;
  IF (NEW.foto <> OLD.foto) THEN  
	    INSERT INTO tb_Log 
	      VALUES ('tb_Usuario', OLD.codigo, 'UPDATE', 'foto', OLD.foto, NEW.foto, NOW(), NEW.modificado_por);
	END IF;
END
$$
DELIMITER ;



-- Tabela Contato
        
create table tb_contato(
	cd_contato int(11) not null,	
    cd_voucher int(11) default null, -- chave estrangeira
    cd_representante int(11) not null, -- chave estrangeira
	ativo int(1) not null,
    nm_contato varchar(100) not null,
    cd_telefone varchar(13)not null,
    cd_celular varchar(15) not null, -- realemnte necessário?
    ds_email varchar(60)not null,
    cd_crm int(5) default null,
    nm_cargo varchar(40) default null,
    ds_site_particular varchar(60) default null,
    ds_profissional varchar(300) default null,
    dt_nascimento date default null,
    cd_sexo varchar(10) default null,
    cd_rg varchar(9) default null,
    nm_clinica varchar(45) default null,
    cd_cep int(8) default null,
    nm_cidade varchar(45) default null,
    sg_estado varchar(2) default null,
    nm_bairro varchar(45) default null,
    ds_endereco varchar(45) default null,
    nm_complemento varchar(128) default null,
	data_modificado datetime default null,
	modificado_por int(11) not null default '0' -- assim?
);

	--
	-- Triggers 'tb_contato'
	--

	DELIMITER $$
	CREATE TRIGGER I_Contato AFTER INSERT ON tb_contato
		FOR EACH ROW BEGIN
			INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
			VALUES
				('tb_Contato', New.cd_contato, 'INSERT', 'ativo', '', NEW.ativo, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'nm_nome', '', NEW.nm_contato, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'cd_telefone', '', NEW.cd_telefone, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'cd_celular', '', NEW.cd_celular, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'ds_email', '', NEW.ds_email, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'cd_crm', '', NEW.cd_crm, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'nm_cargo', '', NEW.nm_cargo, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'ds_site_particular', '', NEW.ds_site_particular, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'ds_profissional', '', NEW.ds_profissional, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'dt_nascimento', '', NEW.dt_nascimento, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'cd_sexo', '', NEW.cd_sexo, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'cd_rg', '', NEW.cd_rg, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'nm_clinica', '', NEW.nm_clinica, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'cd_cep', '', NEW.cd_cep, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'nm_cidade', '', NEW.nm_cidade, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'sg_estado', '', NEW.sg_estado, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'nm_bairro', '', NEW.nm_bairro, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'ds_endereco', '', NEW.ds_endereco, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'nm_complemento', '', NEW.nm_complemento, NOW(), NEW.modificado_por);
		END
	$$
	DELIMITER ;

	DELIMITER $$
		CREATE TRIGGER u_cONTATO AFTER UPDATE ON tb_contato
			FOR EACH ROW BEGIN
				IF(NEW.ativo <> OLD.ativo) THEN
					INSERT INTO tb_Log-- esse cd_contato/ codigo de tb_log é a chave primária da tabela contato?
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'ativo', OLD.ativo, NEW.ativo, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.nm_contato <> OLD.nm_contato) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'nm_nome', OLD.nm_contato , NEW.nm_contato, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.cd_telefone <> OLD.cd_telefone) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'cd_telefone', OLD.cd_telefone , NEW.cd_telefone, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.cd_celular <> OLD.cd_celular) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'cd_celular', OLD.cd_celular , NEW.cd_celular, NOW(), NEW.modificado_por);
				END IF; 
				IF(NEW.ds_email <> OLD.ds_email) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'ds_email', OLD.ds_email, NEW.ds_email, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.cd_crm <> OLD.cd_crm) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'cd_crm', OLD.cd_crm , NEW.cd_crm, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.nm_cargo <> OLD.nm_cargo) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'nm_cargo', OLD.nm_cargo , NEW.nm_cargo, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.ds_site_particular <> OLD.ds_site_particular) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'ds_site_particular', OLD.ds_site_particular , NEW.ds_site_particular, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.ds_profissional <> OLD.ds_profissional) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'ds_profissional', OLD.ds_profissional , NEW.ds_profissional, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.dt_nascimento <> OLD.dt_nascimento) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'dt_nascimento', OLD.dt_nascimento , NEW.dt_nascimento, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.cd_sexo <> OLD.cd_sexo) THEN 
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'cd_sexo', OLD.cd_sexo , NEW.cd_sexo, NOW(), NEW.modificado_por);
				END IF; 
				IF(NEW.cd_rg <> OLD.cd_rg) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'ds_email', OLD.cd_rg, NEW.cd_rg, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.nm_clinica <> OLD.nm_clinica) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'nm_clinica', OLD.nm_clinica , NEW.nm_clinica, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.cd_cep <> OLD.cd_cep) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'nm_cargo', OLD.cd_cep , NEW.cd_cep, NOW(), NEW.modificado_por);
				END IF;
				IF (NEW.nm_cidade <> OLD.nm_cidade) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'nm_cidade', OLD.nm_cidade, NEW.nm_cidade, NOW(),NEW.modificado_por);
				END IF;
				IF(NEW.sg_estado <> OLD.sg_estado) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'sg_estado', OLD.sg_estado, NEW.sg_estado, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.nm_bairro <> OLD.nm_bairro) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'nm_bairro', OLD.nm_bairro , NEW.nm_bairro, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.ds_endereco <> OLD.ds_endereco) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'ds_endereco', OLD.ds_endereco , NEW.ds_endereco, NOW(), NEW.modificado_por);
				END IF;
				IF (NEW.nm_complemento <> OLD.nm_complemento) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'nm_complemento', OLD.nm_complemento, NEW.nm_complemento, NOW(),NEW.modificado_por);
				END IF;
		END
	$$
	DELIMITER ;
    
    
-- Tabela de servicos 

create table tb_servico(
	cd_servico int(11) not null,
	ativo int(1) not null,
    vl_servico_uni decimal(9,2) not null,
    nm_servico varchar(40) not null,
    dt_cadastro datetime default null,
    dt_modificado datetime default null,
    modificado_por int(11) not null default '0'
);

insert into tb_servico values
(1,1,0.25,'SMS','2018-05-07 00:00:00','2018-05-07 00:00:00',0),
(2,1,1.00,'Ligação','2018-05-07 00:00:00','2018-05-07 00:00:00',0);
	-- 
	-- Triggers tabela serviços
	--

	DELIMITER $$
		CREATE TRIGGER I_Servico AFTER INSERT ON tb_servico
			FOR EACH ROW BEGIN
				INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
				VALUES
					('tb_servico', NEW.cd_servico , 'INSERT' , 'ativo'      , '' , NEW.ativo      , NOW(), NEW.modificado_por),
					('tb_servico', NEW.cd_servico , 'INSERT' , 'vl_servico_uni' , '' , NEW.vl_servico_uni , NOW(), NEW.modificado_por),
					('tb_servico', NEW.cd_servico , 'INSERT' , 'nm_servico' , '' , NEW.nm_servico , NOW(), NEW.modificado_por);
			END
	$$
	DELIMITER ;
   
	DELIMITER $$
		CREATE TRIGGER U_Servico AFTER UPDATE ON tb_servico
		FOR EACH ROW BEGIN
			IF (NEW.ativo <> OLD.ativo) THEN
				INSERT INTO tb_Log
				VALUES ('tb_servico', OLD.cd_servico, 'UPDATE', 'ativo', OLD.ativo, NEW.ativo , NOW(), NEW.modificado_por);
			END IF;
			IF( NEW.vl_servico_uni <> OLD.vl_servico_uni) THEN
				INSERT INTO tb_Log
				VALUES ('tb_servico', OLD.cd_servico, 'UPDATE', 'vl_servico_uni',OLD.vl_servico_uni , NEW.vl_servico_uni , NOW(), NEW.modificado_por);
			END IF;
			IF (NEW.nm_servico <> OLD.nm_servico) THEN
				INSERT INTO tb_Log
				VALUES ('tb_servico', NEW.cd_servico, 'UPDATE', 'nm_servico', OLD.nm_servico , NEW.nm_servico , NOW(), NEW.modificado_por);
			END IF;		
		END
	$$
	DELIMITER ;
    


-- Tabela Pacote/Serviços

create table tb_servico_pacote(
	codigo int not null,
	cd_pacote int(11) not null, -- estrangeira
    cd_servico int(11) not null, -- estrangeira
	ativo int(1) not null,
    limite_servico int(11) default null,
    dt_cadastro datetime default null,
    dt_modificado datetime default null,
    modificado_por int(11) default '0'
);
	
        
    
	insert into tb_servico_pacote values
    (1,1,1,1,20,'2018-05-07 00:00:00','2018-05-07 00:00:00',0),
    (2,1,2,1,20,'2018-05-07 00:00:00','2018-05-07 00:00:00',0);
	-- 
	-- Triggers tabela serviço_pacote
	--

	DELIMITER $$
		CREATE TRIGGER I_Servico_pacote AFTER INSERT ON tb_servico_pacote
			FOR EACH ROW BEGIN
				INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
				VALUES
					('tb_servico_pacote', NEW.codigo, 'INSERT', 'ativo', '', NEW.ativo , NOW(), NEW.modificado_por),
					('tb_servico_pacote', NEW.codigo, 'INSERT', 'limite_servico', '', NEW.limite_servico , NOW(), NEW.modificado_por);
			END
	$$
	DELIMITER;

	DELIMITER $$
		CREATE TRIGGER U_Servico_pacote AFTER UPDATE ON tb_servico_pacote
			FOR EACH ROW BEGIN
				IF(NEW.ativo <> OLD.ativo) THEN
					INSERT INTO tb_Log
					VALUES ('tb_servico_pacote', NEW.codigo, 'UPDATE', 'ativo', OLD.ativo, NEW.ativo , NOW(), NEW.modificado_por);
				END IF;
				IF (NEW.limite_servico <> OLD.limite_servico) THEN
					INSERT INTO tb_Log
					VALUES ('tb_servico_pacote', NEW.codigo, 'UPDATE', 'limite_servico', OLD.limite_servico, NEW.limite_servico , NOW(), NEW.modificado_por);
				END IF;
			END
	$$
	DELIMITER ;
    
    
-- Tabela de pacotes
	
create table tb_pacote(
	cd_pacote int(11) not null,
    nm_pacote varchar(70) not null,
    vl_pacote decimal(9,2) not null,
    ativo int(1) not null,
    dt_cadastro datetime default null,
    dt_modificado datetime default null,
    modificado_por int(11) default '0'
);

insert into tb_pacote() values
(1,'Básico',30.00,1,'2018-05-07 00:00:00', '2018-05-07 00:00:00',0);
	-- 
	-- Triggers tabela pacote
	--

	DELIMITER $$
		CREATE TRIGGER I_Pacote AFTER INSERT ON tb_pacote
			FOR EACH ROW BEGIN
				INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
				VALUES -- tablea pacote
					('tb_pacote', NEW.cd_pacote, 'INSERT' , 'ativo'     , '' , NEW.ativo     , NOW() , NEW.modificado_por ),
					('tb_pacote', NEW.cd_pacote, 'INSERT' , 'nm_pacote' , '' , NEW.nm_pacote , NOW() , NEW.modificado_por ),
					('tb_pacote', NEW.cd_pacote, 'INSERT' , 'vl_pacote' , '' , NEW.vl_pacote , NOW() , NEW.modificado_por );
			END
	$$
	DELIMITER ;

	DELIMITER $$
		CREATE TRIGGER U_Pacote AFTER UPDATE ON tb_pacote
			FOR EACH ROW BEGIN
				IF( NEW.ativo <> OLD.ativo) THEN
					INSERT INTO tb_Log
					VALUES ('tb_pacote', OLD.cd_pacote, 'UPDATE', 'ativo', OLD.ativo, NEW.ativo , NOW(), NEW.modificado_por);
				END IF;
				IF (NEW.nm_pacote <> OLD.nm_pacote) THEN
					INSERT INTO tb_Log 
					VALUES ('tb_pacote', OLD.cd_pacote, 'UPDATE', 'nm_pacote', OLD.nm_pacote, NEW.nm_pacote , NOW(), NEW.modificado_por);
				END IF;
				IF (NEW.vl_pacote <> OLD.vl_pacote) THEN
					INSERT INTO tb_Log
					VALUES ('tb_pacote', OLD.cd_pacote, 'UPDATE', 'vl_pacote', OLD.vl_pacote, NEW.vl_pacote , NOW(), NEW.modificado_por);
				END IF;
			END
	$$
	DELIMITER ;

--  Tabela Representante
    
create table tb_representante(
	cd_representante int(11) not null,
    cd_telefone varchar(14) NOT NULL,
    cd_celular varchar(15) NOT NULL,
    dt_nascimento date,
    cd_sexo varchar (10),
    cd_cpf int(11),
    cd_rg varchar(9),
    cd_cep varchar(8),
    nm_cidade varchar(45),
    sg_estado char(2),
    nm_bairro varchar(30),
    ds_endereco varchar(70),
    nm_endereco varchar (30),
    dt_cadastro datetime,
	cd_ativo int(1) not null,
    dt_modificado datetime,
    modificado_por int(11)not null
);

INSERT INTO tb_representante (cd_representante,cd_telefone,cd_celular,dt_nascimento,cd_sexo,cd_cpf, cd_rg, cd_cep,nm_cidade,sg_estado,nm_bairro,ds_endereco,nm_endereco,dt_cadastro,cd_ativo ,dt_modificado ,modificado_por) values
(3,'(13) 3471.6473','(13) 98765.6453','0000-00-00', '',0,'','','','','','','','0000-00-00 00:00:00',1,'0000-00-00 00:00:00',0);


	-- 
	-- Triggers tabela representantes
	--
    
	DELIMITER $$
	CREATE TRIGGER `I_Representante` AFTER INSERT ON `tb_representante`
	 FOR EACH ROW BEGIN
	  INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
	  VALUES
		  
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'cd_telefone', '', NEW.cd_telefone, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'cd_celular', '', NEW.cd_celular, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'nm_endereco', '', NEW.nm_endereco, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'dt_nascimento', '', NEW.dt_nascimento, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'cd_sexo', '', NEW.cd_sexo, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'cd_cpf', '', NEW.cd_cpf, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'cd_rg', '', NEW.cd_rg, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'cd_cep', '', NEW.cd_cep, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'nm_cidade', '', NEW.nm_cidade, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'sg_estado', '', NEW.sg_estado, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'nm_bairro', '', NEW.nm_bairro, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'ds_endereco', '', NEW.ds_endereco, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'nm_endereco', '', NEW.nm_endereco, NOW(), NEW.modificado_por);

	END
	$$
	DELIMITER ;


	DELIMITER $$
	CREATE TRIGGER `U_Representante` AFTER UPDATE ON `tb_representante`
	 FOR EACH ROW BEGIN
	  IF (NEW.cd_telefone <> OLD.cd_telefone) THEN  
		INSERT INTO tb_Log 
		  VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'cd_telefone', OLD.cd_telefone, NEW.cd_telefone, NOW(), NEW.modificado_por);
	  END IF;
	  IF (NEW.cd_celular <> OLD.cd_celular) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'cd_celular', OLD.cd_celular, NEW.cd_celular, NOW(), NEW.modificado_por);
	  END IF;
	  IF (NEW.nm_endereco <> OLD.nm_endereco) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'nm_endereco', OLD.nm_endereco, NEW.nm_endereco, NOW(), NEW.modificado_por);
	  END IF;
	  IF (NEW.dt_nascimento <> OLD.dt_nascimento) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'dt_nascimento', OLD.dt_nascimento, NEW.dt_nascimento, NOW(), NEW.modificado_por);
	  END IF;
	   IF (NEW.cd_sexo <> OLD.cd_sexo) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'cd_sexo', OLD.cd_sexo, NEW.cd_sexo, NOW(), NEW.modificado_por);
	  END IF;
	   IF (NEW.cd_cpf <> OLD.cd_cpf) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'cd_cpf', OLD.cd_cpf, NEW.cd_cpf, NOW(), NEW.modificado_por);
	  END IF;
	   IF (NEW.cd_rg <> OLD.cd_rg) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'cd_rg', OLD.cd_rg, NEW.cd_rg, NOW(), NEW.modificado_por);
	  END IF;
	   IF (NEW.cd_cep <> OLD.cd_cep) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'cd_cep', OLD.cd_cep, NEW.cd_cep, NOW(), NEW.modificado_por);
	  END IF;
	   IF (NEW.nm_cidade <> OLD.nm_cidade) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'nm_cidade', OLD.nm_cidade, NEW.nm_cidade, NOW(), NEW.modificado_por);
	  END IF;
	   IF (NEW.sg_estado <> OLD.sg_estado) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'sg_estado', OLD.sg_estado, NEW.sg_estado, NOW(), NEW.modificado_por);
	  END IF;
	   IF (NEW.nm_bairro <> OLD.nm_bairro) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'nm_bairro', OLD.nm_bairro, NEW.nm_bairro, NOW(), NEW.modificado_por);
	  END IF;
	  IF (NEW.ds_endereco <> OLD.ds_endereco) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'ds_endereco', OLD.ds_endereco, NEW.ds_endereco, NOW(), NEW.modificado_por);
	  END IF;
	  IF (NEW.nm_endereco <> OLD.nm_endereco) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'nm_endereco', OLD.nm_endereco, NEW.nm_endereco, NOW(), NEW.modificado_por);
	  END IF;
	END
	$$
	DELIMITER ;

-- Tabela Solicitação de Voucher
    
create table tb_solicitacao_voucher(
	cd_solicitacao int(11) not null,
	cd_representante int(11) not null, -- estrangeira
	ds_voucher varchar(250) not null,
    dt_solicitado datetime,
    cd_ativo int(1) not null,
    confirmacao int(1) not null,
    modificado_por int(11) not null
);

    -- trigger 
    
	DELIMITER $$
	CREATE TRIGGER `I_Solicitacao_voucher` AFTER INSERT ON `tb_solicitacao_voucher`
	 FOR EACH ROW BEGIN
	  INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
	  VALUES
		  ('tb_solicitacao_voucher', NEW.cd_solicitacao, 'INSERT', 'ds_voucher', '', NEW.ds_voucher, NOW(), NEW.modificado_por),
		  ('tb_solicitacao_voucher', NEW.cd_solicitacao, 'INSERT', 'dt_solicitado', '', NEW.dt_solicitado, NOW(), NEW.modificado_por),
		  ('tb_solicitacao_voucher', NEW.cd_solicitacao, 'INSERT', 'confirmacao', '', NEW.confirmacao, NOW(), NEW.modificado_por);
		  
	END
	$$
	DELIMITER ;


-- Tabela Voucher
        
create table tb_voucher (
	cd_voucher int(11),
    cd_pacote int(11) not null, -- estrangeira
    cd_usuario int(11) default null, -- estrangeira
    cd_voucher_utilizavel varchar(7),
    cd_associado int(1) null,     
    dt_validade date,
    cd_limite_utilizado int(11),
    vl_comissao decimal (9,2),
    vl_insencao decimal(9,2),
    dt_carencia date,
    dt_comissao date,
    modificado_por int(11) not null
);
select * from tb_voucher;

insert into tb_voucher  values
(1,1,3,'123',null,'2018-05-07',2,130.00,20.00,'2018-05-10','2018-05-10',0),
(2,1,null,'321',null,'2018-05-07',2,30.00,10.00,'2018-05-10','2018-05-10',0);
    

	


   -- trigger
	DELIMITER $$
	CREATE TRIGGER `I_Voucher` AFTER INSERT ON `tb_voucher`
	 FOR EACH ROW BEGIN
	  INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
	  VALUES
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'cd_associado', '', NEW.cd_associado, NOW(), NEW.modificado_por),
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'dt_validade', '', NEW.dt_validade, NOW(), NEW.modificado_por),
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'cd_limite_utilizado', '', NEW.cd_limite_utilizado, NOW(), NEW.modificado_por),
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'vl_comissao', '', NEW.vl_comissao, NOW(), NEW.modificado_por),
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'vl_insencao', '', NEW.vl_insencao, NOW(), NEW.modificado_por),
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'dt_carencia', '', NEW.dt_carencia, NOW(), NEW.modificado_por),
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'cd_pacote', '', NEW.cd_pacote, NOW(), NEW.modificado_por),
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'dt_comissao', '', NEW.dt_comissao, NOW(), NEW.modificado_por);		  	  
	END
	$$
	DELIMITER ;


-- Tabela convertidos 
		
create table tb_convertidos(
	cd_convertidos int(11) not null,
	cd_contato int(11) not null, -- estrangeira
    dt_convertido datetime,
    cd_ativo int(1) not null,
    modificado_por int(11) not null default '0'
);


	-- trigger
	DELIMITER $$
	CREATE TRIGGER `I_Convertidos` AFTER INSERT ON `tb_convertidos`
	 FOR EACH ROW BEGIN
	  INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
	  VALUES
		  ('tb_convertidos', NEW.cd_convertidos, 'INSERT', 'dt_convertido', '', NEW.dt_convertido, NOW(), NEW.modificado_por),
		  ('tb_convertidos', NEW.cd_convertidos, 'INSERT', 'cd_ativo', '', NEW.cd_ativo, NOW(), NEW.modificado_por);		  		  
	END
	$$
	DELIMITER ;
    
--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_clinica`
--
ALTER TABLE `tb_clinica`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `tb_clinicaendereco`
--
ALTER TABLE `tb_clinicaendereco`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `clinica` (`clinica`);

--
-- Indexes for table `tb_clinicaprofissional`
--
ALTER TABLE `tb_clinicaprofissional`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `clinica` (`clinica`),
  ADD KEY `profissional` (`profissional`);

--
-- Indexes for table `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `modulo` (`modulo`);

--
-- Indexes for table `tb_modulo`
--
ALTER TABLE `tb_modulo`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `tb_perfil`
--
ALTER TABLE `tb_perfil`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `tb_permissao`
--
ALTER TABLE `tb_permissao`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `tb_permissaousuario`
--
ALTER TABLE `tb_permissaousuario`
  ADD KEY `usuario` (`usuario`),
  ADD KEY `modulo` (`modulo`),
  ADD KEY `permissao` (`permissao`);

--
-- Indexes for table `tb_profissao`
--
ALTER TABLE `tb_profissao`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `tb_profissionaldadosgerais`
--
ALTER TABLE `tb_profissionaldadosgerais`
  ADD PRIMARY KEY (`usuario`),
  ADD KEY `profissao` (`profissao`);

--
-- Indexes for table `tb_profissionalendereco`
--
ALTER TABLE `tb_profissionalendereco`
  ADD PRIMARY KEY (`codigo`,`usuario`),
  ADD KEY `usuario` (`usuario`);

--
-- Indexes for table `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `perfil` (`perfil`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_clinica`
--
ALTER TABLE `tb_clinica`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_clinicaendereco`
--
ALTER TABLE `tb_clinicaendereco`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_clinicaprofissional`
--
ALTER TABLE `tb_clinicaprofissional`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_menu`
--
ALTER TABLE `tb_menu`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tb_modulo`
--
ALTER TABLE `tb_modulo`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tb_perfil`
--
ALTER TABLE `tb_perfil`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tb_permissao`
--
ALTER TABLE `tb_permissao`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_profissao`
--
ALTER TABLE `tb_profissao`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tb_profissionalendereco`
--
ALTER TABLE `tb_profissionalendereco`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_clinicaendereco`
--
ALTER TABLE `tb_clinicaendereco`
  ADD CONSTRAINT `tb_ClinicaEndereco_ibfk_1` FOREIGN KEY (`clinica`) REFERENCES `tb_clinica` (`codigo`);

--
-- Constraints for table `tb_clinicaprofissional`
--
ALTER TABLE `tb_clinicaprofissional`
  ADD CONSTRAINT `tb_ClinicaProfissional_ibfk_1` FOREIGN KEY (`clinica`) REFERENCES `tb_clinica` (`codigo`),
  ADD CONSTRAINT `tb_ClinicaProfissional_ibfk_2` FOREIGN KEY (`profissional`) REFERENCES `tb_profissionaldadosgerais` (`usuario`);

--
-- Constraints for table `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD CONSTRAINT `tb_Menu_ibfk_1` FOREIGN KEY (`modulo`) REFERENCES `tb_modulo` (`codigo`);

--
-- Constraints for table `tb_permissaousuario`
--
ALTER TABLE `tb_permissaousuario`
  ADD CONSTRAINT `tb_PermissaoUsuario_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `tb_usuario` (`codigo`),
  ADD CONSTRAINT `tb_PermissaoUsuario_ibfk_2` FOREIGN KEY (`modulo`) REFERENCES `tb_modulo` (`codigo`),
  ADD CONSTRAINT `tb_PermissaoUsuario_ibfk_3` FOREIGN KEY (`permissao`) REFERENCES `tb_permissao` (`codigo`);

--
-- Constraints for table `tb_profissionaldadosgerais`
--
ALTER TABLE `tb_profissionaldadosgerais`
  ADD CONSTRAINT `tb_ProfissionalDadosGerais_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `tb_usuario` (`codigo`),
  ADD CONSTRAINT `tb_ProfissionalDadosGerais_ibfk_2` FOREIGN KEY (`profissao`) REFERENCES `tb_profissao` (`codigo`);

--
-- Constraints for table `tb_profissionalendereco`
--
ALTER TABLE `tb_profissionalendereco`
  ADD CONSTRAINT `tb_ProfissionalEndereco_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `tb_profissionaldadosgerais` (`usuario`);

--
-- Constraints for table `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `tb_Usuario_ibfk_1` FOREIGN KEY (`perfil`) REFERENCES `tb_perfil` (`codigo`);



-- Chaves primárias 
AlTER TABLE tb_contato
	ADD PRIMARY KEY (cd_contato),
    ADD KEY (cd_representante),
    add index i_voucher (cd_voucher);
    
ALTER TABLE tb_convertidos 
	ADD PRIMARY KEY (cd_convertidos),
    ADD KEY (cd_contato);
    
ALTER TABLE tb_pacote
	ADD PRIMARY KEY (cd_pacote);
    
ALTER TABLE tb_representante
	ADD PRIMARY KEY(cd_representante);
    
ALTER TABLE tb_servico
	ADD PRIMARY KEY (cd_servico);
    
ALTER TABLE tb_servico_pacote
	ADD PRIMARY KEY (codigo),
    ADD KEY (cd_pacote, cd_servico);
    
ALTER TABLE tb_solicitacao_voucher
	ADD PRIMARY KEY (cd_solicitacao),
    ADD KEY (cd_representante);
    
ALTER TABLE tb_voucher
	ADD PRIMARY KEY (cd_voucher),
    ADD KEY (cd_pacote),
    add index i_usuario (cd_usuario);

-- chaves estrangeiras

ALTER TABLE tb_contato
    ADD CONSTRAINT fk_contato_representante FOREIGN KEY (cd_representante) REFERENCES tb_representante(cd_representante);
    
	
ALTER TABLE tb_representante
	ADD CONSTRAINT fk_representante_user FOREIGN KEY (cd_representante) REFERENCES tb_usuario(codigo);


ALTER TABLE tb_convertidos
	ADD CONSTRAINT fk_convertidos_contato FOREIGN KEY (cd_contato) REFERENCES tb_contato(cd_contato);
    
ALTER TABLE tb_servico_pacote
	ADD CONSTRAINT fk_pacote FOREIGN KEY (cd_pacote) REFERENCES tb_pacote(cd_pacote),
    ADD CONSTRAINT fk_servico FOREIGN KEY (cd_servico) REFERENCES tb_servico(cd_servico);
    
ALTER TABLE tb_solicitacao_voucher
	ADD CONSTRAINT fk_solicitacao_representante FOREIGN KEY (cd_representante) REFERENCES tb_representante(cd_representante);

ALTER TABLE tb_voucher
	ADD CONSTRAINT fk_pacote_voucher FOREIGN KEY (cd_pacote) REFERENCES tb_pacote(cd_pacote);
 
 
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
