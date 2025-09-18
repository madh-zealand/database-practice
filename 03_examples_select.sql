-- ===========================================
-- Eksempel SELECT-queries
-- ===========================================


-- 1. Se alle brugere
SELECT * FROM users;



-- 2. Find alle brugere over 30 år
SELECT * FROM users
WHERE age > 30;



-- 3. Find alle brugere hvis efternavn slutter med 'sen'
SELECT * FROM users
WHERE lastname LIKE '%sen';



-- 4. Tæl hvor mange brugere der er i databasen
SELECT COUNT(*) AS total_users
FROM users;



-- 5. Se alle bøger
SELECT * FROM books;



-- 6. Find alle bøger udgivet før år 2000
SELECT * FROM books
WHERE year < 2000;



-- 7. Find alle bøger med mere end 500 sider
SELECT * FROM books
WHERE pages > 500;



-- 8. Tæl hvor mange bøger der er i databasen
SELECT COUNT(*) AS total_books
FROM books;



-- 9. Find den ældste bog (laveste year)
SELECT * FROM books
ORDER BY year ASC
LIMIT 1;



-- 10. Find den nyeste bog (højeste year)
SELECT * FROM books
ORDER BY year DESC
LIMIT 1;



-- 11. Se alle lån (uanset status)
SELECT * FROM loans;



-- 12. Find alle aktive lån (ikke returneret endnu)
SELECT * FROM loans
WHERE returned_at IS NULL;



-- 13. Find alle lån der er returneret
SELECT * FROM loans
WHERE returned_at IS NOT NULL;



-- 14. Find alle lån der blev afleveret for sent
SELECT * FROM loans
WHERE returned_at IS NOT NULL
  AND returned_at > due_at;



-- 15. Find alle lån der stadig er aktive og allerede forfaldne (overdue)
SELECT * FROM loans
WHERE returned_at IS NULL
  AND due_at < datetime('now');



-- 16. Find alle lån der forfalder i dag
SELECT * FROM loans
WHERE date(due_at) = date('now');



-- 17. Find alle lån hvor afleveringsdatoen var præcis til tiden
SELECT * FROM loans
WHERE date(returned_at) = date(due_at);



-- 18. Tæl hvor mange lån der er aktive lige nu
SELECT COUNT(*) AS active_loans
FROM loans
WHERE returned_at IS NULL;



-- 19. Tæl hvor mange lån der er overdue lige nu
SELECT COUNT(*) AS overdue_loans
FROM loans
WHERE returned_at IS NULL
  AND due_at < datetime('now');



-- 20. Find de seneste 5 oprettede lån (sorteret efter created_at)
SELECT * FROM loans
ORDER BY created_at DESC
LIMIT 5;



-- 21. Find alle lån for en bestemt bruger (fx user_id = 1)
SELECT * FROM loans
WHERE user_id = 1;



-- 22. Find alle lån af en bestemt bog (fx book_id = 1)
SELECT * FROM loans
WHERE book_id = 1;



-- 23. Find alle lån returneret samme dag de blev lånt
SELECT * FROM loans
WHERE returned_at IS NOT NULL
  AND date(returned_at) = date(created_at);



-- 24. Find alle lån oprettet indenfor de sidste 7 dage
SELECT * FROM loans
WHERE created_at >= datetime('now','-7 days');



-- 25. Find alle lån som er due indenfor de næste 7 dage
SELECT * FROM loans
WHERE due_at BETWEEN datetime('now') AND datetime('now','+7 days');



-- 26. Vis id, created_at, due_at, og en beregnet kolonne 'days_late' for alle returnerede lån
SELECT
    id,
    created_at,
    due_at,
    returned_at,
    MAX(0, CAST(julianday(returned_at) - julianday(due_at) AS INTEGER)) AS days_late
FROM loans
WHERE returned_at IS NOT NULL;
