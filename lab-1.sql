DROP TABLE hypostasis;
DROP TABLE creature;
DROP TABLE human_idea;
DROP TABLE idea;
DROP TABLE human;

create table human (
	key_human BIGSERIAL NOT NULL PRIMARY KEY,
	name_human VARCHAR(50) NOT NULL,
	development_level integer,
    CHECK (development_level >= 0 AND development_level <= 10)
);

create table idea (
	key_idea BIGSERIAL NOT NULL PRIMARY KEY,
	description_idea VARCHAR(150) NOT NULL
);

create table human_idea (
	key_human BIGSERIAL REFERENCES human,
    key_idea BIGSERIAL REFERENCES idea,
    rank_of_idea integer,
    CHECK (rank_of_idea >= 0 AND rank_of_idea <= 100),
    PRIMARY KEY (key_human, key_idea)
);

create table creature (
	key_creature BIGSERIAL NOT NULL PRIMARY KEY,
    name_creature VARCHAR(50),
	development_level integer,
    key_human BIGSERIAL REFERENCES human,
    CHECK (development_level >= 0 AND development_level <= 10)
);

create table hypostasis (
	key_hypostasis BIGSERIAL NOT NULL PRIMARY KEY,
	name_hypostasis VARCHAR(50),
    key_creature BIGSERIAL REFERENCES creature
);

insert into human (name_human, development_level) values ('Bob', 7);
insert into human (name_human, development_level) values ('Bill', 8);
insert into human (name_human, development_level) values ('Immanuel', 10);
insert into human (name_human, development_level) values ('Crack', 8);

insert into idea (description_idea) values ('play football');
insert into idea (description_idea) values ('save the word');
insert into idea (description_idea) values ('jump for no reason');
insert into idea (description_idea) values ('someone is controlling me');
insert into idea (description_idea) values ('kill everyone');

insert into human_idea (key_human, key_idea, rank_of_idea) values (1, 3, 60);
insert into human_idea (key_human, key_idea, rank_of_idea) values (1, 4, 90);
insert into human_idea (key_human, key_idea, rank_of_idea) values (1, 5, 10);
insert into human_idea (key_human, key_idea, rank_of_idea) values (3, 3, 70);
insert into human_idea (key_human, key_idea, rank_of_idea) values (4, 4, 20);
insert into human_idea (key_human, key_idea, rank_of_idea) values (4, 2, 100);
insert into human_idea (key_human, key_idea, rank_of_idea) values (3, 1, 65);
insert into human_idea (key_human, key_idea, rank_of_idea) values (2, 3, 48);

insert into creature (name_creature, development_level, key_human) values ('dragon', 3, 2);
insert into creature (name_creature, development_level, key_human) values ('shark', 5, 2);
insert into creature (name_creature, development_level, key_human) values ('snake', 6, 2);
insert into creature (name_creature, development_level, key_human) values ('enormous cat', 2, 1);
insert into creature (name_creature, development_level, key_human) values ('skeleton', 1, 4);

insert into hypostasis (name_hypostasis, key_creature) values ('strange', 5);
insert into hypostasis (name_hypostasis, key_creature) values ('sonfusing', 5);
insert into hypostasis (name_hypostasis, key_creature) values ('liquid', 5);
insert into hypostasis (name_hypostasis, key_creature) values ('sdbksdv', 4);
insert into hypostasis (name_hypostasis, key_creature) values ('night', 2);
insert into hypostasis (name_hypostasis, key_creature) values ('goooood', 4);
