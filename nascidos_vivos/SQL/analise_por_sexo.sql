/* Objective of the Analysis: How are births distributed between sexes over the years? 
To achieve this, the problem was broken into steps:

1 - Count the total number of births for each sex in each year;
2 - Calculate the proportion (percentage) of each sex relative to the total births per year;
3 - Sort the results to make interpretation easier.
 */

-- 1 - Count the total number of births for each sex in each year
SELECT 
  ano as birth_year,
  sexo as sex,
  COUNT(*) AS total_births
 FROM `basedosdados.br_ms_sinasc.microdados` 
  GROUP BY birth_year, sex
 LIMIT 100;

-- 2 - Calculate the proportion (percentage) of each sex relative to the total births per year

SELECT 
    ano as birth_year,
    COUNT(*) AS total_births
FROM 
    `basedosdados.br_ms_sinasc.microdados` 
GROUP BY 
    birth_year;

-- 2.1 Using the analytical function (SUM() OVER) to calculate the total directly within the same query
SELECT 
    ano as birth_year,
    sexo as sex,
    COUNT(*) AS total_births,
    SUM(COUNT(*)) OVER (PARTITION BY ano) AS grand_total_births,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY ano), 2) AS percent
FROM 
    `basedosdados.br_ms_sinasc.microdados` 
GROUP BY 
    birth_year, sex;

-- 3 - Sort the results to make interpretation easier
SELECT 
    ano as birth_year,
    CASE 
        WHEN sexo = '1' THEN 'Male'
        WHEN sexo = '2' THEN 'Female'
        WHEN sexo IN ('0', '9') THEN 'Ignored'
        WHEN sexo IS NULL THEN 'Null'
        ELSE 'Unknown'
    END AS sex,
    COUNT(*) AS total_births,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY ano), 2) AS percent
FROM 
    `basedosdados.br_ms_sinasc.microdados` 
GROUP BY 
    birth_year, sex
ORDER BY 
    birth_year, sex;

-->>>

/*
PT - BR

Objetivo da Análise: Como os nascimentos são distribuídos entre os sexos no decorrer dos anos? 
para isso foi necessário quebrar o problema em etapas:

1 - contar o número total de nascimentos para cada sexo em cada ano;
2 - Calcular a proporção (percentual) de cada sexo em relação ao total de nascimentos por ano;
3 - Ordenar os resultados para facilitar a interpretação.
 */

-- 1 - contagem do número total de nascimentos para cada sexo em cada ano
SELECT 
  ano as birth_year,
  sexo as sex,
  COUNT(*) AS total_births
 FROM `basedosdados.br_ms_sinasc.microdados` 
  GROUP BY birth_year, sex
 LIMIT 100;

-- 2 - Calcular a proporção (percentual) de cada sexo em relação ao total de nascimentos por ano;
SELECT 
    ano as birth_year,
    COUNT(*) AS total_births
FROM 
    `basedosdados.br_ms_sinasc.microdados` 
GROUP BY 
    birth_year;


  --2.1 usando a função analítica (SUM() OVER) que calcula o total geral diretamente na mesma consulta.
SELECT 
    ano as birth_year,
    sexo as sex,
    COUNT(*) AS total_births,
    SUM(COUNT(*)) OVER (PARTITION BY ano) AS grand_total_births,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY ano), 2) AS percent
FROM 
    `basedosdados.br_ms_sinasc.microdados` 
GROUP BY 
    birth_year, sex;



-- 3 Ordenar os resultados para facilitar a interpretação, melhorar a exibição e normalização.
SELECT 
    ano as birth_year,
    CASE 
        WHEN sexo = '1' THEN 'Male'
        WHEN sexo = '2' THEN 'Fem'
        WHEN sexo IN ('0', '9') THEN 'Ignored'
        WHEN sexo IS NULL THEN 'Null'
        ELSE 'Desconhecido'
    END AS sex,
    COUNT(*) AS total_births,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY ano), 2) AS percent
FROM 
    `basedosdados.br_ms_sinasc.microdados` 
GROUP BY 
    birth_year, sex
ORDER BY 
    birth_year, sex;







