CREATE TABLE IF NOT EXISTS Genre(
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Executor (
	executor_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Executor_Genre (
	executor_id INTEGER REFERENCES Executor(executor_id),
	genre_id INTEGER REFERENCES Genre(genre_id),
	CONSTRAINT eg primary key (executor_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Album (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	create_at DATE  NOT NULL,
	executor_id INTEGER NOT NULL REFERENCES Executor_Album(executor_id)
);

CREATE TABLE IF NOT EXISTS Executor_Album (
	executor_id INTEGER REFERENCES Executor(executor_id),
	album_id INTEGER REFERENCES Album(album_id),
	CONSTRAINT ea PRIMARY KEY (executor_id, album_id)
);

CREATE TABLE IF NOT EXISTS Track (
	track_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	duration TIME ,
	album_id INTEGER NOT NULL REFERENCES Album(album_id)
);

ALTER TABLE Track 
	alter column duration set data type TIME;


CREATE TABLE IF NOT EXISTS Compilation (
	compilation_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	year_issue DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Track_Compilation (
	track_id INTEGER REFERENCES Track(track_id),
	compilation_id INTEGER REFERENCES Compilation(compilation_id),
	CONSTRAINT tc PRIMARY KEY (track_id, compilation_id)
);