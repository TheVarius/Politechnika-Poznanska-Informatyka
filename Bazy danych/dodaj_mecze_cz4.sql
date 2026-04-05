
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

    -- ROUND 11: Radomiak Radom vs Cracovia
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Radomiak Radom');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Cracovia');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-27', 'YYYY-MM-DD'), 0, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wiktor', 'Koptas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zié', 'Ouattara', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Grzesik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Saad', 'Agouzoul', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paulo', 'Henrique', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Wolski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Mazur', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paulius', 'Golubickas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renat', 'Dadashov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Burek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kuba', 'Pestka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andreas', 'Skovgaard', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Janasik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Jugas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Biedrzycki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mauro', 'Perkovic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Davíd', 'Kristján Olafsson', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamin', 'Kallman', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mick', 'van Buren', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Polak', v_a_id));
    reg_sub(v_match_id, get_p_id('Bruno', 'Jordão', v_h_id), get_p_id('Renat', 'Dadashov', v_h_id), 75);

    -- ROUND 11: Widzew Łódź vs Jagiellonia Białystok
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Widzew Łódź');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Jagiellonia Białystok');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-27', 'YYYY-MM-DD'), 3, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Biegański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luis', 'Silva', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Krajewski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Kozlovský', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Therkildsen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Sypek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Kerk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marek', 'Hanousek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hilary', 'Gong', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Sobol', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żyro', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartłomiej', 'Zynel', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Norbert', 'Wojtuszek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jetmir', 'Haliti', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Cezary', 'Polak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Sacek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Taras', 'Romanczuk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jarosław', 'Kubicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Mazurek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Afimico', 'Pululu', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Pietuszewski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miki', 'Villar', v_a_id));
    register_goal(v_match_id, get_p_id('Marcel', 'Krajewski', v_h_id), 88, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 88, 'ASSIST', v_match_id, get_p_id('Marek', 'Hanousek', v_h_id));
    register_goal(v_match_id, get_p_id('Marek', 'Hanousek', v_h_id), 8, 1);
    register_goal(v_match_id, get_p_id('Mikołaj', 'Biegański', v_h_id), 31, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 31, 'ASSIST', v_match_id, get_p_id('Hilary', 'Gong', v_h_id));
    reg_sub(v_match_id, get_p_id('Bartosz', 'Lewandowski', v_h_id), get_p_id('Jakub', 'Sypek', v_h_id), 81);

    -- ROUND 11: Lechia Gdańsk vs Legia Warszawa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lechia Gdańsk');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Legia Warszawa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-27', 'YYYY-MM-DD'), 2, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Gutowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Loup-Diwan', 'Gueho', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bujar', 'Pllana', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Wójtowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Conrado', 'Conrado', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Biegański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Viunnyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergiy', 'Buletsa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Głogowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maksym', 'Khlan', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Sezonienko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Zielinski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Ziolkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Steve', 'Kapuadi', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Wszołek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Radovan', 'Pankov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Jędrasik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maxi', 'Oyedele', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jurgen', 'Çelhaka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Pekhart', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Migouel', 'Alfarela', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jordan', 'Majchrzak', v_a_id));
    register_goal(v_match_id, get_p_id('Bujar', 'Pllana', v_h_id), 6, 1);
    register_goal(v_match_id, get_p_id('Maksym', 'Khlan', v_h_id), 51, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 51, 'ASSIST', v_match_id, get_p_id('Bogdan', 'Viunnyk', v_h_id));
    register_goal(v_match_id, get_p_id('Steve', 'Kapuadi', v_a_id), 24, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 24, 'ASSIST', v_match_id, get_p_id('Paweł', 'Wszołek', v_a_id));
    register_goal(v_match_id, get_p_id('Radovan', 'Pankov', v_a_id), 8, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 8, 'ASSIST', v_match_id, get_p_id('Jakub', 'Jędrasik', v_a_id));

    -- ROUND 11: Motor Lublin vs Raków Częstochowa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Motor Lublin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Raków Częstochowa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-27', 'YYYY-MM-DD'), 1, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Bartnik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Murzacz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Stolarski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Rudol', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Luberecki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Kubica', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Gasior', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Wolski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Mráz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jean-Kévin', 'Augustin', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mbaye', 'Ndiaye', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Trelowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matej', 'Rodin', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Racovitan', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zoran', 'Arsenic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stratos', 'Svarnas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adriano', 'Adriano', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Czyż', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Vladyslav', 'Kochergin', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ante', 'Crnac', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Basse', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Walczak', v_a_id));
    register_goal(v_match_id, get_p_id('Paweł', 'Stolarski', v_h_id), 20, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 20, 'ASSIST', v_match_id, get_p_id('Jean-Kévin', 'Augustin', v_h_id));
    register_goal(v_match_id, get_p_id('Kacper', 'Trelowski', v_a_id), 2, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 2, 'ASSIST', v_match_id, get_p_id('Zoran', 'Arsenic', v_a_id));
    register_goal(v_match_id, get_p_id('Matej', 'Rodin', v_a_id), 82, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 82, 'ASSIST', v_match_id, get_p_id('Szymon', 'Czyż', v_a_id));
    register_goal(v_match_id, get_p_id('Bogdan', 'Racovitan', v_a_id), 70, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 70, 'ASSIST', v_match_id, get_p_id('Zoran', 'Arsenic', v_a_id));
    register_goal(v_match_id, get_p_id('Ante', 'Crnac', v_a_id), 61, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 61, 'ASSIST', v_match_id, get_p_id('Bogdan', 'Racovitan', v_a_id));

    -- ROUND 11: Korona Kielce vs Puszcza Niepołomice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Korona Kielce');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Puszcza Niepołomice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-27', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Mikielewicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Malarczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Pau', 'Resta', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milosz', 'Trojak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominick', 'Zator', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Martin', 'Remacle', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andrzej', 'Wójcik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Niedbała', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Perchel', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ioan-Calin', 'Revenco', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Crăciun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Roman', 'Yakuba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jani', 'Atanasov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Zieliński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klimek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kewin', 'Komar', v_a_id));
    register_goal(v_match_id, get_p_id('Michał', 'Mikielewicz', v_h_id), 77, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 77, 'ASSIST', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_h_id));
    register_goal(v_match_id, get_p_id('Artur', 'Crăciun', v_a_id), 49, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 49, 'ASSIST', v_match_id, get_p_id('Ioan-Calin', 'Revenco', v_a_id));
    reg_sub(v_match_id, get_p_id('Adam', 'Woźniak', v_h_id), get_p_id('Milosz', 'Trojak', v_h_id), 82);

    -- ROUND 11: GKS Katowice vs Stal Mielec
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('GKS Katowice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Stal Mielec');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-27', 'YYYY-MM-DD'), 4, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Strączek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Klemenz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Jaroszek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Komor', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Märten', 'Kuusk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Shun', 'Shibata', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Borja', 'Galán', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Drachal', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Zrelak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Arak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Bergier', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Dybowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marvin', 'Senger', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alvis', 'Jaunzems', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Matras', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bert', 'Esselink', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Kądzior', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Pyry', 'Hannola', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krystian', 'Getinger', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Cavaleiro', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ravve', 'Assayag', v_a_id));
    register_goal(v_match_id, get_p_id('Dawid', 'Drachal', v_h_id), 79, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 79, 'ASSIST', v_match_id, get_p_id('Aleksander', 'Komor', v_h_id));
    register_goal(v_match_id, get_p_id('Märten', 'Kuusk', v_h_id), 7, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 7, 'ASSIST', v_match_id, get_p_id('Sebastian', 'Bergier', v_h_id));
    register_goal(v_match_id, get_p_id('Jakub', 'Arak', v_h_id), 6, 1);
    register_goal(v_match_id, get_p_id('Borja', 'Galán', v_h_id), 67, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 67, 'ASSIST', v_match_id, get_p_id('Dawid', 'Drachal', v_h_id));

    -- ROUND 12: Lech Poznań vs Górnik Zabrze
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lech Poznań');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Górnik Zabrze');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-04', 'YYYY-MM-DD'), 3, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Mrozek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Mońka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antonio', 'Milic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ian', 'Hoffmann', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Elias', 'Andersson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sammy', 'Dudek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rasmus', 'Carstensen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jesper', 'Karlström', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bryan', 'Fiabema', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Szymczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kristoffer', 'Velde', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Szromnik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Janicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Radosław', 'Szafrański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Prebsl', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Szala', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Hellebrand', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matija', 'Marsenić', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Ambros', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ousmane', 'Sow', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Lukoszek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yosuke', 'Furukawa', v_a_id));
    register_goal(v_match_id, get_p_id('Ian', 'Hoffmann', v_h_id), 16, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 16, 'ASSIST', v_match_id, get_p_id('Kristoffer', 'Velde', v_h_id));
    register_goal(v_match_id, get_p_id('Elias', 'Andersson', v_h_id), 18, 1);
    register_goal(v_match_id, get_p_id('Antonio', 'Milic', v_h_id), 35, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 35, 'ASSIST', v_match_id, get_p_id('Ian', 'Hoffmann', v_h_id));
    reg_card(v_match_id, get_p_id('Elias', 'Andersson', v_h_id), 74, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Michał', 'Gurgul', v_h_id), get_p_id('Kristoffer', 'Velde', v_h_id), 81);

    -- ROUND 12: Zagłębie Lubin vs Pogoń Szczecin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Zagłębie Lubin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Pogoń Szczecin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-04', 'YYYY-MM-DD'), 0, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Hładun', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Michalski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jaroslaw', 'Jach', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Nalepa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleks', 'Ławniczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kajetan', 'Szmyt', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Grzybek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kurminowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Danijel', 'Loncar', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lis', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Léo', 'Borges', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Zawadzki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fredrik', 'Ulvestad', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('João', 'Gamboa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alexander', 'Gorgon', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Vahan', 'Bichakhchyan', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renyer', 'Renyer', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Bak', v_a_id));
    register_goal(v_match_id, get_p_id('Alexander', 'Gorgon', v_a_id), 64, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 64, 'ASSIST', v_match_id, get_p_id('Fredrik', 'Ulvestad', v_a_id));
    reg_card(v_match_id, get_p_id('Aleks', 'Ławniczak', v_h_id), 83, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Igor', 'Orlikowski', v_h_id), get_p_id('Jaroslaw', 'Jach', v_h_id), 78);

    -- ROUND 12: Śląsk Wrocław vs Cracovia
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Śląsk Wrocław');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Cracovia');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-04', 'YYYY-MM-DD'), 3, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Loska', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Petkov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yegor', 'Matsenko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Llinares', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Szymański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Samiec-Talar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żukowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Musiolik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jose', 'Pozo', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Burek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Virgil', 'Ghiță', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Jugas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arttu', 'Hoskonen', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gustav', 'Henriksson', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fabian', 'Bzdyl', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Rakoczy', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Biedrzycki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamin', 'Kallman', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mick', 'van Buren', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Amir', 'Al-Ammari', v_a_id));
    register_goal(v_match_id, get_p_id('Tomasz', 'Loska', v_h_id), 60, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 60, 'ASSIST', v_match_id, get_p_id('Yegor', 'Matsenko', v_h_id));
    register_goal(v_match_id, get_p_id('Mateusz', 'Żukowski', v_h_id), 30, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 30, 'ASSIST', v_match_id, get_p_id('Marc', 'Llinares', v_h_id));
    register_goal(v_match_id, get_p_id('Marc', 'Llinares', v_h_id), 62, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 62, 'ASSIST', v_match_id, get_p_id('Sebastian', 'Musiolik', v_h_id));
    reg_card(v_match_id, get_p_id('Sebastian', 'Musiolik', v_h_id), 24, 'YELLOW_CARD');

    -- ROUND 12: Piast Gliwice vs Jagiellonia Białystok
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Piast Gliwice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Jagiellonia Białystok');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-04', 'YYYY-MM-DD'), 2, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartlomiej', 'Jelonek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miguel', 'Nóbrega', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Huk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Levis', 'Pitan', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Mokwa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kopczyński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Dziczek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Chrapek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Rosołek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Erik', 'Jirka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fabian', 'Piasecki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sławomir', 'Abramowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Diéguez', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Olszewski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jetmir', 'Haliti', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Sacek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcin', 'Listkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Eryk', 'Kozłowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Leon', 'Flach', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Darko', 'Churlinov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Edi', 'Semedo', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Afimico', 'Pululu', v_a_id));
    register_goal(v_match_id, get_p_id('Bartlomiej', 'Jelonek', v_h_id), 29, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 29, 'ASSIST', v_match_id, get_p_id('Michał', 'Chrapek', v_h_id));
    register_goal(v_match_id, get_p_id('Tomasz', 'Mokwa', v_h_id), 71, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 71, 'ASSIST', v_match_id, get_p_id('Fabian', 'Piasecki', v_h_id));
    register_goal(v_match_id, get_p_id('Darko', 'Churlinov', v_a_id), 89, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 89, 'ASSIST', v_match_id, get_p_id('Eryk', 'Kozłowski', v_a_id));
    register_goal(v_match_id, get_p_id('Paweł', 'Olszewski', v_a_id), 60, 0);
    reg_sub(v_match_id, get_p_id('Arkadiusz', 'Pyrka', v_h_id), get_p_id('Patryk', 'Dziczek', v_h_id), 58);

    -- ROUND 12: Radomiak Radom vs Legia Warszawa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Radomiak Radom');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Legia Warszawa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-04', 'YYYY-MM-DD'), 3, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Kikolski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cichocki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rahil', 'Mammadov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Grzesik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pestka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bruno', 'Jordão', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Francisco', 'Ramos', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renat', 'Dadashov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Saad', 'Agouzoul', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Mendes-Dudziński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Burch', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Steve', 'Kapuadi', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Jędrzejczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Leszczyński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Pascal', 'Mozie', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Szczepaniak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oliwier', 'Olewiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Pekhart', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Chodyna', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jean-Pierre', 'Nsame', v_a_id));
    register_goal(v_match_id, get_p_id('Mikołaj', 'Jankowski', v_h_id), 1, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 1, 'ASSIST', v_match_id, get_p_id('Kamil', 'Pestka', v_h_id));
    register_goal(v_match_id, get_p_id('Rahil', 'Mammadov', v_h_id), 8, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 8, 'ASSIST', v_match_id, get_p_id('Renat', 'Dadashov', v_h_id));
    register_goal(v_match_id, get_p_id('Abdoul', 'Tapsoba', v_h_id), 15, 1);

    -- ROUND 12: Widzew Łódź vs Raków Częstochowa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Widzew Łódź');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Raków Częstochowa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-04', 'YYYY-MM-DD'), 0, 3, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Krzywański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Kozlovský', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Krajewski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luis', 'Silva', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juan', 'Ibiza', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Kerk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Sypek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hilary', 'Gong', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Sobol', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Gikiewicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dusan', 'Kuciak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ariel', 'Mosór', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zoran', 'Arsenic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stratos', 'Svarnas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Racovitan', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jesus', 'Díaz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gustav', 'Berggren', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Nowakowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ante', 'Crnac', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lazaros', 'Lamprou', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Walczak', v_a_id));
    register_goal(v_match_id, get_p_id('Stratos', 'Svarnas', v_a_id), 81, 0);
    register_goal(v_match_id, get_p_id('Jesus', 'Díaz', v_a_id), 24, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 24, 'ASSIST', v_match_id, get_p_id('Kacper', 'Nowakowski', v_a_id));
    register_goal(v_match_id, get_p_id('Ante', 'Crnac', v_a_id), 6, 0);

    -- ROUND 12: Lechia Gdańsk vs Puszcza Niepołomice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lechia Gdańsk');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Puszcza Niepołomice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-04', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Weirauch', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Borys', 'Jesionowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andrei', 'Chindriș', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Wójtowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Elias', 'Olsson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karl', 'Wendt', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Neugebauer', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Anton', 'Tsarenko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Bobcek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Głogowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Camilo', 'Mena', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Perchel', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Sołowiej', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Mroziński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Crăciun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Roman', 'Yakuba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Stępień', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Szymański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klimek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_a_id));
    register_goal(v_match_id, get_p_id('Michał', 'Głogowski', v_h_id), 82, 1);
    register_goal(v_match_id, get_p_id('Dawid', 'Szymonowicz', v_a_id), 56, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 56, 'ASSIST', v_match_id, get_p_id('Artur', 'Crăciun', v_a_id));
    reg_card(v_match_id, get_p_id('Elias', 'Olsson', v_h_id), 2, 'YELLOW_CARD');

    -- ROUND 12: Motor Lublin vs Stal Mielec
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Motor Lublin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Stal Mielec');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-04', 'YYYY-MM-DD'), 1, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Brkic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hervé', 'Matthys', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Kruk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bright', 'Ede', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Murzacz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Kubica', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Christopher', 'Simon', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Franciszek', 'Lewandowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bradly van', 'Hoeven', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antonio', 'Sefer', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Ceglarz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Jałocha', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pajnowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alvis', 'Jaunzems', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bert', 'Esselink', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Ehmann', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Wlazło', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergiy', 'Krykun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Kądzior', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ravve', 'Assayag', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Cavaleiro', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_a_id));
    register_goal(v_match_id, get_p_id('Piotr', 'Ceglarz', v_h_id), 20, 1);
    register_goal(v_match_id, get_p_id('Konrad', 'Jałocha', v_a_id), 73, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 73, 'ASSIST', v_match_id, get_p_id('Damian', 'Kądzior', v_a_id));
    register_goal(v_match_id, get_p_id('Kamil', 'Pajnowski', v_a_id), 80, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 80, 'ASSIST', v_match_id, get_p_id('Konrad', 'Jałocha', v_a_id));
    reg_card(v_match_id, get_p_id('Kamil', 'Pajnowski', v_a_id), 45, 'RED_CARD');
    reg_sub(v_match_id, get_p_id('Igor', 'Bartnik', v_h_id), get_p_id('Franciszek', 'Lewandowski', v_h_id), 65);

    -- ROUND 12: Korona Kielce vs GKS Katowice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Korona Kielce');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('GKS Katowice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-04', 'YYYY-MM-DD'), 0, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Mamla', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Pięczek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartłomiej', 'Smolarczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Malarczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milosz', 'Trojak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Martin', 'Remacle', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yoav', 'Hofmayster', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Woźniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Strączek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Klemenz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Jędrych', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alan', 'Czerwiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Märten', 'Kuusk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Marzec', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Antczak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Zrelak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Szymczak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Arak', v_a_id));
    register_goal(v_match_id, get_p_id('Rafał', 'Strączek', v_a_id), 48, 0);
    register_goal(v_match_id, get_p_id('Rafał', 'Strączek', v_a_id), 76, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 76, 'ASSIST', v_match_id, get_p_id('Filip', 'Szymczak', v_a_id));

    -- ROUND 13: Lech Poznań vs Pogoń Szczecin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lech Poznań');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Pogoń Szczecin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-11', 'YYYY-MM-DD'), 0, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Bednarek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antonio', 'Milic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Joel', 'Pereira', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Elias', 'Andersson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maksymilian', 'Pingot', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rasmus', 'Carstensen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stjepan', 'Loncar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jesper', 'Karlström', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kristoffer', 'Velde', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Szymczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikael', 'Ishak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Zawadzki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Léo', 'Borges', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mariusz', 'Malec', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dimitrios', 'Keramitsis', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('João', 'Gamboa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Przyborek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Kurzawa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klukowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Olaf', 'Korczakowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renyer', 'Renyer', v_a_id));
    reg_sub(v_match_id, get_p_id('Filip', 'Jagiełło', v_h_id), get_p_id('Antonio', 'Milic', v_h_id), 60);

    -- ROUND 13: Górnik Zabrze vs Cracovia
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Górnik Zabrze');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Cracovia');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-11', 'YYYY-MM-DD'), 1, 3, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Majchrowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Mazurek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Szala', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Erik', 'Janza', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Josema', 'Josema', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matija', 'Marsenić', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Ambros', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Hellebrand', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sinan', 'Bakış', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ousmane', 'Sow', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Taofeek', 'Ismaheel', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Henrich', 'Ravas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Janasik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Wójcik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arttu', 'Hoskonen', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kuba', 'Pestka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mauro', 'Perkovic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Rózga', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Bochnak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamin', 'Kallman', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mick', 'van Buren', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Golonka', v_a_id));
    register_goal(v_match_id, get_p_id('Dawid', 'Mazurek', v_h_id), 68, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 68, 'ASSIST', v_match_id, get_p_id('Erik', 'Janza', v_h_id));
    register_goal(v_match_id, get_p_id('Mick', 'van Buren', v_a_id), 64, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 64, 'ASSIST', v_match_id, get_p_id('Oskar', 'Wójcik', v_a_id));
    register_goal(v_match_id, get_p_id('Benjamin', 'Kallman', v_a_id), 45, 0);
    register_goal(v_match_id, get_p_id('Mick', 'van Buren', v_a_id), 23, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 23, 'ASSIST', v_match_id, get_p_id('Oskar', 'Wójcik', v_a_id));

    -- ROUND 13: Zagłębie Lubin vs Jagiellonia Białystok
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Zagłębie Lubin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Jagiellonia Białystok');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-11', 'YYYY-MM-DD'), 3, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Hładun', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Michalski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleks', 'Ławniczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jaroslaw', 'Jach', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Nalepa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Kowalski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Pieńko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Wdowiak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kurminowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kajetan', 'Szmyt', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Grzybek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maksymilian', 'Stryjek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Skrzypczak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dusan', 'Stojinovic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Sacek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('João', 'Moutinho', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jarosław', 'Kubicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Leon', 'Flach', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aurélien', 'Nguiamba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Edi', 'Semedo', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Afimico', 'Pululu', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Darko', 'Churlinov', v_a_id));
    register_goal(v_match_id, get_p_id('Kajetan', 'Szmyt', v_h_id), 84, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 84, 'ASSIST', v_match_id, get_p_id('Jan', 'Kowalski', v_h_id));
    register_goal(v_match_id, get_p_id('Kajetan', 'Szmyt', v_h_id), 80, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 80, 'ASSIST', v_match_id, get_p_id('Damian', 'Michalski', v_h_id));
    register_goal(v_match_id, get_p_id('Jan', 'Kowalski', v_h_id), 1, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 1, 'ASSIST', v_match_id, get_p_id('Dominik', 'Hładun', v_h_id));
    register_goal(v_match_id, get_p_id('Maksymilian', 'Stryjek', v_a_id), 86, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 86, 'ASSIST', v_match_id, get_p_id('João', 'Moutinho', v_a_id));
    reg_sub(v_match_id, get_p_id('Tomasz', 'Krawczyk', v_h_id), get_p_id('Dominik', 'Hładun', v_h_id), 54);

    -- ROUND 13: Śląsk Wrocław vs Legia Warszawa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Śląsk Wrocław');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Legia Warszawa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-11', 'YYYY-MM-DD'), 0, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Loska', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Petkov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yegor', 'Matsenko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Llinares', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jose', 'Pozo', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Kowalski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Musiolik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Samiec-Talar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żukowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Wiśniewski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Banasik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Steve', 'Kapuadi', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rúben', 'Vinagre', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Jędrzejczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Leszczyński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Wyganowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Strzałek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juergen', 'Elitim', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jean-Pierre', 'Nsame', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jordan', 'Majchrzak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luquinhas', 'Luquinhas', v_a_id));
    register_goal(v_match_id, get_p_id('Wojciech', 'Banasik', v_a_id), 13, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 13, 'ASSIST', v_match_id, get_p_id('Igor', 'Strzałek', v_a_id));
    reg_card(v_match_id, get_p_id('Yegor', 'Matsenko', v_h_id), 78, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_h_id), get_p_id('Filip', 'Dąbrowski', v_h_id), 84);

    -- ROUND 13: Piast Gliwice vs Raków Częstochowa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Piast Gliwice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Raków Częstochowa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-11', 'YYYY-MM-DD'), 0, 3, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Szymański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Mokwa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miguel', 'Nóbrega', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Czerwiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Pyrka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Grzegorz', 'Tomasiewicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miłosz', 'Szczepański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Leśniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andreas', 'Katsantonis', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fabian', 'Piasecki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Thierry', 'Gale', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Trelowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matej', 'Rodin', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pestka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milan', 'Rundic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ariel', 'Mosór', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adriano', 'Adriano', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Erick', 'Otieno', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Péter', 'Baráth', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Basse', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lazaros', 'Lamprou', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('David', 'Ezeh', v_a_id));
    register_goal(v_match_id, get_p_id('Kamil', 'Pestka', v_a_id), 18, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 18, 'ASSIST', v_match_id, get_p_id('Erick', 'Otieno', v_a_id));
    register_goal(v_match_id, get_p_id('Adam', 'Basse', v_a_id), 73, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 73, 'ASSIST', v_match_id, get_p_id('Erick', 'Otieno', v_a_id));
    register_goal(v_match_id, get_p_id('Adam', 'Basse', v_a_id), 66, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 66, 'ASSIST', v_match_id, get_p_id('Erick', 'Otieno', v_a_id));
    reg_card(v_match_id, get_p_id('Lazaros', 'Lamprou', v_a_id), 53, 'RED_CARD');

    -- ROUND 13: Radomiak Radom vs Puszcza Niepołomice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Radomiak Radom');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Puszcza Niepołomice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-11', 'YYYY-MM-DD'), 2, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wiktor', 'Koptas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Burch', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Saad', 'Agouzoul', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pestka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rahil', 'Mammadov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bruno', 'Jordão', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paulius', 'Golubickas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Woźniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renat', 'Dadashov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zié', 'Ouattara', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Perchel', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Mroziński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ioan-Calin', 'Revenco', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Sołowiej', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakov', 'Blagaic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Serafin', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klimek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michal', 'Siplak', v_a_id));
    register_goal(v_match_id, get_p_id('Saad', 'Agouzoul', v_h_id), 40, 1);
    register_goal(v_match_id, get_p_id('Zié', 'Ouattara', v_h_id), 57, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 57, 'ASSIST', v_match_id, get_p_id('Marco', 'Burch', v_h_id));
    register_goal(v_match_id, get_p_id('Antoni', 'Klimek', v_a_id), 83, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 83, 'ASSIST', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_a_id));
    register_goal(v_match_id, get_p_id('Jakub', 'Serafin', v_a_id), 59, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 59, 'ASSIST', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_a_id));

    -- ROUND 13: Widzew Łódź vs Stal Mielec
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Widzew Łódź');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Stal Mielec');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-11', 'YYYY-MM-DD'), 1, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Krzywański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Therkildsen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luis', 'Silva', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Krajewski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juan', 'Ibiza', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fran', 'Alvarez', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juljan', 'Shehu', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marek', 'Hanousek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hilary', 'Gong', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Sobol', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Woźniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Dybowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Ehmann', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marvin', 'Senger', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Matras', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alvis', 'Jaunzems', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergiy', 'Krykun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kōki', 'Hinokio', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krystian', 'Getinger', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Cavaleiro', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ravve', 'Assayag', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_a_id));
    register_goal(v_match_id, get_p_id('Juljan', 'Shehu', v_h_id), 38, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 38, 'ASSIST', v_match_id, get_p_id('Fran', 'Alvarez', v_h_id));
    register_goal(v_match_id, get_p_id('Sergiy', 'Krykun', v_a_id), 44, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 44, 'ASSIST', v_match_id, get_p_id('Marvin', 'Senger', v_a_id));
    register_goal(v_match_id, get_p_id('Krystian', 'Getinger', v_a_id), 35, 0);

    -- ROUND 13: Lechia Gdańsk vs GKS Katowice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lechia Gdańsk');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('GKS Katowice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-11', 'YYYY-MM-DD'), 0, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Weirauch', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Borys', 'Jesionowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Brylowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andrei', 'Chindriș', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Loup-Diwan', 'Gueho', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Viunnyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karl', 'Wendt', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Piła', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Camilo', 'Mena', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Bobcek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Sezonienko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kudła', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alan', 'Czerwiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Kaduk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Komor', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Märten', 'Kuusk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Błąd', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Borja', 'Galán', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Nowak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Zrelak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Arak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Bergier', v_a_id));
    reg_card(v_match_id, get_p_id('Borys', 'Jesionowski', v_h_id), 62, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Maksym', 'Khlan', v_h_id), get_p_id('Szymon', 'Weirauch', v_h_id), 65);

    -- ROUND 13: Motor Lublin vs Korona Kielce
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Motor Lublin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Korona Kielce');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-11', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Jez', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Kruk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marek', 'Bartos', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bright', 'Ede', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Stolarski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Gasior', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Franciszek', 'Lewandowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Kubica', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Ceglarz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mbaye', 'Ndiaye', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Król', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Niedbała', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konstantinos', 'Sotiriou', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Pau', 'Resta', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milosz', 'Trojak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Pięczek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Kośmicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andrzej', 'Wójcik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_a_id));
    register_goal(v_match_id, get_p_id('Krzysztof', 'Kubica', v_h_id), 13, 1);
    register_goal(v_match_id, get_p_id('Tomasz', 'Krawczyk', v_a_id), 18, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 18, 'ASSIST', v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id));

    -- ROUND 14: Lech Poznań vs Cracovia
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lech Poznań');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Cracovia');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-18', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Bednarek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dagerstal', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Wichtowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Elias', 'Andersson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Douglas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Radosław', 'Murawski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gísli', 'Thórdarson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tymoteusz', 'Gmur', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kristoffer', 'Velde', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ali', 'Gholizadeh', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adriel', 'Ba Loua', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Madejski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gustav', 'Henriksson', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Jugas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andreas', 'Skovgaard', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Jaroszyński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Bochnak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Lachowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Amir', 'Al-Ammari', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamin', 'Kallman', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mick', 'van Buren', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mauro', 'Perkovic', v_a_id));
    register_goal(v_match_id, get_p_id('Maciej', 'Wichtowski', v_h_id), 51, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 51, 'ASSIST', v_match_id, get_p_id('Filip', 'Dagerstal', v_h_id));
    register_goal(v_match_id, get_p_id('Mick', 'van Buren', v_a_id), 13, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 13, 'ASSIST', v_match_id, get_p_id('Andreas', 'Skovgaard', v_a_id));
    reg_sub(v_match_id, get_p_id('Filip', 'Jagiełło', v_h_id), get_p_id('Filip', 'Dagerstal', v_h_id), 82);

    -- ROUND 14: Pogoń Szczecin vs Jagiellonia Białystok
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Pogoń Szczecin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Jagiellonia Białystok');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-18', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Valentin', 'Cojocaru', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lis', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luizão', 'Luizão', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benedikt', 'Zech', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamín', 'Rojas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fredrik', 'Ulvestad', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Wędrychowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('João', 'Gamboa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Bak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Efthymios', 'Koulouris', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renyer', 'Renyer', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miłosz', 'Piekutowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dusan', 'Stojinovic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Enzo', 'Ebosse', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Cezary', 'Polak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dimitrios', 'Retsos', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Stypułkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aurélien', 'Nguiamba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Leon', 'Flach', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Marczuk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kristoffer', 'Hansen', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Darko', 'Churlinov', v_a_id));
    register_goal(v_match_id, get_p_id('Efthymios', 'Koulouris', v_h_id), 8, 1);
    register_goal(v_match_id, get_p_id('Aurélien', 'Nguiamba', v_a_id), 12, 0);
    reg_sub(v_match_id, get_p_id('Vahan', 'Bichakhchyan', v_h_id), get_p_id('Benedikt', 'Zech', v_h_id), 81);

    -- ROUND 14: Górnik Zabrze vs Legia Warszawa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Górnik Zabrze');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Legia Warszawa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-18', 'YYYY-MM-DD'), 0, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Szromnik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Radosław', 'Szafrański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Mazurek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Olkowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Janicki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Hellebrand', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matija', 'Marsenić', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Ambros', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Buksa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Lukoszek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yosuke', 'Furukawa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Tobiasz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Wszołek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Kun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Ziolkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergio', 'Barcia', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Żewłakow', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Urbański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Kapustka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Migouel', 'Alfarela', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Blaz', 'Kramer', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Pekhart', v_a_id));
    register_goal(v_match_id, get_p_id('Tomas', 'Pekhart', v_a_id), 68, 0);
    register_goal(v_match_id, get_p_id('Bartosz', 'Kapustka', v_a_id), 3, 0);
    reg_card(v_match_id, get_p_id('Yosuke', 'Furukawa', v_h_id), 74, 'YELLOW_CARD');
    reg_card(v_match_id, get_p_id('Tomas', 'Pekhart', v_a_id), 90, 'RED_CARD');

    -- ROUND 14: Zagłębie Lubin vs Raków Częstochowa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Zagłębie Lubin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Raków Częstochowa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-18', 'YYYY-MM-DD'), 1, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Hładun', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleks', 'Ławniczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Michalski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jaroslaw', 'Jach', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Nalepa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Pieńko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Orlikowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kurminowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kajetan', 'Szmyt', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Matys', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Muhamed', 'Sahinovic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zoran', 'Arsenic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stratos', 'Svarnas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Racovitan', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matej', 'Rodin', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gustav', 'Berggren', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Czyż', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Nowakowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jonatan Braut', 'Brunes', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Basse', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Leonardo', 'Rocha', v_a_id));
    register_goal(v_match_id, get_p_id('Łukasz', 'Kamiński', v_h_id), 61, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 61, 'ASSIST', v_match_id, get_p_id('Igor', 'Orlikowski', v_h_id));
    register_goal(v_match_id, get_p_id('Jonatan Braut', 'Brunes', v_a_id), 86, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 86, 'ASSIST', v_match_id, get_p_id('Stratos', 'Svarnas', v_a_id));
    register_goal(v_match_id, get_p_id('Stratos', 'Svarnas', v_a_id), 14, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 14, 'ASSIST', v_match_id, get_p_id('Muhamed', 'Sahinovic', v_a_id));
    register_goal(v_match_id, get_p_id('Adam', 'Basse', v_a_id), 71, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 71, 'ASSIST', v_match_id, get_p_id('Jonatan Braut', 'Brunes', v_a_id));
    register_goal(v_match_id, get_p_id('Szymon', 'Czyż', v_a_id), 70, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 70, 'ASSIST', v_match_id, get_p_id('Kacper', 'Nowakowski', v_a_id));
    reg_sub(v_match_id, get_p_id('Mikołaj', 'Jankowski', v_h_id), get_p_id('Łukasz', 'Kamiński', v_h_id), 47);

    -- ROUND 14: Śląsk Wrocław vs Puszcza Niepołomice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Śląsk Wrocław');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Puszcza Niepołomice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-18', 'YYYY-MM-DD'), 2, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Leszczyński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Petkov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yegor', 'Matsenko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Llinares', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Szymański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Kowalski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Wiśniewski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żukowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Samiec-Talar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Musiolik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kewin', 'Komar', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Sołowiej', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ioan-Calin', 'Revenco', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Crăciun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Roman', 'Yakuba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Radecki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakov', 'Blagaic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klimek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Tomalski', v_a_id));
    register_goal(v_match_id, get_p_id('Mateusz', 'Żukowski', v_h_id), 73, 1);
    register_goal(v_match_id, get_p_id('Sebastian', 'Musiolik', v_h_id), 51, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 51, 'ASSIST', v_match_id, get_p_id('Mateusz', 'Żukowski', v_h_id));
    register_goal(v_match_id, get_p_id('Mateusz', 'Cholewiak', v_a_id), 48, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 48, 'ASSIST', v_match_id, get_p_id('Jakov', 'Blagaic', v_a_id));
    reg_card(v_match_id, get_p_id('Alex', 'Petkov', v_h_id), 7, 'YELLOW_CARD');
    reg_card(v_match_id, get_p_id('Hubert', 'Tomalski', v_a_id), 33, 'RED_CARD');

    -- ROUND 14: Piast Gliwice vs Stal Mielec
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Piast Gliwice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Stal Mielec');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-18', 'YYYY-MM-DD'), 4, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Szymański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ariel', 'Mosór', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Mokwa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Huk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Akim', 'Zedadka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tihomir', 'Kostadinov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Grzegorz', 'Tomasiewicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kopczyński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Rosołek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jorge', 'Felix', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Erik', 'Jirka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Mądrzyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bert', 'Esselink', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alvis', 'Jaunzems', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Ehmann', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marvin', 'Senger', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Tkacz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergiy', 'Krykun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fryderyk', 'Gerbowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Cavaleiro', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ravve', 'Assayag', v_a_id));
    register_goal(v_match_id, get_p_id('Ariel', 'Mosór', v_h_id), 53, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 53, 'ASSIST', v_match_id, get_p_id('Tomas', 'Huk', v_h_id));
    register_goal(v_match_id, get_p_id('Grzegorz', 'Tomasiewicz', v_h_id), 11, 1);
    register_goal(v_match_id, get_p_id('Ariel', 'Mosór', v_h_id), 88, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 88, 'ASSIST', v_match_id, get_p_id('Karol', 'Szymański', v_h_id));
    register_goal(v_match_id, get_p_id('Grzegorz', 'Tomasiewicz', v_h_id), 61, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 61, 'ASSIST', v_match_id, get_p_id('Tomas', 'Huk', v_h_id));

    -- ROUND 14: Radomiak Radom vs GKS Katowice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Radomiak Radom');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('GKS Katowice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-10-18', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wiktor', 'Koptas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pestka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cichocki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Saad', 'Agouzoul', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Grzesik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Christos', 'Donis', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Kaput', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Woźniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renat', 'Dadashov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Burch', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kudła', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Jędrych', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Jaroszek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Komor', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Klemenz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Repka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Baranowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alan', 'Bród', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Arak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Zrelak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Bergier', v_a_id));
    register_goal(v_match_id, get_p_id('Kamil', 'Pestka', v_h_id), 90, 1);
    register_goal(v_match_id, get_p_id('Jakub', 'Arak', v_a_id), 77, 0);
    reg_card(v_match_id, get_p_id('Adam', 'Woźniak', v_h_id), 83, 'YELLOW_CARD');
    COMMIT;
END;
/
