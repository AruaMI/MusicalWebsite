create table Genre(
	id serial primary key,
	title varchar(40) not null unique
);

create table GenreArtist(
	genre_id integer references Genre(id),
	artist_id integer references Artist(id),
	constraint GA primary key (genre_id, artist_id)
);

create table Artist(
	id serial primary key,
	name varchar(50) not null unique
);

create table ArtistAlbum(
	artist_id integer references Artist(id),
	album_id integer references Album(id),
	constraint AA primary key (artist_id, album_id)
);

create table Album(
	id serial primary key,
	title varchar(50) not null,
	releas_year date
);

create table Track(
	id serial primary key,
	title varchar(60) not null unique,
	duration integer not null check(duration > 0),
	Album_id integer references Album(id)
);

create table if not exists TrackCollection(
	id serial primary key,
	track_id integer not null references Track(id),
	collection_id integer not null references Collection(id),
	album text not null
);

create table Collection(
	id serial primary key,
	title varchar(50) not null unique,
	releas_year_collection integer
)