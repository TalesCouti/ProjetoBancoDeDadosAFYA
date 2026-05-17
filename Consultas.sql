-- Seleciona filmes da categoria ficção cientifica
SELECT * FROM filmes
WHERE categoria = 'Ficção Científica';


-- Seleciona atores que atuaram em filmes de ficção cientifica
SELECT a.nome
FROM ator a   
JOIN filme_ator fa ON a.ator_id = fa.ator_id
JOIN filme f ON fa.filme_id = f.filme_id    
WHERE f.categoria = 'Ficção Científica';

-- Funcionario que fez maior valor em alugueis
SELECT fun.nome, SUM(pg.valor)
FROM funcionario fun
JOIN aluguel al 
    ON fun.funcionario_id = al.funcionario_id
JOIN pagamento pg 
    ON al.pagamento_id = pg.pagamento_id
GROUP BY fun.funcionario_id, fun.nome
ORDER BY SUM(pg.valor) DESC
LIMIT 1;

-- Cliente que fez maior valor em alugueis
SELECT cli.nome, SUM(pg.valor)
FROM cliente cli
JOIN aluguel al
    ON cli.cliente_id = al.cliente_id
JOIN pagamento pg
    ON al.pagamento_id = pg.pagamento_id
GROUP BY cli.cliente_id, cli.nome
ORDER BY SUM(pg.valor) DESC
LIMIT 1;

-- CLientes que não devolveram os filmes ainda e o titulo do filme alugado
SELECT cli.nome, f.titulo
FROM cliente cli
JOIN aluguel al
    ON cli.cliente_id = al.cliente_id
JOIN filme f
    ON al.filme_id = f.filme_id
WHERE al.data_devolucao IS NULL;

-- Todos funcionarios de uma loja
SELECT fun.nome
FROM funcionario fun
JOIN loja l
    ON fun.loja_id = l.loja_id
WHERE l.loja_id = 1; 

-- Filmes e atores cadastrados como é um LEFT JOIN, caso um filme não tenha ator cadastrado, ele ainda aparecerá na consulta, mas com valor nulo no campo ator
SELECT 
    f.titulo,
    a.nome AS ator
FROM filme f
LEFT JOIN filme_ator fa
    ON f.filme_id = fa.filme_id
LEFT JOIN ator a
    ON fa.ator_id = a.ator_id;

-- Mesmo exemplo da consulta anterior, mas agora utilizando RIGHT JOIN, caso um ator não tenha filme cadastrado, ele ainda aparecerá na consulta, mas com valor nulo no campo titulo
SELECT 
    f.titulo,
    a.nome AS ator
FROM filme f
RIGHT JOIN filme_ator fa
    ON f.filme_id = fa.filme_id
RIGHT JOIN ator a
    ON fa.ator_id = a.ator_id;


-- Quantidade de atores cadastrado em filmes e titulo do flme de maior para menor

SELECT 
    f.titulo,
    COUNT(a.ator_id) AS quantidade_atores
FROM filme f
LEFT JOIN filme_ator fa
    ON f.filme_id = fa.filme_id
LEFT JOIN ator a
    ON fa.ator_id = a.ator_id
GROUP BY f.filme_id, f.titulo
ORDER BY COUNT(a.ator_id) DESC;

-- Média de filmes alugados por cliente no total somando todos clientes e dividindo pelo total de filmes cadastrados
SELECT 
    (SELECT COUNT(*) FROM aluguel) / (SELECT COUNT(*) FROM cliente) AS media_alugueis_por_cliente;

-- Nome da loja com endereço completo (pais, cidade, bairro, logradouro e numero)
SELECT 
    l.nome,
    e.pais,
    e.cidade,
    e.bairro,
    e.logradouro,
    e.numero
FROM loja l
JOIN endereco e
    ON l.endereco_id = e.endereco_id;