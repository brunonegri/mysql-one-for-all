SELECT
    artista_nome AS artista,
    album_nome AS album
FROM
    SpotifyClone.albums AS alb
        INNER JOIN
    SpotifyClone.artistas AS art ON alb.artista_id = art.artista_id
        AND art.artista_nome = 'Elis Regina'