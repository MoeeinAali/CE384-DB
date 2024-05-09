-- Query 1
SELECT staffs.staff_id,
       CONCAT(staffs.first_name, ' ', staffs.last_name) AS name,
       COALESCE(service_count, 0)                       AS service_count
FROM staffs
         LEFT JOIN (SELECT staff_id, COUNT(*) AS service_count
                    FROM orders
                    GROUP BY staff_id) AS services ON staffs.staff_id = services.staff_id
ORDER BY service_count DESC, name;

-- Query 2
SELECT states.state, COALESCE(count, 0) AS order_count
FROM (SELECT state
      FROM stores
      UNION
      SELECT state
      FROM customers) AS states
         LEFT JOIN (SELECT stores.state, count(*) AS count
                    FROM orders
                             JOIN stores ON orders.store_id = stores.store_id
                             JOIN customers ON orders.customer_id = customers.customer_id
                    WHERE order_status = 4
                      AND stores.state = customers.state
                    GROUP BY stores.state) AS state_orders ON states.state = state_orders.state;
-- Query 3
SELECT customer_id, SUM(order_items.quantity * products.list_price * order_items.discount) AS total_discount
FROM orders
         JOIN order_items ON orders.order_id = order_items.order_id
         JOIN products ON order_items.product_id = products.product_id
GROUP BY orders.customer_id
ORDER BY total_discount DESC
LIMIT 3;
-- Query 4
SELECT product_id
FROM stocks
WHERE product_id NOT IN (SELECT DISTINCT product_id
                         FROM stocks
                         WHERE quantity = 0)
  AND product_id NOT IN (SELECT DISTINCT product_id
                         FROM order_items
                         WHERE quantity > 0)
GROUP BY product_id
ORDER BY sum(quantity) DESC;