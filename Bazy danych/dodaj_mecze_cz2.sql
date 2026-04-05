
DECLARE
    v_league_id NUMBER;
    v_match_id NUMBER;
    v_h_id NUMBER;
    v_a_id NUMBER;
    v_stadium_id NUMBER;

BEGIN
    BEGIN
        SELECT league_id INTO v_league_id FROM League WHERE name = 'PKO BP Ekstraklasa' AND season = '2024/2025';
    EXCEPTION WHEN NO_DATA_FOUND THEN
        INSERT INTO League (name, season, country) VALUES ('PKO BP Ekstraklasa', '2024/2025', 'Polska') RETURNING league_id INTO v_league_id;
    END;

    -- ROUND 4: Raków Częstochowa vs Radomiak Radom
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Raków Częstochowa');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Radomiak Radom');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-09', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Muhamed', 'Sahinovic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matej', 'Rodin', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milan', 'Rundic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pestka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stratos', 'Svarnas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tobiasz', 'Mras', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Péter', 'Baráth', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Nowakowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Basse', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lazaros', 'Lamprou', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Walczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Kikolski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rahil', 'Mammadov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pestka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Steve', 'Kingue', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Saad', 'Agouzoul', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Kaput', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafael', 'Barbosa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Francisco', 'Ramos', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renat', 'Dadashov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Roberto', 'Alves', v_a_id));
    register_goal(v_match_id, get_p_id('Lazaros', 'Lamprou', v_h_id), 20, 1);
    register_goal(v_match_id, get_p_id('Roberto', 'Alves', v_a_id), 55, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 55, 'ASSIST', v_match_id, get_p_id('Saad', 'Agouzoul', v_a_id));

    -- ROUND 4: Legia Warszawa vs Piast Gliwice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Legia Warszawa');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Piast Gliwice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-09', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Zielinski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Ziolkowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Steve', 'Kapuadi', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Burch', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergio', 'Barcia', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Szczepaniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juergen', 'Elitim', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maxi', 'Oyedele', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Gual', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jordan', 'Majchrzak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Migouel', 'Alfarela', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartlomiej', 'Jelonek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Drapiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miguel', 'Nóbrega', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Mokwa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Czerwiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kopczyński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Chrapek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Leśniak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jorge', 'Felix', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Thierry', 'Gale', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fabian', 'Piasecki', v_a_id));
    register_goal(v_match_id, get_p_id('Juergen', 'Elitim', v_h_id), 10, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 10, 'ASSIST', v_match_id, get_p_id('Mateusz', 'Szczepaniak', v_h_id));
    register_goal(v_match_id, get_p_id('Miguel', 'Nóbrega', v_a_id), 35, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 35, 'ASSIST', v_match_id, get_p_id('Fabian', 'Piasecki', v_a_id));
    reg_card(v_match_id, get_p_id('Jordan', 'Majchrzak', v_h_id), 15, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Radovan', 'Pankov', v_h_id), get_p_id('Marco', 'Burch', v_h_id), 81);

    -- ROUND 4: Jagiellonia Białystok vs Śląsk Wrocław
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Jagiellonia Białystok');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Śląsk Wrocław');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-09', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sławomir', 'Abramowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lewicki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Skrzypczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('João', 'Moutinho', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Kovacik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcin', 'Listkowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aurélien', 'Nguiamba', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Taras', 'Romanczuk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Marczuk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Afimico', 'Pululu', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Edi', 'Semedo', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Loska', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Petkov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yegor', 'Matsenko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Llinares', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Petr', 'Schwarz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Kowalski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Musiolik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Świerczok', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Samiec-Talar', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Pokorný', v_a_id));
    register_goal(v_match_id, get_p_id('Peter', 'Kovacik', v_h_id), 22, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 22, 'ASSIST', v_match_id, get_p_id('João', 'Moutinho', v_h_id));
    register_goal(v_match_id, get_p_id('Sebastian', 'Musiolik', v_a_id), 52, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 52, 'ASSIST', v_match_id, get_p_id('Tomasz', 'Loska', v_a_id));
    reg_card(v_match_id, get_p_id('Aurélien', 'Nguiamba', v_h_id), 26, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Norbert', 'Wojtuszek', v_h_id), get_p_id('Taras', 'Romanczuk', v_h_id), 52);

    -- ROUND 4: Cracovia vs Zagłębie Lubin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Cracovia');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Zagłębie Lubin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-09', 'YYYY-MM-DD'), 0, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Burek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gustav', 'Henriksson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andreas', 'Skovgaard', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kuba', 'Pestka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Glik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Davíd', 'Kristján Olafsson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Biedrzycki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Martin', 'Minchev', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamin', 'Kallman', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mick', 'van Buren', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Otar', 'Kakabadze', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jasmin', 'Burić', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleks', 'Ławniczak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Nalepa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jaroslaw', 'Jach', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Michalski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kajetan', 'Szmyt', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Kowalski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kurminowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Matys', v_a_id));
    register_goal(v_match_id, get_p_id('Jaroslaw', 'Jach', v_a_id), 52, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 52, 'ASSIST', v_match_id, get_p_id('Jasmin', 'Burić', v_a_id));
    register_goal(v_match_id, get_p_id('Aleks', 'Ławniczak', v_a_id), 32, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 32, 'ASSIST', v_match_id, get_p_id('Michał', 'Nalepa', v_a_id));

    -- ROUND 4: Pogoń Szczecin vs Górnik Zabrze
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Pogoń Szczecin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Górnik Zabrze');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-09', 'YYYY-MM-DD'), 2, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Valentin', 'Cojocaru', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamín', 'Rojas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Danijel', 'Loncar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mariusz', 'Malec', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lis', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Przyborek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Wędrychowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Smoliński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renyer', 'Renyer', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Olaf', 'Korczakowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Efthymios', 'Koulouris', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Jeleń', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kryspin', 'Szcześniak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Olkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Janicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Erik', 'Janza', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Ambros', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Hellebrand', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matija', 'Marsenić', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Tobolik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sondre', 'Liseth', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Lukoszek', v_a_id));
    register_goal(v_match_id, get_p_id('Benjamín', 'Rojas', v_h_id), 16, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 16, 'ASSIST', v_match_id, get_p_id('Danijel', 'Loncar', v_h_id));
    register_goal(v_match_id, get_p_id('Mariusz', 'Malec', v_h_id), 25, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 25, 'ASSIST', v_match_id, get_p_id('Jakub', 'Lis', v_h_id));
    register_goal(v_match_id, get_p_id('Sondre', 'Liseth', v_a_id), 46, 0);
    register_goal(v_match_id, get_p_id('Rafał', 'Janicki', v_a_id), 19, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 19, 'ASSIST', v_match_id, get_p_id('Erik', 'Janza', v_a_id));
    reg_sub(v_match_id, get_p_id('Kamil', 'Grosicki', v_h_id), get_p_id('Renyer', 'Renyer', v_h_id), 77);

    -- ROUND 5: Lech Poznań vs Motor Lublin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lech Poznań');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Motor Lublin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-16', 'YYYY-MM-DD'), 2, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Mędrala', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ian', 'Hoffmann', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Douglas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Gurgul', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Elias', 'Andersson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stjepan', 'Loncar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rasmus', 'Carstensen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Jagiełło', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adriel', 'Ba Loua', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dino', 'Hotic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Szymczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Jez', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bright', 'Ede', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marek', 'Bartos', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Rudol', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krystian', 'Palacz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kaan', 'Caliskaner', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Romanowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergi', 'Samper', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Król', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bradly van', 'Hoeven', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Mráz', v_a_id));
    register_goal(v_match_id, get_p_id('Adriel', 'Ba Loua', v_h_id), 65, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 65, 'ASSIST', v_match_id, get_p_id('Stjepan', 'Loncar', v_h_id));
    register_goal(v_match_id, get_p_id('Rasmus', 'Carstensen', v_h_id), 16, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 16, 'ASSIST', v_match_id, get_p_id('Elias', 'Andersson', v_h_id));
    register_goal(v_match_id, get_p_id('Patryk', 'Romanowski', v_a_id), 20, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 20, 'ASSIST', v_match_id, get_p_id('Oskar', 'Jez', v_a_id));
    reg_card(v_match_id, get_p_id('Ian', 'Hoffmann', v_h_id), 21, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Bartosz', 'Mrozek', v_h_id), get_p_id('Rasmus', 'Carstensen', v_h_id), 56);

    -- ROUND 5: Korona Kielce vs Lechia Gdańsk
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Korona Kielce');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Lechia Gdańsk');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-16', 'YYYY-MM-DD'), 0, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Niedbała', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milosz', 'Trojak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Kośmicki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Malarczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominick', 'Zator', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andrzej', 'Wójcik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Xavier', 'Dziekoński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Pięczek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Gutowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Loup-Diwan', 'Gueho', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miłosz', 'Kałahur', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bujar', 'Pllana', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Elias', 'Olsson', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Viunnyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karl', 'Wendt', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergiy', 'Buletsa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Głogowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Sezonienko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Camilo', 'Mena', v_a_id));
    register_goal(v_match_id, get_p_id('Bujar', 'Pllana', v_a_id), 44, 0);
    register_goal(v_match_id, get_p_id('Kacper', 'Sezonienko', v_a_id), 39, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 39, 'ASSIST', v_match_id, get_p_id('Miłosz', 'Kałahur', v_a_id));
    register_goal(v_match_id, get_p_id('Elias', 'Olsson', v_a_id), 76, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 76, 'ASSIST', v_match_id, get_p_id('Kacper', 'Gutowski', v_a_id));
    register_goal(v_match_id, get_p_id('Bogdan', 'Viunnyk', v_a_id), 29, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 29, 'ASSIST', v_match_id, get_p_id('Karl', 'Wendt', v_a_id));
    reg_card(v_match_id, get_p_id('Michał', 'Niedbała', v_h_id), 29, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Rafał', 'Mamla', v_h_id), get_p_id('Szymon', 'Kozłowski', v_h_id), 85);

    -- ROUND 5: GKS Katowice vs Widzew Łódź
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('GKS Katowice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Widzew Łódź');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-16', 'YYYY-MM-DD'), 0, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Strączek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Kaduk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alan', 'Czerwiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Jędrych', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Trepka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Drachal', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Gruszkowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Bergier', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Arak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Szymczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Biegański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luis', 'Silva', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Krajewski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juan', 'Ibiza', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Therkildsen', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Kerk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Kwiatkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hilary', 'Gong', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Sobol', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_a_id));

    -- ROUND 5: Stal Mielec vs Radomiak Radom
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Stal Mielec');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Radomiak Radom');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-16', 'YYYY-MM-DD'), 0, 3, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Mądrzyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bert', 'Esselink', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Matras', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marvin', 'Senger', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Ehmann', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Domanski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fryderyk', 'Gerbowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krystian', 'Getinger', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Robert', 'Dadok', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ravve', 'Assayag', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Kikolski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Grzesik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Steve', 'Kingue', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zié', 'Ouattara', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rahil', 'Mammadov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Francisco', 'Ramos', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Mazur', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renat', 'Dadashov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Saad', 'Agouzoul', v_a_id));
    register_goal(v_match_id, get_p_id('Wojciech', 'Mazur', v_a_id), 15, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 15, 'ASSIST', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    register_goal(v_match_id, get_p_id('Rahil', 'Mammadov', v_a_id), 15, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 15, 'ASSIST', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    register_goal(v_match_id, get_p_id('Francisco', 'Ramos', v_a_id), 38, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 38, 'ASSIST', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    reg_card(v_match_id, get_p_id('Maciej', 'Domanski', v_h_id), 29, 'YELLOW_CARD');

    -- ROUND 5: Puszcza Niepołomice vs Piast Gliwice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Puszcza Niepołomice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Piast Gliwice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-16', 'YYYY-MM-DD'), 2, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kewin', 'Komar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Roman', 'Yakuba', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Crăciun', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Sołowiej', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Abramowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jani', 'Atanasov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klimek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Mroziński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Szymański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Huk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Pyrka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Levis', 'Pitan', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Czerwiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kopczyński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Dziczek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Grzegorz', 'Tomasiewicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Thierry', 'Gale', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Erik', 'Jirka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jorge', 'Felix', v_a_id));
    register_goal(v_match_id, get_p_id('Dawid', 'Szymonowicz', v_h_id), 86, 1);
    register_goal(v_match_id, get_p_id('Piotr', 'Mroziński', v_h_id), 61, 1);
    register_goal(v_match_id, get_p_id('Grzegorz', 'Tomasiewicz', v_a_id), 36, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 36, 'ASSIST', v_match_id, get_p_id('Levis', 'Pitan', v_a_id));
    register_goal(v_match_id, get_p_id('Erik', 'Jirka', v_a_id), 39, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 39, 'ASSIST', v_match_id, get_p_id('Jakub', 'Czerwiński', v_a_id));
    reg_card(v_match_id, get_p_id('Artur', 'Crăciun', v_h_id), 82, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Hubert', 'Tomalski', v_h_id), get_p_id('Piotr', 'Mroziński', v_h_id), 63);

    -- ROUND 5: Raków Częstochowa vs Śląsk Wrocław
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Raków Częstochowa');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Śląsk Wrocław');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-16', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dusan', 'Kuciak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Racovitan', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ariel', 'Mosór', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pestka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matej', 'Rodin', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jean Carlos', 'Silva', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Czyż', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gustav', 'Berggren', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('David', 'Ezeh', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Walczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Basse', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Loska', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Petkov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yegor', 'Matsenko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Llinares', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Petr', 'Schwarz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcin', 'Cebula', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Kowalski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Samiec-Talar', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żukowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Świerczok', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Musiolik', v_a_id));
    register_goal(v_match_id, get_p_id('Dusan', 'Kuciak', v_h_id), 87, 1);
    register_goal(v_match_id, get_p_id('Alex', 'Petkov', v_a_id), 19, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 19, 'ASSIST', v_match_id, get_p_id('Marc', 'Llinares', v_a_id));
    reg_card(v_match_id, get_p_id('Bogdan', 'Racovitan', v_h_id), 87, 'YELLOW_CARD');

    -- ROUND 5: Legia Warszawa vs Zagłębie Lubin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Legia Warszawa');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Zagłębie Lubin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-16', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Zielinski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Ziolkowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Burch', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Kun', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Wszołek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Adkonis', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Wyganowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Augustyniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jordan', 'Majchrzak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Pekhart', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Chodyna', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jasmin', 'Burić', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleks', 'Ławniczak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jaroslaw', 'Jach', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Michalski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Nalepa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Makowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Orlikowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kurminowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_a_id));
    register_goal(v_match_id, get_p_id('Aleksander', 'Wyganowski', v_h_id), 7, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 7, 'ASSIST', v_match_id, get_p_id('Paweł', 'Wszołek', v_h_id));
    register_goal(v_match_id, get_p_id('Damian', 'Michalski', v_a_id), 23, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 23, 'ASSIST', v_match_id, get_p_id('Jasmin', 'Burić', v_a_id));
    reg_sub(v_match_id, get_p_id('Wojciech', 'Urbański', v_h_id), get_p_id('Aleksander', 'Wyganowski', v_h_id), 85);

    -- ROUND 5: Jagiellonia Białystok vs Górnik Zabrze
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Jagiellonia Białystok');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Górnik Zabrze');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-16', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miłosz', 'Piekutowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Kovacik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Cezary', 'Polak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Enzo', 'Ebosse', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Olszewski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aurélien', 'Nguiamba', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Taras', 'Romanczuk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Łaski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Edi', 'Semedo', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Marczuk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Darko', 'Churlinov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Szromnik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Janicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Olkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Prebsl', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matúš', 'Kmeť', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matija', 'Marsenić', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Hellebrand', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Ambros', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Buksa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luka', 'Zahović', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abbati', 'Abdullahi', v_a_id));
    register_goal(v_match_id, get_p_id('Miłosz', 'Piekutowski', v_h_id), 89, 1);
    register_goal(v_match_id, get_p_id('Patrik', 'Hellebrand', v_a_id), 20, 0);
    reg_sub(v_match_id, get_p_id('Bartosz', 'Mazurek', v_h_id), get_p_id('Paweł', 'Olszewski', v_h_id), 58);

    -- ROUND 5: Cracovia vs Pogoń Szczecin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Cracovia');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Pogoń Szczecin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-16', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Madejski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arttu', 'Hoskonen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Virgil', 'Ghiță', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Jugas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Wójcik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Polak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Martin', 'Minchev', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Lachowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamin', 'Kallman', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mick', 'van Buren', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jani', 'Atanasov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Linus', 'Wahlqvist', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamín', 'Rojas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Zawadzki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Danijel', 'Loncar', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stanislaw', 'Wawrzynowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Kurzawa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fredrik', 'Ulvestad', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Olaf', 'Korczakowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renyer', 'Renyer', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Bak', v_a_id));
    register_goal(v_match_id, get_p_id('Virgil', 'Ghiță', v_h_id), 16, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 16, 'ASSIST', v_match_id, get_p_id('Benjamin', 'Kallman', v_h_id));
    register_goal(v_match_id, get_p_id('Jakub', 'Zawadzki', v_a_id), 75, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 75, 'ASSIST', v_match_id, get_p_id('Fredrik', 'Ulvestad', v_a_id));

    -- ROUND 6: Lech Poznań vs Lechia Gdańsk
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lech Poznań');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Lechia Gdańsk');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-23', 'YYYY-MM-DD'), 4, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Mędrala', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antonio', 'Milic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Joel', 'Pereira', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Salamon', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Gurgul', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sammy', 'Dudek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Radosław', 'Murawski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Afonso', 'Sousa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Walemark', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikael', 'Ishak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ali', 'Gholizadeh', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Weirauch', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Brylowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Elias', 'Olsson', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bujar', 'Pllana', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andrei', 'Chindriș', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rifet', 'Kapic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Neugebauer', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Bajko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Sezonienko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Bobcek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maksym', 'Khlan', v_a_id));
    register_goal(v_match_id, get_p_id('Bartosz', 'Salamon', v_h_id), 18, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 18, 'ASSIST', v_match_id, get_p_id('Mateusz', 'Mędrala', v_h_id));
    register_goal(v_match_id, get_p_id('Afonso', 'Sousa', v_h_id), 14, 1);
    register_goal(v_match_id, get_p_id('Bartosz', 'Salamon', v_h_id), 62, 1);
    register_goal(v_match_id, get_p_id('Antonio', 'Milic', v_h_id), 11, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 11, 'ASSIST', v_match_id, get_p_id('Radosław', 'Murawski', v_h_id));
    register_goal(v_match_id, get_p_id('Tomasz', 'Neugebauer', v_a_id), 35, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 35, 'ASSIST', v_match_id, get_p_id('Kacper', 'Sezonienko', v_a_id));
    reg_sub(v_match_id, get_p_id('Filip', 'Jagiełło', v_h_id), get_p_id('Michał', 'Gurgul', v_h_id), 55);

    -- ROUND 6: Motor Lublin vs Widzew Łódź
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Motor Lublin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Widzew Łódź');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-23', 'YYYY-MM-DD'), 0, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gasper', 'Tratnik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Stolarski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marek', 'Bartos', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krystian', 'Palacz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Luberecki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafal', 'Krol', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kaan', 'Caliskaner', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergi', 'Samper', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Ceglarz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mbaye', 'Ndiaye', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Król', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Gikiewicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luis', 'Silva', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Krajewski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żyro', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juan', 'Ibiza', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Kerk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marek', 'Hanousek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Woźniak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hilary', 'Gong', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Sobol', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Krzywański', v_a_id));
    register_goal(v_match_id, get_p_id('Marek', 'Hanousek', v_a_id), 89, 0);
    register_goal(v_match_id, get_p_id('Jan', 'Krzywański', v_a_id), 90, 0);
    register_goal(v_match_id, get_p_id('Marcel', 'Krajewski', v_a_id), 32, 0);
    register_goal(v_match_id, get_p_id('Juan', 'Ibiza', v_a_id), 69, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 69, 'ASSIST', v_match_id, get_p_id('Rafał', 'Gikiewicz', v_a_id));
    reg_card(v_match_id, get_p_id('Michał', 'Król', v_h_id), 90, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Kamil', 'Kruk', v_h_id), get_p_id('Filip', 'Luberecki', v_h_id), 47);

    -- ROUND 6: Korona Kielce vs Radomiak Radom
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Korona Kielce');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Radomiak Radom');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-23', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Niedbała', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Pięczek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartłomiej', 'Smolarczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milosz', 'Trojak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Pau', 'Resta', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yoav', 'Hofmayster', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Woźniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Mikielewicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Kwiatkowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Kikolski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pestka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rahil', 'Mammadov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zié', 'Ouattara', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cichocki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bruno', 'Jordão', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Roberto', 'Alves', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafael', 'Barbosa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renat', 'Dadashov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paulius', 'Golubickas', v_a_id));
    register_goal(v_match_id, get_p_id('Michał', 'Mikielewicz', v_h_id), 36, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 36, 'ASSIST', v_match_id, get_p_id('Pau', 'Resta', v_h_id));
    register_goal(v_match_id, get_p_id('Rahil', 'Mammadov', v_a_id), 52, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 52, 'ASSIST', v_match_id, get_p_id('Renat', 'Dadashov', v_a_id));

    -- ROUND 6: GKS Katowice vs Piast Gliwice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('GKS Katowice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Piast Gliwice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-23', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Strączek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alan', 'Czerwiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Märten', 'Kuusk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Klemenz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Trepka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Mak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Danek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Drachal', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Arak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Bergier', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Zrelak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartlomiej', 'Jelonek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Akim', 'Zedadka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lewicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miguel', 'Muñoz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miguel', 'Nóbrega', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Grzegorz', 'Tomasiewicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Dziczek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tihomir', 'Kostadinov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Erik', 'Jirka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andreas', 'Katsantonis', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Thierry', 'Gale', v_a_id));
    register_goal(v_match_id, get_p_id('Dawid', 'Drachal', v_h_id), 19, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 19, 'ASSIST', v_match_id, get_p_id('Rafał', 'Strączek', v_h_id));
    register_goal(v_match_id, get_p_id('Patryk', 'Dziczek', v_a_id), 70, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 70, 'ASSIST', v_match_id, get_p_id('Jakub', 'Lewicki', v_a_id));

    -- ROUND 6: Stal Mielec vs Śląsk Wrocław
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Stal Mielec');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Śląsk Wrocław');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-23', 'YYYY-MM-DD'), 1, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Jałocha', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Matras', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marvin', 'Senger', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Ehmann', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alvis', 'Jaunzems', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Pyry', 'Hannola', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergiy', 'Krykun', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Wołkowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ravve', 'Assayag', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Robert', 'Dadok', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Cavaleiro', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Loska', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Petkov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yegor', 'Matsenko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Llinares', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Szymański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Szymański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żukowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Musiolik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Świerczok', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Pokorný', v_a_id));
    register_goal(v_match_id, get_p_id('Alvis', 'Jaunzems', v_h_id), 16, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 16, 'ASSIST', v_match_id, get_p_id('Konrad', 'Jałocha', v_h_id));
    register_goal(v_match_id, get_p_id('Tomasz', 'Loska', v_a_id), 49, 0);
    register_goal(v_match_id, get_p_id('Sebastian', 'Musiolik', v_a_id), 66, 0);
    register_goal(v_match_id, get_p_id('Jakub', 'Szymański', v_a_id), 29, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 29, 'ASSIST', v_match_id, get_p_id('Marc', 'Llinares', v_a_id));
    register_goal(v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_a_id), 18, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 18, 'ASSIST', v_match_id, get_p_id('Peter', 'Pokorný', v_a_id));
    reg_card(v_match_id, get_p_id('Jakub', 'Szymański', v_a_id), 57, 'RED_CARD');

    -- ROUND 6: Puszcza Niepołomice vs Zagłębie Lubin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Puszcza Niepołomice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Zagłębie Lubin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-23', 'YYYY-MM-DD'), 1, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Perchel', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michal', 'Siplak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Sołowiej', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Mroziński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Abramowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Radecki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jani', 'Atanasov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klimek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakov', 'Blagaic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Hładun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Nalepa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Michalski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleks', 'Ławniczak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jaroslaw', 'Jach', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Makowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kurminowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Matys', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Kowalski', v_a_id));
    register_goal(v_match_id, get_p_id('Dawid', 'Abramowicz', v_h_id), 61, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 61, 'ASSIST', v_match_id, get_p_id('Antoni', 'Klimek', v_h_id));
    register_goal(v_match_id, get_p_id('Tomasz', 'Makowski', v_a_id), 42, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 42, 'ASSIST', v_match_id, get_p_id('Michał', 'Nalepa', v_a_id));
    register_goal(v_match_id, get_p_id('Jaroslaw', 'Jach', v_a_id), 63, 0);
    register_goal(v_match_id, get_p_id('Jan', 'Kowalski', v_a_id), 48, 0);
    register_goal(v_match_id, get_p_id('Michał', 'Matys', v_a_id), 34, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 34, 'ASSIST', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    reg_sub(v_match_id, get_p_id('Hubert', 'Tomalski', v_h_id), get_p_id('Antoni', 'Klimek', v_h_id), 63);

    -- ROUND 6: Raków Częstochowa vs Górnik Zabrze
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Raków Częstochowa');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Górnik Zabrze');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-23', 'YYYY-MM-DD'), 3, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Muhamed', 'Sahinovic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milan', 'Rundic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stratos', 'Svarnas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zoran', 'Arsenic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matej', 'Rodin', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adriano', 'Adriano', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivi', 'López', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ibrahima', 'Seck', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jonatan Braut', 'Brunes', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('David', 'Ezeh', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Basse', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Majchrowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Erik', 'Janza', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Olkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matúš', 'Kmeť', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Radosław', 'Szafrański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Ambros', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matija', 'Marsenić', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Hellebrand', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sondre', 'Liseth', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sinan', 'Bakış', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Buksa', v_a_id));
    register_goal(v_match_id, get_p_id('Adriano', 'Adriano', v_h_id), 9, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 9, 'ASSIST', v_match_id, get_p_id('Adam', 'Basse', v_h_id));
    register_goal(v_match_id, get_p_id('Ivi', 'López', v_h_id), 76, 1);
    register_goal(v_match_id, get_p_id('Ibrahima', 'Seck', v_h_id), 46, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 46, 'ASSIST', v_match_id, get_p_id('Ivi', 'López', v_h_id));
    register_goal(v_match_id, get_p_id('Sinan', 'Bakış', v_a_id), 31, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 31, 'ASSIST', v_match_id, get_p_id('Matúš', 'Kmeť', v_a_id));
    reg_card(v_match_id, get_p_id('Ibrahima', 'Seck', v_h_id), 8, 'YELLOW_CARD');

    -- ROUND 6: Legia Warszawa vs Pogoń Szczecin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Legia Warszawa');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Pogoń Szczecin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-23', 'YYYY-MM-DD'), 0, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gabriel', 'Kobylak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Jędrzejczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Wszołek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergio', 'Barcia', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Ziolkowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oliwier', 'Olewiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maxi', 'Oyedele', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Augustyniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Blaz', 'Kramer', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Gual', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Chodyna', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mariusz', 'Malec', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dimitrios', 'Keramitsis', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Zawadzki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Danijel', 'Loncar', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Kurzawa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stanislaw', 'Wawrzynowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Przyborek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Efthymios', 'Koulouris', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Olaf', 'Korczakowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klukowski', v_a_id));
    register_goal(v_match_id, get_p_id('Efthymios', 'Koulouris', v_a_id), 28, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 28, 'ASSIST', v_match_id, get_p_id('Krzysztof', 'Kamiński', v_a_id));
    register_goal(v_match_id, get_p_id('Antoni', 'Klukowski', v_a_id), 69, 0);
    register_goal(v_match_id, get_p_id('Olaf', 'Korczakowski', v_a_id), 45, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 45, 'ASSIST', v_match_id, get_p_id('Rafał', 'Kurzawa', v_a_id));
    register_goal(v_match_id, get_p_id('Stanislaw', 'Wawrzynowicz', v_a_id), 8, 0);
    reg_sub(v_match_id, get_p_id('Claude', 'Gonçalves', v_h_id), get_p_id('Kacper', 'Chodyna', v_h_id), 78);

    -- ROUND 6: Jagiellonia Białystok vs Cracovia
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Jagiellonia Białystok');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Cracovia');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-23', 'YYYY-MM-DD'), 0, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Suchocki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Olszewski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jetmir', 'Haliti', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dimitrios', 'Retsos', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Kovacik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Mazurek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jesus', 'Imaz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lamine', 'Diaby-Fadiga', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Afimico', 'Pululu', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Darko', 'Churlinov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Edi', 'Semedo', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Madejski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Wójcik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Jaroszyński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Janasik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Virgil', 'Ghiță', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ajdin', 'Hasic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fabian', 'Bzdyl', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Otar', 'Kakabadze', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamin', 'Kallman', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mick', 'van Buren', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Sokołowski', v_a_id));
    reg_card(v_match_id, get_p_id('Edi', 'Semedo', v_h_id), 53, 'YELLOW_CARD');

    -- ROUND 7: Lech Poznań vs Widzew Łódź
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lech Poznań');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Widzew Łódź');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-30', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Mrozek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antonio', 'Milic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dagerstal', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Joel', 'Pereira', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maksymilian', 'Pingot', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gísli', 'Thórdarson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Afonso', 'Sousa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rasmus', 'Carstensen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adriel', 'Ba Loua', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kornel', 'Lisman', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Walemark', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Gikiewicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Krajewski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juan', 'Ibiza', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luis', 'Silva', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Therkildsen', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Lewandowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Woźniak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hilary', 'Gong', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Sobol', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juljan', 'Shehu', v_a_id));
    register_goal(v_match_id, get_p_id('Kornel', 'Lisman', v_h_id), 43, 1);
    register_goal(v_match_id, get_p_id('Hubert', 'Sobol', v_a_id), 89, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 89, 'ASSIST', v_match_id, get_p_id('Adam', 'Woźniak', v_a_id));
    reg_card(v_match_id, get_p_id('Joel', 'Pereira', v_h_id), 43, 'YELLOW_CARD');

    -- ROUND 7: Lechia Gdańsk vs Radomiak Radom
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lechia Gdańsk');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Radomiak Radom');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-30', 'YYYY-MM-DD'), 1, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Gutowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Loup-Diwan', 'Gueho', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Brylowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andrei', 'Chindriș', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bujar', 'Pllana', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Kardas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rifet', 'Kapic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Biegański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Głogowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Bobcek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Camilo', 'Mena', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wiktor', 'Koptas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Steve', 'Kingue', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Saad', 'Agouzoul', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zié', 'Ouattara', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cichocki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paulius', 'Golubickas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Woźniak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Roberto', 'Alves', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renat', 'Dadashov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pestka', v_a_id));
    register_goal(v_match_id, get_p_id('Michał', 'Głogowski', v_h_id), 26, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 26, 'ASSIST', v_match_id, get_p_id('Adam', 'Kardas', v_h_id));
    register_goal(v_match_id, get_p_id('Abdoul', 'Tapsoba', v_a_id), 28, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 28, 'ASSIST', v_match_id, get_p_id('Steve', 'Kingue', v_a_id));
    register_goal(v_match_id, get_p_id('Roberto', 'Alves', v_a_id), 67, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 67, 'ASSIST', v_match_id, get_p_id('Kamil', 'Pestka', v_a_id));
    reg_injury(v_match_id, get_p_id('Jan', 'Biegański', v_h_id), 32, 14);

    -- ROUND 7: Motor Lublin vs Piast Gliwice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Motor Lublin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Piast Gliwice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-30', 'YYYY-MM-DD'), 0, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Jez', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Wójcik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Luberecki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hervé', 'Matthys', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Najemski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kaan', 'Caliskaner', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mathieu', 'Scalet', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Wolski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Mráz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bradly van', 'Hoeven', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mbaye', 'Ndiaye', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Rychta', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lewicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miguel', 'Nóbrega', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Huk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Mokwa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Dziczek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Karbowy', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miłosz', 'Szczepański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fabian', 'Piasecki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Thierry', 'Gale', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Erik', 'Jirka', v_a_id));
    register_goal(v_match_id, get_p_id('Filip', 'Karbowy', v_a_id), 55, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 55, 'ASSIST', v_match_id, get_p_id('Patryk', 'Dziczek', v_a_id));

    -- ROUND 7: Korona Kielce vs Śląsk Wrocław
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Korona Kielce');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Śląsk Wrocław');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-30', 'YYYY-MM-DD'), 0, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Mamla', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milosz', 'Trojak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konstantinos', 'Sotiriou', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Pau', 'Resta', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Malarczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andrzej', 'Wójcik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Martin', 'Remacle', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartłomiej', 'Smolarczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Leszczyński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Petkov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yegor', 'Matsenko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Llinares', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tudor', 'Băluță', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Kowalski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żukowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Samiec-Talar', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Świerczok', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    reg_card(v_match_id, get_p_id('Milosz', 'Trojak', v_h_id), 50, 'YELLOW_CARD');

    -- ROUND 7: GKS Katowice vs Zagłębie Lubin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('GKS Katowice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Zagłębie Lubin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-30', 'YYYY-MM-DD'), 4, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Przemyslaw', 'Peksa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Jędrych', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Jaroszek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Kaduk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alan', 'Czerwiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Gruszkowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Danek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Baranowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Bergier', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Szymczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Zrelak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Matys', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleks', 'Ławniczak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Michalski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jaroslaw', 'Jach', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Nalepa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kurminowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Josip', 'Corluka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Dąbrowski', v_a_id));
    register_goal(v_match_id, get_p_id('Filip', 'Szymczak', v_h_id), 33, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 33, 'ASSIST', v_match_id, get_p_id('Bartosz', 'Baranowicz', v_h_id));
    register_goal(v_match_id, get_p_id('Konrad', 'Gruszkowski', v_h_id), 81, 1);
    register_goal(v_match_id, get_p_id('Bartosz', 'Baranowicz', v_h_id), 56, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 56, 'ASSIST', v_match_id, get_p_id('Adam', 'Zrelak', v_h_id));
    register_goal(v_match_id, get_p_id('Arkadiusz', 'Jędrych', v_h_id), 9, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 9, 'ASSIST', v_match_id, get_p_id('Adrian', 'Danek', v_h_id));
    register_goal(v_match_id, get_p_id('Aleks', 'Ławniczak', v_a_id), 76, 0);
    reg_sub(v_match_id, get_p_id('Shun', 'Shibata', v_h_id), get_p_id('Adrian', 'Danek', v_h_id), 54);

    -- ROUND 7: Stal Mielec vs Górnik Zabrze
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Stal Mielec');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Górnik Zabrze');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-30', 'YYYY-MM-DD'), 0, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Dybowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bert', 'Esselink', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pajnowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alvis', 'Jaunzems', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Matras', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Wołkowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fryderyk', 'Gerbowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Tkacz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ravve', 'Assayag', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Robert', 'Dadok', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Jeleń', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matúš', 'Kmeť', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Janicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Szala', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Radosław', 'Szafrański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matija', 'Marsenić', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Ambros', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Hellebrand', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ousmane', 'Sow', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yosuke', 'Furukawa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Podolski', v_a_id));
    register_goal(v_match_id, get_p_id('Lukas', 'Ambros', v_a_id), 15, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 15, 'ASSIST', v_match_id, get_p_id('Rafał', 'Janicki', v_a_id));
    register_goal(v_match_id, get_p_id('Patrik', 'Hellebrand', v_a_id), 33, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 33, 'ASSIST', v_match_id, get_p_id('Dominik', 'Szala', v_a_id));
    register_goal(v_match_id, get_p_id('Matija', 'Marsenić', v_a_id), 34, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 34, 'ASSIST', v_match_id, get_p_id('Yosuke', 'Furukawa', v_a_id));
    register_goal(v_match_id, get_p_id('Rafał', 'Janicki', v_a_id), 57, 0);
    reg_card(v_match_id, get_p_id('Alvis', 'Jaunzems', v_h_id), 42, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Jakub', 'Mądrzyk', v_h_id), get_p_id('Dawid', 'Tkacz', v_h_id), 49);

    -- ROUND 7: Puszcza Niepołomice vs Pogoń Szczecin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Puszcza Niepołomice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Pogoń Szczecin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-30', 'YYYY-MM-DD'), 4, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Perchel', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Roman', 'Yakuba', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Crăciun', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Sołowiej', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Stępień', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klimek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Legowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Léo', 'Borges', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dimitrios', 'Keramitsis', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mariusz', 'Malec', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Zawadzki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fredrik', 'Ulvestad', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Wędrychowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('João', 'Gamboa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renyer', 'Renyer', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Efthymios', 'Koulouris', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Olaf', 'Korczakowski', v_a_id));
    register_goal(v_match_id, get_p_id('Artur', 'Crăciun', v_h_id), 71, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 71, 'ASSIST', v_match_id, get_p_id('Filip', 'Dąbrowski', v_h_id));
    register_goal(v_match_id, get_p_id('Łukasz', 'Kamiński', v_h_id), 90, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 90, 'ASSIST', v_match_id, get_p_id('Artur', 'Crăciun', v_h_id));
    register_goal(v_match_id, get_p_id('Artur', 'Crăciun', v_h_id), 41, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 41, 'ASSIST', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_h_id));
    register_goal(v_match_id, get_p_id('Artur', 'Crăciun', v_h_id), 30, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 30, 'ASSIST', v_match_id, get_p_id('Roman', 'Yakuba', v_h_id));
    register_goal(v_match_id, get_p_id('João', 'Gamboa', v_a_id), 11, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 11, 'ASSIST', v_match_id, get_p_id('Mariusz', 'Malec', v_a_id));

    -- ROUND 7: Raków Częstochowa vs Cracovia
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Raków Częstochowa');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Cracovia');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-30', 'YYYY-MM-DD'), 1, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dusan', 'Kuciak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Racovitan', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stratos', 'Svarnas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ariel', 'Mosór', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pestka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ibrahima', 'Seck', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gustav', 'Berggren', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Vasilios', 'Sourlis', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Walczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jonatan Braut', 'Brunes', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('David', 'Ezeh', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Burek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Virgil', 'Ghiță', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Jaroszyński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kuba', 'Pestka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Janasik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Otar', 'Kakabadze', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Sokołowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Biedrzycki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamin', 'Kallman', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mick', 'van Buren', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Bochnak', v_a_id));
    register_goal(v_match_id, get_p_id('David', 'Ezeh', v_h_id), 74, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 74, 'ASSIST', v_match_id, get_p_id('Stratos', 'Svarnas', v_h_id));
    register_goal(v_match_id, get_p_id('Otar', 'Kakabadze', v_a_id), 50, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 50, 'ASSIST', v_match_id, get_p_id('Mateusz', 'Bochnak', v_a_id));
    register_goal(v_match_id, get_p_id('Kuba', 'Pestka', v_a_id), 5, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 5, 'ASSIST', v_match_id, get_p_id('Benjamin', 'Kallman', v_a_id));
    register_goal(v_match_id, get_p_id('Jakub', 'Burek', v_a_id), 61, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 61, 'ASSIST', v_match_id, get_p_id('Otar', 'Kakabadze', v_a_id));
    register_goal(v_match_id, get_p_id('Otar', 'Kakabadze', v_a_id), 62, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 62, 'ASSIST', v_match_id, get_p_id('Kuba', 'Pestka', v_a_id));
    reg_card(v_match_id, get_p_id('Jonatan Braut', 'Brunes', v_h_id), 50, 'YELLOW_CARD');
    COMMIT;
END;
/
