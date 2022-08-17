DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.planos(
      plano_id INT PRIMARY KEY AUTO_INCREMENT,
      plano_nome VARCHAR(45) NOT NULL,
      valor_plano DECIMAL(10,2) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuarios(
      usuario_id INT PRIMARY KEY AUTO_INCREMENT,
      usuario_nome VARCHAR(45) NOT NULL,
      idade INT NOT NULL,
      plano_id INT NOT NULL,
      data_assinatura DATE NOT NULL,
      FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artistas(
      artista_id INT PRIMARY KEY AUTO_INCREMENT,
      artista_nome VARCHAR(45) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albums(
      album_id INT PRIMARY KEY AUTO_INCREMENT,
      album_nome VARCHAR(45) NOT NULL,
      artista_id INT NOT NULL,
      lancamento INT NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.cancoes(
      cancao_id INT PRIMARY KEY AUTO_INCREMENT,
      cancao_nome VARCHAR(45) NOT NULL,
      album_id INT NOT NULL,
      duracao_segundos INT NOT NULL,
      FOREIGN KEY (album_id) REFERENCES albums (album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico(
      historico_id INT AUTO_INCREMENT,
      cancao_id INT NOT NULL,
      usuario_id INT NOT NULL,
      data_reproducao DATETIME NOT NULL,
      PRIMARY KEY (historico_id, cancao_id, usuario_id),
      FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
      FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.seguindo(
      seguindo_id INT AUTO_INCREMENT,
      usuario_id INT NOT NULL,
      artista_id INT,
      PRIMARY KEY (seguindo_id, usuario_id, artista_id),
      FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
      FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.planos (plano_id, plano_nome, valor_plano)
  VALUES
    ('1', 'gratuito', '0.00'),
    ('2', 'universitário', '5.99'),
    ('3', 'pessoal', '6.99'),
    ('4', 'familiar', '7.99');

  INSERT INTO SpotifyClone.usuarios (usuario_id, usuario_nome,idade,plano_id,data_assinatura)
  VALUES
    ('1', 'Barbara Liskov', '82', '1', '2019-10-20'),
    ('2', 'Robert Cecil Martin', '58', '1', '2017-01-06'),
    ('3', 'Ada Lovelace', '37', '4', '2017-12-30'),
    ('4', 'Martin Fowler', '46', '4', '2017-01-17'),
    ('5', 'Sandi Metz', '58', '4', '2018-04-29'),
    ('6', 'Paulo Freire', '19', '2', '2018-02-14'),
    ('7', 'Bell Hooks', '26', '2', '2018-01-05'),
    ('8', 'Christopher Alexander', '85', '3', '2019-06-05'),
    ('9', 'Judith Butler', '45', '3', '2020-05-13'),
    ('10', 'Jorge Amado', '58', '3', '2017-02-17');
  
  INSERT INTO SpotifyClone.artistas (artista_id, artista_nome)
  VALUES
    ('1', 'Beyoncé'),
    ('2', 'Queen'),
    ('3', 'Elis Regina'),
    ('4', 'Baco Exu do Blues'),
    ('5', 'Blind Guardian'),
    ('6', 'Nina Simone');

  INSERT INTO SpotifyClone.albums (album_id, album_nome, artista_id, lancamento)
  VALUES
    ('1', 'Renaissance', '1', '2022'),
    ('2', 'Jazz', '2', '1978'),
    ('3', 'Hot Space', '2', '1982'),
    ('4', 'Falso Brilhante', '3', '1998'),
    ('5', 'Vento de Maio', '3', '2001'),
    ('6', 'QVVJFA?', '4', '2003'),
    ('7', 'Somewhere Far Beyond', '5', '2007'),
    ('8', 'I Put A Spell On You', '6', '2012');

  INSERT INTO SpotifyClone.cancoes (cancao_id, cancao_nome, album_id, duracao_segundos)
  VALUES
    ('1', 'BREAK MY SOUL', '1', '279'),
    ('2', 'VIRGO’S GROOVE', '1', '369'),
    ('3', 'ALIEN SUPERSTAR', '1', '116'),
    ('4', 'Don’t Stop Me Now', '2', '203'),
    ('5', 'Under Pressure', '3', '152'),
    ('6', 'Como Nossos Pais', '4', '105'),
    ('7', 'O Medo de Amar é o Medo de Ser Livre', '5', '207'),
    ('8', 'Samba em Paris', '6', '267'),
    ('9', 'The Bard’s Song', '7', '244'),
    ('10', 'Feeling Good', '8', '100');
  
  INSERT INTO SpotifyClone.historico (historico_id, cancao_id, usuario_id, data_reproducao)
  VALUES
    ('1', '8', '1', '2022-02-28 10:45:55'),
    ('2', '2', '1', '2020-05-02 05:30:35'),
    ('3', '10', '1', '2020-03-06 11:22:33'),
    ('4', '10', '2', '2020-08-05 08:05:17'),
    ('5', '7', '2', '2020-01-02 07:40:33'),
    ('6', '10', '3', '2020-11-13 16:55:13'),
    ('7', '2', '3', '2020-12-05 18:38:30'),
    ('8', '8', '4', '2021-08-15 17:10:10'),
    ('9', '8', '5', '2022-01-09 01:44:33'),
    ('10', '5', '5', '2020-08-06 15:23:43'),
    ('11', '7', '6', '2017-01-24 00:31:17'),
    ('12', '1', '6', '2017-10-12 12:35:20'),
    ('13', '4', '7', '2011-12-15 22:30:49'),
    ('14', '4', '8', '2012-03-17 14:56:41'),
    ('15', '9', '9', '2022-02-24 21:14:22'),
    ('16', '3', '10', '2015-12-13 08:30:22');

  INSERT INTO SpotifyClone.seguindo (usuario_id, artista_id)
  VALUES
    ('1', '1'),
    ('1', '2'),
    ('1', '3'),
    ('2', '1'),
    ('2', '3'),
    ('3', '2'),
    ('4', '4'),
    ('5', '5'),
    ('5', '6'),
    ('6', '6'),
    ('6', '1'),
    ('7', '6'),
    ('9', '3'),
    ('10', '2');
