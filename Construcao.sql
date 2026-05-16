-- Criação da tabela de filmes, que armazena informações sobre os filmes disponíveis para aluguel
CREATE TABLE filme(
    filme_id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    diretor VARCHAR(255) NOT NULL,
    categoria VARCHAR(255) NOT NULL,
    estoque INT NOT NULL,
    data_lancamento DATE NOT NULL
);
-- Criação da tabela de enderecos, que armazena informações sobre os enderecos dos clientes, lojas e funcionários
CREATE TABLE endereco(
    endereco_id SERIAL PRIMARY KEY,
    pais VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    logradouro VARCHAR(255) NOT NULL,
    numero VARCHAR(20)
);
-- Criação da tabela de clientes, que armazena informações sobre os clientes que alugam os filmes
CREATE TABLE cliente(
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL UNIQUE,
    endereco_id INT,
    FOREIGN KEY (endereco_id) REFERENCES endereco(endereco_id)
);
-- Criação da tabela de lojas, que armazena informações sobre as lojas onde os filmes são alugados
CREATE TABLE loja(
    loja_id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco_id INT NOT NULL,
    FOREIGN KEY (endereco_id) REFERENCES endereco(endereco_id)
);
-- Criação da tabela de funcionários, que armazena informações sobre os funcionários que trabalham nas lojas
CREATE TABLE funcionario(
    funcionario_id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(255) NOT NULL,
    loja_id INT NOT NULL,
    endereco_id INT NOT NULL,
    FOREIGN KEY (loja_id) REFERENCES loja(loja_id),
    FOREIGN KEY (endereco_id) REFERENCES endereco(endereco_id)
);
-- Criação da tabela de atores, que armazena informações sobre os atores que atuam nos filmes
CREATE TABLE ator(
    ator_id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);
-- Criação da tabela de relacionamento entre filmes e atores, permitindo que um filme tenha vários atores e um ator possa atuar em vários filmes
CREATE TABLE filme_ator(
    filme_id INT NOT NULL,
    ator_id INT NOT NULL,
    PRIMARY KEY (filme_id, ator_id),
    FOREIGN KEY (filme_id) REFERENCES filme(filme_id),
    FOREIGN KEY (ator_id) REFERENCES ator(ator_id)
);

-- Criação da tabela de pagamento, que armazena informações sobre os pagamentos realizados pelos clientes
CREATE TABLE pagamento(
    pagamento_id SERIAL PRIMARY KEY,
    valor DECIMAL(10, 2) NOT NULL,
    data_pagamento DATE NOT NULL
);

-- Criação da tabela de aluguel, que relaciona clientes, filmes, funcionários e pagamentos
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


-- Abaixo estão os comandos de inserção de dados inicias para todas tabelas acima.

-- Inserção de filmes (30 registros)
INSERT INTO filme (titulo, diretor, categoria, estoque, data_lancamento) VALUES
('O Poderoso Chefão',           'Francis Ford Coppola',  'Drama',         5,  '1972-03-24'),
('Clube da Luta',               'David Fincher',          'Thriller',      4,  '1999-10-15'),
('Interestelar',                'Christopher Nolan',      'Ficção Científica', 6, '2014-11-07'),
('Parasita',                    'Bong Joon-ho',           'Drama',         3,  '2019-05-30'),
('Forrest Gump',                'Robert Zemeckis',        'Drama',         7,  '1994-07-06'),
('Matrix',                      'Lana e Lilly Wachowski', 'Ficção Científica', 5, '1999-03-31'),
('O Senhor dos Anéis: A Sociedade do Anel', 'Peter Jackson', 'Fantasia',   4,  '2001-12-19'),
('Pulp Fiction',                'Quentin Tarantino',      'Crime',         6,  '1994-10-14'),
('A Lista de Schindler',        'Steven Spielberg',       'Drama',         3,  '1993-11-30'),
('Gladiador',                   'Ridley Scott',           'Ação',          5,  '2000-05-05'),
('Titanic',                     'James Cameron',          'Romance',       8,  '1997-12-19'),
('O Silêncio dos Inocentes',    'Jonathan Demme',         'Suspense',      4,  '1991-02-14'),
('Corra!',                      'Jordan Peele',           'Terror',        5,  '2017-02-24'),
('Coringa',                     'Todd Phillips',          'Drama',         6,  '2019-10-04'),
('Cidade de Deus',              'Fernando Meirelles',     'Crime',         4,  '2002-08-30'),
('Tropa de Elite',              'José Padilha',           'Ação',          5,  '2007-10-12'),
('Central do Brasil',           'Walter Salles',          'Drama',         3,  '1998-04-03'),
('O Auto da Compadecida',       'Guel Arraes',            'Comédia',       6,  '2000-08-11'),
('Bacurau',                     'Kleber Mendonça Filho',  'Thriller',      4,  '2019-08-29'),
('Vidas Secas',                 'Nelson Pereira dos Santos','Drama',        2,  '1963-06-14'),
('Blade Runner 2049',           'Denis Villeneuve',       'Ficção Científica', 4, '2017-10-06'),
('Duna',                        'Denis Villeneuve',       'Ficção Científica', 5, '2021-10-22'),
('Tudo em Todo o Lugar ao Mesmo Tempo', 'Daniel Kwan',   'Ficção Científica', 5, '2022-03-25'),
('Avatar',                      'James Cameron',          'Aventura',      7,  '2009-12-18'),
('Vingadores: Ultimato',        'Anthony e Joe Russo',    'Ação',          8,  '2019-04-26'),
('Oppenheimer',                 'Christopher Nolan',      'Drama',         6,  '2023-07-21'),
('Barbie',                      'Greta Gerwig',           'Comédia',       7,  '2023-07-21'),
('A Bruxa',                     'Robert Eggers',          'Terror',        3,  '2015-01-27'),
('Midsommar',                   'Ari Aster',              'Terror',        3,  '2019-07-03'),
('Bohemian Rhapsody',           'Bryan Singer',           'Biografia',     5,  '2018-10-24');
 
