#!/bin/sh

clear
echo "==========================================="
echo "        Oracle DBMS Add / Update Review"
echo "==========================================="
echo
echo "What would you like to do?"
echo "1) Add a new review"
echo "2) Update/Edit an existing review"
echo
echo -ne "Enter choice (1 or 2): "
read choice
echo

# ------------------------------------------------------------
# OPTION 1 — Add a new review
# ------------------------------------------------------------
if [ "$choice" = "1" ]; then
    echo -ne "Enter your User ID: "
    read userId
    echo -ne "Enter Game ID: "
    read gameId
    echo -ne "Enter rating (1-5): "
    read rateScore
    echo -ne "Enter your comment: "
    read rateComment
    echo

    sqlplus64 "user/pass@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.cs.torontomu.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

SET SERVEROUTPUT ON;
SET LINESIZE 200
SET PAGESIZE 100
COLUMN title FORMAT A40
COLUMN rate_comment FORMAT A40

INSERT INTO reviews (user_id, game_id, rate_score, rate_comment, rate_date)
VALUES ($userId, $gameId, $rateScore, '$rateComment', SYSDATE);

COMMIT;

PROMPT Review added successfully.

PROMPT
PROMPT ==============================
PROMPT Current Reviews for User ID: $userId
PROMPT ==============================

SELECT r.game_id,
       g.title,
       r.rate_score,
       r.rate_comment,
       TO_CHAR(r.rate_date, 'YYYY-MM-DD') AS review_date
FROM reviews r
JOIN games g ON r.game_id = g.game_id
WHERE r.user_id = $userId
ORDER BY r.rate_date DESC;

exit;
EOF

# ------------------------------------------------------------
# OPTION 2 — Update/Edit an existing review
# ------------------------------------------------------------
elif [ "$choice" = "2" ]; then
    echo -ne "Enter your User ID: "
    read userId
    echo -ne "Enter Game ID of the review to update: "
    read gameId
    echo -ne "Enter new rating (1-5): "
    read rateScore
    echo -ne "Enter new comment: "
    read rateComment
    echo

    sqlplus64 "user/pass@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.cs.torontomu.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

SET SERVEROUTPUT ON;
SET LINESIZE 200
SET PAGESIZE 100
COLUMN title FORMAT A40
COLUMN rate_comment FORMAT A40

UPDATE reviews
SET rate_score = $rateScore,
    rate_comment = '$rateComment',
    rate_date = SYSDATE
WHERE user_id = $userId
  AND game_id = $gameId;

COMMIT;

PROMPT Review updated successfully.

PROMPT
PROMPT ==============================
PROMPT Updated Reviews for User ID: $userId
PROMPT ==============================

SELECT r.game_id,
       g.title,
       r.rate_score,
       r.rate_comment,
       TO_CHAR(r.rate_date, 'YYYY-MM-DD') AS review_date
FROM reviews r
JOIN games g ON r.game_id = g.game_id
WHERE r.user_id = $userId
ORDER BY r.rate_date DESC;

exit;
EOF

else
    echo "Invalid choice. Exiting."
fi

echo
echo "Press ENTER to continue..."
read dummy