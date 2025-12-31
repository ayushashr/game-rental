#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib

sqlplus64 "user/pass@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.cs.torontomu.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

INSERT INTO age_rating_ref (esrv_rating, min_age) VALUES ('E', 6);
INSERT INTO age_rating_ref (esrv_rating, min_age) VALUES ('E10+', 10);
INSERT INTO age_rating_ref (esrv_rating, min_age) VALUES ('T', 13);
INSERT INTO age_rating_ref (esrv_rating, min_age) VALUES ('M', 17);
INSERT INTO age_rating_ref (esrv_rating, min_age) VALUES ('AO', 18);
INSERT INTO age_rating_ref (esrv_rating, min_age) VALUES ('RP', NULL);

INSERT INTO admins (username, hashed_password, admin_role) VALUES ('Nevaeh20', 'Bag20', 'Store Owner');
INSERT INTO admins (username, hashed_password, admin_role) VALUES ('RuthMat', 'Huzz30', 'Store Owner');
INSERT INTO admins (username, hashed_password, admin_role) VALUES ('LiamRos', 'Surf@bay', 'Employee');
INSERT INTO admins (username, hashed_password, admin_role) VALUES ('SabCool', 'brightDay', 'Employee');
INSERT INTO admins (username, hashed_password, admin_role) VALUES ('Reiner25', 'ILuvAOT', 'Employee');
INSERT INTO admins (username, hashed_password, admin_role) VALUES ('Ayusha34', 'Fish123', 'Manager');

INSERT INTO users (user_id, user_email, first_name, last_name, password_hash, date_of_birth) VALUES (1, 'sara@gmail.com', 'Sara', 'Lee', 'LEEsara174', TO_DATE('17/04/1997', 'DD/MM/YYYY'));
INSERT INTO users (user_id, user_email, first_name, last_name, password_hash, date_of_birth) VALUES (2, 'mike.jones@gmail.com', 'Mike', 'Jones', 'MJpass2025', TO_DATE('05/11/1995', 'DD/MM/YYYY'));
INSERT INTO users (user_id, user_email, first_name, last_name, password_hash, date_of_birth) VALUES (3, 'anita.sharma@gmail.com', 'Anita', 'Sharma', 'Anita$99', TO_DATE('12/03/2000', 'DD/MM/YYYY'));
INSERT INTO users (user_id, user_email, first_name, last_name, password_hash, date_of_birth) VALUES (4, 'tim.nguyen@email.com', 'Tim', 'Nguyen', 'Tim@2025', TO_DATE('23/07/2004', 'DD/MM/YYYY'));
INSERT INTO users (user_id, user_email, first_name, last_name, password_hash, date_of_birth) VALUES (5, 'megumi.fushiguro@email.com', 'Megumi', 'Fushiguro', 'DemonDogs$', TO_DATE('30/01/2002', 'DD/MM/YYYY'));
INSERT INTO users (user_id, user_email, first_name, last_name, password_hash, date_of_birth) VALUES (6, 'maki.zenin@email.com', 'Maki', 'Zenin', 'Zenin!123', TO_DATE('14/08/2001', 'DD/MM/YYYY'));
INSERT INTO users (user_id, user_email, first_name, last_name, password_hash, date_of_birth) VALUES (7, 'oikawa.toru@email.com', 'Oikawa', 'Toru', 'Toru#2025', TO_DATE('27/02/1993', 'DD/MM/YYYY'));
INSERT INTO users (user_id, user_email, first_name, last_name, password_hash, date_of_birth) VALUES (8, 'linda.kim@email.com', 'Linda', 'Kim', 'LKim$789', TO_DATE('05/06/2001', 'DD/MM/YYYY'));
INSERT INTO users (user_id, user_email, first_name, last_name, password_hash, date_of_birth) VALUES (9, 'kenma.kozume@email.com', 'Kenma', 'Kozume', 'LuvVolley', TO_DATE('20/04/2008', 'DD/MM/YYYY'));
INSERT INTO users (user_id, user_email, first_name, last_name, password_hash, date_of_birth) VALUES (10, 'kuroo.tetsuro@email.com', 'Kuroo', 'Tetsuro', 'helpOthers23', TO_DATE('17/07/2010', 'DD/MM/YYYY'));

