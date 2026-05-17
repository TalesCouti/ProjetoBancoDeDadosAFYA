# Dicionario de Dados

Este documento descreve a estrutura do banco de dados da locadora de filmes, com base no arquivo `Construcao.sql`.

## Visao geral

O banco de dados possui 9 tabelas:

- `filme`
- `endereco`
- `cliente`
- `loja`
- `funcionario`
- `ator`
- `filme_ator`
- `pagamento`
- `aluguel`

## Tabela: filme

Armazena os dados dos filmes disponiveis na locadora.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `filme_id` | `SERIAL` | Chave primaria | Identificador unico do filme. |
| `titulo` | `VARCHAR(255)` | Obrigatorio | Titulo do filme. |
| `diretor` | `VARCHAR(255)` | Obrigatorio | Nome do diretor do filme. |
| `categoria` | `VARCHAR(255)` | Obrigatorio | Categoria ou genero do filme. |
| `estoque` | `INT` | Obrigatorio | Quantidade de unidades disponiveis em estoque. |
| `data_lancamento` | `DATE` | Obrigatorio | Data de lancamento do filme. |

## Tabela: endereco

Armazena informacoes de localizacao usadas por clientes, lojas e funcionarios.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `endereco_id` | `SERIAL` | Chave primaria | Identificador unico do endereco. |
| `pais` | `VARCHAR(255)` | Obrigatorio | Pais do endereco. |
| `cidade` | `VARCHAR(255)` | Obrigatorio | Cidade do endereco. |
| `bairro` | `VARCHAR(255)` | Obrigatorio | Bairro do endereco. |
| `logradouro` | `VARCHAR(255)` | Obrigatorio | Logradouro do endereco. |
| `numero` | `VARCHAR(20)` | Opcional | Numero da residenia, opcional devido a endereços S/N. |
c
## Tabela: cliente

Armazena os dados dos clientes cadastrados na locadora.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `cliente_id` | `SERIAL` | Chave primaria | Identificador unico do cliente. |
| `nome` | `VARCHAR(255)` | Obrigatorio | Nome do cliente. |
| `email` | `VARCHAR(255)` | Obrigatorio, unico | Email do cliente. |
| `telefone` | `VARCHAR(20)` | Obrigatorio, unico | Telefone do cliente. |
| `endereco_id` | `INT` | Chave estrangeira | Referencia o endereco do cliente. |

Relacionamento:

- `cliente.endereco_id` referencia `endereco.endereco_id`.

## Tabela: loja

Armazena os dados das lojas da locadora.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `loja_id` | `SERIAL` | Chave primaria | Identificador unico da loja. |
| `nome` | `VARCHAR(255)` | Obrigatorio | Nome da loja. |
| `endereco` | `VARCHAR(255)` | Obrigatorio | Endereco textual da loja. |
| `endereco_id` | `INT` | Chave estrangeira | Referencia o endereco cadastrado da loja. |

Relacionamento:

- `loja.endereco_id` referencia `endereco.endereco_id`.

## Tabela: funcionario

Armazena os dados dos funcionarios da locadora.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `funcionario_id` | `SERIAL` | Chave primaria | Identificador unico do funcionario. |
| `nome` | `VARCHAR(255)` | Obrigatorio | Nome do funcionario. |
| `cargo` | `VARCHAR(255)` | Obrigatorio | Cargo exercido pelo funcionario. |
| `loja_id` | `INT` | Obrigatorio, chave estrangeira | Loja em que o funcionario trabalha. |
| `endereco_id` | `INT` | Chave estrangeira | Endereco associado ao funcionario. |

Relacionamentos:

- `funcionario.loja_id` referencia `loja.loja_id`.
- `funcionario.endereco_id` referencia `endereco.endereco_id`.

## Tabela: ator

Armazena os atores cadastrados no banco.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `ator_id` | `SERIAL` | Chave primaria | Identificador unico do ator. |
| `nome` | `VARCHAR(255)` | Obrigatorio | Nome do ator. |

## Tabela: filme_ator

Tabela associativa usada para representar o relacionamento muitos-para-muitos entre filmes e atores.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `filme_id` | `INT` | Chave primaria composta, chave estrangeira | Filme relacionado ao ator. |
| `ator_id` | `INT` | Chave primaria composta, chave estrangeira | Ator relacionado ao filme. |

Chave primaria:

- Composta por `filme_id` e `ator_id`.

Relacionamentos:

- `filme_ator.filme_id` referencia `filme.filme_id`.
- `filme_ator.ator_id` referencia `ator.ator_id`.

## Tabela: pagamento

Armazena informacoes sobre os pagamentos realizados.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `pagamento_id` | `SERIAL` | Chave primaria | Identificador unico do pagamento. |
| `valor` | `DECIMAL(10, 2)` | Obrigatorio | Valor pago pelo aluguel. |
| `data_pagamento` | `DATE` | Obrigatorio | Data em que o pagamento foi realizado. |

## Tabela: aluguel

Armazena os registros de alugueis realizados pelos clientes.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `aluguel_id` | `SERIAL` | Chave primaria | Identificador unico do aluguel. |
| `cliente_id` | `INT` | Obrigatorio, chave estrangeira | Cliente que realizou o aluguel. |
| `filme_id` | `INT` | Obrigatorio, chave estrangeira | Filme alugado. |
| `funcionario_id` | `INT` | Obrigatorio, chave estrangeira | Funcionario responsavel pelo atendimento. |
| `pagamento_id` | `INT` | Obrigatorio, chave estrangeira | Pagamento associado ao aluguel. |
| `data_aluguel` | `DATE` | Obrigatorio | Data em que o aluguel foi realizado. |
| `data_devolucao` | `DATE` | Opcional | Data em que o filme foi devolvido. |

Relacionamentos:

- `aluguel.cliente_id` referencia `cliente.cliente_id`.
- `aluguel.filme_id` referencia `filme.filme_id`.
- `aluguel.funcionario_id` referencia `funcionario.funcionario_id`.
- `aluguel.pagamento_id` referencia `pagamento.pagamento_id`.


 