DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music;

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist TEXT[] NOT NULL
);


CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  album TEXT NOT NULL
);


CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer TEXT[] NOT NULL
);


CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artist_id INTEGER REFERENCES artists ON DELETE CASCADE,
  album_id INTEGER REFERENCES albums ON DELETE CASCADE,
  producer_id INTEGER REFERENCES producers ON DELETE CASCADE
);

INSERT INTO artists (artist)
VALUES('{"Hanson"}'),
('{"Queen"}'),
('{"Mariah Cary", "Boyz II Men"}'),
('{"Lady Gaga", "Bradley Cooper"}'),
('{"Nickleback"}'),
('{"Jay Z", "Alicia Keys"}'),
('{"Katy Perry", "Juicy J"}'),
('{"Maroon 5" , "Christina Aguilera"}'),
('{"Avril Lavigne"}'),
('{"Destiny''s Child"}');

INSERT INTO albums (album)
VALUES('Middle of Nowhere'),
('A Night at the Opera'),
('Daydream'),
('A Star Is Born'),
('Silver Side Up'),
('The Blueprint 3'),
('Prism'),
('Hands All Over'),
('Let Go'),
('The Writings''s on the Wall');

INSERT INTO producers (producer)
VALUES ('{"Dust Brothers", "Stephen Lironi"}'),
('{"Roy Thomas Baker"}'),
('{"Walter Afanasieff"}'),
('{"Benjamin Rice"}'),
('{"Rick Parashar"}'),
('{"Al Shux"}'),
('{"Max Martin" , "Cirkut"}'),
('{"Shellback", "Benny Blanco"}'),
('{"The Matrix"}'),
('{"Darkchild"}');

INSERT INTO songs (title, duration, release_date, artist_id, album_id, producer_id)
VALUES ('MMMBop', 238, '04-15-1997', 1, 1, 1),
('Bohemian Rhapsody', 335, '10-31-1975', 2, 2, 2),
('One Sweet Day', 282, '11-14-1995', 3, 3, 3),
('Shallow', 216, '09-27-2018', 4, 4, 4),
('How You Remind Me', 223, '08-21-2001', 5, 5, 5),
('New York State of Mind', 276, '10-20-2009', 6, 6, 6),
('Dark Horse', 215, '12-17-2013', 7, 7, 7),
('Moves Like Jagger', 201, '06-21-2011', 8, 8, 8),
('Complicated', 244, '05-14-2002', 9, 9, 9),
('Say My Name', 240, '11-07-1999', 10, 10, 10);

CREATE INDEX idx_songs_title ON songs (title);
CREATE INDEX idx_songs_artist ON songs (artist_id);