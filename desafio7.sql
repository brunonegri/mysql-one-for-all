SELECT 
artista_nome AS artista,
album_nome AS album,
COUNT(usuario_id) AS seguidores
FROM 
    SpotifyClone.albums AS alb
        INNER JOIN
    SpotifyClone.artistas AS art ON alb.artista_id = art.artista_id
        INNER JOIN
    SpotifyClone.seguindo AS seg ON seg.artista_id = art.artista_id
GROUP BY album_nome, artista_nome
ORDER BY seguidores DESC , artista_nome, album_nome