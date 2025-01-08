
-- en
/*
To explore the database before answering the essential questions, I start by answering some questions to understand the data quality.
0 - What is the total size of the database?
1 - What are the data types?
2 - What is the number of records and the distribution of null values for the columns I want to analyze?
3 - What are the distinct values in each column?

*/

-- 0 - Check the total size of the database
SELECT 
    COUNT(*) AS total_records
FROM 
    `basedosdados.br_ms_sinasc.microdados`;

-- 1 - Check the data types of each column in a table in BigQuery
SELECT 
    column_name, 
    data_type
FROM 
    `basedosdados.br_ms_sinasc.INFORMATION_SCHEMA.COLUMNS`
WHERE 
    table_name = 'microdados';

-- 2 - Check the number of records (rows) and the distribution of null values in each column

SELECT 
    'sexo' AS column_name,
    COUNT(sexo) AS total_records,
    SUM(CASE WHEN sexo IS NULL THEN 1 ELSE 0 END) AS null_values,
    COUNT(DISTINCT sexo) AS distinct_values
FROM 
    `basedosdados.br_ms_sinasc.microdados`

UNION ALL

SELECT 
    'ano' AS column_name,
    COUNT(ano) AS total_records,
    SUM(CASE WHEN ano IS NULL THEN 1 ELSE 0 END) AS null_values,
    COUNT(DISTINCT ano) AS distinct_values
FROM 
    `basedosdados.br_ms_sinasc.microdados`

UNION ALL

SELECT
    'sigla_uf' AS column_name,
    COUNT (sigla_uf) AS total_records,
    SUM(CASE WHEN sigla_uf IS NULL THEN 1 ELSE 0 END) AS null_values,
    COUNT (DISTINCT sigla_uf) AS distinct_values
FROM
    `basedosdados.br_ms_sinasc.microdados`

UNION ALL

SELECT
    'raca_cor' AS column_name,
    COUNT (raca_cor) AS total_records,
    SUM(CASE WHEN raca_cor IS NULL THEN 1 ELSE 0 END) AS null_values,
    COUNT (DISTINCT raca_cor) AS distinct_values
FROM
    `basedosdados.br_ms_sinasc.microdados`;

-- 3 - Check distinct values in each column
SELECT 
    COUNT(DISTINCT ano) AS distinct_year,
    COUNT(DISTINCT sexo) AS distinct_sex,
    COUNT(DISTINCT raca_cor) AS distinct_race_color,
    COUNT(DISTINCT sigla_uf) AS distinct_state
FROM 
    `basedosdados.br_ms_sinasc.microdados`;



-- pt-br

/*
com objetivo de explorar a base antes de responder as perguntas essenciais começo respondendo algumas perguntas para entender a qualidade dos dados
0 - qual tamanho total da base de dados?
1 - quais são os tipos de dados?
2 - qual número de registros e a distribuição dos valores nulos para as colunas que quero analisar?
3 - quais são os valores distintos em cada coluna?

*/

-- 0 - Verifica o tamanho total da base de dados
SELECT 
    COUNT(*) AS total_records
    FROM 
        `basedosdados.br_ms_sinasc.microdados`;

-- 1 -  Verifica os tipos de dados de cada coluna em uma tabela no BigQuery
SELECT 
    column_name, 
    data_type
FROM 
    `basedosdados.br_ms_sinasc.INFORMATION_SCHEMA.COLUMNS`
WHERE 
    table_name = 'microdados';

-- 2 - Verifica o número de registros (linhas) e a distribuição dos valores nulo em cada coluna

SELECT 
    'sexo' AS column_name,
    COUNT(sexo) AS total_records,
    SUM(CASE WHEN sexo IS NULL THEN 1 ELSE 0 END) AS null_values,
    COUNT(DISTINCT sexo) AS distinct_values
FROM 
    `basedosdados.br_ms_sinasc.microdados`

UNION ALL

SELECT 
    'ano' AS column_name,
    COUNT(ano) AS total_records,
    SUM(CASE WHEN ano IS NULL THEN 1 ELSE 0 END) AS null_values,
    COUNT(DISTINCT ano) AS distinct_values
FROM 
    `basedosdados.br_ms_sinasc.microdados`


UNION ALL

SELECT
    'sigla_uf' AS column_name,
    COUNT (sigla_uf) AS total_records,
    SUM(CASE WHEN sigla_uf IS NULL THEN 1 ELSE 0 END) AS null_values,
    COUNT (DISTINCT sigla_uf) AS distinct_valies

FROM
    `basedosdados.br_ms_sinasc.microdados`

UNION ALL

SELECT
    'raca_cor' AS column_name,
    COUNT (raca_cor) AS total_records,
    SUM(CASE WHEN raca_cor IS NULL THEN 1 ELSE 0 END) AS null_values,
    COUNT (DISTINCT raca_cor) AS distinct_valies

FROM
    `basedosdados.br_ms_sinasc.microdados`;

-- 3 - verifica valores distintos em cada coluna
SELECT 
    COUNT(DISTINCT ano) AS distinct_year,
    COUNT (DISTINCT sexo) AS distinct_sex,
    COUNT (DISTINCT raca_cor) AS distinct_race_color,
    COUNT (DISTINCT sigla_uf) AS distinct_state,
FROM 
    `basedosdados.br_ms_sinasc.microdados`;
