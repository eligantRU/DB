CREATE DATABASE rental;

USE rental;

CREATE TABLE
  human
(
  id INT UNSIGNED NOT nULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  passport_code VARCHAR(255) NOT NULL UNIQUE,
  email VARCHAR(255) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE
  customer
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  registration_date DATE NOT NULL,
  human_id INT UNSIGNED NOT NULL UNIQUE,
  FOREIGN KEY(human_id) REFERENCES human(id),
  PRIMARY KEY(id)
);

CREATE TABLE
  owner
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  human_id INT UNSIGNED NOT NULL UNIQUE,
  rating TINYINT UNSIGNED,
  FOREIGN KEY(human_id) REFERENCES human(id),
  PRIMARY KEY(id)
);

CREATE TABLE
  limitation
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  label VARCHAR(255) UNIQUE,
  PRIMARY KEY(id)
);
       
CREATE TABLE
  category
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL UNIQUE,    
  limitation_id INT UNSIGNED,
  PRIMARY KEY(id)
);
                           
CREATE TABLE
  worker
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  position VARCHAR(255) NOT NULL,
  human_id INT UNSIGNED NOT NULL UNIQUE,
  FOREIGN KEY(human_id) REFERENCES human(id),
  PRIMARY KEY(id)
);

CREATE TABLE
  black_list
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  starting_date DATE NOT NULL,
  bad_human_id INT UNSIGNED NOT NULL UNIQUE,
  FOREIGN KEY(bad_human_id) REFERENCES customer(id),
  PRIMARY KEY(id)
);

CREATE TABLE
  offer
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  rented_object_id INT UNSIGNED NOT NULL,
  customer_id INT UNSIGNED NOT NULL,
  worker_id INT UNSIGNED NOT NULL,
  offer_date DATE NOT NULL,
  return_date DATE,
  FOREIGN KEY(customer_id) REFERENCES customer(id),
  FOREIGN KEY(worker_id) REFERENCES worker(id),
  PRIMARY KEY(id)  
);

CREATE TABLE 
  object
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  owner_id INT UNSIGNED NOT NULL,
  name VARCHAR(255),
  category_id INT UNSIGNED NOT NULL,
  FOREIGN KEY(owner_id) REFERENCES owner(id),     
  PRIMARY KEY(id)
);

INSERT
  INTO
    human
  (name, passport_code, email)
VALUES
  ('Nick', '88 12 108462', 'eligant.ru@gmail.com'),
  ('Andrew', '88 11 105931', 'q@gmail.com'),
  ('Olga', '88 12 123456', 'w@ya.ru'),
  ('Elena', '88 13 102984', 'e@ya.ru'),
  ('Michael', '88 10 111462', 'm@gmail.com'),
  ('Nigan', '88 11 998802', 'p@gmail.com'),
  ('Helen', '88 12 191451', 'l@gmail.com'),
  ('Tatyana', '88 14 102984', 't@ya.ru');

INSERT
  INTO
    owner
  (human_id)
VALUES
  (1),
  (2),
  (5),
  (6),
  (8);

INSERT
  INTO
    worker
  (human_id, position)
VALUES
  (1, 'director'),
  (2, 'accountant'),
  (4, 'consultant'),
  (5, 'consultant');

INSERT
  INTO
    customer
  (human_id, registration_date)
VALUES
  (1, '2009-11-30'),
  (2, '2009-11-30'),
  (3, '2010-01-01'),
  (4, '2010-02-16'),
  (5, '2010-04-11'),
  (7, '2010-07-16'),
  (8, '2010-12-13');

INSERT
  INTO
    black_list
  (bad_human_id, starting_date)
VALUES
  (2, '2010-01-02'),
  (4, '2010-03-03'),
  (6, '2011-07-07'),
  (7, '2010-08-01');

INSERT
  INTO
    limitation
  (label)
VALUES
  ('12+'),
  ('14+'),
  ('16+'),
  ('18+'),
  ('21+');

INSERT
  INTO
    category
  (name, limitation_id)
VALUES
  ('weapon', 4),
  ('tool', 3),
  ('computer technology', NULL),
  ('household appliances', NULL),
  ('book', NULL),
  ('laptop', 3),
  ('video game', NULL),
  ('DVD-film', NULL);
    
INSERT
  INTO
    object
  (owner_id, name, category_id)
VALUES
  (1, 'Magnum 500', 1),
  (1, 'Mosin-Nagant', 1),
  (2, 'chainsaw', 2),
  (5, 'monitor', 3),
  (3, 'washing machine', 4),
  (3, 'radio', 5),
  (1, 'M16', 1),
  (4, 'The art of the Programming: I', 6);
         
INSERT
  INTO
    offer
  (rented_object_id, customer_id, worker_id, offer_date, return_date)
VALUES
  (1, 2, 3, '2011-01-14', '2012-01-14'),
  (2, 1, 1, '2014-01-20', '2014-02-10'),
  (3, 3, 4, '2013-01-10', '2013-02-10'),
  (4, 2, 2, '2011-01-01', '2011-01-02'),
  (1, 4, 1, '2012-01-01', NULL),
  (5, 6, 2, '2012-07-07', '2012-08-08'),
  (6, 5, 1, '2013-01-01', NULL),
  (7, 6, 4, '2013-01-02', NULL);
