-- ===========================================
-- Eksempel INSERT-queries
-- ===========================================


-- 1. Tilføj en ny bruger til users
INSERT INTO users (firstname, lastname, age, email)
VALUES ('Karen', 'Knudsen', 26, 'karen.knudsen@example.com');



-- 2. Tilføj flere bøger på én gang
INSERT INTO books (title, author, year, pages) VALUES
    ('Learning SQL', 'Alan Beaulieu', 2020, 350),
    ('Database Design 101', 'Sam Student', 2022, 200);



-- 3. Tilføj et lån hvor datoer sættes dynamisk med datetime()
INSERT INTO loans (user_id, book_id, created_at, due_at, returned_at)
VALUES (1, 2, datetime('now'), datetime('now','+14 days'), NULL);