-- ATORES (40 registros)

INSERT INTO ator (nome) VALUES
('Marlon Brando'),
('Al Pacino'),
('Brad Pitt'),
('Edward Norton'),
('Matthew McConaughey'),
('Anne Hathaway'),
('Song Kang-ho'),
('Tom Hanks'),
('Keanu Reeves'),
('Laurence Fishburne'),
('Elijah Wood'),
('Ian McKellen'),
('John Travolta'),
('Uma Thurman'),
('Liam Neeson'),
('Russell Crowe'),
('Leonardo DiCaprio'),
('Kate Winslet'),
('Jodie Foster'),
('Anthony Hopkins'),
('Daniel Kaluuya'),
('Joaquin Phoenix'),
('Alexandre Rodrigues'),
('Wagner Moura'),
('Fernanda Montenegro'),
('Ranveer Singh'),
('Harrison Ford'),
('Ryan Gosling'),
('Timothée Chalamet'),
('Zendaya'),
('Michelle Yeoh'),
('Jamie Lee Curtis'),
('Robert Downey Jr.'),
('Chris Evans'),
('Scarlett Johansson'),
('Cillian Murphy'),
('Margot Robbie'),
('Ryan Reynolds'),
('Anya Taylor-Joy'),
('Florence Pugh');
 

-- FILME-ATOR (50 registros)
INSERT INTO filme_ator (filme_id, ator_id) VALUES
(1,  1), 
(1,  2),
(2,  3), 
(2,  4),
(3,  5), 
(3,  6),
(4,  7),
(5,  8),
(6,  9), 
(6, 10),
(7, 11), 
(7, 12),
(8, 13), 
(8, 14),
(9, 15),
(10, 16),
(11, 17), 
(11, 18),
(12, 19), 
(12, 20),
(13, 21),
(14, 22),
(15, 23),
(16, 24),
(17, 25),
(21, 27), 
(21, 28),
(22, 29), 
(22, 30),
(23, 31), 
(23, 32),
(24, 17),
(25, 33), 
(25, 34), 
(25, 35),
(26, 36),
(27, 37),
(29, 39),
(30, 40);
 
