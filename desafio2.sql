-- Active: 1660763243827@@127.0.0.1@3307@SpotifyClone
SELECT 

COUNT(DISTINCT cancoes.cancao_id) AS cancoes,
COUNT(DISTINCT artistas.artista_id) AS artistas,
COUNT(DISTINCT albums.album_id) AS albuns

FROM 

SpotifyClone.cancoes AS cancoes,
SpotifyClone.artistas AS artistas,
SpotifyClone.albums AS albums;