-- Insert games without genre column
INSERT INTO games (game_id, title, developer, year_released, game_desc, age_rating) VALUES (1, 'Minecraft', 'Mojang Studios', 2011, 'A sandbox video game where players can build, explore, and survive in block-based worlds.', 'E10+');
INSERT INTO games (game_id, title, developer, year_released, game_desc, age_rating) VALUES (2, 'The Legend of Zelda: Breath of the Wild', 'Nintendo', 2017, 'Open-world adventure game in the Zelda franchise.', 'E10+');
INSERT INTO games (game_id, title, developer, year_released, game_desc, age_rating) VALUES (3, 'Grand Theft Auto V', 'Rockstar Games', 2013, 'Riveting action-adventure game set in an open world of Los Santos.', 'M');
INSERT INTO games (game_id, title, developer, year_released, game_desc, age_rating) VALUES (4, 'Portal 2', 'Valve', 2011, 'Physics-based puzzle game using portals to solve challenges.', 'E10+');
INSERT INTO games (game_id, title, developer, year_released, game_desc, age_rating) VALUES (5, 'Call of Duty: Modern Warfare II', 'Infinity Ward', 2022, 'First-person shooter with campaign and online multiplayer modes.', 'M');
INSERT INTO games (game_id, title, developer, year_released, game_desc, age_rating) VALUES (6, 'Florence', 'Mountains', 2018, 'Interactive story about young love and personal growth.', 'E10+');
INSERT INTO games (game_id, title, developer, year_released, game_desc, age_rating) VALUES (7, 'Silent Hill 2', 'Konami', 2001, 'Psychological horror classic with deep story and terrifying atmosphere.', 'M');
INSERT INTO games (game_id, title, developer, year_released, game_desc, age_rating) VALUES (8, 'Persona 5', 'Atlus', 2016, 'Japanese RPG where players live dual lives as students and Phantom Thieves.', 'T');
INSERT INTO games (game_id, title, developer, year_released, game_desc, age_rating) VALUES (9, 'Kingdom Hearts II', 'Square Enix', 2005, 'Action RPG mixing Disney worlds with original fantasy storylines.', 'T');
INSERT INTO games (game_id, title, developer, year_released, game_desc, age_rating) VALUES (10, 'Manhunt 2', 'Rockstar Games', 2007, 'Stealth-based survival horror with graphic violence and psychological themes.', 'AO');
INSERT INTO games (game_id, title, developer, year_released, game_desc, age_rating) VALUES (11, 'Project X', 'Indie Studio', 2025, 'Upcoming experimental action game awaiting official ESRB review.', 'RP');
INSERT INTO games (game_id, title, developer, year_released, game_desc, age_rating) VALUES (12, 'Minecraft Dungeons', 'Mojang Studios', 2020, 'Dungeon crawler spin-off of Minecraft featuring cooperative gameplay.', 'E10+');
INSERT INTO games (game_id, title, developer, year_released, game_desc, age_rating) VALUES (13, 'Super Mario Odyssey', 'Nintendo', 2017, '3D platformer featuring Mario exploring kingdoms around the world.', 'E10+');
INSERT INTO games (game_id, title, developer, year_released, game_desc, age_rating) VALUES (14, 'Red Dead Redemption 2', 'Rockstar Games', 2018, 'Open-world western adventure with a focus on narrative and exploration.', 'M');

-- Insert genres
INSERT INTO genres (genre_id, genre_name) VALUES (1, 'Sandbox');
INSERT INTO genres (genre_id, genre_name) VALUES (2, 'Survival');
INSERT INTO genres (genre_id, genre_name) VALUES (3, 'Adventure');
INSERT INTO genres (genre_id, genre_name) VALUES (4, 'Action-Adventure');
INSERT INTO genres (genre_id, genre_name) VALUES (5, 'Action');
INSERT INTO genres (genre_id, genre_name) VALUES (6, 'Open World');
INSERT INTO genres (genre_id, genre_name) VALUES (7, 'Puzzle');
INSERT INTO genres (genre_id, genre_name) VALUES (8, 'Shooter');
INSERT INTO genres (genre_id, genre_name) VALUES (9, 'Romance');
INSERT INTO genres (genre_id, genre_name) VALUES (10, 'Interactive Story');
INSERT INTO genres (genre_id, genre_name) VALUES (11, 'Horror');
INSERT INTO genres (genre_id, genre_name) VALUES (12, 'RPG');
INSERT INTO genres (genre_id, genre_name) VALUES (13, 'Stealth');
INSERT INTO genres (genre_id, genre_name) VALUES (14, 'Indie');
INSERT INTO genres (genre_id, genre_name) VALUES (15, 'Platformer');

