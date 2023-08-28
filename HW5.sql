CREATE DATABASE hw_5;
USE hw_5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT * FROM cars;

CREATE VIEW auto_view AS 
SELECT * FROM cars
WHERE cost < 25000;

ALTER VIEW auto_view AS
SELECT * FROM cars
WHERE cost < 30000;

CREATE VIEW skoda_audi AS 
SELECT * FROM cars
WHERE name = "Skoda" OR name = "Audi";

CREATE VIEW all_views (name, cost) AS 
	SELECT auto_view.name, auto_view.cost 
	FROM auto_view
		JOIN skoda_audi
			ON auto_view.name = skoda_audi.name;
        
SELECT * FROM auto_view;
SELECT * FROM skoda_audi;
SELECT * FROM all_views;

CREATE TABLE stations (
  id INT NOT NULL,
  station VARCHAR(255) COMMENT 'Станция',  
  station_time_without_timezone TIME);

INSERT stations
VALUES
	(110, "A", "10:00:00"),
    (110, "B", "10:54:00"),
    (110, "C", "11:02:00"),
    (110, "D", "12:35:00"),
	(120, "E", "11:00:00"),
    (120, "F", "12:49:00"), 
    (120, "G", "13:30:00");

SELECT * FROM stations;

SELECT
  *,
  TIMEDIFF
	(LEAD 
		(station_time_without_timezone) 
		OVER (PARTITION BY id ORDER BY station), 
		station_time_without_timezone) 
	AS time_to_next_station
FROM stations;
