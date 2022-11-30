create database imdb;

use imdb;

CREATE TABLE Movies (
	Id INT UNIQUE AUTO_INCREMENT PRIMARY KEY,
    Movie_Name VARCHAR(255),
    Director VARCHAR(255),
    Language VARCHAR(255)
);

create table Media (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Name varchar(255),
    Type varchar(255),
    Size varchar(255),
    MovieId INT,
    FOREIGN KEY(MovieId) REFERENCES Movies(Id)
);

create table Genre (
	Id INT UNIQUE AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Name varchar(255)
);

create table Movie_Genre (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    MovieId INT,
    GenreId INT,
    FOREIGN KEY (MovieId) REFERENCES Movies(Id),
    FOREIGN KEY (GenreId) REFERENCES genre(Id)
);

create table user (
	Id INT AUTO_INCREMENT UNIQUE PRIMARY KEY NOT NULL,
    Name varchar(255),
    Age INT
);

CREATE TABLE Review (
	Id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    MovieId INT,
    UserId INT,
    Point INT,
    FOREIGN KEY (MovieId) REFERENCES Movies(id),
    FOREIGN KEY (UserId) REFERENCES user(id)
);

CREATE TABLE Artist (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255),
    Experience VARCHAR(255),
    Average_Salary VARCHAR(255),
    Contact_Number DOUBLE
);

CREATE TABLE Skills (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255)
);

CREATE TABLE Artist_Skills (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    ArtistId INT,
    SkillsId INT,
    FOREIGN KEY (ArtistId) REFERENCES Artist (Id),
    FOREIGN KEY (SkillsId) REFERENCES Skills (Id)
);

INSERT INTO Movies (Id, Movie_Name, Director, Language) VALUES (1, "PS1", "Manirathnam", "Tamil");
INSERT INTO Movies (Movie_Name, Director, Language) VALUES ("Vikram", "Lokesh Kanagaraj", "Tamil");
INSERT INTO Movies (Movie_Name, Director, Language, Hero, Villain) VALUES ("Cobra", "Nayamuthu", "Tamil", 1, 1);

INSERT INTO Media (Id, Name, Type, Size, MovieId) VALUES (1, "Video1", "Video", "50MB", 1);
INSERT INTO Media (Id, Name, Type, Size, MovieId) VALUES (2, "Image1", "Image", "0.1MB", 1);

INSERT INTO Genre (Id, Name) VALUES (1, "Action");
INSERT INTO Genre (Name) VALUES ("Comedy");
INSERT INTO Genre (Name) VALUES ("Love");
INSERT INTO Genre (Name) VALUES ("Period");

INSERT INTO Movie_Genre (Id, MovieId, GenreId) VALUES (1, 1, 1);
INSERT INTO Movie_Genre (MovieId, GenreId) VALUES (1, 4);
INSERT INTO Movie_Genre (MovieId, GenreId) VALUES (2, 1);

INSERT INTO user (Id, Name, Age) VALUES (1, "XXX", 25);
INSERT INTO user (Name, Age) VALUES ("YYY", 45);

INSERT INTO Review (Id, MovieId, UserId, Point) VALUES (1, 1, 1, 5);
INSERT INTO Review (MovieId, UserId, Point) VALUES (1, 2, 4);
INSERT INTO Review (MovieId, UserId, Point) VALUES (2, 1, 3);

INSERT INTO Artist (Id, Name, Experience, Average_Salary, Contact_Number) VALUES (1, "Vikram", "20yrs", "50L", 33432432423);
INSERT INTO Artist (Name, Experience, Average_Salary, Contact_Number) VALUES ("KamalHasan", "40yrs", "100L", 23254365346) , ("PrakashRaj", "40yrs", "50L", 65472356), ("VJS", "30yrs", "60L", 547367576);

INSERT INTO Skills (Id, Name) VALUES (1, "Dancer");
INSERT INTO Skills (Name) VALUES ("Fighter");
INSERT INTO Skills (Name) VALUES ("Mimicry");
INSERT INTO Skills (Name) VALUES ("Politician");

INSERT INTO Artist_Skills (Id, ArtistId, SkillsId) VALUES (1,1,1);
INSERT INTO Artist_Skills (ArtistId, SkillsId) VALUES (1,2), (2,1), (2,2), (2,3), (2,4);

ALTER TABLE Movies ADD COLUMN Hero INT AFTER Language;

ALTER TABLE Movies ADD COLUMN Villain INT AFTER Hero;

ALTER TABLE Movies ADD CONSTRAINT fk_1 FOREIGN KEY (Hero) REFERENCES Artist (Id);
ALTER TABLE Movies ADD CONSTRAINT fk_2 FOREIGN KEY (Villain) REFERENCES Artist (Id);

ALTER TABLE Movies DROP COLUMN Hero;
ALTER TABLE Movies DROP COLUMN Villain;

UPDATE Movies SET Villain = 4 WHERE Id = 2;

UPDATE Artist SET Id = 4 WHERE Name = "VJS";

SELECT * FROM Movies;

SELECT * FROM Review;

SELECT * FROM Artist_Skills;