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
  
SELECT * FROM "tasks";
\d+ "tasks";