-- Endereços (25 registros)
INSERT INTO endereco (pais, cidade, bairro, logradouro, numero) VALUES
('Brasil', 'São Paulo',        'Moema',           'Rua Iraí',                  '142'),
('Brasil', 'São Paulo',        'Pinheiros',        'Rua dos Pinheiros',         '830'),
('Brasil', 'São Paulo',        'Vila Madalena',    'Rua Harmonia',              '215'),
('Brasil', 'Rio de Janeiro',   'Ipanema',          'Rua Visconde de Pirajá',    '540'),
('Brasil', 'Rio de Janeiro',   'Barra da Tijuca',  'Avenida das Américas',      '3900'),
('Brasil', 'Rio de Janeiro',   'Copacabana',       'Rua Barata Ribeiro',        '110'),
('Brasil', 'Belo Horizonte',   'Savassi',          'Rua Pernambuco',            '1200'),
('Brasil', 'Belo Horizonte',   'Lourdes',          'Avenida Álvares Cabral',    '450'),
('Brasil', 'Curitiba',         'Batel',            'Rua Comendador Araújo',     '600'),
('Brasil', 'Curitiba',         'Água Verde',       'Avenida Água Verde',        '1870'),
('Brasil', 'Porto Alegre',     'Moinhos de Vento', 'Rua Padre Chagas',          '333'),
('Brasil', 'Porto Alegre',     'Petrópolis',       'Rua Plínio Brasil Milano',  '90'),
('Brasil', 'Salvador',         'Vitória',          'Rua da Graça',              '210'),
('Brasil', 'Salvador',         'Barra',            'Avenida Oceânica',          '780'),
('Brasil', 'Recife',           'Boa Viagem',       'Avenida Boa Viagem',        '3500'),
('Brasil', 'Recife',           'Aflitos',          'Rua dos Aflitos',           '55'),
('Brasil', 'Fortaleza',        'Meireles',         'Avenida Beira Mar',         '2200'),
('Brasil', 'Manaus',           'Adrianópolis',     'Rua Rio Japurá',            '88'),
('Brasil', 'Brasília',         'Asa Sul',          'SQS 308 Bloco A',           NULL),
('Brasil', 'Brasília',         'Asa Norte',        'SQN 212 Bloco C',           NULL),
('Brasil', 'Florianópolis',    'Trindade',         'Rua Lauro Linhares',        '1730'),
('Brasil', 'Goiânia',          'Setor Bueno',      'Rua T-37',                  '960'),
('Brasil', 'Campinas',         'Cambuí',           'Rua Coronel Quirino',       '410'),
('Brasil', 'Natal',            'Tirol',            'Rua Jundiaí',               '302'),
('Brasil', 'Vitória',          'Praia do Canto',   'Rua Joaquim Lírio',         '175');
 
-- LOJAS (5 registros)

INSERT INTO loja (nome, endereco_id) VALUES
('VideoMax Moema',1),
('CineClub Ipanema',4),
('FilmHouse Savassi',7),
('LocaFácil Batel',9),
('Tela Grande Meireles',17);

-- FUNCIONÁRIOS (15 registros)

INSERT INTO funcionario (nome, cargo, loja_id, endereco_id) VALUES
('Rafael Mendonça',      'Gerente',          1,  1),
('Juliana Farias',       'Atendente',        1,  2),
('Carlos Eduardo Lima',  'Atendente',        1,  3),
('Beatriz Nascimento',   'Gerente',          2,  4),
('Thiago Cavalcanti',    'Atendente',        2,  5),
('Mariana Souza',        'Atendente',        2,  6),
('André Gonçalves',      'Gerente',          3,  7),
('Letícia Borges',       'Atendente',        3,  8),
('Rodrigo Martins',      'Atendente',        3,  9),
('Fernanda Albuquerque', 'Gerente',          4, 10),
('Diego Henrique',       'Atendente',        4, 11),
('Camila Rocha',         'Atendente',        4, 12),
('Paulo Sérgio',         'Gerente',          5, 17),
('Aline Teixeira',       'Atendente',        5, 18),
('Lucas Magalhães',      'Atendente',        5, 19);
 
-- CLIENTES (30 registros)

