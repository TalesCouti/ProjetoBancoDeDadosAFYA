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

## Regras de Cascade

As tabelas que possuem chaves estrangeiras usam `ON DELETE CASCADE` e `ON UPDATE CASCADE`.

- `ON DELETE CASCADE`: quando um registro da tabela pai é excluido, os registros das tabelas filho tambem sao excluidos automaticamente.
- `ON DELETE CASCADE`: quando um registro da tabela pai é atualizado, os registros das tabelas filho tambem sao atualizados automaticamente.

Essa regra ajuda a manter a organização do banco de dados para que as referencias não quebrem.

Tabelas com cascade:

| Tabela | Chave estrangeira | Referencia | Regra |
| --- | --- | --- | --- |
| `cliente` | `endereco_id` | `endereco(endereco_id)` | `ON DELETE CASCADE`, `ON UPDATE CASCADE` |
| `loja` | `endereco_id` | `endereco(endereco_id)` | `ON DELETE CASCADE`, `ON UPDATE CASCADE` |
| `funcionario` | `loja_id` | `loja(loja_id)` | `ON DELETE CASCADE`, `ON UPDATE CASCADE` |
| `funcionario` | `endereco_id` | `endereco(endereco_id)` | `ON DELETE CASCADE`, `ON UPDATE CASCADE` |
| `filme_ator` | `filme_id` | `filme(filme_id)` | `ON DELETE CASCADE`, `ON UPDATE CASCADE` |
| `filme_ator` | `ator_id` | `ator(ator_id)` | `ON DELETE CASCADE`, `ON UPDATE CASCADE` |
| `aluguel` | `cliente_id` | `cliente(cliente_id)` | `ON DELETE CASCADE`, `ON UPDATE CASCADE` |
| `aluguel` | `filme_id` | `filme(filme_id)` | `ON DELETE CASCADE`, `ON UPDATE CASCADE` |
| `aluguel` | `funcionario_id` | `funcionario(funcionario_id)` | `ON DELETE CASCADE`, `ON UPDATE CASCADE` |
| `aluguel` | `pagamento_id` | `pagamento(pagamento_id)` | `ON DELETE CASCADE`, `ON UPDATE CASCADE` |

## Tabela: filme

Armazena os dados dos filmes disponiveis na locadora.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `filme_id` | `INT AUTO_INCREMENT` | Chave primaria | Identificador unico do filme. |
| `titulo` | `VARCHAR(255)` | Obrigatorio | Titulo do filme. |
| `diretor` | `VARCHAR(255)` | Obrigatorio | Nome do diretor do filme. |
| `categoria` | `VARCHAR(255)` | Obrigatorio | Categoria ou genero do filme. |
| `estoque` | `INT` | Obrigatorio | Quantidade de unidades disponiveis em estoque. |
| `data_lancamento` | `DATE` | Obrigatorio | Data de lancamento do filme. |

## Tabela: endereco

Armazena informacoes de localizacao usadas por clientes, lojas e funcionarios.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `endereco_id` | `INT AUTO_INCREMENT` | Chave primaria | Identificador unico do endereco. |
| `pais` | `VARCHAR(255)` | Obrigatorio | Pais do endereco. |
| `cidade` | `VARCHAR(255)` | Obrigatorio | Cidade do endereco. |
| `bairro` | `VARCHAR(255)` | Obrigatorio | Bairro do endereco. |
| `logradouro` | `VARCHAR(255)` | Obrigatorio | Logradouro do endereco. |
| `numero` | `VARCHAR(20)` | Opcional | Numero da residencia, opcional devido a enderecos S/N. |

## Tabela: cliente

Armazena os dados dos clientes cadastrados na locadora.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `cliente_id` | `INT AUTO_INCREMENT` | Chave primaria | Identificador unico do cliente. |
| `nome` | `VARCHAR(255)` | Obrigatorio | Nome do cliente. |
| `email` | `VARCHAR(255)` | Obrigatorio, unico | Email do cliente. |
| `telefone` | `VARCHAR(20)` | Obrigatorio, unico | Telefone do cliente. |
| `endereco_id` | `INT` | Chave estrangeira com cascade | Referencia o endereco do cliente. |

Relacionamento:

- `cliente.endereco_id` referencia `endereco.endereco_id` com `ON DELETE CASCADE` e `ON UPDATE CASCADE`.

## Tabela: loja

