DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  money INT4
);

CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  cost INT4
);

CREATE TABLE screenings(
  id SERIAL4 PRIMARY KEY,
  show_time CHAR(5),
  total_tickets INT2,
  film_id INT4 REFERENCES films(id)
);

CREATE TABLE tickets(
  id SERIAL4 PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id),
  screening_id INT4 REFERENCES screenings(id)
);

-- -- TESTS -- --

-- INSERT INTO customers (name, money)
-- VALUES
-- ('Tommy Atkins', 100),
-- ('Dakine', 110),
-- ('Jane Doe', 120),
-- ('Benjaman Kyle', 130),
-- ('Rudolf Lingens', 140),
-- ('Joe Diner', 150),
-- ('Hong Gildong', 160),
-- ('Joe Shmoe', 170);
--
-- -- SELECT * FROM customers;
--
-- INSERT INTO films (title, cost)
-- VALUES
-- ('Wonder Woman', 10),
-- ('LOTR: The Fellowship of the Ring', 4),
-- ('Your Name', 5),
-- ('Boy and the Beast', 7);
--
-- -- SELECT * FROM films;
--
-- INSERT INTO screenings (show_time, total_tickets, film_id)
-- VALUES
-- ('09:15', 10, 2),
-- ('11:00', 10, 1),
-- ('12:00', 10, 2),
-- ('13:30', 10, 1),
-- ('14:45', 10, 2),
-- ('15:00', 10, 3),
-- ('16:15', 10, 4),
-- ('17:00', 10, 1),
-- ('18:30', 10, 3),
-- ('19:45', 10, 4),
-- ('20:30', 10, 3),
-- ('21:45', 10, 4);
--
-- -- SELECT * FROM screenings;
--
-- -- SELECT screenings.show_time, screenings.total_tickets, films.title
-- -- FROM screenings INNER JOIN films
-- -- ON screenings.film_id = films.id;
--
-- INSERT INTO tickets (customer_id, screening_id)
-- VALUES
-- (1, 1),
-- (1, 8),
-- (1, 6),
-- (2, 3),
-- (2, 10),
-- (3, 2),
-- (3, 5),
-- (3, 12),
-- (3, 6),
-- (4, 8),
-- (4, 6),
-- (4, 7),
-- (5, 4),
-- (6, 1),
-- (6, 8),
-- (7, 10),
-- (8, 2),
-- (8, 12);
--
-- -- SELECT * FROM tickets;
--
-- -- SELECT customers.name, films.title, screenings.show_time
-- -- FROM customers INNER JOIN tickets
-- -- ON customers.id = tickets.customer_id
-- -- INNER JOIN screenings
-- -- ON tickets.screening_id = screenings.id
-- -- INNER JOIN films
-- -- ON screenings.film_id = films.id;