INSERT INTO cliente (nome, email, telefone, endereco_id) VALUES
('Amanda Cristina Ferreira',   'amanda.ferreira@gmail.com',      '(11) 98234-5610',  2),
('Bruno Alves Pereira',        'bruno.a.pereira@hotmail.com',    '(11) 97823-1042',  3),
('Carla Monteiro Dias',        'carla.monteiro@yahoo.com.br',    '(21) 99102-3847',  4),
('Daniel Freitas Souza',       'daniel.freitas@outlook.com',     '(21) 98765-4321',  5),
('Eduarda Lins Cavalcanti',    'eduarda.lins@gmail.com',         '(21) 99234-8760',  6),
('Fabio Henrique Ramos',       'fabio.ramos@empresa.com.br',     '(31) 98100-2233',  7),
('Gabriela Oliveira Costa',    'gabi.costa@gmail.com',           '(31) 97654-9870',  8),
('Hugo Carvalho Neto',         'hugo.carvalho@hotmail.com',      '(41) 99345-6712',  9),
('Isabela Nogueira Pinto',     'isabela.pinto@gmail.com',        '(41) 98456-7823', 10),
('João Victor Andrade',        'joao.andrade@outlook.com',       '(51) 99567-8934', 11),
('Karen Mello Teixeira',       'karen.teixeira@gmail.com',       '(51) 98678-9045', 12),
('Leonardo Braga Figueiredo',  'leo.braga@gmail.com',            '(71) 99789-0156', 13),
('Mariana Cunha Barbosa',      'mariana.cunha@yahoo.com.br',     '(71) 98890-1267', 14),
('Nicolas Rocha Vieira',       'nicolas.vieira@hotmail.com',     '(81) 99901-2378', 15),
('Olivia Santos Duarte',       'olivia.duarte@gmail.com',        '(81) 98012-3489', 16),
('Pedro Augusto Cardoso',      'pedro.cardoso@gmail.com',        '(85) 99123-4590', 17),
('Queila Moreira Lopes',       'queila.lopes@outlook.com',       '(92) 98234-5601', 18),
('Ricardo Tavares Melo',       'ricardo.melo@empresa.com.br',    '(61) 99345-6712', 19),
('Sabrina Lima Campos',        'sabrina.campos@gmail.com',       '(61) 98456-7823', 20),
('Tiago Fernandes Guerra',     'tiago.guerra@hotmail.com',       '(48) 99567-8934', 21),
('Ursula Dias Correia',        'ursula.correia@gmail.com',       '(62) 98678-9045', 22),
('Vinícius Araújo Bastos',     'vinicius.bastos@gmail.com',      '(19) 99789-0156', 23),
('Wendy Castro Pimentel',      'wendy.pimentel@outlook.com',     '(84) 98890-1267', 24),
('Xavier Ribeiro Santana',     'xavier.santana@hotmail.com',     '(27) 99901-2378', 25),
('Yasmin Almeida Fonseca',     'yasmin.fonseca@gmail.com',       '(11) 98912-3481',  1),
('Zeca Borges Medeiros',       'zeca.medeiros@gmail.com',        '(21) 97823-4592',  4),
('Alice Prado Guimarães',      'alice.guimaraes@yahoo.com.br',   '(31) 96734-5603',  7),
('Bruno Siqueira Machado',     'b.machado@empresa.com.br',       '(41) 95645-6714',  9),
('Clarice Alves Drummond',     'clarice.drummond@gmail.com',     '(51) 94556-7825', 11),
('Diego Mota Vasconcelos',     'diego.vasconcelos@hotmail.com',  '(85) 93467-8936', 17);
 
-- PAGAMENTOS (50 registros)

INSERT INTO pagamento (valor, data_pagamento) VALUES
(7.50,  '2024-01-05'),
(12.00, '2024-01-07'),
(7.50,  '2024-01-10'),
(9.00,  '2024-01-12'),
(12.00, '2024-01-15'),
(7.50,  '2024-01-18'),
(9.00,  '2024-01-20'),
(12.00, '2024-01-22'),
(7.50,  '2024-01-25'),
(9.00,  '2024-01-28'),
(12.00, '2024-02-02'),
(7.50,  '2024-02-05'),
(9.00,  '2024-02-08'),
(12.00, '2024-02-10'),
(7.50,  '2024-02-13'),
(9.00,  '2024-02-15'),
(12.00, '2024-02-18'),
(7.50,  '2024-02-20'),
(9.00,  '2024-02-22'),
(12.00, '2024-02-25'),
(7.50,  '2024-03-01'),
(9.00,  '2024-03-04'),
(12.00, '2024-03-07'),
(7.50,  '2024-03-10'),
(9.00,  '2024-03-13'),
(12.00, '2024-03-16'),
(7.50,  '2024-03-19'),
(9.00,  '2024-03-22'),
(12.00, '2024-03-25'),
(7.50,  '2024-03-28'),
(9.00,  '2024-04-02'),
(12.00, '2024-04-05'),
(7.50,  '2024-04-08'),
(9.00,  '2024-04-11'),
(12.00, '2024-04-14'),
(7.50,  '2024-04-17'),
(9.00,  '2024-04-20'),
(12.00, '2024-04-23'),
(7.50,  '2024-04-26'),
(9.00,  '2024-04-29'),
(12.00, '2024-05-02'),
(7.50,  '2024-05-05'),
(9.00,  '2024-05-08'),
(12.00, '2024-05-11'),
(7.50,  '2024-05-14'),
(9.00,  '2024-05-17'),
(12.00, '2024-05-20'),
(7.50,  '2024-05-23'),
(9.00,  '2024-05-26'),
(12.00, '2024-05-29');
 
 
-- ALUGUÉIS (50 registros)

