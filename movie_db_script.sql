DROP DATABASE IF EXISTS cs431_movie_database;
CREATE DATABASE cs431_movie_database;
USE cs431_movie_database;


CREATE TABLE `artists` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `Profession` TEXT DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `address` TEXT DEFAULT NULL,
  PRIMARY KEY (`artist_id`)
) ;



CREATE TABLE `movies` (
  `movie_id` INT NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `genre` varchar(25) NOT NULL,
  `gross` decimal(6,2) DEFAULT NULL,
  `Distributor` varchar(45) NOT NULL,
  `release_date` datetime DEFAULT NULL,
  PRIMARY KEY (`movie_id`),
  KEY `genre_fk_idx` (`genre`)
) ; 

CREATE TABLE `awards` (
  `awards_id` INT NOT NULL AUTO_INCREMENT,
  `movie_id` INT DEFAULT NULL,
  `person_id` INT DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`awards_id`),
  KEY `person_id_idx` (`person_id`),
  KEY `movie_id_idx` (`movie_id`),
  CONSTRAINT `movie_awards_fk` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `person_awards_fk` FOREIGN KEY (`person_id`) REFERENCES `artists` (`artist_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `movies_ratings` (
  `rating_id` INT NOT NULL AUTO_INCREMENT,
  `movie_id` INT NOT NULL,
  `person_id` INT NOT NULL,
  `number_of_stars` INT DEFAULT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `movies__ratings_fk_idx` (`movie_id`),
  KEY `artist_ratings_fk_idx` (`person_id`),
  CONSTRAINT `artist_ratings_fk` FOREIGN KEY (`person_id`) REFERENCES `artists` (`artist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movies__ratings_fk` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ;


CREATE TABLE `movie_cast` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `movie_id` INT DEFAULT NULL,
  `person_id` INT DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id_idx` (`person_id`),
  KEY `movie_id_idx` (`movie_id`),
  CONSTRAINT `movie_cast_fk` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `person_cast_fk` FOREIGN KEY (`person_id`) REFERENCES `artists` (`artist_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ;


INSERT INTO artists (`artist_id`,`first_name`,`last_name`,`contact_no`,`Profession`,`birth_date`,`address`) VALUES (1,'Idrissa Akuna ','Elba','4706091972','Actor','1972-09-06 00:00:00','CA');
INSERT INTO artists (`artist_id`,`first_name`,`last_name`,`contact_no`,`Profession`,`birth_date`,`address`) VALUES (2,'Christopher Hemsworth','Hemsworth','3408111983','Actor','1983-08-11 00:00:00','IL');
INSERT INTO artists (`artist_id`,`first_name`,`last_name`,`contact_no`,`Profession`,`birth_date`,`address`) VALUES (3,'Zoe ','Saldana','4106191978','Actor','1978-06-19 00:00:00','AZ');
INSERT INTO artists (`artist_id`,`first_name`,`last_name`,`contact_no`,`Profession`,`birth_date`,`address`) VALUES (4,'Christopher','Townsend','3903251976','Visual Effects','1976-03-25 00:00:00',NULL);
INSERT INTO artists (`artist_id`,`first_name`,`last_name`,`contact_no`,`Profession`,`birth_date`,`address`) VALUES (5,'Guy','Williams','3209211985','Reviewer','1985-09-21 00:00:00',NULL);
INSERT INTO artists (`artist_id`,`first_name`,`last_name`,`contact_no`,`Profession`,`birth_date`,`address`) VALUES (6,'Jonathan','Fawkner','3011131990','Reviewer','1990-11-13 00:00:00',NULL);
INSERT INTO artists (`artist_id`,`first_name`,`last_name`,`contact_no`,`Profession`,`birth_date`,`address`) VALUES (7,'Dan','Sudick','4701201972','Visual Effects','1972-01-20 00:00:00','NJ');
INSERT INTO artists (`artist_id`,`first_name`,`last_name`,`contact_no`,`Profession`,`birth_date`,`address`) VALUES (8,'Tom','Holland','2401061996','Actor','1996-06-01 00:00:00','CA');
INSERT INTO artists (`artist_id`,`first_name`,`last_name`,`contact_no`,`Profession`,`birth_date`,`address`) VALUES (9,'Justin ','Marks','2804021992','Screenplay','1992-04-02 00:00:00','LA');
INSERT INTO artists (`artist_id`,`first_name`,`last_name`,`contact_no`,`Profession`,`birth_date`,`address`) VALUES (10,'Adam','McGay','5104171968','Director','1968-04-17 00:00:00','PA');
INSERT INTO artists (`artist_id`,`first_name`,`last_name`,`contact_no`,`Profession`,`birth_date`,`address`) VALUES (11,'Adam','McGay','5104171968','Actor','1968-04-17 00:00:00','PA');
INSERT INTO artists (`artist_id`,`first_name`,`last_name`,`contact_no`,`Profession`,`birth_date`,`address`) VALUES (12,'Justin ','Marks','2804021992','Screenplay','1992-04-02 00:00:00','LA');



INSERT INTO movies (`movie_id`,`title`,`genre`,`gross`,`Distributor`,`release_date`) VALUES (1,'Star Wars','Sci Fi',2.06,'Disney','2015-12-18 00:00:00');
INSERT INTO movies (`movie_id`,`title`,`genre`,`gross`,`Distributor`,`release_date`) VALUES (2,'Jurassic World','Sci Fi',1.67,'Universal','2015-05-29 00:00:00');
INSERT INTO movies (`movie_id`,`title`,`genre`,`gross`,`Distributor`,`release_date`) VALUES (3,'Minions','Comedy',1.15,'Universal','2015-07-10 00:00:00');
INSERT INTO movies (`movie_id`,`title`,`genre`,`gross`,`Distributor`,`release_date`) VALUES (4,'The Jungle Book','Adventure',9.66,'Disney','2016-04-04 00:00:00');
INSERT INTO movies (`movie_id`,`title`,`genre`,`gross`,`Distributor`,`release_date`) VALUES (5,'Fantastic Beasts and Where to Find Them','Fantasy',8.14,'Warner Bros','2016-09-10 00:00:00');
INSERT INTO movies (`movie_id`,`title`,`genre`,`gross`,`Distributor`,`release_date`) VALUES (6,'Zootopia','Comedy',1.02,'Disney','2016-02-13 00:00:00');
INSERT INTO movies (`movie_id`,`title`,`genre`,`gross`,`Distributor`,`release_date`) VALUES (7,'Beauty and the Beast','Fantasy',1.26,'Disney','2017-02-23 00:00:00');
INSERT INTO movies (`movie_id`,`title`,`genre`,`gross`,`Distributor`,`release_date`) VALUES (8,'Spider-Man: Homecoming','Super Hero',8.80,'Sony','2017-06-28 00:00:00');
INSERT INTO movies (`movie_id`,`title`,`genre`,`gross`,`Distributor`,`release_date`) VALUES (9,'Guardians of the Galaxy Vol. 2','Super Hero',8.60,'Disney','2017-04-10 00:00:00');
INSERT INTO movies (`movie_id`,`title`,`genre`,`gross`,`Distributor`,`release_date`) VALUES (10,'Thor: Ragnarok','Super Hero',8.54,'Disney','2017-10-10 00:00:00');


INSERT INTO awards (`awards_id`,`movie_id`,`person_id`,`category`) VALUES (1,1,1,'Actor');
INSERT INTO awards (`awards_id`,`movie_id`,`person_id`,`category`) VALUES (2,1,2,'Actor');
INSERT INTO awards (`awards_id`,`movie_id`,`person_id`,`category`) VALUES (3,1,4,'Visual Effects');
INSERT INTO awards (`awards_id`,`movie_id`,`person_id`,`category`) VALUES (4,2,5,'Visual Effects');
INSERT INTO awards (`awards_id`,`movie_id`,`person_id`,`category`) VALUES (5,2,3,'Actor');
INSERT INTO awards (`awards_id`,`movie_id`,`person_id`,`category`) VALUES (6,5,10,'Director');
INSERT INTO awards (`awards_id`,`movie_id`,`person_id`,`category`) VALUES (7,4,9,'Screenplay');
INSERT INTO awards (`awards_id`,`movie_id`,`person_id`,`category`) VALUES (8,5,2,'Actor');
INSERT INTO awards (`awards_id`,`movie_id`,`person_id`,`category`) VALUES (9,5,10,NULL);


INSERT INTO movie_cast (`id`,`movie_id`,`person_id`,`category`) VALUES (1,1,1,'Actor');
INSERT INTO movie_cast (`id`,`movie_id`,`person_id`,`category`) VALUES (2,1,2,'Actor');
INSERT INTO movie_cast (`id`,`movie_id`,`person_id`,`category`) VALUES (3,1,4,'Visual Effects');
INSERT INTO movie_cast (`id`,`movie_id`,`person_id`,`category`) VALUES (4,2,5,'Visual Effects');
INSERT INTO movie_cast (`id`,`movie_id`,`person_id`,`category`) VALUES (5,2,3,'Actor');
INSERT INTO movie_cast (`id`,`movie_id`,`person_id`,`category`) VALUES (6,5,10,'Director');
INSERT INTO movie_cast (`id`,`movie_id`,`person_id`,`category`) VALUES (7,4,9,'Screenplay');
INSERT INTO movie_cast (`id`,`movie_id`,`person_id`,`category`) VALUES (8,5,2,'Actor');
INSERT INTO movie_cast (`id`,`movie_id`,`person_id`,`category`) VALUES (9,5,10,NULL);
INSERT INTO movie_cast (`id`,`movie_id`,`person_id`,`category`) VALUES (10,1,10,'Director');
INSERT INTO movie_cast (`id`,`movie_id`,`person_id`,`category`) VALUES (11,2,2,'Actor');
INSERT INTO movie_cast (`id`,`movie_id`,`person_id`,`category`) VALUES (12,2,7,'Visual Effects');


INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (1,1,5,5);
INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (2,2,5,5);
INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (3,3,5,5);
INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (4,4,5,4);
INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (5,5,5,4);
INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (6,6,5,4);
INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (7,7,5,4);
INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (8,8,5,4);
INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (9,1,6,5);
INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (10,2,6,5);
INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (11,3,6,5);
INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (12,4,6,5);
INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (13,7,6,4);
INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (14,8,6,4);
INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (15,9,6,4);
INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (16,10,6,4);
INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (17,9,5,NULL);
INSERT INTO movies_ratings (`rating_id`,`movie_id`,`person_id`,`number_of_stars`) VALUES (18,10,5,NULL);

