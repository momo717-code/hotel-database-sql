-- =====================================================================
--  The Crowned Duck Inn — Example Queries (MySQL)
--  Demonstrates joins, aggregation, and filtering across the schema.
-- =====================================================================

-- 1. All bookings with guest name and room details (multi-table join)
SELECT b.booking_id, g.first_name, g.last_name,
       r.room_number, r.room_type,
       b.check_in_date, b.check_out_date, b.total_cost
FROM booking b
JOIN guest g ON b.guest_id = g.guest_id
JOIN room  r ON b.room_id  = r.room_id
ORDER BY b.check_in_date;

-- 2. Revenue by room type
SELECT r.room_type,
       COUNT(*)          AS bookings,
       SUM(b.total_cost) AS revenue
FROM booking b
JOIN room r ON b.room_id = r.room_id
GROUP BY r.room_type
ORDER BY revenue DESC;

-- 3. Full pub-order breakdown with line items (three-table join)
SELECT po.order_id, po.order_datetime,
       mi.name AS item, oi.quantity, oi.line_total
FROM pub_order po
JOIN order_item oi ON po.order_id     = oi.order_id
JOIN menu_item  mi ON oi.menu_item_id = mi.menu_item_id
ORDER BY po.order_id;

-- 4. Stock items at or below their reorder level (needs restocking)
SELECT name, quantity_in_stock, reorder_level, unit
FROM stock_item
WHERE quantity_in_stock <= reorder_level;

-- 5. Total spend per guest (bookings + pub orders would combine via UNION)
SELECT g.guest_id, g.first_name, g.last_name,
       SUM(b.total_cost) AS total_room_spend
FROM guest g
JOIN booking b ON g.guest_id = b.guest_id
GROUP BY g.guest_id, g.first_name, g.last_name;

-- 6. Staff roster for a hotel, ordered by pay
SELECT first_name, last_name, role, hourly_rate
FROM staff
WHERE hotel_id = 101
ORDER BY hourly_rate DESC;
