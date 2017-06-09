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
