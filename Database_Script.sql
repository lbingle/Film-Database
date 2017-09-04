--DATABASE
CREATE DATABASE UBC_FILM_SOCIETY;




--ENTITIES
CREATE TABLE FILM 
	(FILM_ID			VARCHAR(4)		NOT NULL	UNIQUE,
	 FILM_TITLE			VARCHAR(100)	NOT NULL,
	 FILM_RELEASE_DATE	SMALLDATETIME	NOT NULL,
	 FILM_LENGTH		NUMERIC(3,0),
	 PRIMARY KEY (FILM_ID));






CREATE TABLE AWARDS 
	(AWARD_ID 		VARCHAR(4)	NOT NULL,
AWARD_CATEGORY	VARCHAR(50)	NOT NULL	UNIQUE,
	PRIMARY KEY (AWARD_ID));






CREATE TABLE AWARD_RECIPIENT
	(AWARD_ID			VARCHAR(4)		FOREIGN KEY REFERENCES AWARDS(AWARD_ID),
	 FILM_ID				VARCHAR(4)		FOREIGN KEY REFERENCES FILM(FILM_ID),
	 AWARD_RECEPIENT_DATE	SMALLDATETIME	NOT NULL,
	 PRIMARY KEY	(AWARD_ID, FILM_ID));






CREATE TABLE PATRON (
	PATRON_ID			VARCHAR(3)		NOT NULL	UNIQUE,
	PATRON_LNAME		VARCHAR(20)		NOT NULL,
	PATRON_FNAME		VARCHAR(20)		NOT	NULL,
	PATRON_PHONE		CHAR(12)		UNIQUE,
	PATRON_EMAIL		VARCHAR(50)		NOT NULL	UNIQUE,
	PATRON_START_DATE	SMALLDATETIME	NOT NULL,
	PRIMARY KEY (PATRON_ID));


CREATE TABLE ITEM_CATEGORY (
	ITEM_FORMAT	VARCHAR(12)	NOT NULL	UNIQUE,
PRIMARY KEY (ITEM_FORMAT));




CREATE TABLE ITEM (
	ITEM_ID		VARCHAR(4)	NOT NULL	UNIQUE,
	FILM_ID		VARCHAR(4)	NOT NULL	FOREIGN KEY REFERENCES FILM(FILM_ID),
	ITEM_FORMAT	VARCHAR(12)	NOT NULL	FOREIGN KEY REFERENCES ITEM_CATEGORY(ITEM_FORMAT),
	PRIMARY KEY (ITEM_ID));




CREATE TABLE CHECK_OUT (
	CHECK_OUT_ID	VARCHAR(4)		NOT NULL	UNIQUE,
	ITEM_ID			VARCHAR(4)		NOT NULL	FOREIGN KEY REFERENCES ITEM(ITEM_ID),
	PATRON_ID		VARCHAR(3)		NOT NULL	FOREIGN KEY REFERENCES PATRON(PATRON_ID),
	CHECK_OUT_DATE	SMALLDATETIME	NOT NULL,
	CHECKED_IN		BIT				NOT NULL	DEFAULT(0),
	PRIMARY KEY (CHECK_OUT_ID));




CREATE TABLE PRODUCTION_COMPANY (
	PRODUCTION_COMPANY_ID		VARCHAR(4)	NOT NULL	UNIQUE,
	PRODUCTION_COMPANY_NAME	VARCHAR(100)	NOT NULL	UNIQUE,
	PRODUCTION_COMPANY_PARENT	VARCHAR(100),
	PRIMARY KEY(PRODUCTION_COMPANY_ID));




CREATE TABLE COLLABORATION (
	PRODUCTION_COMPANY_ID	VARCHAR(4) 		NOT NULL FOREIGN KEY REFERENCES PRODUCTION_COMPANY(PRODUCTION_COMPANY_ID),
	FILM_ID					VARCHAR(4)	NOT NULL FOREIGN KEY REFERENCES FILM(FILM_ID),
	PRIMARY KEY (PRODUCTION_COMPANY_ID, FILM_ID));




