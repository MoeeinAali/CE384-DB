-- Create Tables

CREATE TABLE IF NOT EXISTS Stores
(
    store_id   INT not null PRIMARY KEY,
    store_name VARCHAR(255),
    state      VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS Products
(
    product_id   INT not null PRIMARY KEY,
    product_name VARCHAR(255),
    model_year   VARCHAR(10),
    list_price   DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS customers
(
    customer_id INT not null PRIMARY KEY,
    first_name  VARCHAR(255),
    last_name   VARCHAR(255),
    state       VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS staffs
(
    staff_id   INT not null PRIMARY KEY,
    first_name VARCHAR(255),
    last_name  VARCHAR(255),
    active     INT,
    store_id   INT REFERENCES Stores (store_id),
    manager_id INT REFERENCES staffs (staff_id)
);

CREATE TABLE orders
(
    order_id     INT not null PRIMARY KEY,
    customer_id  INT REFERENCES customers (customer_id),
    order_status INT,
    store_id     INT REFERENCES stores (store_id),
    staff_id     INT REFERENCES staffs (staff_id)
);

CREATE TABLE order_items
(
    order_id   INT not null REFERENCES orders (order_id),
    item_id    INT not null,
    product_id INT REFERENCES products (product_id),
    quantity   INT,
    discount   DECIMAL(4, 2),
    PRIMARY KEY (order_id, item_id)
);

CREATE TABLE stocks
(
    store_id   INT not null REFERENCES stores (store_id),
    product_id INT not null REFERENCES products (product_id),
    quantity   INT,
    primary key (store_id, product_id)
);


-- Insert Data into Tables

\copy Stores(store_id, store_name, state) FROM './Data/tables/stores.csv' DELIMITER ',' CSV HEADER;
\copy Products(product_id, product_name, model_year, list_price) FROM './Data/tables/products.csv' DELIMITER ',' CSV HEADER;
\copy customers(customer_id, first_name, last_name, state) FROM './Data/tables/customers.csv' DELIMITER ',' CSV HEADER;
\copy staffs(staff_id, first_name, last_name, active, store_id, manager_id) FROM './Data/tables/staffs.csv' DELIMITER ',' CSV HEADER;
\copy orders(order_id, customer_id, order_status, store_id, staff_id) FROM './Data/tables/orders.csv' DELIMITER ',' CSV HEADER;
\copy order_items(order_id, item_id, product_id, quantity, discount) FROM './Data/tables/order_items.csv' DELIMITER ',' CSV HEADER;
\copy stocks(store_id, product_id, quantity) FROM './Data/tables/stocks.csv' DELIMITER ',' CSV HEADER;