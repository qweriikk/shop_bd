![](https://github.com/qweriikk/shop_bd/blob/main/ura.png)

## Типовые запросы 
### 1. Получение списка всех клиентов с их данными:
```sql
SELECT id, client_name, client_email, client_phone, balance
FROM client;
```
### 2. Получение всех заказов для конкретного клиента по ID:
```sql
SELECT o.id, o.order_date, o.amount
FROM orders o
JOIN basket b ON o.basket_id = b.id
WHERE b.client_id = 1;
```

### 3. Получение всех продуктов, количество которых меньше определенного значения:
```sql
SELECT id, tittle, quantity
FROM products
WHERE quantity < 40;
```

### 4. Получение продуктов, заказанных в конкретный период времени:
```sql
SELECT p.tittle, o.order_date
FROM orders o
JOIN basket b ON o.basket_id = b.id
JOIN basket_has_products bhp ON b.id = bhp.basket_id
JOIN products p ON bhp.products_id = p.id
WHERE o.order_date BETWEEN '2024-05-20' AND '2024-05-25';
```

### 5. Получение всех клиентов, которые заказывали конкретный продукт:
```sql
SELECT DISTINCT c.client_name
FROM client c
JOIN basket b ON c.id = b.client_id
JOIN basket_has_products bhp ON b.id = bhp.basket_id
JOIN products p ON bhp.products_id = p.id
WHERE p.tittle = 'DARK MOON MEMORABILIA';
```

## Хранимые процедуры

#### Добавление товара в корзину:
```sql
call mydb.add_product_to_basket(1, 1);
```


## Представление
#### Представление будет содержать информацию о заказах, включая дату заказа, сумму, идентификатор корзины, общую сумму и количество товаров в корзине, а также информацию о клиенте, сделавшем заказ.
```sql
SELECT 
    o.id AS order_id,
    o.order_date,
    o.amount,
    o.basket_id,
    b.total_sum,
    b.count,
    b.client_id,
    c.client_name,
    c.client_email,
    c.client_phone
FROM orders o
JOIN basket b ON o.basket_id = b.id
JOIN client c ON b.client_id = c.id;
```

## Пользовательская функция
#### Запрос вернет количество уникальных продуктов в корзине с идентификатором 1.
```sql
SELECT count_unique_products_in_basket(1);
```
