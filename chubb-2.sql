CREATE DATABASE IMDB;
USE imdb;

CREATE TABLE movies (movie_id INT,movie_name VARCHAR(20),PRIMARY KEY(movie_id));

INSERT INTO movies (movie_id , movie_name ) VALUES(1 , 'Avenger' );
INSERT INTO movies (movie_id , movie_name ) VALUES(2 , 'Wolf of wall street' );
INSERT INTO movies (movie_id , movie_name ) VALUES(3 , 'Shang-chi' );
INSERT INTO movies (movie_id , movie_name ) VALUES(4 , 'Inception' );
INSERT INTO movies (movie_id , movie_name ) VALUES(5 , 'Joker' );

CREATE TABLE genres(genre_id INT , genre_name VARCHAR(20),movie_id INT , PRIMARY KEY(genre_id) ) ; 

INSERT INTO genres (genre_id, genre_name  , movie_id) VALUES(1 ,'Action' ,1 ) ;
INSERT INTO genres (genre_id, genre_name  , movie_id) VALUES(2 ,'comedy' ,2 ) ;
INSERT INTO genres (genre_id, genre_name  , movie_id) VALUES(3 ,'drama' , 2 ) ;
INSERT INTO genres (genre_id, genre_name  , movie_id) VALUES(4 ,'Fight' , 3 ) ;
INSERT INTO genres (genre_id, genre_name  , movie_id) VALUES(5 ,'Sci-fi' ,4 ) ;

CREATE TABLE reviews (movie_id INT, review VARCHAR(20) ,user_id INT, user_name VARCHAR(20) );

INSERT INTO reviews (movie_id , review  , user_id ,user_name ) VALUES(1 , 'great' , 1 , 'Alice') ;
INSERT INTO reviews (movie_id , review  , user_id ,user_name ) VALUES(1 , 'superb' , 2 , 'Bob') ;
INSERT INTO reviews (movie_id , review  , user_id ,user_name ) VALUES(2 , 'great acting' , 3 , 'Charlie') ;
INSERT INTO reviews (movie_id , review  , user_id ,user_name ) VALUES(2 , 'mind blowing' , 4 , 'Danny') ;
INSERT INTO reviews (movie_id , review  , user_id ,user_name ) VALUES(5 , 'thriller' , 1 , 'Alice') ;
INSERT INTO reviews (movie_id , review  , user_id ,user_name ) VALUES(3 , 'great action' , 3 , 'Charlie') ;

CREATE TABLE artist (artist_id INT , artist_name VARCHAR(20), PRIMARY KEY(artist_id));

INSERT INTO artist (artist_id , artist_name) VALUES(1 , 'leo');
INSERT INTO artist (artist_id , artist_name) VALUES(2 , 'Brad');
INSERT INTO artist (artist_id , artist_name) VALUES(3 , 'marshal');
INSERT INTO artist (artist_id , artist_name) VALUES(4 , 'ye');
INSERT INTO artist (artist_id , artist_name) VALUES(5 , 'kendrick');

CREATE TABLE skills (skill_id INT , skill_name VARCHAR(20) , artist_id INT)  ; 

INSERT INTO skills(skill_id , skill_name , artist_id) VALUES(1 , 'acting' , 1) ;
INSERT INTO skills(skill_id , skill_name , artist_id) VALUES(2 , 'singing' , 2) ;
INSERT INTO skills(skill_id , skill_name , artist_id) VALUES(3 , 'dancing' , 3) ;
INSERT INTO skills(skill_id , skill_name , artist_id) VALUES(1 , 'acting' , 4) ;
INSERT INTO skills(skill_id , skill_name , artist_id) VALUES(2 , 'singing' , 5) ;
INSERT INTO skills(skill_id , skill_name , artist_id) VALUES(4 , 'swimming' , 1) ;

CREATE TABLE roles (movie_id INT , artist_id INT, roles VARCHAR(20)) ;

INSERT INTO roles(movie_id , artist_id , roles) VALUES(1 , 1 , 'hero') ;
INSERT INTO roles(movie_id , artist_id , roles) VALUES(2 , 3 , 'villian') ;
INSERT INTO roles(movie_id , artist_id , roles) VALUES(1 , 2 , 'supporting') ;
INSERT INTO roles(movie_id , artist_id , roles) VALUES(4 , 3 , 'supporting') ;
INSERT INTO roles(movie_id , artist_id , roles) VALUES(5 , 2 , 'villian') ;
INSERT INTO roles(movie_id , artist_id , roles) VALUES(5 , 5 , 'rapper') ;
INSERT INTO roles(movie_id , artist_id , roles) VALUES(4 , 1 , 'hero') ;

CREATE TABLE media (movie_id INT , image INT , video INT) ;

INSERT INTO media(movie_id , image , video) VALUES(1,1,1) ;
INSERT INTO media(movie_id , image , video) VALUES(2,1,1) ;
INSERT INTO media(movie_id , image , video) VALUES(3,1,1) ;
INSERT INTO media(movie_id , image , video) VALUES(4,1,1) ;
INSERT INTO media(movie_id , image , video) VALUES(5,1,1) ;


-- 1.
SELECT movies.movie_name , media.image ,media.video FROM movies INNER JOIN media ON media.movie_id = movies.movie_id;

-- 2.

SELECT movies.movie_name , media.image ,media.video,review FROM movies INNER JOIN media ON media.movie_id = movies.movie_id INNER JOIN reviews ON movies.movie_id = reviews.movie_id;

-- 3. 
SELECT movie_name ,artist_name , roles FROM roles INNER JOIN artist ON artist.artist_id = roles.artist_id INNER JOIN movies ON movies.movie_id = roles.movie_id;

-- 4.
SELECT review , user_name FROM reviews GROUP BY review ;
-- 5.
SELECT skill_name , artist_name FROM skills INNER JOIN artist ON skills.artist_id = artist.artist_id;
-- 6.
SELECT artist_name , roles FROM roles INNER JOIN artist ON artist.artist_id = roles.artist_id;