CREATE TABLE GENRE (
	GENRE_ID	VARCHAR(4)	NOT NULL	UNIQUE,
	GENRE_NAME	VARCHAR(20)	NOT NULL	UNIQUE,
	PRIMARY KEY (GENRE_ID));


CREATE TABLE GENRE_ASSIGNMENT (
	GENRE_ID	VARCHAR(4)		NOT NULL	FOREIGN KEY REFERENCES GENRE(GENRE_ID),
	FILM_ID		VARCHAR(4)		NOT NULL	FOREIGN KEY REFERENCES FILM(FILM_ID),
	PRIMARY KEY (GENRE_ID, FILM_ID));




CREATE TABLE PERSON (
	PERSON_ID			VARCHAR(4)	NOT NULL	UNIQUE,
	PERSON_FNAME			VARCHAR(20)	NOT NULL,
	PERSON_LNAME			VARCHAR(30)	NOT NULL,
	PERSON_IS_DIRECTOR	BIT	DEFAULT(0)	NOT NULL,
	PERSON_IS_ACTOR		BIT	DEFAULT(0)	NOT NULL,
	PERSON_IS_WRITER	BIT	DEFAULT(0)	NOT NULL,
	PERSON_IS_PRODUCER	BIT	DEFAULT(0)	NOT NULL,
	PRIMARY KEY (PERSON_ID));




CREATE TABLE WRITER (
	PERSON_ID	VARCHAR(4)	NOT NULL	FOREIGN KEY REFERENCES PERSON(PERSON_ID)
	PRIMARY KEY (PERSON_ID));


CREATE TABLE ACTOR(
	PERSON_ID	VARCHAR(4)	NOT NULL	FOREIGN KEY REFERENCES PERSON(PERSON_ID)
	PRIMARY KEY (PERSON_ID));


CREATE TABLE DIRECTOR(
	PERSON_ID	VARCHAR(4)	NOT NULL	FOREIGN KEY REFERENCES PERSON(PERSON_ID)
	PRIMARY KEY (PERSON_ID));


CREATE TABLE PRODUCER(
	PERSON_ID	VARCHAR(4)	NOT NULL	FOREIGN KEY REFERENCES PERSON(PERSON_ID)
	PRIMARY KEY (PERSON_ID));


CREATE TABLE SCRIPT (
	PERSON_ID	VARCHAR(4)	NOT NULL	FOREIGN KEY REFERENCES WRITER(PERSON_ID),
	FILM_ID		VARCHAR(4)		NOT NULL	FOREIGN KEY REFERENCES FILM(FILM_ID),
	PRIMARY KEY (PERSON_ID, FILM_ID));


CREATE TABLE PERFORMANCE (
	PERSON_ID	VARCHAR(4)	NOT NULL	FOREIGN KEY REFERENCES ACTOR(PERSON_ID),
	FILM_ID		VARCHAR(4)		NOT NULL	FOREIGN KEY REFERENCES FILM(FILM_ID),
	PRIMARY KEY (PERSON_ID, FILM_ID));


CREATE TABLE CREDIT (
	PERSON_ID	VARCHAR(4)	NOT NULL	FOREIGN KEY REFERENCES DIRECTOR(PERSON_ID),
	FILM_ID		VARCHAR(4)		NOT NULL	FOREIGN KEY REFERENCES FILM(FILM_ID),
	PRIMARY KEY (PERSON_ID, FILM_ID));


CREATE TABLE PRODUCTION (
	PERSON_ID	VARCHAR(4)	NOT NULL	FOREIGN KEY REFERENCES PRODUCER(PERSON_ID),
	FILM_ID		VARCHAR(4)		NOT NULL	FOREIGN KEY REFERENCES FILM(FILM_ID),
	PRIMARY KEY (PERSON_ID, FILM_ID));










