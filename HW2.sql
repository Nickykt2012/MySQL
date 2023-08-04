
/* 1. Используя операторы языка SQL, 
создайте таблицу “sales”. Заполните ее данными.
Справа располагается рисунок к первому 
заданию*/

CREATE DATABASE IF NOT EXISTS hw_2;

USE hw_2; 

CREATE TABLE IF NOT EXISTS sales (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  count_product INT);
   
INSERT sales (order_date, count_product)
VALUES
  ('2022-01-01', 156),
  ('2022-01-02', 180),
  ('2022-01-03', 21),
  ('2022-01-04', 124),
  ('2022-01-05', 341);
  
/*2. Для данных таблицы “sales” укажите тип 
заказа в зависимости от кол-ва : 
меньше 100 - Маленький заказ
от 100 до 300 - Средний заказ
больше 300 - Большой заказ*/

ALTER TABLE sales
ADD type_order VARCHAR(45) AFTER count_product;

SELECT id,
CASE
	WHEN count_product < 100 THEN 'Маленький заказ'
    WHEN count_product BETWEEN 100 AND 300 THEN 'Средний заказ'
    WHEN count_product > 300 THEN 'Большой заказ'
    ELSE "Нет данных о заказе"
END AS type_order
FROM sales;

-- 3. Создайте таблицу “orders”

CREATE TABLE IF NOT EXISTS orders (
  id SERIAL PRIMARY KEY,
  employee_id VARCHAR(45),
  amount FLOAT, -- не выводит дробные числа???
  order_status VARCHAR(45)   
  );

INSERT orders (employee_id, amount, order_status)
VALUES
  ('e03', 15.00, 'OPEN'),
  ('e01', 25.50, 'OPEN'),
  ('e05', 10.70, 'CLOSED'),
  ('e02', 22.18, 'OPEN'),
  ('e04', 9.50, 'CANCEL');

/*Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled»*/

SELECT id, employee_id, amount, order_status,
CASE
	WHEN order_status = 'OPEN' THEN 'Order is in open state'
    WHEN order_status = 'CLOSED' THEN 'Order is closed'
    WHEN order_status = 'CANCEL' THEN 'Order is cancelled'
    ELSE "Нет данных о заказе"
END AS full_order_status
FROM orders;

/*4. Чем 0 отличается от NULL
0 - это значение INT либо логическое, а NULL - это не заполненная ячейка */