-- Insert game_genres relationships
-- Game 1: Minecraft - Sandbox, Survival, Adventure
INSERT INTO game_genres (game_id, genre_id) VALUES (1, 1);
INSERT INTO game_genres (game_id, genre_id) VALUES (1, 2);
INSERT INTO game_genres (game_id, genre_id) VALUES (1, 3);

-- Game 2: The Legend of Zelda: Breath of the Wild - Action-Adventure
INSERT INTO game_genres (game_id, genre_id) VALUES (2, 4);

-- Game 3: Grand Theft Auto V - Action, Open World
INSERT INTO game_genres (game_id, genre_id) VALUES (3, 5);
INSERT INTO game_genres (game_id, genre_id) VALUES (3, 6);

-- Game 4: Portal 2 - Puzzle, Adventure
INSERT INTO game_genres (game_id, genre_id) VALUES (4, 7);
INSERT INTO game_genres (game_id, genre_id) VALUES (4, 3);

-- Game 5: Call of Duty: Modern Warfare II - Shooter, Action-Adventure
INSERT INTO game_genres (game_id, genre_id) VALUES (5, 8);
INSERT INTO game_genres (game_id, genre_id) VALUES (5, 4);

-- Game 6: Florence - Romance, Interactive Story
INSERT INTO game_genres (game_id, genre_id) VALUES (6, 9);
INSERT INTO game_genres (game_id, genre_id) VALUES (6, 10);

-- Game 7: Silent Hill 2 - Horror
INSERT INTO game_genres (game_id, genre_id) VALUES (7, 11);

-- Game 8: Persona 5 - RPG, Adventure
INSERT INTO game_genres (game_id, genre_id) VALUES (8, 12);
INSERT INTO game_genres (game_id, genre_id) VALUES (8, 3);

-- Game 9: Kingdom Hearts II - RPG, Action-Adventure
INSERT INTO game_genres (game_id, genre_id) VALUES (9, 12);
INSERT INTO game_genres (game_id, genre_id) VALUES (9, 4);

-- Game 10: Manhunt 2 - Stealth, Horror
INSERT INTO game_genres (game_id, genre_id) VALUES (10, 13);
INSERT INTO game_genres (game_id, genre_id) VALUES (10, 11);

-- Game 11: Project X - Action, Indie
INSERT INTO game_genres (game_id, genre_id) VALUES (11, 5);
INSERT INTO game_genres (game_id, genre_id) VALUES (11, 14);

-- Game 12: Minecraft Dungeons - Action-Adventure, RPG
INSERT INTO game_genres (game_id, genre_id) VALUES (12, 4);
INSERT INTO game_genres (game_id, genre_id) VALUES (12, 12);

-- Game 13: Super Mario Odyssey - Platformer, Adventure
INSERT INTO game_genres (game_id, genre_id) VALUES (13, 15);
INSERT INTO game_genres (game_id, genre_id) VALUES (13, 3);

-- Game 14: Red Dead Redemption 2 - Action-Adventure, Open World
INSERT INTO game_genres (game_id, genre_id) VALUES (14, 4);
INSERT INTO game_genres (game_id, genre_id) VALUES (14, 6);

INSERT INTO game_copies (copy_id, game_id, status) VALUES (101, 1, 'Borrowed');
INSERT INTO game_copies (copy_id, game_id, status) VALUES (102, 1, 'Available');
INSERT INTO game_copies (copy_id, game_id, status) VALUES (103, 1, 'Available');
INSERT INTO game_copies (copy_id, game_id, status) VALUES (104, 2, 'Available');
INSERT INTO game_copies (copy_id, game_id, status) VALUES (105, 2, 'Available');
INSERT INTO game_copies (copy_id, game_id, status) VALUES (106, 3, 'Available');
INSERT INTO game_copies (copy_id, game_id, status) VALUES (107, 3, 'Available');
INSERT INTO game_copies (copy_id, game_id, status) VALUES (108, 3, 'Available');
INSERT INTO game_copies (copy_id, game_id, status) VALUES (109, 4, 'Available');
INSERT INTO game_copies (copy_id, game_id, status) VALUES (110, 4, 'Available');
INSERT INTO game_copies (copy_id, game_id, status) VALUES (111, 5, 'Borrowed');
INSERT INTO game_copies (copy_id, game_id, status) VALUES (112, 5, 'Borrowed');
INSERT INTO game_copies (copy_id, game_id, status) VALUES (113, 6, 'Borrowed');
INSERT INTO game_copies (copy_id, game_id, status) VALUES (114, 7, 'Available');
INSERT INTO game_copies (copy_id, game_id, status) VALUES (115, 7, 'Available');

