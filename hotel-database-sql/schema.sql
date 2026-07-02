-- =====================================================================
--  The Crowned Duck Inn — Relational Schema (MySQL)
--  MSc Database Systems, Assignment 1 · University of Dundee
--
--  A small independent hotel + public house: guest rooms, bookings,
--  staff, pub orders, menu, and stock. Third-normal-form design with
--  primary keys and referential integrity via foreign keys.
--
--  NOTE: the original assignment ran on a hosted MySQL instance;
--  all connection details/credentials have been removed. Run locally.
-- =====================================================================

-- Parent tables first (referenced by foreign keys) ------------------

CREATE TABLE hotel (
    hotel_id       INT           PRIMARY KEY,
    name           VARCHAR(100)  NOT NULL,
    address_line1  VARCHAR(200)  NOT NULL,
    city           VARCHAR(100)  NOT NULL,
    postcode       VARCHAR(20)   NOT NULL,
    phone_number   VARCHAR(20),
    email          VARCHAR(100)
);

CREATE TABLE guest (
    guest_id       INT           PRIMARY KEY,
    first_name     VARCHAR(50)   NOT NULL,
    last_name      VARCHAR(50)   NOT NULL,
    email          VARCHAR(100),
    phone_number   VARCHAR(20)
);

CREATE TABLE menu_item (
    menu_item_id   INT           PRIMARY KEY,
    name           VARCHAR(100)  NOT NULL,
    category       VARCHAR(50),
    price          DECIMAL(10,2) NOT NULL,
    is_alcoholic   BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE room (
    room_id         INT           PRIMARY KEY,
    hotel_id        INT           NOT NULL,
    room_number     VARCHAR(50)   NOT NULL,
    room_type       VARCHAR(50)   NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    status          VARCHAR(20),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
);

CREATE TABLE staff (
    staff_id          INT          PRIMARY KEY,
    hotel_id          INT          NOT NULL,
    first_name        VARCHAR(50)  NOT NULL,
    last_name         VARCHAR(50)  NOT NULL,
    role              VARCHAR(50),
    hourly_rate       DECIMAL(6,2),
    employment_status VARCHAR(20),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
);

CREATE TABLE stock_item (
    stock_item_id     INT           PRIMARY KEY,
    hotel_id          INT           NOT NULL,
    name              VARCHAR(100)  NOT NULL,
    quantity_in_stock DECIMAL(10,2) NOT NULL,
    reorder_level     DECIMAL(10,2) NOT NULL,
    unit              VARCHAR(20),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
);

-- Child tables (contain the foreign keys) ---------------------------

CREATE TABLE booking (
    booking_id       INT           PRIMARY KEY,
    guest_id         INT           NOT NULL,
    room_id          INT           NOT NULL,
    check_in_date    DATE          NOT NULL,
    check_out_date   DATE          NOT NULL,
    booking_datetime DATETIME,
    total_cost       DECIMAL(10,2),
    FOREIGN KEY (guest_id) REFERENCES guest(guest_id),
    FOREIGN KEY (room_id)  REFERENCES room(room_id)
);

CREATE TABLE pub_order (
    order_id       INT           PRIMARY KEY,
    hotel_id       INT           NOT NULL,
    staff_id       INT,
    order_datetime DATETIME      NOT NULL,
    total_amount   DECIMAL(10,2),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE order_item (
    order_item_id INT           PRIMARY KEY,
    order_id      INT           NOT NULL,
    menu_item_id  INT           NOT NULL,
    quantity      INT           NOT NULL,
    line_total    DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id)     REFERENCES pub_order(order_id),
    FOREIGN KEY (menu_item_id) REFERENCES menu_item(menu_item_id)
);
