![](https://github.com/qweriikk/shop_bd/blob/main/erd3.png)

## Типовые запросы 
### 1. Получение списка всех клиентов с их данными:
```sql
SELECT id, client_name, client_email, client_phone, balance
FROM client;
```
### 2. Получение товаров в определенной корзине::
```sql
SELECT products.* 
FROM basket_has_products 
JOIN products ON basket_has_products.products_id = products.id
WHERE basket_has_products.basket_id = 3; 
```

### 3. Получение всех продуктов, количество которых меньше определенного значения:
```sql
SELECT id, tittle, quantity
FROM products
WHERE quantity < 40;
```

### 4. Выборка с использованием LIKE для поиска клиента по имени:
```sql
SELECT *
FROM client
WHERE client_name LIKE '%Дарья%';
```

### 5. Получение всех клиентов, которые заказывали конкретный продукт:
```sql
SELECT DISTINCT client.client_name
FROM client 
JOIN basket ON client.id = basket.client_id
JOIN basket_has_products ON basket.id = basket_has_products.basket_id
JOIN products ON basket_has_products.products_id = products.id
WHERE products.tittle = 'DARK MOON MEMORABILIA';
```

## Хранимые процедуры

#### Добавление товара в корзину:
```sql
CALL add_product_to_basket(17, 1);
```
> Вводить product_id и basket_id.

## Представление
#### Представление позволяет увидеть информацию о клиентах и их заказах.
```sql
SELECT * FROM mydb.client_orders_view;
```

## Пользовательская функция
#### Запрос вернет количество уникальных продуктов в корзине с идентификатором 1.
```sql
SELECT count_unique_products_in_basket(1);
```
## Триггер
#### Запрос добавит новый заказ и вызовет триггер, который обновит количество товаров на складе.
```sql
INSERT INTO orders (order_date, amount, basket_id) VALUES (NOW(), 5000.00, 1);
```

## Роли
1. Роль: менеджер.
```sql
-- Создание роли
CREATE ROLE manager_role;

-- Назначение привилегий для manager_role
GRANT SELECT, INSERT, UPDATE, DELETE ON kpop.* TO manager_role;

-- Создание пользователя
CREATE USER 'manager_user'@'localhost' IDENTIFIED BY 'manager_password';

-- Присвоение ролей пользователям
GRANT manager_role TO 'manager_user'@'localhost';
```
> Эти привилегии позволяют роли полностью управлять данными в таблицах бд, включая чтение, добавление, обновление и удаление данных.

2. Роль: клиент.
```sql
-- Создание роли
CREATE ROLE client_role;

-- Назначение привилегий для client_role
GRANT SELECT, INSERT ON kpop.* TO client_role;

-- Создание пользователя
CREATE USER 'client_user'@'localhost' IDENTIFIED BY 'client_password';

-- Присвоение ролей пользователям
GRANT client_role TO 'client_user'@'localhost';
```
> Роль ограничена функциональностью добавления и чтения данных. 
