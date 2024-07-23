CREATE TABLE categories (
  category_id SERIAL NOT NULL PRIMARY KEY,
  category_name VARCHAR(255),
  description VARCHAR(255)
);



INSERT INTO categories (category_name, description)
VALUES
  ('Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
  ('Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
  ('Confections', 'Desserts, candies, and sweet breads'),
  ('Dairy Products', 'Cheeses'),
  ('Grains/Cereals', 'Breads, crackers, pasta, and cereal'),
  ('Meat/Poultry', 'Prepared meats'),
  ('Produce', 'Dried fruit and bean curd'),
  ('Seafood', 'Seaweed and fish');


select * from categories ;




CREATE TABLE products (
  product_id SERIAL NOT NULL PRIMARY KEY,
  product_name VARCHAR(255),
  category_id INT,
  unit VARCHAR(255),
  price INTEGER
);


INSERT INTO products (product_name, category_id, unit, price)
VALUES
  ('Tandoori Masala', 1, '250 grams', 12),
  ('Banarasi Silk Saree', 2, '1 saree', 200),
  ('Kundan Necklace Set', 3, '1 set', 150),
  ('Jaipur Blue Pottery Vase', 4, '1 vase', 30),
   ('Gujrat diamond', 6, '10 diamnds' ,100);

select * from products ;




select * from categories c
inner join products p on  c.category_id = p.category_id ;

select * from categories c 
left join products p on c.category_id = p.category_id ;

select * from categories c 
right join products p on c.category_id = p.category_id ;

select * from categories c 
full join products p on c.category_id = p.category_id ;