-- Active: 1660763243827@@127.0.0.1@3307@SpotifyClone
SELECT 
usuarios.usuario_nome AS usuario,
COUNT(*) AS qt_de_musicas_ouvidas,
ROUND(SUM(duracao_segundos)/60,2) AS total_minutos
FROM 
SpotifyClone.usuarios AS usuarios
    INNER JOIN
SpotifyClone.historico AS his ON his.usuario_id = usuarios.usuario_id
    INNER JOIN
SpotifyClone.cancoes AS can ON can.cancao_id = his.cancao_id
GROUP BY usuario_nome
ORDER BY usuario_nome ASC;