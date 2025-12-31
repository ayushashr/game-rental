#!/bin/sh
echo "==========================================="
echo "        Oracle DBMS Read Operations"
echo "==========================================="
echo
echo "What would you like to view?"
echo "1) View reviews for a game"
echo "2) View all copies of a game"
echo
echo -ne "Enter choice (1 or 2): "
read choice
echo

# ------------------------------------------------------------
# OPTION 1 — View all reviews for a game
# ------------------------------------------------------------
if [ "$choice" = "1" ]; then
    echo -ne "Enter Game ID: "
    read gameId
    echo

    sqlplus64 "user/pass@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.cs.torontomu.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

    SET LINESIZE 200
    SET PAGESIZE 100

    COLUMN title FORMAT A40
    COLUMN rate_comment FORMAT A40

    PROMPT ===============================================
    PROMPT Reviews for Game ID: $gameId
    PROMPT ===============================================

    SELECT r.user_id,
           g.title,
           r.rate_score,
           r.rate_comment,
           TO_CHAR(r.rate_date, 'YYYY-MM-DD') AS review_date
    FROM reviews r
    JOIN games g ON r.game_id = g.game_id
    WHERE r.game_id = $gameId
    ORDER BY r.rate_date DESC;

    exit;
EOF

# ------------------------------------------------------------
# OPTION 2 — View all copies of a game
# ------------------------------------------------------------
elif [ "$choice" = "2" ]; then
    echo -ne "Enter Game Title: "
    read gameTitle
    echo

    sqlplus64 "user/pass@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.cs.torontomu.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

    SET LINESIZE 200
    SET PAGESIZE 100

    COLUMN title FORMAT A40
    COLUMN status FORMAT A15

    PROMPT ===============================================
    PROMPT Game Copies for: $gameTitle
    PROMPT ===============================================

    SELECT g.game_id,
           g.title,
           c.copy_id,
           c.status
    FROM games g
    JOIN game_copies c ON g.game_id = c.game_id
    WHERE LOWER(g.title) = LOWER('$gameTitle')
    ORDER BY c.copy_id;

    exit;
EOF

else
    echo "Invalid choice. Exiting."
fi

echo
echo "Press ENTER to continue..."
read dummy