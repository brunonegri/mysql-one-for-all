SELECT
    cancao_nome AS nome, COUNT(his.cancao_id) AS reproducoes
FROM
    SpotifyClone.cancoes AS can
        INNER JOIN
    SpotifyClone.historico AS his ON his.cancao_id = can.cancao_id
        INNER JOIN
    SpotifyClone.usuarios AS usu ON usu.usuario_id = his.usuario_id
        INNER JOIN
    SpotifyClone.planos AS pla ON usu.plano_id = pla.plano_id
WHERE
    plano_nome = 'gratuito' || plano_nome = 'pessoal'

GROUP BY cancao_nome
ORDER BY nome ASC;