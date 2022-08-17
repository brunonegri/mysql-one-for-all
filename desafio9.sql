SELECT 
    COUNT(his.cancao_id) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.historico AS his
        INNER JOIN
    SpotifyClone.usuarios AS usu ON usu.usuario_id = his.usuario_id
WHERE usu.usuario_nome = 'Barbara Liskov'