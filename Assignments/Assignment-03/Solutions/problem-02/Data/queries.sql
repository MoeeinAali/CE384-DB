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
                    GROUP BY stores.state) AS state_orders ON states.state = state_orders.state

