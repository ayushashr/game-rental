#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "user/pass@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.cs.torontomu.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
SET LINESIZE 200
SET PAGESIZE 100
COLUMN first_name FORMAT A15
COLUMN last_name FORMAT A15
COLUMN title FORMAT A40
COLUMN genre FORMAT A20
COLUMN rate_comment FORMAT A40
PROMPT
PROMPT 1. Highest Rated Games per Genre
SELECT
    gen.genre_name AS genre,
    g.title,
    AVG(r.rate_score) AS avg_rating
FROM genres gen
JOIN game_genres gg
    ON gen.genre_id = gg.genre_id
JOIN games g
    ON gg.game_id = g.game_id
JOIN reviews r
    ON g.game_id = r.game_id
GROUP BY gen.genre_name, gen.genre_id, g.game_id, g.title
HAVING AVG(r.rate_score) = (
    SELECT MAX(avg_score)
    FROM (
        SELECT
            gg2.genre_id,
            gg2.game_id,
            AVG(r2.rate_score) AS avg_score
        FROM game_genres gg2
        JOIN reviews r2 ON gg2.game_id = r2.game_id
        GROUP BY gg2.genre_id, gg2.game_id
    ) x
    WHERE x.genre_id = gen.genre_id
)
ORDER BY gen.genre_name;
PROMPT
PROMPT 2. Users with Overdue Rentals (Unreturned and Past Due Date)
SELECT
  u.user_id,
  u.first_name,
  u.last_name,
  u.user_email,
  (SELECT SUM(b.overdue_fee)
    FROM borrows b
    WHERE b.user_id = u.user_id
      AND b.return_date IS NULL
      AND b.due_date < SYSDATE
  ) AS overdue_fee
FROM users u
WHERE EXISTS (
  SELECT b.borrow_id
  FROM borrows b
  WHERE b.user_id = u.user_id
    AND b.return_date IS NULL
    AND b.due_date < SYSDATE)
ORDER BY u.first_name, u.last_name;
PROMPT
PROMPT 3. Games in Database but Without Any Borrows or Reviews
SELECT g.game_id, g.title
FROM games g
MINUS
(SELECT g2.game_id, g2.title
   FROM borrows b
   JOIN game_copies c ON c.copy_id = b.copy_id
   JOIN games g2 ON g2.game_id = c.game_id
   UNION
   SELECT g3.game_id, g3.title
   FROM reviews r
   JOIN games g3 ON g3.game_id = r.game_id)
ORDER BY title;
PROMPT
PROMPT 4. Games Currently Available to Rent
SELECT
    g.game_id,
    g.title,
    COUNT(c.copy_id) AS total_copies,
    /* Count available copies without CASE */
    (SELECT COUNT(*)
       FROM game_copies c2
      WHERE c2.game_id = g.game_id
        AND c2.status = 'Available') AS available_copies,
    /* Merge genres into one string */
    (SELECT LISTAGG(gn.genre_name, ', ')
             WITHIN GROUP (ORDER BY gn.genre_name)
       FROM game_genres gg
       JOIN genres gn
         ON gg.genre_id = gn.genre_id
      WHERE gg.game_id = g.game_id) AS genres
FROM games g
JOIN game_copies c
  ON g.game_id = c.game_id
GROUP BY g.game_id, g.title
HAVING (SELECT COUNT(*)
           FROM game_copies c3
          WHERE c3.game_id = g.game_id
            AND c3.status = 'Available') > 0
ORDER BY g.title;
PROMPT
PROMPT 5. Valid Reviews — Users Who Actually Borrowed the Game
SELECT
    u.first_name,
    u.last_name,
    g.title,
    r.rate_score,
    r.rate_comment,
    r.rate_date
FROM reviews r
JOIN users u ON r.user_id = u.user_id
JOIN games g ON r.game_id = g.game_id
WHERE g.title = 'Minecraft'
    AND EXISTS (
        SELECT b.borrow_id
        FROM borrows b
        JOIN game_copies gc ON b.copy_id = gc.copy_id
        WHERE b.user_id = r.user_id
          AND gc.game_id = r.game_id);
exit;
EOF