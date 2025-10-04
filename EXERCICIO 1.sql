CREATE DATABASE  IF NOT EXISTS `db_financeiro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_financeiro`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: db_financeiro
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `data_nascimento` date NOT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'João Silva','12345678901','1980-01-15'),(2,'Maria Oliveira','23456789012','1990-02-20'),(3,'Carlos\nSouza','34567890123','1985-03-25'),(4,'Ana Santos','45678901234','1975-04-30'),(5,'Luiz Pereira','56789012345','2000-05-05'),(6,'Patricia Costa','67890123456','1995-06-10'),(7,'Rafael Alves','78901234567','1982-07-15'),(8,'Fernanda Gomes','89012345678','1988-08-20'),(9,'Gustavo Rocha','90123456789','1992-09-25'),(10,'Camila Cardoso','01234567890','1970-10-30'),(11,'Roberto Dias','11223344556','1978-06-12'),(12,'Juliana Martins','22334455667','1989-09-19'),(13,'Marcos Paulo','33445566778','1995-12-22'),(14,'Sofia Goncalves','44556677889','2001-03-18');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contas`
--

DROP TABLE IF EXISTS `contas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contas` (
  `conta_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `data_criacao` date NOT NULL,
  PRIMARY KEY (`conta_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `contas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contas`
--

LOCK TABLES `contas` WRITE;
/*!40000 ALTER TABLE `contas` DISABLE KEYS */;
INSERT INTO `contas` VALUES (1,1,1200.50,'2023-01-01'),(2,2,3000.00,'2023-02-01'),(3,3,1500.75,'2023-03-01'),(4,4,800.00,'2023-04-01'),(5,5,5600.20,'2023-05-01'),(6,6,430.00,'2023-06-01'),(7,7,3200.60,'2023-07-01'),(8,8,2100.30,'2023-08-01'),(9,9,500.00,'2023-09-01'),(10,10,900.45,'2023-10-01'),(11,11,2500.00,'2023-01-15'),(12,12,3000.00,'2023-02-20'),(13,13,1500.00,'2023-03-25'),(14,14,2750.00,'2023-04-30');
/*!40000 ALTER TABLE `contas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecos`
--

DROP TABLE IF EXISTS `enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecos` (
  `endereco_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `endereco` varchar(255) NOT NULL,
  PRIMARY KEY (`endereco_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `enderecos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecos`
--

LOCK TABLES `enderecos` WRITE;
/*!40000 ALTER TABLE `enderecos` DISABLE KEYS */;
INSERT INTO `enderecos` VALUES (1,1,'Rua A, 100, Centro, São\nPaulo, SP'),(2,2,'Rua B, 200, Vila Nova, Rio de Janeiro, RJ'),(3,3,'Rua C, 300, Jardim\nMar, Salvador, BA'),(4,4,'Rua D, 400, Vila Olímpica, Curitiba, PR'),(5,5,'Rua E, 500,\nSetor Central, Goiânia, GO'),(6,6,'Rua F, 600, Bairro Azul, Manaus, AM'),(7,7,'Rua G,\n700, Cidade Nova, Fortaleza, CE'),(8,8,'Rua H, 800, Centro Histórico, Porto Alegre,\nRS'),(9,9,'Rua I, 900, Praia do Futuro, Recife, PE'),(10,10,'Rua J, 1000, Parque Verde,\nBelém, PA'),(11,11,'Rua L, 1100, Bairro Novo, Porto Velho, RO'),(12,12,'Rua M, 1200, Bairro Velho, Natal, RN'),(13,13,'Rua N, 1300, Bairro Alto, Londrina, PR'),(14,14,'Rua O, 1400, Bairro Baixo, Florianópolis, SC');
/*!40000 ALTER TABLE `enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `movimentacao_clientes`
--

DROP TABLE IF EXISTS `movimentacao_clientes`;
/*!50001 DROP VIEW IF EXISTS `movimentacao_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `movimentacao_clientes` AS SELECT 
 1 AS `cliente_id`,
 1 AS `nome`,
 1 AS `cpf`,
 1 AS `data_transacao`,
 1 AS `valor`,
 1 AS `descricao`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tipostransacao`
--

DROP TABLE IF EXISTS `tipostransacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipostransacao` (
  `tipo_id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`tipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipostransacao`
--

LOCK TABLES `tipostransacao` WRITE;
/*!40000 ALTER TABLE `tipostransacao` DISABLE KEYS */;
INSERT INTO `tipostransacao` VALUES (1,'Depósito'),(2,'Saque'),(3,'Transferência'),(4,'Pagamento'),(5,'Investimento'),(6,'Rendimento'),(7,'Tarifa'),(8,'Estorno'),(9,'Doação'),(10,'Compra'),(11,'Depósito'),(12,'Saque'),(13,'Transferência'),(14,'Pagamento'),(15,'Investimento'),(16,'Rendimento'),(17,'Tarifa'),(18,'Estorno'),(19,'Doação'),(20,'Compra');
/*!40000 ALTER TABLE `tipostransacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacoes`
--

DROP TABLE IF EXISTS `transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacoes` (
  `transacao_id` int NOT NULL AUTO_INCREMENT,
  `conta_id` int DEFAULT NULL,
  `tipo_id` int DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_transacao` date NOT NULL,
  PRIMARY KEY (`transacao_id`),
  KEY `conta_id` (`conta_id`),
  KEY `tipo_id` (`tipo_id`),
  CONSTRAINT `transacoes_ibfk_1` FOREIGN KEY (`conta_id`) REFERENCES `contas` (`conta_id`),
  CONSTRAINT `transacoes_ibfk_2` FOREIGN KEY (`tipo_id`) REFERENCES `tipostransacao` (`tipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacoes`
--

LOCK TABLES `transacoes` WRITE;
/*!40000 ALTER TABLE `transacoes` DISABLE KEYS */;
INSERT INTO `transacoes` VALUES (1,1,1,200.00,'2023-01-10'),(2,2,2,500.00,'2023-02-15'),(3,3,3,300.00,'2023-03-20'),(4,4,4,100.00,'2023-04-25'),(5,5,5,600.00,'2023-05-30'),(6,6,6,200.00,'2023-06-05'),(7,7,7,400.00,'2023-07-10'),(8,8,8,150.00,'2023-08-15'),(9,9,9,350.00,'2023-09-20'),(10,10,10,250.00,'2023-10-25'),(11,11,1,1000.00,'2023-11-01'),(12,12,2,500.00,'2023-11-02'),(13,13,1,1500.00,'2023-11-03'),(14,14,2,2000.00,'2023-11-04'),(15,11,2,800.00,'2023-11-05'),(16,12,1,750.00,'2023-11-06'),(17,13,2,400.00,'2023-11-07'),(18,14,1,1250.00,'2023-11-08');
/*!40000 ALTER TABLE `transacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `movimentacao_clientes`
--

/*!50001 DROP VIEW IF EXISTS `movimentacao_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `movimentacao_clientes` AS select `ct`.`cliente_id` AS `cliente_id`,`ct`.`nome` AS `nome`,`ct`.`cpf` AS `cpf`,`t`.`data_transacao` AS `data_transacao`,`t`.`valor` AS `valor`,`tp`.`descricao` AS `descricao` from (((`contas` `c` join `transacoes` `t` on((`c`.`conta_id` = `t`.`conta_id`))) join `tipostransacao` `tp` on((`tp`.`tipo_id` = `t`.`tipo_id`))) join `clientes` `ct` on((`ct`.`cliente_id` = `c`.`cliente_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


USE db_financeiro;
DELIMITER $$

CREATE PROCEDURE numeros_pares()
BEGIN
    DECLARE v_numero INT DEFAULT 1;
    
   
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_pares (
        numero INT
    );
    
   
    TRUNCATE TABLE temp_pares;
    
    -- Loop de 1 a 100
    WHILE v_numero <= 100 DO
       
        IF v_numero % 2 = 0 THEN
            INSERT INTO temp_pares VALUES (v_numero);
        END IF;
        
        SET v_numero = v_numero + 1;
    END WHILE;
    
   
    SELECT numero AS 'Números Pares de 1 a 100' FROM temp_pares;
    
    
    SELECT COUNT(*) AS 'Total de Números Pares' FROM temp_pares;
END$$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE multiplos_cinco_pares()
BEGIN
    DECLARE v_numero INT DEFAULT 1;
    
    
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_multiplos (
        numero INT,
        mensagem VARCHAR(100)
    );
    
   
    TRUNCATE TABLE temp_multiplos;
    
 
    WHILE v_numero <= 100 DO
    
        IF v_numero % 2 = 0 THEN
           
            IF v_numero % 5 = 0 THEN
                INSERT INTO temp_multiplos VALUES (
                    v_numero,
                    CONCAT('✓ ', v_numero, ' é PAR e MÚLTIPLO DE 5')
                );
            ELSE
                INSERT INTO temp_multiplos VALUES (
                    v_numero,
                    CONCAT('  ', v_numero, ' é apenas PAR')
                );
            END IF;
        END IF;
        
        SET v_numero = v_numero + 1;
    END WHILE;
    

    SELECT numero AS 'Número', mensagem AS 'Descrição' FROM temp_multiplos;
    
  
    SELECT 
        COUNT(*) AS 'Total de Pares',
        SUM(CASE WHEN numero % 5 = 0 THEN 1 ELSE 0 END) AS 'Múltiplos de 5',
        SUM(CASE WHEN numero % 5 != 0 THEN 1 ELSE 0 END) AS 'Apenas Pares'
    FROM temp_multiplos;
END$$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE apenas_multiplos_cinco_pares()
BEGIN
    DECLARE v_numero INT DEFAULT 1;
    
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_mult5 (
        numero INT,
        mensagem VARCHAR(100)
    );
    
    TRUNCATE TABLE temp_mult5;
    
    WHILE v_numero <= 100 DO
        IF v_numero % 2 = 0 AND v_numero % 5 = 0 THEN
            INSERT INTO temp_mult5 VALUES (
                v_numero,
                CONCAT( v_numero, ' é PAR e MÚLTIPLO DE 5!')
            );
        END IF;
        
        SET v_numero = v_numero + 1;
    END WHILE;
    
    SELECT numero AS 'Número', mensagem AS 'Mensagem Especial' FROM temp_mult5;
    
    SELECT COUNT(*) AS 'Total de Números Pares e Múltiplos de 5' FROM temp_mult5;
END$$

DELIMITER ;
CALL numeros_pares();
CALL multiplos_cinco_pares();
CALL apenas_multiplos_cinco_pares();
SHOW PROCEDURE STATUS WHERE Db = 'db_financeiro';
SHOW CREATE PROCEDURE numeros_pares;
