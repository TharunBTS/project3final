-- create DB
CREATE DATABASE quizdb;
USE quizdb;

-- admin table
CREATE TABLE admin (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL
);

-- insert a sample admin
INSERT INTO admin(username, password) VALUES ('admin', 'admin123');



CREATE TABLE questions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    question TEXT NOT NULL,
    optionA VARCHAR(200),
    optionB VARCHAR(200),
    optionC VARCHAR(200),
    optionD VARCHAR(200),
    correctAnswer VARCHAR(1)
);


select * from questions;
truncate table questions;


CREATE TABLE results (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100),
  quiz_id INT NOT NULL,
  score INT
);


CREATE TABLE quiz (
   id INT AUTO_INCREMENT PRIMARY KEY,
   quiz_name VARCHAR(100)
);


CREATE TABLE quiz_questions (
   id INT AUTO_INCREMENT PRIMARY KEY,
   quiz_id INT,
   question_id INT
);

select * from quiz;
select * from quiz_questions;


CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL
);

select * from users;

drop table results;
truncate table results;

select * from results;
