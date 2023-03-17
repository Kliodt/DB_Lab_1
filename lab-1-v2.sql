--  'C:/Users/79215/Desktop/ИТМО/Базы данных/Лаб 1/lab-1-v2.sql'

DROP TABLE creature_info;
DROP TABLE creature;
DROP TABLE hypostasis;
DROP TABLE human_idea;
DROP TABLE idea;
DROP TABLE human;
DROP TABLE development; 

CREATE TABLE development (
    development_level TEXT NOT NULL PRIMARY KEY
);
CREATE TABLE human (
	human_id BIGSERIAL NOT NULL PRIMARY KEY,
	development_level TEXT NOT NULL REFERENCES development
);
CREATE TABLE idea (
    idea_id BIGSERIAL NOT NULL PRIMARY KEY,
    idea_description TEXT
);
CREATE TABLE human_idea (
    human_id INTEGER REFERENCES human,
    idea_id INTEGER REFERENCES idea,
    PRIMARY KEY (human_id, idea_id)
);
CREATE TABLE hypostasis (
	hypostasis_name TEXT NOT NULL PRIMARY KEY
);
CREATE TABLE creature (
    creature_id BIGSERIAL NOT NULL,
    hypostasis_name TEXT NOT NULL REFERENCES hypostasis,
    PRIMARY KEY (creature_id, hypostasis_name)
);
CREATE TABLE creature_info (
    creature_id BIGSERIAL NOT NULL PRIMARY KEY,
    creature_role TEXT,
    human_id BIGSERIAL REFERENCES human,
    development_level TEXT REFERENCES development
);

INSERT INTO development(development_level) VALUES ('Primitive');
INSERT INTO development(development_level) VALUES ('Low');
INSERT INTO development(development_level) VALUES ('Medium');
INSERT INTO development(development_level) VALUES ('High');
INSERT INTO development(development_level) VALUES ('Super high');

insert into human (development_level) values ('Primitive');
insert into human (development_level) values ('Low');
insert into human (development_level) values ('Low');
insert into human (development_level) values ('Primitive');

INSERT INTO idea (idea_description) VALUES ('play football');
INSERT INTO idea (idea_description) VALUES ('save the word');
INSERT INTO idea (idea_description) VALUES ('jump on one leg');
INSERT INTO idea (idea_description) VALUES ('someone is controlling me');
INSERT INTO idea (idea_description) VALUES ('kill everyone');

INSERT INTO human_idea (human_id, idea_id) SELECT human.human_id, idea.idea_id FROM human, idea WHERE human.human_id = 1 AND idea.idea_description = 'jump on one leg';
INSERT INTO human_idea (human_id, idea_id) SELECT human.human_id, idea.idea_id FROM human, idea WHERE human.human_id = 2 AND idea.idea_description = 'save the word';
INSERT INTO human_idea (human_id, idea_id) SELECT human.human_id, idea.idea_id FROM human, idea WHERE human.human_id = 2 AND idea.idea_description = 'someone is controlling me';
INSERT INTO human_idea (human_id, idea_id) SELECT human.human_id, idea.idea_id FROM human, idea WHERE human.human_id = 2 AND idea.idea_description = 'play football';
INSERT INTO human_idea (human_id, idea_id) SELECT human.human_id, idea.idea_id FROM human, idea WHERE human.human_id = 3 AND idea.idea_description = 'someone is controlling me';
INSERT INTO human_idea (human_id, idea_id) SELECT human.human_id, idea.idea_id FROM human, idea WHERE human.human_id = 3 AND idea.idea_description = 'jump on one leg';

INSERT INTO hypostasis (hypostasis_name) VALUES ('artist');
INSERT INTO hypostasis (hypostasis_name) VALUES ('teacher');
INSERT INTO hypostasis (hypostasis_name) VALUES ('killer');
INSERT INTO hypostasis (hypostasis_name) VALUES ('child');
INSERT INTO hypostasis (hypostasis_name) VALUES ('big cat');


INSERT INTO creature (hypostasis_name) VALUES ('artist');
INSERT INTO creature (hypostasis_name) VALUES ('killer');
INSERT INTO creature (hypostasis_name) VALUES ('artist');
INSERT INTO creature (hypostasis_name) VALUES ('big cat');

--(creature_id,  creature_role,  human_id,  development_level)
INSERT INTO creature_info VALUES (1, 'translator', 2, 'High');
INSERT INTO creature_info VALUES (2, NULL, 1, 'Medium');
INSERT INTO creature_info VALUES (3, 'boss', 4, 'Super high');
INSERT INTO creature_info VALUES (4, 'brother', 4, 'Super high');


SELECT * FROM development;
SELECT * FROM human;
SELECT * FROM idea;
SELECT * FROM human_idea;
SELECT * FROM hypostasis;
SELECT * FROM creature;
SELECT * FROM creature_info;