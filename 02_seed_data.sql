-- Seed data for users, books, and loans (DATETIME format 'YYYY-MM-DD HH:MM:SS')
-- Compatible with the basic schema (no FKs/indexes required)

-- Clean tables (optional)
DELETE
FROM "loans";
DELETE
FROM "books";
DELETE
FROM "users";

-- Users
INSERT INTO "users" ("firstname", "lastname", "age", "email")
VALUES ('Alice', 'Andersen', 22, 'alice@example.com'),
    ('Bjørn', 'Berg', 28, 'bjorn@example.com'),
    ('Clara', 'Christensen', 31, 'clara@example.com'),
    ('David', 'Dahl', 35, 'david@example.com'),
    ('Eva', 'Eriksen', 27, 'eva@example.com'),
    ('Frederik', 'Frost', 24, 'frederik@example.com'),
    ('Gitte', 'Grau', 29, 'gitte@example.com'),
    ('Hans', 'Hansen', 33, 'hans@example.com'),
    ('Ida', 'Iversen', 19, 'ida@example.com'),
    ('Jonas', 'Jensen', 41, 'jonas@example.com');

-- Books
INSERT INTO "books" ("title", "author", "year", "pages")
VALUES ('Clean Code', 'Robert C. Martin', 2008, 464),
    ('You Don''t Know JS Yet', 'Kyle Simpson', 2020, 350),
    ('Design Patterns', 'Erich Gamma et al.', 1994, 395),
    ('The Pragmatic Programmer', 'Andy Hunt & Dave Thomas', 1999, 352),
    ('Refactoring', 'Martin Fowler', 1999, 448),
    ('Introduction to Algorithms', 'Cormen/Leiserson/Rivest/Stein', 2009, 1312),
    ('Eloquent JavaScript', 'Marijn Haverbeke', 2018, 472),
    ('Database System Concepts', 'Silberschatz/Korth/Sudarshan', 2019, 1376),
    ('SQL Antipatterns', 'Bill Karwin', 2010, 320),
    ('Head First Design Patterns', 'Freeman/Sierra/Bates', 2004, 694),
    ('Patterns of Enterprise Application Architecture', 'Martin Fowler', 2002, 560),
    ('Domain-Driven Design', 'Eric Evans', 2003, 560);

-- Loans
INSERT INTO "loans" ("user_id", "book_id", "created_at", "due_at", "returned_at")
VALUES
-- Alice borrows 'Clean Code', returns on time
    (1, 1,
     DATETIME('now', '-40 days'), DATETIME('now', '-26 days'), DATETIME('now', '-26 days', '+1 hour')),
-- Bjørn borrows 'Design Patterns', returns late
    (2, 3,
     DATETIME('now', '-30 days'), DATETIME('now', '-16 days'), DATETIME('now', '-12 days')),
-- Alice borrows 'You Don''t Know JS Yet', not returned yet (overdue)
    (1, 2,
     DATETIME('now', '-20 days'), DATETIME('now', '-13 days'), NULL),
-- Clara borrows 'The Pragmatic Programmer', not returned yet (active, not due yet)
    (3, 4,
     DATETIME('now', '-2 days'), DATETIME('now', '+12 days'), NULL),
-- David borrows 'Refactoring', returns early
    (4, 5,
     DATETIME('now', '-25 days'), DATETIME('now', '-11 days'), DATETIME('now', '-15 days')),
-- Eva borrows 'Eloquent JavaScript', returns same day
    (5, 7,
     DATETIME('now', '-10 days'), DATETIME('now', '-3 days'), DATETIME('now', '-10 days', '+1 hour')),
-- Frederik borrows 'Database System Concepts', returned before due
    (6, 8,
     DATETIME('now', '-18 days'), DATETIME('now', '+3 days'), DATETIME('now', '-1 days')),
-- Frederik borrows 'SQL Antipatterns', not returned yet (overdue)
    (6, 9,
     DATETIME('now', '-17 days'), DATETIME('now', '-10 days'), NULL),
-- Gitte borrows 'Clean Code', returns late
    (7, 1,
     DATETIME('now', '-15 days'), DATETIME('now', '-5 days'), DATETIME('now', '-4 days')),
-- Hans borrows 'Clean Code', not returned yet (still active)
    (8, 1,
     DATETIME('now', '-3 days'), DATETIME('now', '+7 days'), NULL),
-- Ida borrows 'Introduction to Algorithms', returned very late
    (9, 6,
     DATETIME('now', '-90 days'), DATETIME('now', '-60 days'), DATETIME('now', '-45 days')),
-- Jonas borrows 'Patterns of Enterprise Application Architecture', active long loan
    (10, 11,
     DATETIME('now', '-1 days'), DATETIME('now', '+20 days'), NULL),
-- Bjørn borrows 'Head First Design Patterns', returns exactly on due date
    (2, 10,
     DATETIME('now', '-14 days'), DATETIME('now'), DATETIME('now', '-1 hours')),
-- Clara borrows 'Domain-Driven Design', returned late
    (3, 12,
     DATETIME('now', '-65 days'), DATETIME('now', '-44 days'), DATETIME('now', '-40 days')),
-- Eva borrows 'You Don''t Know JS Yet', due today, not returned
    (5, 2,
     DATETIME('now', '-7 days'), DATETIME('now'), NULL),
-- David borrows 'SQL Antipatterns', due today but not returned
    (4, 9,
     DATETIME('now', '-7 days'), DATETIME('now'), NULL);
