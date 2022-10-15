use pf_veiculos;
-- QUESTAO 1
SELECT 
    veiculo.modelo
FROM
    veiculo,
    carro
WHERE
    carro.veiculo_cod_veiculo = veiculo.cod_veiculo;

-- QUESTAO 2
SELECT 
    cliente.*, vendedor.nome 
FROM
    cliente, vendedor, venda 
WHERE 
    venda.cliente_cpf = cliente.cpf and venda.vendedor_num_vend = vendedor.num_vend and vendedor.num_vend = 13;

-- QUESTAO 3
SELECT 
    veiculo.cod_veiculo, vendedor.nome 
FROM 
    veiculo, venda, vendedor 
WHERE 
    venda.veiculo_cod_veiculo = veiculo.cod_veiculo and venda.vendedor_num_vend = vendedor.num_vend and vendedor.num_vend = 13; 

-- QUESTAO 4
SELECT 
    veiculo.cod_veiculo, cliente.nome 
FROM 
    venda, cliente, vendedor, veiculo
WHERE 
    venda.cliente_cpf = cliente.cpf and venda.veiculo_cod_veiculo = veiculo.cod_veiculo and venda.vendedor_num_vend = vendedor.num_vend and cliente.cpf = '57175566749';

-- QUESTAO 5
SELECT 
    utilitario.*, cliente.nome 
FROM 
    cliente, venda, veiculo, utilitario 
WHERE 
    venda.cliente_cpf = cliente.cpf and venda.veiculo_cod_veiculo = veiculo.cod_veiculo and utilitario.veiculo_cod_veiculo = veiculo.cod_veiculo and cliente.cpf = '46693187467';