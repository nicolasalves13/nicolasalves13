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

-- Dump completed on 2023-11-14  9:02:30

DROP PROCEDURE IF EXISTS calcularSaldoTotal;
DELIMITER //

CREATE PROCEDURE calcularSaldoTotal()

BEGIN
DECLARE saldoTotal DECIMAL(10,2);
SELECT SUM(saldo) INTO saldoTotal
    FROM contas;
    SELECT saldoTotal AS 'Saldo Total de Todos os Clientes';

END //

DELIMITER ;
CALL calcularSaldoTotal();
DROP PROCEDURE IF EXISTS calcularSaldoTotalComDetalhes;

DELIMITER //

CREATE PROCEDURE calcularSaldoTotalComDetalhes()
BEGIN
   
    SELECT 
        SUM(saldo) AS 'Saldo Total Geral',
        COUNT(*) AS 'Quantidade de Contas',
        AVG(saldo) AS 'Saldo Médio',
        MAX(saldo) AS 'Maior Saldo',
        MIN(saldo) AS 'Menor Saldo'
    FROM contas;
    
    SELECT 
        cl.nome AS 'Cliente',
        co.saldo AS 'Saldo',
        co.data_criacao AS 'Data Criação'
    FROM contas co
    JOIN clientes cl ON co.cliente_id = cl.cliente_id
    ORDER BY co.saldo DESC
    LIMIT 5;
    
END//

DELIMITER ;

CALL calcularSaldoTotalComDetalhes();

SHOW PROCEDURE STATUS WHERE db = 'db_financeiro';


SHOW CREATE PROCEDURE calcularSaldoTotal;

DROP PROCEDURE IF EXISTS calcularSaldoTotal;

DELIMITER //

CREATE PROCEDURE atualizarEndereco(
    IN p_cliente_id INT,
    IN p_novo_endereco VARCHAR(255)
)
BEGIN
   
    DECLARE v_existe_cliente INT DEFAULT 0;
    DECLARE v_existe_endereco INT DEFAULT 0;
    
    
    SELECT COUNT(*) INTO v_existe_cliente
    FROM clientes
    WHERE cliente_id = p_cliente_id;
    
    
    IF v_existe_cliente = 0 THEN
        SELECT 'Erro: Cliente não encontrado!' AS mensagem;
    ELSE
        
        SELECT COUNT(*) INTO v_existe_endereco
        FROM enderecos
        WHERE cliente_id = p_cliente_id;
        
       
        IF v_existe_endereco > 0 THEN
            UPDATE enderecos
            SET endereco = p_novo_endereco
            WHERE cliente_id = p_cliente_id;
            
            SELECT 'Endereço atualizado com sucesso!' AS mensagem,
                   p_cliente_id AS cliente_id,
                   p_novo_endereco AS novo_endereco;
        ELSE
           
            INSERT INTO enderecos (cliente_id, endereco)
            VALUES (p_cliente_id, p_novo_endereco);
            
            SELECT 'Endereço cadastrado com sucesso!' AS mensagem,
                   p_cliente_id AS cliente_id,
                   p_novo_endereco AS novo_endereco;
        END IF;
    END IF;
END//

DELIMITER ;

CALL atualizarEndereco(1, 'Rua Nova, 150, Centro, São Paulo, SP');


CALL atualizarEndereco(5, 'Avenida Principal, 999, Jardim Europa, Goiânia, GO');


CALL atualizarEndereco(999, 'Endereço Teste');


SELECT c.cliente_id, c.nome, e.endereco
FROM clientes c
LEFT JOIN enderecos e ON c.cliente_id = e.cliente_id
WHERE c.cliente_id = 1;


DELIMITER //

CREATE PROCEDURE inserirNovoCliente(
    IN p_nome VARCHAR(255),
    IN p_cpf VARCHAR(11),
    IN p_data_nascimento DATE
)
BEGIN
    
    DECLARE v_cpf_existe INT DEFAULT 0;
    DECLARE v_novo_cliente_id INT;
    DECLARE v_idade INT;
    
    
    SELECT COUNT(*) INTO v_cpf_existe
    FROM clientes
    WHERE cpf = p_cpf;
    
    
    SET v_idade = TIMESTAMPDIFF(YEAR, p_data_nascimento, CURDATE());
    
    
    IF p_nome IS NULL OR TRIM(p_nome) = '' THEN
        SELECT 'Erro: O nome do cliente é obrigatório!' AS mensagem;
        
    ELSEIF p_cpf IS NULL OR LENGTH(p_cpf) != 11 THEN
        SELECT 'Erro: CPF inválido! Deve conter exatamente 11 dígitos.' AS mensagem;
        
    ELSEIF p_data_nascimento IS NULL OR p_data_nascimento > CURDATE() THEN
        SELECT 'Erro: Data de nascimento inválida!' AS mensagem;
        
    ELSEIF v_idade < 18 THEN
        SELECT 'Erro: Cliente deve ter pelo menos 18 anos!' AS mensagem,
               v_idade AS idade_atual;
        
    ELSEIF v_cpf_existe > 0 THEN
        SELECT 'Erro: CPF já cadastrado no sistema!' AS mensagem,
               p_cpf AS cpf_informado;
    ELSE
       
        INSERT INTO clientes (nome, cpf, data_nascimento)
        VALUES (p_nome, p_cpf, p_data_nascimento);
        
       
        SET v_novo_cliente_id = LAST_INSERT_ID();
        
        
        SELECT 'Cliente cadastrado com sucesso!' AS mensagem,
               v_novo_cliente_id AS cliente_id,
               p_nome AS nome,
               p_cpf AS cpf,
               p_data_nascimento AS data_nascimento,
               v_idade AS idade;
    END IF;
