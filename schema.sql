CREATE TABLE filme{
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    diretor VARCHAR(255) NOT NULL,
    ano_lancamento INT NOT NULL
}

CREATE TABLE cliente{
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
}

CREATE TABLE loja{
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL
}

CREATE TABLE funcionario{
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(255) NOT NULL,
    loja_id INT NOT NULL,
    FOREIGN KEY (loja_id) REFERENCES loja(id)
}

CREATE TABLE ator{
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
    FOREIGN KEY(filme_id) REFERENCES filme(id)
}
    
CREATE TABLE aluguel{
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    filme_id INT NOT NULL,
    data_aluguel DATE NOT NULL,
    data_devolucao DATE,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (filme_id) REFERENCES filme(id)
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(id)
    FOREIGN KEY (loja_id) REFERENCES loja(id)
}

CREATE TABLE pagamento{
    id SERIAL PRIMARY KEY,
    aluguel_id INT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_pagamento DATE NOT NULL,
    FOREIGN KEY (aluguel_id) REFERENCES aluguel(id)
}

