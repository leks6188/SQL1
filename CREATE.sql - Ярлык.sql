CREATE TABLE IF NOT EXISTS genre(
id SERIAL PRIMARY KEY,
title_genre VARCHAR(60) NOT NULL);

CREATE TABLE IF NOT EXISTS musician(
id SERIAL PRIMARY KEY,
name_musician VARCHAR(60) NOT NULL);

CREATE TABLE IF NOT EXISTS genremusician(
genre_ID INTEGER REFERENCES genre(id),
musician_ID INTEGER REFERENCES musician(id),
CONSTRAINT gm PRIMARY KEY (genre_id, musician_id));

CREATE TABLE IF NOT EXISTS album(
id SERIAL PRIMARY KEY,
title_album VARCHAR(60) NOT NULL,
year_of_release NUMERIC(4,0));

CREATE TABLE IF NOT EXISTS albummusician(
musician_id INTEGER REFERENCES musician(id),
album_id INTEGER REFERENCES album(id),
CONSTRAINT am PRIMARY KEY (musician_id, album_id));

CREATE TABLE IF NOT EXISTS trek(
id SERIAL PRIMARY KEY,
name_trek VARCHAR(60) NOT NULL,
lehght_trek DECIMAL(5,2),
album_id INTEGER REFERENCES album(id));

CREATE TABLE IF NOT EXISTS Collection(
id SERIAL PRIMARY KEY,
name_collection VARCHAR(60) NOT NULL,
year_of_release NUMERIC(4,0));

CREATE TABLE IF NOT EXISTS trekcollection(
trek_id INTEGER REFERENCES trek(id),
collection_id INTEGER REFERENCES collection(id),
CONSTRAINT tc PRIMARY KEY (trek_id, collection_id));

