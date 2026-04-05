
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

    -- ROUND 14: Widzew Łódź vs Korona Kielce
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Widzew Łódź');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Korona Kielce');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-18', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Biegański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Therkildsen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Kozlovský', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juan', 'Ibiza', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żyro', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juljan', 'Shehu', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Lewandowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hilary', 'Gong', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Sobol', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fran', 'Alvarez', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Niedbała', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konstantinos', 'Sotiriou', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Pięczek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominick', 'Zator', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Malarczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andrzej', 'Wójcik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Mamla', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Woźniak', v_a_id));
    register_goal(v_match_id, get_p_id('Peter', 'Therkildsen', v_h_id), 69, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 69, 'ASSIST', v_match_id, get_p_id('Samuel', 'Kozlovský', v_h_id));
    register_goal(v_match_id, get_p_id('Andrzej', 'Wójcik', v_a_id), 7, 0);

    -- ROUND 14: Lechia Gdańsk vs Motor Lublin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lechia Gdańsk');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Motor Lublin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-18', 'YYYY-MM-DD'), 4, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Sarnavskyi', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Loup-Diwan', 'Gueho', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Conrado', 'Conrado', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Elias', 'Olsson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Wójtowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Zhelizko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Kardas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Bajko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maksym', 'Khlan', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Bobcek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Sezonienko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gasper', 'Tratnik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bright', 'Ede', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Luberecki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Murzacz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Najemski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergi', 'Samper', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Christopher', 'Simon', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Franciszek', 'Lewandowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Król', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Ceglarz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mbaye', 'Ndiaye', v_a_id));
    register_goal(v_match_id, get_p_id('Ivan', 'Zhelizko', v_h_id), 76, 1);
    register_goal(v_match_id, get_p_id('Loup-Diwan', 'Gueho', v_h_id), 63, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 63, 'ASSIST', v_match_id, get_p_id('Tomas', 'Bobcek', v_h_id));
    register_goal(v_match_id, get_p_id('Ivan', 'Zhelizko', v_h_id), 58, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 58, 'ASSIST', v_match_id, get_p_id('Maksym', 'Khlan', v_h_id));
    register_goal(v_match_id, get_p_id('Adam', 'Kardas', v_h_id), 9, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 9, 'ASSIST', v_match_id, get_p_id('Tomas', 'Bobcek', v_h_id));
    reg_sub(v_match_id, get_p_id('Bartosz', 'Borkowski', v_h_id), get_p_id('Kacper', 'Sezonienko', v_h_id), 80);

    -- ROUND 15: Lech Poznań vs Jagiellonia Białystok
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lech Poznań');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Jagiellonia Białystok');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-25', 'YYYY-MM-DD'), 1, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Mrozek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ian', 'Hoffmann', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antonio', 'Milic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Joel', 'Pereira', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maksymilian', 'Pingot', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sammy', 'Dudek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Radosław', 'Murawski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Brzyski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kristoffer', 'Velde', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bryan', 'Fiabema', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mario', 'González', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Suchocki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dimitrios', 'Retsos', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Cezary', 'Polak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Sacek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Olszewski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Mazurek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Nené', 'Nené', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcin', 'Listkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Darko', 'Churlinov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miki', 'Villar', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kristoffer', 'Hansen', v_a_id));
    register_goal(v_match_id, get_p_id('Igor', 'Brzyski', v_h_id), 13, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 13, 'ASSIST', v_match_id, get_p_id('Antonio', 'Milic', v_h_id));
    reg_card(v_match_id, get_p_id('Mario', 'González', v_h_id), 25, 'YELLOW_CARD');

    -- ROUND 15: Cracovia vs Legia Warszawa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Cracovia');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Legia Warszawa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-25', 'YYYY-MM-DD'), 3, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Henrich', 'Ravas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gustav', 'Henriksson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kuba', 'Pestka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Virgil', 'Ghiță', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andreas', 'Skovgaard', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jani', 'Atanasov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikkel', 'Maigaard', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mauro', 'Perkovic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamin', 'Kallman', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mick', 'van Buren', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fabian', 'Bzdyl', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Banasik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Kun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Jędrzejczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Wszołek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rúben', 'Vinagre', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juergen', 'Elitim', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Żewłakow', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Strzałek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michal', 'Kucharczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jordan', 'Majchrzak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Migouel', 'Alfarela', v_a_id));
    register_goal(v_match_id, get_p_id('Kuba', 'Pestka', v_h_id), 5, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 5, 'ASSIST', v_match_id, get_p_id('Mick', 'van Buren', v_h_id));
    register_goal(v_match_id, get_p_id('Fabian', 'Bzdyl', v_h_id), 73, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 73, 'ASSIST', v_match_id, get_p_id('Mick', 'van Buren', v_h_id));
    register_goal(v_match_id, get_p_id('Mauro', 'Perkovic', v_h_id), 64, 1);
    reg_card(v_match_id, get_p_id('Mikkel', 'Maigaard', v_h_id), 38, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Patryk', 'Sokołowski', v_h_id), get_p_id('Andreas', 'Skovgaard', v_h_id), 56);

    -- ROUND 15: Pogoń Szczecin vs Raków Częstochowa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Pogoń Szczecin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Raków Częstochowa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-25', 'YYYY-MM-DD'), 0, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Valentin', 'Cojocaru', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamín', 'Rojas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lis', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mariusz', 'Malec', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Lisowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Przyborek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Wędrychowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alexander', 'Gorgon', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Grosicki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Bak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klukowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dusan', 'Kuciak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ariel', 'Mosór', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milan', 'Rundic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stratos', 'Svarnas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Racovitan', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gustav', 'Berggren', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adriano', 'Adriano', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Nowak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('David', 'Ezeh', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lazaros', 'Lamprou', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jonatan Braut', 'Brunes', v_a_id));
    reg_sub(v_match_id, get_p_id('Efthymios', 'Koulouris', v_h_id), get_p_id('Benjamín', 'Rojas', v_h_id), 53);

    -- ROUND 15: Górnik Zabrze vs Puszcza Niepołomice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Górnik Zabrze');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Puszcza Niepołomice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-25', 'YYYY-MM-DD'), 3, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Jeleń', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Prebsl', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matúš', 'Kmeť', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Olkowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Szala', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Ambros', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matija', 'Marsenić', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Hellebrand', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luka', 'Zahović', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Tobolik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Lukoszek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Perchel', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ioan-Calin', 'Revenco', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Mroziński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michal', 'Siplak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jani', 'Atanasov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Serafin', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klimek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Georgiy', 'Zhukov', v_a_id));
    register_goal(v_match_id, get_p_id('Lukas', 'Ambros', v_h_id), 66, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 66, 'ASSIST', v_match_id, get_p_id('Patrik', 'Hellebrand', v_h_id));
    register_goal(v_match_id, get_p_id('Paweł', 'Olkowski', v_h_id), 27, 1);
    register_goal(v_match_id, get_p_id('Luka', 'Zahović', v_h_id), 4, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 4, 'ASSIST', v_match_id, get_p_id('Filip', 'Prebsl', v_h_id));
    register_goal(v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id), 61, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 61, 'ASSIST', v_match_id, get_p_id('Jakub', 'Serafin', v_a_id));
    reg_card(v_match_id, get_p_id('Luka', 'Zahović', v_h_id), 11, 'YELLOW_CARD');

    -- ROUND 15: Zagłębie Lubin vs Stal Mielec
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Zagłębie Lubin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Stal Mielec');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-25', 'YYYY-MM-DD'), 1, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jasmin', 'Burić', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Michalski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Nalepa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleks', 'Ławniczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jaroslaw', 'Jach', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Wdowiak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Makowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kurminowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Pieńko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kevin', 'Szurlej', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alvis', 'Jaunzems', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Matras', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Ehmann', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pajnowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergiy', 'Krykun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Domanski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Pyry', 'Hannola', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Robert', 'Dadok', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Cavaleiro', v_a_id));
    register_goal(v_match_id, get_p_id('Michał', 'Nalepa', v_h_id), 38, 1);
    register_goal(v_match_id, get_p_id('Pyry', 'Hannola', v_a_id), 90, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 90, 'ASSIST', v_match_id, get_p_id('Alvis', 'Jaunzems', v_a_id));
    register_goal(v_match_id, get_p_id('Alvis', 'Jaunzems', v_a_id), 88, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 88, 'ASSIST', v_match_id, get_p_id('Mateusz', 'Matras', v_a_id));
    register_goal(v_match_id, get_p_id('Robert', 'Dadok', v_a_id), 47, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 47, 'ASSIST', v_match_id, get_p_id('Alvis', 'Jaunzems', v_a_id));
    register_goal(v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_a_id), 21, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 21, 'ASSIST', v_match_id, get_p_id('Maciej', 'Domanski', v_a_id));
    reg_card(v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_h_id), 63, 'YELLOW_CARD');
    reg_card(v_match_id, get_p_id('Alvis', 'Jaunzems', v_a_id), 1, 'RED_CARD');
    reg_sub(v_match_id, get_p_id('Mikołaj', 'Jankowski', v_h_id), get_p_id('Mateusz', 'Wdowiak', v_h_id), 74);

    -- ROUND 15: Śląsk Wrocław vs GKS Katowice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Śląsk Wrocław');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('GKS Katowice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-25', 'YYYY-MM-DD'), 2, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Leszczyński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Petkov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yegor', 'Matsenko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Llinares', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jose', 'Pozo', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Świerczok', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Samiec-Talar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Musiolik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Petr', 'Schwarz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Przemyslaw', 'Peksa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Jędrych', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Kaduk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Märten', 'Kuusk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Jaroszek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Danek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Grzegorz', 'Rogala', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Shun', 'Shibata', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Arak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Bergier', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Zrelak', v_a_id));
    register_goal(v_match_id, get_p_id('Filip', 'Dąbrowski', v_h_id), 45, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 45, 'ASSIST', v_match_id, get_p_id('Petr', 'Schwarz', v_h_id));
    register_goal(v_match_id, get_p_id('Marc', 'Llinares', v_h_id), 51, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 51, 'ASSIST', v_match_id, get_p_id('Sebastian', 'Musiolik', v_h_id));
    register_goal(v_match_id, get_p_id('Jakub', 'Arak', v_a_id), 81, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 81, 'ASSIST', v_match_id, get_p_id('Bartosz', 'Jaroszek', v_a_id));
    register_goal(v_match_id, get_p_id('Adrian', 'Danek', v_a_id), 32, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 32, 'ASSIST', v_match_id, get_p_id('Sebastian', 'Bergier', v_a_id));

    -- ROUND 15: Piast Gliwice vs Korona Kielce
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Piast Gliwice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Korona Kielce');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-25', 'YYYY-MM-DD'), 1, 3, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartlomiej', 'Jelonek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lewicki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miguel', 'Nóbrega', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Akim', 'Zedadka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Czerwiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Justin', 'Daniel', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tihomir', 'Kostadinov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Grzegorz', 'Tomasiewicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jorge', 'Felix', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Rosołek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Erik', 'Jirka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Mikielewicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milosz', 'Trojak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominick', 'Zator', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartłomiej', 'Smolarczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konstantinos', 'Sotiriou', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Woźniak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andrzej', 'Wójcik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Kośmicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Malarczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    register_goal(v_match_id, get_p_id('Miguel', 'Nóbrega', v_h_id), 90, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 90, 'ASSIST', v_match_id, get_p_id('Grzegorz', 'Tomasiewicz', v_h_id));
    register_goal(v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id), 52, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 52, 'ASSIST', v_match_id, get_p_id('Igor', 'Kośmicki', v_a_id));
    register_goal(v_match_id, get_p_id('Bartłomiej', 'Smolarczyk', v_a_id), 85, 0);
    register_goal(v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id), 22, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 22, 'ASSIST', v_match_id, get_p_id('Konstantinos', 'Sotiriou', v_a_id));
    reg_sub(v_match_id, get_p_id('Michał', 'Chrapek', v_h_id), get_p_id('Maciej', 'Rosołek', v_h_id), 63);

    -- ROUND 15: Radomiak Radom vs Motor Lublin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Radomiak Radom');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Motor Lublin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-25', 'YYYY-MM-DD'), 0, 3, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wiktor', 'Koptas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Saad', 'Agouzoul', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zié', 'Ouattara', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rahil', 'Mammadov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cichocki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Roberto', 'Alves', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafael', 'Barbosa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renat', 'Dadashov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Christos', 'Donis', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Brkic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Luberecki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marek', 'Bartos', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Kruk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Wójcik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Christopher', 'Simon', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Kubica', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kaan', 'Caliskaner', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Mráz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antonio', 'Sefer', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jean-Kévin', 'Augustin', v_a_id));
    register_goal(v_match_id, get_p_id('Ivan', 'Brkic', v_a_id), 48, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 48, 'ASSIST', v_match_id, get_p_id('Samuel', 'Mráz', v_a_id));
    register_goal(v_match_id, get_p_id('Christopher', 'Simon', v_a_id), 76, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 76, 'ASSIST', v_match_id, get_p_id('Antonio', 'Sefer', v_a_id));
    register_goal(v_match_id, get_p_id('Samuel', 'Mráz', v_a_id), 25, 0);

    -- ROUND 15: Widzew Łódź vs Lechia Gdańsk
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Widzew Łódź');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Lechia Gdańsk');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-25', 'YYYY-MM-DD'), 4, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Gikiewicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Krajewski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Therkildsen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Kozlovský', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żyro', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juljan', 'Shehu', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartłomiej', 'Pawłowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Sypek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hilary', 'Gong', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Sobol', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Lewandowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Sarnavskyi', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Loup-Diwan', 'Gueho', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miłosz', 'Kałahur', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bujar', 'Pllana', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Wójtowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Bajko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Zhelizko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Piła', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Camilo', 'Mena', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maksym', 'Khlan', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Sezonienko', v_a_id));
    register_goal(v_match_id, get_p_id('Jakub', 'Sypek', v_h_id), 67, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 67, 'ASSIST', v_match_id, get_p_id('Hilary', 'Gong', v_h_id));
    register_goal(v_match_id, get_p_id('Bartłomiej', 'Pawłowski', v_h_id), 41, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 41, 'ASSIST', v_match_id, get_p_id('Bartosz', 'Lewandowski', v_h_id));
    register_goal(v_match_id, get_p_id('Peter', 'Therkildsen', v_h_id), 47, 1);
    register_goal(v_match_id, get_p_id('Peter', 'Therkildsen', v_h_id), 44, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 44, 'ASSIST', v_match_id, get_p_id('Hilary', 'Gong', v_h_id));
    register_goal(v_match_id, get_p_id('Bujar', 'Pllana', v_a_id), 42, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 42, 'ASSIST', v_match_id, get_p_id('Kacper', 'Sezonienko', v_a_id));
    reg_card(v_match_id, get_p_id('Mateusz', 'Żyro', v_h_id), 32, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Filip', 'Dąbrowski', v_h_id), get_p_id('Jakub', 'Sypek', v_h_id), 75);

    -- ROUND 16: Lech Poznań vs Legia Warszawa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lech Poznań');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Legia Warszawa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-01', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Bednarek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Wichtowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Salamon', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Mońka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Douglas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tymoteusz', 'Gmur', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jesper', 'Karlström', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Kozubal', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikael', 'Ishak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Szymczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mario', 'González', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gabriel', 'Kobylak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Wszołek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Jędrzejczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rúben', 'Vinagre', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Radovan', 'Pankov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Wyganowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Adkonis', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Jędrasik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Gual', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luquinhas', 'Luquinhas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Blaz', 'Kramer', v_a_id));
    register_goal(v_match_id, get_p_id('Alex', 'Douglas', v_h_id), 16, 1);
    register_goal(v_match_id, get_p_id('Rúben', 'Vinagre', v_a_id), 13, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 13, 'ASSIST', v_match_id, get_p_id('Paweł', 'Wszołek', v_a_id));

    -- ROUND 16: Jagiellonia Białystok vs Raków Częstochowa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Jagiellonia Białystok');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Raków Częstochowa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-01', 'YYYY-MM-DD'), 0, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Suchocki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Diéguez', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lewicki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Olszewski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('João', 'Moutinho', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Eryk', 'Kozłowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lamine', 'Diaby-Fadiga', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Łaski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Pietuszewski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kristoffer', 'Hansen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Edi', 'Semedo', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Trelowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Racovitan', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zoran', 'Arsenic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matej', 'Rodin', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stratos', 'Svarnas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivi', 'López', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Nowakowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gustav', 'Berggren', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lazaros', 'Lamprou', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('David', 'Ezeh', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Basse', v_a_id));
    register_goal(v_match_id, get_p_id('Zoran', 'Arsenic', v_a_id), 32, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 32, 'ASSIST', v_match_id, get_p_id('Gustav', 'Berggren', v_a_id));
    register_goal(v_match_id, get_p_id('Stratos', 'Svarnas', v_a_id), 89, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 89, 'ASSIST', v_match_id, get_p_id('Kacper', 'Nowakowski', v_a_id));
    reg_injury(v_match_id, get_p_id('Wojciech', 'Łaski', v_h_id), 16, 14);

    -- ROUND 16: Cracovia vs Puszcza Niepołomice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Cracovia');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Puszcza Niepołomice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-01', 'YYYY-MM-DD'), 1, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Burek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Glik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kuba', 'Pestka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Wójcik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Virgil', 'Ghiță', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Martin', 'Minchev', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Amir', 'Al-Ammari', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Bochnak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamin', 'Kallman', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mick', 'van Buren', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Polak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Perchel', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michal', 'Siplak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Mroziński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ioan-Calin', 'Revenco', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Roman', 'Yakuba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Radecki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Zieliński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klimek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Stępień', v_a_id));
    register_goal(v_match_id, get_p_id('Kuba', 'Pestka', v_h_id), 50, 1);
    register_goal(v_match_id, get_p_id('Konrad', 'Stępień', v_a_id), 14, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 14, 'ASSIST', v_match_id, get_p_id('Michal', 'Siplak', v_a_id));
    register_goal(v_match_id, get_p_id('Ioan-Calin', 'Revenco', v_a_id), 16, 0);
    register_goal(v_match_id, get_p_id('Piotr', 'Mroziński', v_a_id), 61, 0);
    register_goal(v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id), 63, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 63, 'ASSIST', v_match_id, get_p_id('Antoni', 'Klimek', v_a_id));

    -- ROUND 16: Pogoń Szczecin vs Stal Mielec
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Pogoń Szczecin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Stal Mielec');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-01', 'YYYY-MM-DD'), 0, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kuba', 'Bochniarz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Danijel', 'Loncar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Léo', 'Borges', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Zawadzki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Lisowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alexander', 'Gorgon', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stanislaw', 'Wawrzynowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fredrik', 'Ulvestad', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Efthymios', 'Koulouris', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klukowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Vahan', 'Bichakhchyan', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kevin', 'Szurlej', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pajnowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Ehmann', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Matras', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bert', 'Esselink', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Tkacz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Bukowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matthew', 'Guillaumier', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Cavaleiro', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Robert', 'Dadok', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_a_id));
    register_goal(v_match_id, get_p_id('Matthew', 'Guillaumier', v_a_id), 73, 0);
    register_goal(v_match_id, get_p_id('Robert', 'Dadok', v_a_id), 25, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 25, 'ASSIST', v_match_id, get_p_id('Matthew', 'Guillaumier', v_a_id));
    register_goal(v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_a_id), 10, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 10, 'ASSIST', v_match_id, get_p_id('Robert', 'Dadok', v_a_id));
    register_goal(v_match_id, get_p_id('Kevin', 'Szurlej', v_a_id), 58, 0);
    reg_card(v_match_id, get_p_id('Adrian', 'Bukowski', v_a_id), 36, 'RED_CARD');
    reg_sub(v_match_id, get_p_id('Mateusz', 'Bak', v_h_id), get_p_id('Stanislaw', 'Wawrzynowicz', v_h_id), 54);

    -- ROUND 16: Górnik Zabrze vs GKS Katowice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Górnik Zabrze');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('GKS Katowice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-01', 'YYYY-MM-DD'), 1, 3, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Szromnik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Olkowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Radosław', 'Szafrański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Janicki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Prebsl', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Ambros', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Hellebrand', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matija', 'Marsenić', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Lukoszek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abbati', 'Abdullahi', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ousmane', 'Sow', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kudła', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alan', 'Czerwiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Jaroszek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Klemenz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Jędrych', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alan', 'Bród', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Danek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Nowak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Zrelak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Arak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Szymczak', v_a_id));
    register_goal(v_match_id, get_p_id('Paweł', 'Olkowski', v_h_id), 26, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 26, 'ASSIST', v_match_id, get_p_id('Filip', 'Prebsl', v_h_id));
    register_goal(v_match_id, get_p_id('Adam', 'Zrelak', v_a_id), 20, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 20, 'ASSIST', v_match_id, get_p_id('Adrian', 'Danek', v_a_id));
    register_goal(v_match_id, get_p_id('Jakub', 'Arak', v_a_id), 21, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 21, 'ASSIST', v_match_id, get_p_id('Lukas', 'Klemenz', v_a_id));
    register_goal(v_match_id, get_p_id('Adrian', 'Danek', v_a_id), 51, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 51, 'ASSIST', v_match_id, get_p_id('Arkadiusz', 'Jędrych', v_a_id));
    reg_sub(v_match_id, get_p_id('Matúš', 'Kmeť', v_h_id), get_p_id('Lukas', 'Ambros', v_h_id), 76);

    -- ROUND 16: Zagłębie Lubin vs Korona Kielce
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Zagłębie Lubin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Korona Kielce');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-01', 'YYYY-MM-DD'), 3, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jasmin', 'Burić', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleks', 'Ławniczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Nalepa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jaroslaw', 'Jach', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Michalski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Kowalski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kajetan', 'Szmyt', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Orlikowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kurminowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Makowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Mikielewicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Pau', 'Resta', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Malarczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Pięczek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milosz', 'Trojak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yoav', 'Hofmayster', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Mamla', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Xavier', 'Dziekoński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Martin', 'Remacle', v_a_id));
    register_goal(v_match_id, get_p_id('Igor', 'Orlikowski', v_h_id), 58, 1);
    register_goal(v_match_id, get_p_id('Jaroslaw', 'Jach', v_h_id), 4, 1);
    register_goal(v_match_id, get_p_id('Michał', 'Nalepa', v_h_id), 48, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 48, 'ASSIST', v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id));
    reg_card(v_match_id, get_p_id('Igor', 'Orlikowski', v_h_id), 57, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Tomasz', 'Krawczyk', v_h_id), get_p_id('Tomasz', 'Makowski', v_h_id), 69);

    -- ROUND 16: Śląsk Wrocław vs Motor Lublin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Śląsk Wrocław');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Motor Lublin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-01', 'YYYY-MM-DD'), 0, 3, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Loska', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Petkov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yegor', 'Matsenko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Llinares', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Kowalski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Samiec-Talar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żukowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Świerczok', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Pokorný', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Brkic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Luberecki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krystian', 'Palacz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marek', 'Bartos', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Rudol', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kaan', 'Caliskaner', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafal', 'Krol', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Franciszek', 'Lewandowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bradly van', 'Hoeven', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Mráz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Ceglarz', v_a_id));
    register_goal(v_match_id, get_p_id('Bradly van', 'Hoeven', v_a_id), 7, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 7, 'ASSIST', v_match_id, get_p_id('Rafal', 'Krol', v_a_id));
    register_goal(v_match_id, get_p_id('Sebastian', 'Rudol', v_a_id), 72, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 72, 'ASSIST', v_match_id, get_p_id('Ivan', 'Brkic', v_a_id));
    register_goal(v_match_id, get_p_id('Rafal', 'Krol', v_a_id), 62, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 62, 'ASSIST', v_match_id, get_p_id('Filip', 'Luberecki', v_a_id));
    reg_card(v_match_id, get_p_id('Alex', 'Petkov', v_h_id), 82, 'YELLOW_CARD');

    -- ROUND 16: Piast Gliwice vs Lechia Gdańsk
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Piast Gliwice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Lechia Gdańsk');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-01', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Szymański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Huk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Akim', 'Zedadka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Mokwa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lewicki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Leśniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tihomir', 'Kostadinov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Justin', 'Daniel', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andreas', 'Katsantonis', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fabian', 'Piasecki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Rosołek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Sarnavskyi', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Wójtowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Brylowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bujar', 'Pllana', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Borys', 'Jesionowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Zhelizko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karl', 'Wendt', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Neugebauer', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Bobcek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Camilo', 'Mena', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Głogowski', v_a_id));
    register_goal(v_match_id, get_p_id('Tomas', 'Huk', v_h_id), 56, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 56, 'ASSIST', v_match_id, get_p_id('Oskar', 'Leśniak', v_h_id));
    register_goal(v_match_id, get_p_id('Tomas', 'Bobcek', v_a_id), 79, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 79, 'ASSIST', v_match_id, get_p_id('Tomasz', 'Neugebauer', v_a_id));
    reg_sub(v_match_id, get_p_id('Ariel', 'Mosór', v_h_id), get_p_id('Oskar', 'Leśniak', v_h_id), 83);

    -- ROUND 16: Radomiak Radom vs Widzew Łódź
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Radomiak Radom');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Widzew Łódź');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-01', 'YYYY-MM-DD'), 2, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wiktor', 'Koptas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Steve', 'Kingue', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Saad', 'Agouzoul', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Burch', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cichocki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Roberto', 'Alves', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Wolski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renat', 'Dadashov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paulius', 'Golubickas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Biegański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Kozlovský', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juan', 'Ibiza', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Therkildsen', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luis', 'Silva', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Kwiatkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartłomiej', 'Pawłowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Lewandowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hilary', 'Gong', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Sobol', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_a_id));
    register_goal(v_match_id, get_p_id('Rafał', 'Wolski', v_h_id), 14, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 14, 'ASSIST', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_h_id));
    register_goal(v_match_id, get_p_id('Rafał', 'Wolski', v_h_id), 57, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 57, 'ASSIST', v_match_id, get_p_id('Marco', 'Burch', v_h_id));
    register_goal(v_match_id, get_p_id('Luis', 'Silva', v_a_id), 9, 0);
    register_goal(v_match_id, get_p_id('Samuel', 'Kozlovský', v_a_id), 76, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 76, 'ASSIST', v_match_id, get_p_id('Bartłomiej', 'Pawłowski', v_a_id));
    reg_card(v_match_id, get_p_id('Paulius', 'Golubickas', v_h_id), 29, 'YELLOW_CARD');

    -- ROUND 17: Lech Poznań vs Raków Częstochowa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lech Poznań');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Raków Częstochowa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-08', 'YYYY-MM-DD'), 4, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Mędrala', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Mońka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Douglas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Joel', 'Pereira', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Elias', 'Andersson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stjepan', 'Loncar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jesper', 'Karlström', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Radosław', 'Murawski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adriel', 'Ba Loua', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kristoffer', 'Velde', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mario', 'González', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Trelowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milan', 'Rundic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matej', 'Rodin', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pestka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ariel', 'Mosór', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivi', 'López', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michael', 'Ameyaw', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Myszor', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Walczak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Basse', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('David', 'Ezeh', v_a_id));
    register_goal(v_match_id, get_p_id('Stjepan', 'Loncar', v_h_id), 42, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 42, 'ASSIST', v_match_id, get_p_id('Joel', 'Pereira', v_h_id));
    register_goal(v_match_id, get_p_id('Kristoffer', 'Velde', v_h_id), 62, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 62, 'ASSIST', v_match_id, get_p_id('Wojciech', 'Mońka', v_h_id));
    register_goal(v_match_id, get_p_id('Kristoffer', 'Velde', v_h_id), 64, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 64, 'ASSIST', v_match_id, get_p_id('Radosław', 'Murawski', v_h_id));
    register_goal(v_match_id, get_p_id('Mario', 'González', v_h_id), 50, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 50, 'ASSIST', v_match_id, get_p_id('Kristoffer', 'Velde', v_h_id));
    register_goal(v_match_id, get_p_id('Ariel', 'Mosór', v_a_id), 6, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 6, 'ASSIST', v_match_id, get_p_id('David', 'Ezeh', v_a_id));
    reg_card(v_match_id, get_p_id('Wojciech', 'Mońka', v_h_id), 47, 'YELLOW_CARD');

    -- ROUND 17: Legia Warszawa vs Puszcza Niepołomice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Legia Warszawa');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Puszcza Niepołomice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-08', 'YYYY-MM-DD'), 0, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Banasik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Leszczyński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Burch', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Jędrzejczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Steve', 'Kapuadi', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Pascal', 'Mozie', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Strzałek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jurgen', 'Çelhaka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Chodyna', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Gual', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jean-Pierre', 'Nsame', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kewin', 'Komar', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Roman', 'Yakuba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michal', 'Siplak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Mroziński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Stępień', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Szymański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klimek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Crăciun', v_a_id));
    register_goal(v_match_id, get_p_id('Piotr', 'Mroziński', v_a_id), 56, 0);
    register_goal(v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id), 11, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 11, 'ASSIST', v_match_id, get_p_id('Michal', 'Siplak', v_a_id));
    register_goal(v_match_id, get_p_id('Piotr', 'Mroziński', v_a_id), 16, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 16, 'ASSIST', v_match_id, get_p_id('Artur', 'Crăciun', v_a_id));
    register_goal(v_match_id, get_p_id('Kewin', 'Komar', v_a_id), 43, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 43, 'ASSIST', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_a_id));
    reg_card(v_match_id, get_p_id('Wojciech', 'Banasik', v_h_id), 80, 'YELLOW_CARD');

    -- ROUND 17: Jagiellonia Białystok vs Stal Mielec
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Jagiellonia Białystok');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Stal Mielec');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-08', 'YYYY-MM-DD'), 4, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sławomir', 'Abramowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dusan', 'Stojinovic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('João', 'Moutinho', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Cezary', 'Polak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Norbert', 'Wojtuszek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Nené', 'Nené', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lamine', 'Diaby-Fadiga', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Taras', 'Romanczuk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Afimico', 'Pululu', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kristoffer', 'Hansen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Pietuszewski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Dybowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alvis', 'Jaunzems', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marvin', 'Senger', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bert', 'Esselink', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Ehmann', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Tkacz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Domanski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Knap', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ravve', 'Assayag', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Robert', 'Dadok', v_a_id));
    register_goal(v_match_id, get_p_id('Oskar', 'Pietuszewski', v_h_id), 32, 1);
    register_goal(v_match_id, get_p_id('Dusan', 'Stojinovic', v_h_id), 40, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 40, 'ASSIST', v_match_id, get_p_id('Afimico', 'Pululu', v_h_id));
    register_goal(v_match_id, get_p_id('Kristoffer', 'Hansen', v_h_id), 6, 1);
    register_goal(v_match_id, get_p_id('Lamine', 'Diaby-Fadiga', v_h_id), 20, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 20, 'ASSIST', v_match_id, get_p_id('Cezary', 'Polak', v_h_id));

    -- ROUND 17: Cracovia vs GKS Katowice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Cracovia');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('GKS Katowice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-08', 'YYYY-MM-DD'), 4, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Burek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Glik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Jugas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arttu', 'Hoskonen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Jaroszyński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikkel', 'Maigaard', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Sokołowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Knap', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamin', 'Kallman', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mick', 'van Buren', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Pomietlo', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Strączek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Jaroszek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Trepka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Märten', 'Kuusk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alan', 'Czerwiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alan', 'Bród', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Repka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Drachal', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Bergier', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Zrelak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Arak', v_a_id));
    register_goal(v_match_id, get_p_id('Karol', 'Knap', v_h_id), 33, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 33, 'ASSIST', v_match_id, get_p_id('Patryk', 'Sokołowski', v_h_id));
    register_goal(v_match_id, get_p_id('Patryk', 'Sokołowski', v_h_id), 80, 1);
    register_goal(v_match_id, get_p_id('Mikkel', 'Maigaard', v_h_id), 27, 1);
    register_goal(v_match_id, get_p_id('Patryk', 'Sokołowski', v_h_id), 20, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 20, 'ASSIST', v_match_id, get_p_id('Mateusz', 'Pomietlo', v_h_id));
    register_goal(v_match_id, get_p_id('Alan', 'Czerwiński', v_a_id), 60, 0);
    reg_sub(v_match_id, get_p_id('Kuba', 'Pestka', v_h_id), get_p_id('Karol', 'Knap', v_h_id), 51);

    -- ROUND 17: Pogoń Szczecin vs Korona Kielce
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Pogoń Szczecin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Korona Kielce');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-08', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Valentin', 'Cojocaru', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Zawadzki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luizão', 'Luizão', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dimitrios', 'Keramitsis', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Léo', 'Borges', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Przyborek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Smoliński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alexander', 'Gorgon', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klukowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Efthymios', 'Koulouris', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Vahan', 'Bichakhchyan', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Xavier', 'Dziekoński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Malarczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Pau', 'Resta', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominick', 'Zator', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Kośmicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andrzej', 'Wójcik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Zapytowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Mamla', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Mikielewicz', v_a_id));
    register_goal(v_match_id, get_p_id('Jakub', 'Zawadzki', v_h_id), 36, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 36, 'ASSIST', v_match_id, get_p_id('Adrian', 'Przyborek', v_h_id));
    register_goal(v_match_id, get_p_id('Marcel', 'Zapytowski', v_a_id), 41, 0);

    -- ROUND 17: Górnik Zabrze vs Motor Lublin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Górnik Zabrze');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Motor Lublin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-08', 'YYYY-MM-DD'), 1, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Szromnik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kryspin', 'Szcześniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Radosław', 'Szafrański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Josema', 'Josema', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matúš', 'Kmeť', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Hellebrand', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Ambros', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matija', 'Marsenić', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Buksa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Lukoszek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sondre', 'Liseth', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Jez', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hervé', 'Matthys', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Najemski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Luberecki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Wójcik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Franciszek', 'Lewandowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Romanowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Wolski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Mráz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mbaye', 'Ndiaye', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Król', v_a_id));
    register_goal(v_match_id, get_p_id('Kamil', 'Lukoszek', v_h_id), 65, 1);

    -- ROUND 17: Zagłębie Lubin vs Lechia Gdańsk
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Zagłębie Lubin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Lechia Gdańsk');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-08', 'YYYY-MM-DD'), 3, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Matys', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jaroslaw', 'Jach', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Nalepa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleks', 'Ławniczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Michalski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Wdowiak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Dąbrowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kurminowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Kowalski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Weirauch', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Brylowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miłosz', 'Kałahur', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andrei', 'Chindriș', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Conrado', 'Conrado', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Anton', 'Tsarenko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rifet', 'Kapic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Piła', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Camilo', 'Mena', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maksym', 'Khlan', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Sezonienko', v_a_id));
    register_goal(v_match_id, get_p_id('Mateusz', 'Wdowiak', v_h_id), 23, 1);
    register_goal(v_match_id, get_p_id('Damian', 'Dąbrowski', v_h_id), 71, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 71, 'ASSIST', v_match_id, get_p_id('Aleks', 'Ławniczak', v_h_id));
    register_goal(v_match_id, get_p_id('Mateusz', 'Wdowiak', v_h_id), 28, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 28, 'ASSIST', v_match_id, get_p_id('Łukasz', 'Kamiński', v_h_id));
    reg_sub(v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id), get_p_id('Mateusz', 'Wdowiak', v_h_id), 53);

    -- ROUND 17: Śląsk Wrocław vs Widzew Łódź
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Śląsk Wrocław');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Widzew Łódź');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-08', 'YYYY-MM-DD'), 1, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Leszczyński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Petkov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yegor', 'Matsenko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Llinares', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Pokorný', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żukowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Musiolik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Świerczok', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Loska', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Gikiewicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Therkildsen', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Krajewski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luis', 'Silva', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żyro', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Łukowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Sypek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Kwiatkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hilary', 'Gong', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Sobol', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Kerk', v_a_id));
    register_goal(v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id), 61, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 61, 'ASSIST', v_match_id, get_p_id('Mateusz', 'Żukowski', v_h_id));

    -- ROUND 17: Piast Gliwice vs Radomiak Radom
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Piast Gliwice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Radomiak Radom');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-11-08', 'YYYY-MM-DD'), 0, 3, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Szymański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lewicki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Pyrka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Levis', 'Pitan', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miguel', 'Muñoz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Leśniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miłosz', 'Szczepański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Justin', 'Daniel', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andreas', 'Katsantonis', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Thierry', 'Gale', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fabian', 'Piasecki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Kikolski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Grzesik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cichocki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rahil', 'Mammadov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Steve', 'Kingue', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Francisco', 'Ramos', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Christos', 'Donis', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bruno', 'Jordão', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renat', 'Dadashov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Mazur', v_a_id));
    register_goal(v_match_id, get_p_id('Wojciech', 'Mazur', v_a_id), 17, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 17, 'ASSIST', v_match_id, get_p_id('Maciej', 'Kikolski', v_a_id));
    register_goal(v_match_id, get_p_id('Abdoul', 'Tapsoba', v_a_id), 15, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 15, 'ASSIST', v_match_id, get_p_id('Renat', 'Dadashov', v_a_id));
    register_goal(v_match_id, get_p_id('Steve', 'Kingue', v_a_id), 15, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 15, 'ASSIST', v_match_id, get_p_id('Francisco', 'Ramos', v_a_id));
    COMMIT;
END;
/