--DATA INSERTED
INSERT INTO FILM VALUES ('1','Star Wars: Episode 1 The Phantom Menace','1999',(136));


INSERT INTO FILM VALUES ('2','Star Wars: Episode 2 Attack of the Clones','2002',(142));


INSERT INTO FILM VALUES ('3','Star Wars: Episode 3 Revenge of the Sith','2005',(140));


INSERT INTO FILM VALUES ('4','Star Wars: Episode 4 A New Hope','1977',(121));


INSERT INTO FILM VALUES ('5','Star Wars: Episode 5 The Empire Strikes Back','1980',(124));


INSERT INTO FILM VALUES ('6','Star Wars: Episode 6 The Return of the Jedi','1983',(131));


INSERT INTO FILM VALUES ('7','Star Wars: The Force Awakens','2015',(138));




INSERT INTO FILM VALUES ('8','Never Say Never Again','1983', (134));


INSERT INTO AWARDS VALUES ('1','Best Music, Original Score�');


INSERT INTO AWARDS VALUES ('2','Best Film Editing');


INSERT INTO AWARDS VALUES('3','Best Sound');


INSERT INTO AWARD_RECIPIENT VALUES ('1','4','1978');


INSERT INTO AWARD_RECIPIENT VALUES ('2','4','1978');


INSERT INTO AWARD_RECIPIENT VALUES ('3','5','1981');


INSERT INTO AWARD_RECIPIENT VALUES ('3','4','1978');


INSERT INTO PATRON VALUES ('1','Smith','John','555-555-5555','johnsmith@gmail.com', '2016-11-08');


INSERT INTO PATRON VALUES ('2','Smithson','Sam','555-444-5555','samsmithson@gmail.com', '2016-11-08');


INSERT INTO PATRON VALUES ('3','Timberlake','Justin','555-444-3333','justintimberlake@gmail.com', '2016-11-08');


INSERT INTO PATRON VALUES ('4','Mozart','Wolfgang','555-441-3322','wolfgangmozart@gmail.com', '2016-11-08');


INSERT INTO PATRON VALUES ('5','Archer','Sterling','555-421-3322','sterlingarcher@gmail.com', '2016-11-08');


INSERT INTO ITEM_CATEGORY VALUES ('DVD');


INSERT INTO ITEM_CATEGORY VALUES ('VHS');


INSERT INTO ITEM_CATEGORY VALUES ('Blu-Ray');


INSERT INTO ITEM_CATEGORY VALUES ('Film Reel');


INSERT INTO ITEM VALUES ('1','1','DVD');


INSERT INTO ITEM VALUES ('2','1','VHS');


INSERT INTO ITEM VALUES ('3','3','Blu-Ray');


INSERT INTO ITEM VALUES('4','4','VHS');


INSERT INTO ITEM VALUES('5','4','DVD');




INSERT INTO ITEM VALUES ('6','8','VHS');


INSERT INTO CHECK_OUT VALUES ('1','1','2','2016-11-07','0');


INSERT INTO CHECK_OUT VALUES ('2','3','4','2016-11-05','0');


INSERT INTO PRODUCTION_COMPANY VALUES ('1','Lucasfilm','The Walt Disney Company');


INSERT INTO PRODUCTION_COMPANY VALUES ('2','20th Century Fox', NULL);




INSERT INTO PRODUCTION_COMPANY VALUES ('4','TaliaFilm II Productions', NULL);




INSERT INTO PRODUCTION_COMPANY VALUES('3','The Walt Disney Company', NULL);


INSERT INTO COLLABORATION VALUES ('1','1');


INSERT INTO COLLABORATION VALUES ('2','1');


INSERT INTO COLLABORATION VALUES ('3', '7');


INSERT INTO COLLABORATION VALUES ('1','7');


INSERT INTO COLLABORATION VALUES ('1','4');


INSERT INTO COLLABORATION VALUES ('2','4');




INSERT INTO COLLABORATION VALUES ('1','2');




