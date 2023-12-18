--Criação da tabela
CREATE TABLE clientes_camisetas (
    id serial PRIMARY KEY,
    nome VARCHAR(100),
    data_cadastro DATE
);

--Cadastro
INSERT INTO clientes_camisetas (nome, data_cadastro) VALUES
    ('Cliente1', '2023-12-18'),
    ('Cliente2', '2023-12-18'),
    ('Cliente3', '2023-12-17'),
    ('Cliente4', '2023-12-18');

--Função
CREATE OR REPLACE FUNCTION total_clientes_cadastrados_em_um_dia(data_consulta DATE)
RETURNS INTEGER AS $$
DECLARE
    total_clientes INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_clientes
    FROM clientes_camisetas
    WHERE data_cadastro = data_consulta;

    RETURN total_clientes;
END;
$$ LANGUAGE plpgsql;

--Selecionando a tabela
SELECT total_clientes_cadastrados_em_um_dia('2023-12-18') AS total_clientes;

