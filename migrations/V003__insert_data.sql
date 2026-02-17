INSERT INTO product (id, name, price, picture_url)
VALUES
  (1, 'Сливочная', 320.00, 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/6.jpg'),
  (2, 'Особая', 179.00, 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/5.jpg'),
  (3, 'Молочная', 225.00, 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/4.jpg'),
  (4, 'Нюренбергская', 315.00, 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/3.jpg'),
  (5, 'Мюнхенская', 330.00, 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/2.jpg'),
  (6, 'Русская', 189.00, 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/1.jpg');

INSERT INTO orders (id, date_created, status)
SELECT i, (CURRENT_DATE - (floor(random() * 90))::int), (ARRAY['pending', 'shipped', 'cancelled'])[1 + floor(random() * 3)::int]
FROM generate_series(1, 10000000) s(i);

INSERT INTO order_product (quantity, order_id, product_id)
SELECT floor(1+random()*50)::int, i, 1 + floor(random()*6)::int % 6
FROM generate_series(1, 10000000) s(i);