INSERT INTO COLLABORATION VALUES ('2','2');




INSERT INTO COLLABORATION VALUES ('1','3');




INSERT INTO COLLABORATION VALUES ('2','3');




INSERT INTO COLLABORATION VALUES ('1','5');




INSERT INTO COLLABORATION VALUES ('2','5');




INSERT INTO COLLABORATION VALUES ('1','6');




INSERT INTO COLLABORATION VALUES ('2','6');


INSERT INTO COLLABORATION VALUES ('4','8');


INSERT INTO GENRE VALUES ('1','Science Fiction');


INSERT INTO GENRE VALUES ('2','Fantasy');


INSERT INTO GENRE VALUES ('3','Romance');


INSERT INTO GENRE VALUES ('4','Adventure');


INSERT INTO GENRE_ASSIGNMENT VALUES ('4', '4');


INSERT INTO GENRE_ASSIGNMENT VALUES ('4', '1');


INSERT INTO GENRE_ASSIGNMENT VALUES ('4', '2');


INSERT INTO GENRE_ASSIGNMENT VALUES ('4', '3');


INSERT INTO GENRE_ASSIGNMENT VALUES ('4', '5');


INSERT INTO GENRE_ASSIGNMENT VALUES ('4', '6');


INSERT INTO GENRE_ASSIGNMENT VALUES ('4', '7');


INSERT INTO GENRE_ASSIGNMENT VALUES ('3', '5');


INSERT INTO GENRE_ASSIGNMENT VALUES ('1', '5');


INSERT INTO GENRE_ASSIGNMENT VALUES ('1', '1');


INSERT INTO GENRE_ASSIGNMENT VALUES ('1', '2');


INSERT INTO GENRE_ASSIGNMENT VALUES ('1', '3');


INSERT INTO GENRE_ASSIGNMENT VALUES ('1', '4');


INSERT INTO GENRE_ASSIGNMENT VALUES ('1', '6');


INSERT INTO GENRE_ASSIGNMENT VALUES ('1', '7');




INSERT INTO GENRE_ASSIGNMENT VALUES ('4','8');


INSERT INTO PERSON VALUES ('1','George','Lucas','1','0','1','1');


INSERT INTO PERSON VALUES ('2','Mark', 'Hamill','0','1','0','0');


INSERT INTO PERSON VALUES ('3','Harrison' , 'Ford','0','1','0','0');


INSERT INTO PERSON VALUES ('4','Carrie' , 'Fisher','0','1','0','0');




INSERT INTO PERSON VALUES ('5', 'Irvin','Kershner','1','0','0','0')




INSERT INTO PERSON VALUES ('6','JJ','Abrams','1','0','1','1')




INSERT INTO PERSON VALUES ('7','Richard','Marquand','1','0','0','0')




INSERT INTO PERSON VALUES ('8','Jack','Schwartzman','0','0','0','1');




INSERT INTO PERSON VALUES ('9','Lorenzo','Semple Jr.','0','0','1','0');




INSERT INTO PERSON VALUES ('10','Sean','Connery','0','1','0','0')


INSERT INTO WRITER VALUES ('1');




INSERT INTO WRITER VALUES ('9')


INSERT INTO ACTOR VALUES ('2');


INSERT INTO ACTOR VALUES ('3');


INSERT INTO ACTOR VALUES ('4');




INSERT INTO ACTOR VALUES ('10')


INSERT INTO DIRECTOR VALUES ('1');


INSERT INTO DIRECTOR VALUES ('5');


INSERT INTO DIRECTOR VALUES ('6');


INSERT INTO DIRECTOR VALUES ('7');


INSERT INTO PRODUCER VALUES ('1');


INSERT INTO PRODUCER VALUES ('6')


INSERT INTO PRODUCER VALUES ('8');


INSERT INTO SCRIPT VALUES ('1','4');


INSERT INTO SCRIPT VALUES ('1','1');


