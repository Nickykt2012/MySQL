USE lesson_4;
CREATE TABLE users_old SELECT * FROM users;
TRUNCATE TABLE users_old;
SELECT * FROM users_old;
SELECT * FROM users;

DROP PROCEDURE IF EXISTS add_user;

DELIMITER //
CREATE PROCEDURE add_user(id_number INT)
BEGIN
	DECLARE id_number INT;
	    
	START TRANSACTION;
	INSERT INTO users_old (id, firstname, lastname, email) 
		SELECT 
        id, 
        firstname, 
        lastname, 
        email 
        FROM users
		WHERE id = id_number;
	DELETE FROM users
    WHERE id = id_number;
COMMIT;
END//
DELIMITER ;

CALL add_user(2);




DROP FUNCTION IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello(my_date VARCHAR(32))
RETURNS VARCHAR(30) DETERMINISTIC 
BEGIN
  DECLARE hello VARCHAR(30);
      SET hello = 
        IF(TIME(my_date) BETWEEN '06:00:00' AND '11:59:59', 'Доброе утро',
   ( IF(TIME(my_date) BETWEEN '12:00:00' AND '17:59:59', 'Добрый день',
( IF(TIME(my_date) BETWEEN '18:00:00' AND '23:59:59', 'Добрый вечер', 'Доброй ночи') ) ) ) );
RETURN hello;
      END//

SELECT hello(NOW())//