INSERT INTO aluguel (cliente_id, filme_id, funcionario_id, pagamento_id, data_aluguel, data_devolucao) VALUES
( 1,  5,  2,  1, '2024-01-05', '2024-01-08'),
( 2, 11,  5,  2, '2024-01-07', '2024-01-10'),
( 3,  1,  8,  3, '2024-01-10', '2024-01-13'),
( 4, 14,  2,  4, '2024-01-12', '2024-01-15'),
( 5,  6, 11,  5, '2024-01-15', '2024-01-18'),
( 6,  3,  8,  6, '2024-01-18', '2024-01-21'),
( 7, 18,  5,  7, '2024-01-20', '2024-01-23'),
( 8, 10, 11,  8, '2024-01-22', '2024-01-25'),
( 9, 15,  2,  9, '2024-01-25', '2024-01-28'),
(10,  8, 14, 10, '2024-01-28', '2024-01-31'),
(11, 26,  5, 11, '2024-02-02', '2024-02-05'),
(12, 27, 11, 12, '2024-02-05', '2024-02-08'),
(13, 22,  8, 13, '2024-02-08', '2024-02-11'),
(14,  2, 14, 14, '2024-02-10', '2024-02-13'),
(15, 13,  2, 15, '2024-02-13', '2024-02-16'),
(16,  4, 14, 16, '2024-02-15', '2024-02-18'),
(17, 19,  5, 17, '2024-02-18', '2024-02-21'),
(18, 25,  8, 18, '2024-02-20', '2024-02-23'),
(19, 30, 11, 19, '2024-02-22', '2024-02-25'),
(20,  7,  2, 20, '2024-02-25', '2024-02-28'),
(21, 16, 14, 21, '2024-03-01', '2024-03-04'),
(22,  9,  5, 22, '2024-03-04', '2024-03-07'),
(23, 23,  8, 23, '2024-03-07', '2024-03-10'),
(24, 29,  2, 24, '2024-03-10', '2024-03-13'),
(25, 12, 11, 25, '2024-03-13', '2024-03-16'),
(26, 17, 14, 26, '2024-03-16', '2024-03-19'),
(27, 28,  5, 27, '2024-03-19', '2024-03-22'),
(28, 24,  2, 28, '2024-03-22', '2024-03-25'),
(29, 21,  8, 29, '2024-03-25', '2024-03-28'),
(30, 20, 11, 30, '2024-03-28', '2024-03-31'),
( 1, 26, 14, 31, '2024-04-02', '2024-04-05'),
( 3, 27,  2, 32, '2024-04-05', '2024-04-08'),
( 5,  3,  5, 33, '2024-04-08', '2024-04-11'),
( 7, 11,  8, 34, '2024-04-11', '2024-04-14'),
( 9, 13, 14, 35, '2024-04-14', '2024-04-17'),
(11, 25,  2, 36, '2024-04-17', '2024-04-20'),
(13,  6,  5, 37, '2024-04-20', '2024-04-23'),
(15, 22,  8, 38, '2024-04-23', '2024-04-26'),
(17,  1, 11, 39, '2024-04-26', '2024-04-29'),
(19, 14, 14, 40, '2024-04-29', '2024-05-02'),
(21, 10,  2, 41, '2024-05-02', '2024-05-05'),
(23,  4,  5, 42, '2024-05-05', '2024-05-08'),
(25, 19,  8, 43, '2024-05-08', '2024-05-11'),
(27,  8, 11, 44, '2024-05-11', '2024-05-14'),
(29, 30,  2, 45, '2024-05-14', '2024-05-17'),
( 2, 15, 14, 46, '2024-05-17', '2024-05-20'),
( 4, 17,  5, 47, '2024-05-20', '2024-05-23'),
( 6,  7,  8, 48, '2024-05-23', NULL),
( 8, 23, 11, 49, '2024-05-26', NULL),
(10, 29,  2, 50, '2024-05-29', NULL);