INSERT INTO SCRIPT VALUES ('1','2');


INSERT INTO SCRIPT VALUES ('1','3');


INSERT INTO SCRIPT VALUES ('1','5');


INSERT INTO SCRIPT VALUES ('1','6');




INSERT INTO SCRIPT VALUES ('9','8');


INSERT INTO PERFORMANCE VALUES ('2','4');


INSERT INTO PERFORMANCE VALUES ('2','7');


INSERT INTO PERFORMANCE VALUES ('2','5');


INSERT INTO PERFORMANCE VALUES ('2','6');


INSERT INTO PERFORMANCE VALUES ('4','7');


INSERT INTO PERFORMANCE VALUES ('4','4');


INSERT INTO PERFORMANCE VALUES ('4','5');


INSERT INTO PERFORMANCE VALUES ('4','6');


INSERT INTO PERFORMANCE VALUES ('3','4');


INSERT INTO PERFORMANCE VALUES ('3','7');


INSERT INTO PERFORMANCE VALUES ('3','5');


INSERT INTO PERFORMANCE VALUES ('3','6');




INSERT INTO PERFORMANCE VALUES ('10','8')


INSERT INTO CREDIT VALUES ('1','4');


INSERT INTO CREDIT VALUES ('1','1');


INSERT INTO CREDIT VALUES ('1','2');


INSERT INTO CREDIT VALUES ('1','3');




INSERT INTO CREDIT VALUES ('5','5')




INSERT INTO CREDIT VALUES ('6','8')




INSERT INTO CREDIT VALUES ('7','6');


INSERT INTO PRODUCTION VALUES ('1','1');


INSERT INTO PRODUCTION VALUES ('1','2');


INSERT INTO PRODUCTION VALUES ('1','3');


INSERT INTO PRODUCTION VALUES ('1','4');


INSERT INTO PRODUCTION VALUES ('1','5');


INSERT INTO PRODUCTION VALUES ('1','6');




INSERT INTO PRODUCTION VALUES ('6','7')




INSERT INTO PRODUCTION VALUES ('8','8');


--INDEXES


CREATE INDEX FILM_TITLE_INDEX ON FILM (FILM_TITLE);


CREATE INDEX PNAME ON PERSON (PERSON_FNAME, PERSON_LNAME)






--QUERIES--


--Procedure that shows items checked-in and items checked-out for a specific film
CREATE PROCEDURE CHECKOUT_ITEMS_AND_AVAILABILITY
@FILM_TITLE VARCHAR(100)
AS


SELECT CHECK_OUT.ITEM_ID AS CHECKED_OUT_ITEMS, ITEM_FORMAT, FILM_TITLE, CHECK_OUT.CHECK_OUT_DATE
	FROM ITEM
	JOIN FILM
	ON ITEM.FILM_ID=FILM.FILM_ID
	JOIN CHECK_OUT
	ON ITEM.ITEM_ID=CHECK_OUT.ITEM_ID
	WHERE FILM.FILM_TITLE LIKE @FILM_TITLE;
SELECT ITEM.ITEM_ID, FILM.FILM_TITLE, FILM.FILM_RELEASE_DATE, FILM.FILM_LENGTH, ITEM.ITEM_FORMAT
	FROM ITEM
	JOIN FILM
	ON ITEM.FILM_ID=FILM.FILM_ID
	WHERE FILM.FILM_TITLE LIKE @FILM_TITLE;




--Procedure to see how many copies of a film are in the collection currently
CREATE PROCEDURE NUMBER_OF_ITEMS
@FILM_TITLE VARCHAR (100)
AS
SELECT FILM.FILM_TITLE, COUNT(ITEM.FILM_ID) AS 'NUMBER OF ITEMS'
FROM FILM
JOIN ITEM
ON ITEM.FILM_ID=FILM.FILM_ID
GROUP BY FILM.FILM_TITLE
HAVING FILM_TITLE LIKE @FILM_TITLE




