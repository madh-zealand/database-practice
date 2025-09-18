-- ===========================================
-- Eksempel UPDATE-queries
-- ===========================================


-- 1. Ret alderen på en bestemt bruger
UPDATE users
SET age = 30
WHERE id = 1;



-- 2. Ret afleveringsdatoen (due_at) på et lån og forlæng det 7 dage
UPDATE loans
SET due_at = datetime(due_at, '+7 days')
WHERE id = 2;
