-- Query 1
SELECT booking.arrival_time, guest.first_name, guest.last_name
FROM booking
         JOIN guest ON booking.guest_id = guest.id
WHERE booking.booking_date = '2016-11-05'
ORDER BY booking.arrival_time;
-- Query 2
SELECT guest_id, count(*) AS count, sum(nights) AS sum
FROM booking
WHERE guest_id IN (1185, 1270)
GROUP BY guest_id;
-- Query 3
SELECT last_name, first_name, address, COALESCE(SUM(nights), 0)
FROM guest
         LEFT JOIN booking ON guest.id = booking.guest_id
WHERE guest.address LIKE '%Edinburgh%'
GROUP BY guest_id, first_name, last_name, address
ORDER BY last_name, first_name
-- Query 4
