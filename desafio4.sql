-- Active: 1660763243827@@127.0.0.1@3307@SpotifyClone
SELECT 
usuarios.usuario_nome AS usuario,
IF (
		YEAR(MAX(his.data_reproducao)) >= 2021,
        'Usuário ativo',
        'Usuário inativo'
	) AS status_usuario
FROM
SpotifyClone.usuarios AS usuarios
    INNER JOIN
SpotifyClone.historico AS his ON his.usuario_id = usuarios.usuario_id
GROUP BY usuario_nome
ORDER BY usuario_nome ASC