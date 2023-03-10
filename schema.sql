CREATE DATABASE catalog;

CREATE TABLE item (
    id  INT GENERATED ALWAYS AS IDENTITY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    PRIMARY KEY(id),
    FOREIGN KEY (genre_id) REFERENCES genres (id)
);

CREATE TABLE music_albums (
    id  INT,
    name VARCHAR(100),
    on_spotify BOOLEAN,
    FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE author (
    id  SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
);

CREATE TABLE games(
    id  SERIAL PRIMARY KEY,
    multiplayer BOOLEAN,
    last_played_at DATE,
    FOREIGN KEY(id) REFERENCES item(id)
)


CREATE TABLE genres (
    id  INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE books (
    id  INT,
    name VARCHAR(100),
    on_spotify BOOLEAN,
    FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE label (
    id  SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
);

CREATE INDEX games_id ON games (id);
CREATE INDEX books_id ON books (id);
CREATE INDEX music_albums_id ON music_albums (id);
CREATE INDEX item_id ON item (id);
CREATE INDEX item_genre_id ON item (genre_id);
CREATE INDEX item_author_id ON item (id);
CREATE INDEX item_label_id ON item (id);

