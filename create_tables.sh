#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "user/pass@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.cs.torontomu.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

CREATE TABLE admins (
    username VARCHAR2(20) PRIMARY KEY,
    hashed_password VARCHAR2(30) NOT NULL,
    admin_role VARCHAR2(20) NOT NULL
);

CREATE TABLE users (
    user_id          INTEGER PRIMARY KEY,
    user_email       VARCHAR2(50) UNIQUE NOT NULL,
    first_name       VARCHAR2(50) NOT NULL,
    last_name        VARCHAR2(50) NOT NULL,
    password_hash    VARCHAR2(30) NOT NULL,
    date_of_birth    DATE NOT NULL
);

CREATE TABLE age_rating_ref (
    esrv_rating    VARCHAR2(12) PRIMARY KEY,
    min_age        NUMBER(2)
);

CREATE TABLE games (
    game_id        INTEGER PRIMARY KEY,
    title          VARCHAR2(100) NOT NULL,
    developer      VARCHAR2(50) NOT NULL,
    year_released  INTEGER NOT NULL CHECK (year_released >= 1950),
    game_desc      VARCHAR2(150) DEFAULT 'No description',
    age_rating     VARCHAR2(12) NOT NULL REFERENCES age_rating_ref(esrv_rating)
);

CREATE TABLE genres (
    genre_id       INTEGER PRIMARY KEY,
    genre_name     VARCHAR2(50) UNIQUE NOT NULL
);

CREATE TABLE game_genres (
    game_id        INTEGER NOT NULL REFERENCES games(game_id) ON DELETE CASCADE,
    genre_id       INTEGER NOT NULL REFERENCES genres(genre_id) ON DELETE CASCADE,
    PRIMARY KEY (game_id, genre_id)
);

CREATE TABLE game_copies (
    copy_id        INTEGER PRIMARY KEY,
    game_id        INTEGER NOT NULL REFERENCES games(game_id) ON DELETE CASCADE,
    status         VARCHAR2(20) DEFAULT 'Available' NOT NULL CHECK (status IN ('Available', 'Borrowed', 'Reserved'))
);

CREATE TABLE reviews (
    user_id      INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    game_id      INTEGER NOT NULL REFERENCES games(game_id) ON DELETE CASCADE,
    rate_score   INTEGER NOT NULL CHECK (rate_score BETWEEN 1 AND 5),
    rate_comment VARCHAR2(500),
    rate_date    DATE DEFAULT SYSDATE,
    PRIMARY KEY (user_id, game_id)
);

CREATE TABLE borrows (
    borrow_id    INTEGER PRIMARY KEY,
    user_id      INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    copy_id      INTEGER NOT NULL REFERENCES game_copies(copy_id) ON DELETE CASCADE,
    borrow_date  DATE NOT NULL,
    due_date     DATE NOT NULL,
    return_date  DATE,
    overdue_fee  NUMBER(5,2) DEFAULT 0,
    CONSTRAINT borrow_only_day CHECK (borrow_date = TRUNC(borrow_date) AND due_date = TRUNC(due_date)),
    CONSTRAINT borrow_due_after_14 CHECK (due_date = borrow_date + 14),
    CONSTRAINT uq_borrow UNIQUE (user_id, copy_id, borrow_date)
);

CREATE TABLE waitlist (
    user_id       INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    game_id       INTEGER NOT NULL REFERENCES games(game_id) ON DELETE CASCADE,
    date_request  TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (user_id, game_id)
);

exit;
EOF