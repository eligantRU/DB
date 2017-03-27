CREATE DATABASE rental;

USE rental;

CREATE TABLE
  customer
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  passport_code VARCHAR(255), 
  PRIMARY KEY(id)
);

CREATE TABLE
  owner
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  PRIMARY KEY(id)
);
       
CREATE TABLE
  category
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  limitation_id INT UNSIGNED NOT NULL,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE
  limitation
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  label VARCHAR(255),
  PRIMARY KEY(id)
);

CREATE TABLE
  worker
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  passport_code VARCHAR(255),
  PRIMARY KEY(id)
);

CREATE TABLE
  black_list
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  bad_user_id INT UNSIGNED NOT NULL,
  FOREIGN KEY(bad_user_id) REFERENCES customer(id),
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
  inventory
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
    worker
  (name, passport_code)
VALUES
  ('Nick', '88 12 108462'),
  ('Dart', '00 00 000000'),
  ('Sarah', '19 18 123456'),
  ('Michael', '48 15 162342'),
  ('Alex', '17 178951'),
  ('Nick', '99 889989'),
  ('Ivan', '84 562117'),
  ('Helen', '51 341141');

INSERT 
  INTO 
    owner
  (name)
VALUES
  ('Nick'),
  ('Dart'),
  ('Sarah'),
  ('Michael'),
  ('Dirack'),
  ('Elena'),
  ('Alex'),
  ('Rudolf');

INSERT
  INTO
    limitation
  (label)
VALUES
  ('18+'),
  ('16+'),
  ('14+'),
  ('12+'),
  ('21+');

INSERT
  INTO
    category
  (name, limitation_id)
VALUES
  ('weapon', 1),
  ('tool', 2),
  ('computer technology', NULL),
  ('household appliances', NULL),
  ('book', NULL),
  ('laptop', 3),
  ('video game', NULL),
  ('DVD-film', NULL);

INSERT
  INTO
    inventory
  (owner_id, name, category_id)
VALUES
  (1, 'Magnum 500', 1),
  (1, 'Mosin-Nagant', 1),
  (2, 'chainsaw', 2),
  (3, 'monitor', 3),
  (4, 'washing machine', 4),
  (6, 'radio', 5),
  (5, 'M16', 1),
  (7, 'The art of the Programming: I', 6);

INSERT
  INTO
    customer
  (name, passport_code)
VALUES
  ('Anrew', '11 222222'),
  ('Sergey', '22 111111'),
  ('Olga', '77 444444'),
  ('Samanta', '66 999999'),
  ('Helen', '19 876159'),
  ('Vladimir', '88 110001'),
  ('Tatyana', '88 120808'),
  ('Elena', '88 808021');

INSERT
  INTO
    black_list
  (bad_user_id)
VALUES
  (4),
  (5),
  (6);

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
  (5, 6, 6, '2012-07-07', '2012-08-08'),
  (6, 5, 5, '2013-01-01', NULL),
  (7, 6, 7, '2013-01-02', NULL);
