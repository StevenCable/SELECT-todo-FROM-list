\c steven;
DROP USER "michael";
CREATE USER "michael" WITH password 'stonebreaker';
DROP DATABASE IF EXISTS "todo_app";
CREATE DATABASE "todo_app";
\c "todo_app";

CREATE TABLE "tasks" (id serial,
 title varchar(255), 
 description text, 
 created_at timestamp WITHOUT TIME ZONE NOT NULL default now(), 
 updated_at timestamp WITHOUT TIME ZONE NOT NULL, 
 completed boolean DEFAULT FALSE);

ALTER TABLE tasks
  DROP COLUMN completed,
  ADD COLUMN completed_at timestamp DEFAULT NULL;

ALTER TABLE tasks
  ALTER COLUMN updated_at SET NOT NULL;

ALTER TABLE tasks
  ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO "tasks" (title, description, created_at, updated_at, completed_at) VALUES ('Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO "tasks" (title, description) VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT title FROM "tasks" WHERE completed_at IS NULL;

UPDATE "tasks" SET completed_at = now() WHERE title = 'Study PostgreSQL';

SELECT title, description FROM "tasks" WHERE completed_at IS NULL;

SELECT * FROM "tasks" ORDER BY created_at DESC;

INSERT INTO "tasks" (title, description) VALUES ('mistake 1', 'another test entry');

INSERT INTO "tasks" (title, description) VALUES ('mistake 2', 'another test entry');

INSERT INTO "tasks" (title, description) VALUES ('third mistake', 'another test entry');
  
SELECT title FROM "tasks" WHERE title LIKE '%mistake%';

DELETE FROM "tasks" WHERE title = 'mistake 1';

SELECT title, description FROM "tasks" WHERE title LIKE '%mistake%';

DELETE FROM "tasks" WHERE title LIKE '%mistake%';

SELECT * FROM "tasks" ORDER BY title ASC;

\d+ "tasks";
