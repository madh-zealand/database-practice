-- ===========================================
-- Eksempel DELETE-queries
-- ===========================================


-- 1. Slet en bruger med en bestemt id
DELETE FROM users
WHERE id = 3;



-- 2. Slet alle lån der er returneret for mere end 1 år siden
DELETE FROM loans
WHERE returned_at < datetime('now','-1 year');
