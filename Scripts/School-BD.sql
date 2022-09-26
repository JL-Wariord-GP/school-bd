CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar(8),
  "age" varchar NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "name_id" varchar NOT NULL
);

CREATE TABLE "student" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "courses_id" varchar NOT NULL
);

CREATE TABLE "teacher" (
  "id" uuid,
  "name" varchar NOT NULL,
  "lessons_id" uuid,
  PRIMARY KEY ("id", "lessons_id")
);

CREATE TABLE "admin" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" varchar,
  "level" varchar,
  "teacher" varchar
);

CREATE TABLE "course_video" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "url" varchar
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

ALTER TABLE "roles" ADD FOREIGN KEY ("name_id") REFERENCES "users" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "admin" ("id");

ALTER TABLE "teacher" ADD FOREIGN KEY ("id") REFERENCES "roles" ("name_id");

ALTER TABLE "student" ADD FOREIGN KEY ("id") REFERENCES "roles" ("name_id");

ALTER TABLE "courses" ADD FOREIGN KEY ("id") REFERENCES "student" ("id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("id") REFERENCES "student" ("id");

ALTER TABLE "categories" ADD FOREIGN KEY ("id") REFERENCES "student" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("id") REFERENCES "teacher" ("lessons_id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("id") REFERENCES "teacher" ("lessons_id");

ALTER TABLE "categories" ADD FOREIGN KEY ("id") REFERENCES "teacher" ("lessons_id");

--! User Administrative

insert into admin (
	id,
	"name" 
) values ( 
	'1bf2b2f3-ccca-445d-90b6-de1e67d87f71',
	'Jorge Gomez'
)



