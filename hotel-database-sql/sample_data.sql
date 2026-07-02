-- =====================================================================
--  The Crowned Duck Inn — Sample Data (MySQL)
--  Load AFTER schema.sql. All data is fictional/illustrative.
-- =====================================================================

INSERT INTO hotel (hotel_id, name, address_line1, city, postcode, phone_number, email) VALUES
(101, 'The Crowned Duck Inn', '123 Duck Lane', 'Dunning', 'PH2 0RW', '01764 000000', 'crowned.duck.inn@example.com');

INSERT INTO guest (guest_id, first_name, last_name, email, phone_number) VALUES
(100, 'Amy',   'Smith', 'amy.smith@example.com',  '07000000001'),
(110, 'Chris', 'White', 'chris.white@example.com', '07000000002');

INSERT INTO menu_item (menu_item_id, name, category, price, is_alcoholic) VALUES
(1, 'Red Wine',   'Wine', 7.00, TRUE),
(2, 'White Wine', 'Wine', 8.00, TRUE),
(3, 'Coke',       'Soft', 3.00, FALSE),
(4, 'Lemonade',   'Soft', 2.50, FALSE),
(5, 'Tiger',      'Beer', 5.00, TRUE);

INSERT INTO room (room_id, hotel_id, room_number, room_type, price_per_night, status) VALUES
(1001, 101, 'Room 1', 'classic', 115.00, 'available'),
(1002, 101, 'Room 2', 'deluxe',  145.00, 'available'),
(1003, 101, 'Room 3', 'classic', 115.00, 'available'),
(1004, 101, 'Room 4', 'deluxe',  145.00, 'available');

INSERT INTO staff (staff_id, hotel_id, first_name, last_name, role, hourly_rate, employment_status) VALUES
(1, 101, 'Leah',    'Colwell',  'FOH', 12.00, 'employed'),
(2, 101, 'Scott',   'Morrison', 'BOH', 14.00, 'employed'),
(3, 101, 'Emma',    'Clark',    'BOH', 14.00, 'employed'),
(4, 101, 'Seb',     'Smith',    'BOH', 12.00, 'employed'),
(5, 101, 'Stephen', 'Kelly',    'FOH', 12.00, 'employed');

INSERT INTO stock_item (stock_item_id, hotel_id, name, quantity_in_stock, reorder_level, unit) VALUES
(122, 101, 'Red Wine', 2.00, 1.00, 'bottles'),
(123, 101, 'Coke',     1.00, 1.00, 'cans');

INSERT INTO booking (booking_id, guest_id, room_id, check_in_date, check_out_date, booking_datetime, total_cost) VALUES
(1, 100, 1001, '2026-01-01', '2026-01-02', '2026-01-01 10:00:00', 115.00),
(2, 110, 1002, '2026-02-02', '2026-02-03', '2026-02-01 10:00:00', 145.00);

INSERT INTO pub_order (order_id, hotel_id, staff_id, order_datetime, total_amount) VALUES
(1, 101, 1, '2026-01-01 19:00:00', 3.00),
(2, 101, 5, '2026-02-03 20:00:00', 8.00);

INSERT INTO order_item (order_item_id, order_id, menu_item_id, quantity, line_total) VALUES
(1, 1, 3, 1, 3.00),   -- Coke on order 1
(2, 2, 2, 1, 8.00);   -- White Wine on order 2