END//

DELIMITER ;
CALL inserirNovoCliente('Fernando Lima', '55667788990', '1995-07-15');


CALL inserirNovoCliente('Mariana Costa', '66778899001', '1988-03-22');


CALL inserirNovoCliente('Teste Silva', '12345678901', '1990-01-01');


CALL inserirNovoCliente('João Teste', '123456', '1990-01-01');


CALL inserirNovoCliente('Cliente Jovem', '99988877766', '2010-01-01');


CALL inserirNovoCliente('', '99988877755', '1990-01-01');


SELECT * FROM clientes ORDER BY cliente_id DESC LIMIT 5;

DELIMITER //

CREATE PROCEDURE inserirNovoCliente(
    IN p_nome VARCHAR(255),
    IN p_cpf VARCHAR(11),
    IN p_data_nascimento DATE
)
BEGIN
    
    INSERT INTO clientes (nome, cpf, data_nascimento)
    VALUES (p_nome, p_cpf, p_data_nascimento);
    
   
    SELECT 'Cliente inserido com sucesso!' AS mensagem,
           LAST_INSERT_ID() AS cliente_id;
END//

DELIMITER ;

CALL inserirNovoCliente('Fernando Lima', '55667788990', '1995-07-15');


CALL inserirNovoCliente('Mariana Costa', '66778899001', '1988-03-22');


CALL inserirNovoCliente('Pedro Henrique', '77889900112', '1992-11-08');


SELECT * FROM clientes ORDER BY cliente_id DESC;

DELIMITER //

CREATE PROCEDURE deletarTransacoesAntigas(
    IN p_data_limite DATE
)
BEGIN
    
    DECLARE v_total_deletado INT DEFAULT 0;
    
    
    SELECT COUNT(*) INTO v_total_deletado
    FROM transacoes
    WHERE data_transacao < p_data_limite;
    
    
    DELETE FROM transacoes
    WHERE data_transacao < p_data_limite;
    
    
    SELECT 'Operação concluída!' AS mensagem,
           v_total_deletado AS total_transacoes_deletadas,
           p_data_limite AS data_limite_informada;
END//

DELIMITER ;
SELECT * FROM transacoes ORDER BY data_transacao;


CALL deletarTransacoesAntigas('2023-05-01');


CALL deletarTransacoesAntigas('2023-08-01');


CALL deletarTransacoesAntigas('2023-11-01');


SELECT * FROM transacoes ORDER BY data_transacao;

DELIMITER //

CREATE PROCEDURE relatorioTransacoesTipo()
BEGIN
    
    SELECT 
        tt.tipo_id,
        tt.descricao AS tipo_transacao,
        COUNT(t.transacao_id) AS numero_transacoes,
        SUM(t.valor) AS valor_total,
        AVG(t.valor) AS valor_medio,
        MIN(t.valor) AS valor_minimo,
        MAX(t.valor) AS valor_maximo
    FROM tipostransacao tt
    LEFT JOIN transacoes t ON tt.tipo_id = t.tipo_id
    GROUP BY tt.tipo_id, tt.descricao
    ORDER BY numero_transacoes DESC, valor_total DESC;
END//

DELIMITER ;
CALL relatorioTransacoesTipo();

DELIMITER //

CREATE PROCEDURE relatorioTransacoesTipoPeriodo(
    IN p_data_inicio DATE,
    IN p_data_fim DATE
)
BEGIN
    SELECT 
        tt.tipo_id,
        tt.descricao AS tipo_transacao,
        COUNT(t.transacao_id) AS numero_transacoes,
        SUM(t.valor) AS valor_total,
        AVG(t.valor) AS valor_medio,
        MIN(t.data_transacao) AS primeira_transacao,
        MAX(t.data_transacao) AS ultima_transacao
    FROM tipostransacao tt
    LEFT JOIN transacoes t ON tt.tipo_id = t.tipo_id
        AND t.data_transacao BETWEEN p_data_inicio AND p_data_fim
    GROUP BY tt.tipo_id, tt.descricao
    HAVING numero_transacoes > 0
    ORDER BY numero_transacoes DESC;
END//

DELIMITER ;
CALL relatorioTransacoesTipoPeriodo('2023-01-01', '2023-12-31');


SELECT 
    tt.descricao AS tipo_transacao,
    COUNT(t.transacao_id) AS total_transacoes
FROM tipostransacao tt
INNER JOIN transacoes t ON tt.tipo_id = t.tipo_id
GROUP BY tt.tipo_id, tt.descricao
ORDER BY total_transacoes DESC;