--Procedure to view all the information on a film
CREATE PROCEDURE FILM_INFORMATION
@FILM_ID VARCHAR(4)
AS
SELECT * FROM FILM
	WHERE FILM_ID = @FILM_ID
SELECT (PERSON_FNAME + ' ' + PERSON_LNAME) AS MAIN_CAST
    FROM PERFORMANCE
    JOIN ACTOR
   	 ON ACTOR.PERSON_ID = PERFORMANCE.PERSON_ID
    JOIN PERSON
   	 ON ACTOR.PERSON_ID = PERSON.PERSON_ID
	WHERE FILM_ID = @FILM_ID
SELECT (PERSON_FNAME + ' ' + PERSON_LNAME) AS DIRECTOR
    FROM CREDIT
    JOIN DIRECTOR
   	 ON CREDIT.PERSON_ID = DIRECTOR.PERSON_ID
    JOIN PERSON
   	 ON DIRECTOR.PERSON_ID = PERSON.PERSON_ID
	WHERE FILM_ID = @FILM_ID
SELECT (PERSON_FNAME + ' ' + PERSON_LNAME) AS WRITER
    FROM SCRIPT
    JOIN WRITER
   	 ON WRITER.PERSON_ID = SCRIPT.PERSON_ID
    JOIN PERSON
   	 ON WRITER.PERSON_ID = PERSON.PERSON_ID
	WHERE FILM_ID = @FILM_ID
SELECT (PERSON_FNAME + ' ' + PERSON_LNAME) AS PRODUCER
    FROM PRODUCTION
    JOIN PRODUCER
   	 ON PRODUCTION.PERSON_ID = PRODUCER.PERSON_ID
    JOIN PERSON
   	 ON PRODUCER.PERSON_ID = PERSON.PERSON_ID
	WHERE FILM_ID = @FILM_ID
SELECT ITEM_FORMAT FROM ITEM
	WHERE FILM_ID = @FILM_ID
SELECT ITEM_ID FROM ITEM
	WHERE FILM_ID = @FILM_ID
SELECT PRODUCTION_COMPANY_NAME
    FROM COLLABORATION
    JOIN PRODUCTION_COMPANY
   	 ON PRODUCTION_COMPANY.PRODUCTION_COMPANY_ID = COLLABORATION.PRODUCTION_COMPANY_ID
	WHERE FILM_ID = @FILM_ID
SELECT GENRE_NAME
    FROM GENRE_ASSIGNMENT
    JOIN GENRE
   	 ON GENRE.GENRE_ID = GENRE_ASSIGNMENT.GENRE_ID
	WHERE FILM_ID = @FILM_ID






--View of Items that are Overdue
CREATE VIEW OVERDUE
AS
SELECT (PATRON_FNAME +' '+PATRON_LNAME) AS 'PATRON NAME', ITEM.ITEM_ID, ITEM_FORMAT, FILM_TITLE, DATEDIFF(DAY, CHECK_OUT_DATE, GETDATE()) AS 'DAYS OVERDUE'
	FROM ITEM
	JOIN FILM
	ON ITEM.FILM_ID=FILM.FILM_ID
	JOIN CHECK_OUT
	ON ITEM.ITEM_ID=CHECK_OUT.ITEM_ID
    JOIN PATRON
    ON PATRON.PATRON_ID=CHECK_OUT.PATRON_ID
	WHERE DATEDIFF(DAY, CHECK_OUT_DATE, GETDATE()) > 3;




--View for all items checked out excluding patron name
CREATE VIEW ITEMS_CHECKED_OUT
AS
SELECT FILM_TITLE, CHECK_OUT.ITEM_ID, CHECKED_IN, CHECK_OUT_DATE
FROM CHECK_OUT
JOIN ITEM
ON ITEM.ITEM_ID = CHECK_OUT.ITEM_ID
JOIN FILM
ON FILM.FILM_ID = ITEM.FILM_ID
WHERE CHECKED_IN = 0
