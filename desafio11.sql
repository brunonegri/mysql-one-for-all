SELECT can.cancao_nome AS nome_musica,
CASE
    WHEN can.cancao_nome LIKE '%Amar%' THEN REPLACE(can.cancao_nome, 'Amar', 'Code Review')
    WHEN can.cancao_nome LIKE '%SUPERSTAR%' THEN REPLACE(can.cancao_nome, 'SUPERSTAR', 'SUPERDEV')
    WHEN can.cancao_nome LIKE '%Bard%' THEN REPLACE(can.cancao_nome, 'Bard', 'QA')
    WHEN can.cancao_nome LIKE '%SOUL%' THEN REPLACE(can.cancao_nome, 'SOUL', 'CODE')
    WHEN can.cancao_nome LIKE '%Pais%' THEN REPLACE(can.cancao_nome, 'Pais', 'Pull Requests')
END AS novo_nome
FROM SpotifyClone.cancoes AS can
HAVING novo_nome IS NOT NULL
ORDER BY nome_musica DESC;