CREATE TABLE filme(
    filme_id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    diretor VARCHAR(255) NOT NULL,
    categoria VARCHAR(255) NOT NULL,
    estoque INT NOT NULL,
    data_lancamento DATE NOT NULL
);
CREATE TABLE endereço(
    endereco_id SERIAL PRIMARY KEY,
    pais VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    rua VARCHAR(255) NOT NULL,
    numero VARCHAR(20)
);

CREATE TABLE cliente(
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL UNIQUE,
    endereco_id INT,
    FOREIGN KEY (endereco_id) REFERENCES endereço(endereco_id)
);

CREATE TABLE loja(
    loja_id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    endereço_id INT,
    FOREIGN KEY (endereco_id) REFERENCES endereço(endereco_id)
);

CREATE TABLE funcionario(
    funcionario_id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(255) NOT NULL,
    loja_id INT NOT NULL,
    endereço_id INT,
    FOREIGN KEY (loja_id) REFERENCES loja(loja_id),
    FOREIGN KEY (endereço_id) REFERENCES endereço(endereço_id)
);

CREATE TABLE ator(
    ator_id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE filme_ator(
    filme_id INT NOT NULL,
    ator_id INT NOT NULL,
    PRIMARY KEY (filme_id, ator_id),
    FOREIGN KEY (filme_id) REFERENCES filme(filme_id),
    FOREIGN KEY (ator_id) REFERENCES ator(ator_id)
);

CREATE TABLE pagamento(
    pagamento_id SERIAL PRIMARY KEY,
    valor DECIMAL(10, 2) NOT NULL,
    data_pagamento DATE NOT NULL,
);

    
CREATE TABLE aluguel(
    aluguel_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    filme_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    pagamento_id INT NOT NULL,
    data_aluguel DATE NOT NULL,
    data_devolucao DATE,
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id),
    FOREIGN KEY (filme_id) REFERENCES filme(filme_id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(funcionario_id),
    FOREIGN KEY (pagamento_id) REFERENCES pagamento(pagamento_id)
);

