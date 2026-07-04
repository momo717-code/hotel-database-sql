[README.md](https://github.com/user-attachments/files/29660617/README.md)
# 🏨 The Crowned Duck Inn — Relational Database (MySQL)

A third-normal-form **MySQL** database for a small independent hotel and public house — modelling rooms, bookings, guests, staff, pub orders, menu, and stock, with full referential integrity.

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-relational-336791?style=flat-square)

> MSc *Database Systems* — Assignment 1 (relational), University of Dundee. Group project.

---

## The scenario

*The Crowned Duck Inn* is a small, independently operated hotel and pub with four guest rooms plus food and drink service. As the business grew, paper and informal digital records caused booking errors and inventory problems. This database centralises operational data into one structured, integrity-checked system.

## Schema

Eight tables in **third normal form**, linked by primary and foreign keys:

| Table | Holds | Key relationships |
|---|---|---|
| `hotel` | The premises | referenced by rooms, staff, stock, orders |
| `room` | Guest rooms | → `hotel` |
| `guest` | Customer contact details | referenced by bookings |
| `booking` | Room reservations | → `guest`, `room` |
| `staff` | Employees | → `hotel` |
| `menu_item` | Food & drink catalogue | referenced by order items |
| `pub_order` | Pub sales | → `hotel`, `staff` |
| `order_item` | Line items on an order | → `pub_order`, `menu_item` |
| `stock_item` | Inventory | → `hotel` |

Design highlights: integer surrogate keys, `DECIMAL` for money, `BOOLEAN`/`DATE`/`DATETIME` typing, and foreign-key constraints enforcing valid relationships (e.g. a booking must reference a real guest and room).

## Files

| File | Purpose |
|---|---|
| `schema.sql` | `CREATE TABLE` statements with PK/FK constraints |
| `sample_data.sql` | `INSERT` statements with illustrative data |
| `queries.sql` | Example joins, aggregation, and filtering queries |
| `Database_Design_Report.pdf` | Written report: design rationale, normalisation, constraints (credentials + IDs redacted) |

## Run it locally

```bash
mysql -u root -p                      # start MySQL
CREATE DATABASE crowned_duck_inn;
USE crowned_duck_inn;
SOURCE schema.sql;
SOURCE sample_data.sql;
SOURCE queries.sql;
```

## Notes

- The assignment ran on a hosted MySQL instance (AWS RDS). **All connection details and credentials have been removed** — this repo runs standalone against a local MySQL server.
- Companion NoSQL redesign of the same domain: **[hotel-pub-mongodb](https://github.com/momo717-code/hotel-pub-mongodb)**.

## What I learned

- **Relational modelling** and normalisation (1NF → 3NF) from a written specification.
- Enforcing **data integrity** with primary/foreign keys and appropriate types.
- Writing **multi-table joins and aggregate queries** to answer real operational questions.
