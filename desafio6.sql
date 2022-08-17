SELECT 
    FORMAT(MIN(valor_plano), 2) as faturamento_minimo,
    FORMAT(MAX(valor_plano), 2) as faturamento_maximo,
    FORMAT(AVG(valor_plano), 2) as faturamento_medio,
    FORMAT(SUM(valor_plano), 2) as faturamento_total
FROM
    SpotifyClone.usuarios AS usu
        INNER JOIN
    SpotifyClone.planos AS p ON usu.plano_id = p.plano_id;