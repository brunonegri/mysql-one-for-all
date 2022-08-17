-- Active: 1660763243827@@127.0.0.1@3307@SpotifyClone
SELECT 
cancao_nome AS cancao,
COUNT(*) as reproducoes
FROM
SpotifyClone.historico AS his
    INNER JOIN
SpotifyClone.cancoes AS can ON his.cancao_id = can.cancao_id
GROUP BY cancao_nome
ORDER BY reproducoes DESC , cancao ASC
LIMIT 2;