INSERT INTO borrows (borrow_id, user_id, copy_id, borrow_date, due_date, return_date, overdue_fee) VALUES (601, 1, 111, TO_DATE('03/10/2025', 'DD/MM/YYYY'), TO_DATE('17/10/2025', 'DD/MM/YYYY'), NULL, 10);
INSERT INTO borrows (borrow_id, user_id, copy_id, borrow_date, due_date, return_date, overdue_fee) VALUES (602, 2, 112, TO_DATE('21/09/2025', 'DD/MM/YYYY'), TO_DATE('05/10/2025', 'DD/MM/YYYY'), NULL, 20);
INSERT INTO borrows (borrow_id, user_id, copy_id, borrow_date, due_date, return_date, overdue_fee) VALUES (603, 3, 113, TO_DATE('22/09/2025', 'DD/MM/YYYY'), TO_DATE('06/10/2025', 'DD/MM/YYYY'), NULL, 20);
INSERT INTO borrows (borrow_id, user_id, copy_id, borrow_date, due_date, return_date, overdue_fee) VALUES (604, 4, 109, TO_DATE('01/09/2025', 'DD/MM/YYYY'), TO_DATE('15/09/2025', 'DD/MM/YYYY'), TO_DATE('14/09/2025', 'DD/MM/YYYY'), 0);
INSERT INTO borrows (borrow_id, user_id, copy_id, borrow_date, due_date, return_date, overdue_fee) VALUES (605, 5, 106, TO_DATE('05/09/2025', 'DD/MM/YYYY'), TO_DATE('19/09/2025', 'DD/MM/YYYY'), TO_DATE('18/09/2025', 'DD/MM/YYYY'), 0);
INSERT INTO borrows (borrow_id, user_id, copy_id, borrow_date, due_date, return_date, overdue_fee) VALUES (606, 2, 101, TO_DATE('06/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'), NULL, 0);

INSERT INTO reviews (user_id, game_id, rate_score, rate_comment, rate_date) VALUES (1, 1, 5, 'Endless creativity, I have been playing for years!', TO_DATE('28/09/2025', 'DD/MM/YYYY'));
INSERT INTO reviews (user_id, game_id, rate_score, rate_comment, rate_date) VALUES (2, 1, 4, 'Great fun with friends, but survival mode can get repetitive.', TO_DATE('28/09/2025', 'DD/MM/YYYY'));
INSERT INTO reviews (user_id, game_id, rate_score, rate_comment, rate_date) VALUES (3, 4, 5, 'Campaign was intense and multiplayer is exciting.', TO_DATE('28/09/2025', 'DD/MM/YYYY'));
INSERT INTO reviews (user_id, game_id, rate_score, rate_comment, rate_date) VALUES (4, 5, 3, 'Good graphics, but matchmaking and lag can be frustrating.', TO_DATE('28/09/2025', 'DD/MM/YYYY'));
INSERT INTO reviews (user_id, game_id, rate_score, rate_comment, rate_date) VALUES (5, 6, 5, 'Best shooting mechanics, I enjoy the competitive matches.', TO_DATE('28/09/2025', 'DD/MM/YYYY'));

INSERT INTO waitlist (user_id, game_id, date_request) VALUES (4, 1, TIMESTAMP '2025-10-15 09:30:00');
INSERT INTO waitlist (user_id, game_id, date_request) VALUES (6, 1, TIMESTAMP '2025-10-16 14:22:00');
INSERT INTO waitlist (user_id, game_id, date_request) VALUES (7, 5, TIMESTAMP '2025-10-10 11:45:00');
INSERT INTO waitlist (user_id, game_id, date_request) VALUES (8, 5, TIMESTAMP '2025-10-12 16:10:00');
INSERT INTO waitlist (user_id, game_id, date_request) VALUES (9, 5, TIMESTAMP '2025-10-18 08:55:00');
INSERT INTO waitlist (user_id, game_id, date_request) VALUES (10, 6, TIMESTAMP '2025-10-14 13:20:00');

exit;
EOF