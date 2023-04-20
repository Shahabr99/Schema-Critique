DROP DATABASE IF EXISTS air_traffic

CREATE DATABASE air_traffic;

\c air_traffic;

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
);

CREATE TABLE origin
(
  id SERIAL PRIMARY KEY,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL
);

CREATE TABLE destinations
(
  id SERIAL PRIMARY KEY,
  to_city TEXT NOT NULL,
  to_county TEXT NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  departure DATE NOT NULL,
  arrival DATE NOT NULL,
  airline_id INTEGER REFERENCES airlines ON DELETE CASCADE,
  passenger_id INTEGER REFERENCES passengers ON DELETE CASCADE,
  origin_id INTEGER REFERENCES origin ON DELETE CASCADE,
  destination_id INTEGER REFERENCES destination ON DELETE CASCADE
);


INSERT INTO passengers (first_name, last_name) 
VALUES ('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Cory', 'Squibbes');


INSERT INTO cities (city)
VALUES ('Washington DC'),
('Tokyo'),
('Los Angeles'),
('Seattle'),
('Paris'),
('Dubai'),
('New York'),
('Cedar Rapids'),
('Charlotte'),
('Sao Paolo'),
('Seattle'),
('London'),
('Las Vegas'),
('Mexico City'),
('Casablanca'),
('Beijing'),
('Chicago'),
('New Orleans'),
('Santiago');




INSERT INTO countries (country)
VALUES
('United Kingdom'),
('United States'),
('Mexico'),
('Morroco'),
('China'),
('Chile'),
('Japan'),
('France'),
('UAE'),
('Brazile');


INSERT INTO airlines (airline)
VALUES ('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');


INSERT INTO flights (passenger_id, seat, departure, arrival, airline_id, origin_id, destination_id)
VALUES (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1,),
(2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, ),
(3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, ),
(4, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, ),
(5, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, ),
(6, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5,),
(7, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1),
(8, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6),
(9, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6),
(10, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7);