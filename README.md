DELIMITER $$

CREATE FUNCTION calcular_bonus (id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE anos_servico INT;
    DECLARE salario_func DECIMAL(10,2);
    DECLARE bonus DECIMAL(10,2);

    -- Calcular anos de serviço e pegar salário do funcionário
    SELECT TIMESTAMPDIFF(YEAR, data_contratacao, CURDATE()), salario
    INTO anos_servico, salario_func
    FROM funcionarios
    WHERE id_funcionario = id;

    -- Regra do bônus
    IF anos_servico < 1 THEN
        SET bonus = 0;
    ELSE
        SET bonus = salario_func * 0.015 * anos_servico;
    END IF;

    RETURN bonus;
END$$

DELIMITER ;
