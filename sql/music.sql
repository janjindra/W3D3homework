
DROP TABLE IF EXISTS album;
DROP TABLE artist;


CREATE TABLE artist(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE album (
  id SERIAL PRIMARY KEY,
  album_name VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT REFERENCES artist(id)
);