Armazena os dados das lojas da locadora.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `loja_id` | `INT AUTO_INCREMENT` | Chave primaria | Identificador unico da loja. |
| `nome` | `VARCHAR(255)` | Obrigatorio | Nome da loja. |
| `endereco_id` | `INT` | Chave estrangeira com cascade | Referencia o endereco cadastrado da loja. |

Relacionamento:

- `loja.endereco_id` referencia `endereco.endereco_id` com `ON DELETE CASCADE` e `ON UPDATE CASCADE`.

## Tabela: funcionario

Armazena os dados dos funcionarios da locadora.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `funcionario_id` | `INT AUTO_INCREMENT` | Chave primaria | Identificador unico do funcionario. |
| `nome` | `VARCHAR(255)` | Obrigatorio | Nome do funcionario. |
| `cargo` | `VARCHAR(255)` | Obrigatorio | Cargo exercido pelo funcionario. |
| `loja_id` | `INT` | Obrigatorio, chave estrangeira com cascade | Loja em que o funcionario trabalha. |
| `endereco_id` | `INT` | Obrigatorio, chave estrangeira com cascade | Endereco associado ao funcionario. |

Relacionamentos:

- `funcionario.loja_id` referencia `loja.loja_id` com `ON DELETE CASCADE` e `ON UPDATE CASCADE`.
- `funcionario.endereco_id` referencia `endereco.endereco_id` com `ON DELETE CASCADE` e `ON UPDATE CASCADE`.

## Tabela: ator

Armazena os atores cadastrados no banco.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `ator_id` | `INT AUTO_INCREMENT` | Chave primaria | Identificador unico do ator. |
| `nome` | `VARCHAR(255)` | Obrigatorio | Nome do ator. |

## Tabela: filme_ator

Tabela associativa usada para representar o relacionamento muitos-para-muitos entre filmes e atores.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `filme_id` | `INT` | Chave primaria composta, chave estrangeira com cascade | Filme relacionado ao ator. |
| `ator_id` | `INT` | Chave primaria composta, chave estrangeira com cascade | Ator relacionado ao filme. |

Chave primaria:

- Composta por `filme_id` e `ator_id`.

Relacionamentos:

- `filme_ator.filme_id` referencia `filme.filme_id` com `ON DELETE CASCADE` e `ON UPDATE CASCADE`.
- `filme_ator.ator_id` referencia `ator.ator_id` com `ON DELETE CASCADE` e `ON UPDATE CASCADE`.

## Tabela: pagamento

Armazena informacoes sobre os pagamentos realizados.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `pagamento_id` | `INT AUTO_INCREMENT` | Chave primaria | Identificador unico do pagamento. |
| `valor` | `DECIMAL(10, 2)` | Obrigatorio | Valor pago pelo aluguel. |
| `data_pagamento` | `DATE` | Obrigatorio | Data em que o pagamento foi realizado. |

## Tabela: aluguel

Armazena os registros de alugueis realizados pelos clientes.

| Campo | Tipo | Restricoes | Descricao |
| --- | --- | --- | --- |
| `aluguel_id` | `INT AUTO_INCREMENT` | Chave primaria | Identificador unico do aluguel. |
| `cliente_id` | `INT` | Obrigatorio, chave estrangeira com cascade | Cliente que realizou o aluguel. |
| `filme_id` | `INT` | Obrigatorio, chave estrangeira com cascade | Filme alugado. |
| `funcionario_id` | `INT` | Obrigatorio, chave estrangeira com cascade | Funcionario responsavel pelo atendimento. |
| `pagamento_id` | `INT` | Obrigatorio, chave estrangeira com cascade | Pagamento associado ao aluguel. |
| `data_aluguel` | `DATE` | Obrigatorio | Data em que o aluguel foi realizado. |
| `data_devolucao` | `DATE` | Opcional | Data em que o filme foi devolvido. |

Relacionamentos:

- `aluguel.cliente_id` referencia `cliente.cliente_id` com `ON DELETE CASCADE` e `ON UPDATE CASCADE`.
- `aluguel.filme_id` referencia `filme.filme_id` com `ON DELETE CASCADE` e `ON UPDATE CASCADE`.
- `aluguel.funcionario_id` referencia `funcionario.funcionario_id` com `ON DELETE CASCADE` e `ON UPDATE CASCADE`.
- `aluguel.pagamento_id` referencia `pagamento.pagamento_id` com `ON DELETE CASCADE` e `ON UPDATE CASCADE`.
