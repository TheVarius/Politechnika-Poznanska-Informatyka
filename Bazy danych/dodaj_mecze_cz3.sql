
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

    -- ROUND 7: Legia Warszawa vs Jagiellonia Białystok
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Legia Warszawa');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Jagiellonia Białystok');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-30', 'YYYY-MM-DD'), 4, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Banasik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Radovan', 'Pankov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Jędrzejczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rúben', 'Vinagre', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Kun', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Urbański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oliwier', 'Olewiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Wyganowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Pekhart', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michal', 'Kucharczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Migouel', 'Alfarela', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartłomiej', 'Zynel', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Diéguez', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jetmir', 'Haliti', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dusan', 'Stojinovic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Cezary', 'Polak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Stypułkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Nené', 'Nené', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Leon', 'Flach', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Darko', 'Churlinov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Edi', 'Semedo', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Pietuszewski', v_a_id));
    register_goal(v_match_id, get_p_id('Oliwier', 'Olewiński', v_h_id), 16, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 16, 'ASSIST', v_match_id, get_p_id('Wojciech', 'Urbański', v_h_id));
    register_goal(v_match_id, get_p_id('Artur', 'Jędrzejczyk', v_h_id), 18, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 18, 'ASSIST', v_match_id, get_p_id('Aleksander', 'Wyganowski', v_h_id));
    register_goal(v_match_id, get_p_id('Aleksander', 'Wyganowski', v_h_id), 35, 1);
    register_goal(v_match_id, get_p_id('Wojciech', 'Banasik', v_h_id), 46, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 46, 'ASSIST', v_match_id, get_p_id('Wojciech', 'Urbański', v_h_id));
    reg_sub(v_match_id, get_p_id('Jordan', 'Majchrzak', v_h_id), get_p_id('Aleksander', 'Wyganowski', v_h_id), 80);

    -- ROUND 8: Lech Poznań vs Radomiak Radom
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lech Poznań');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Radomiak Radom');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-06', 'YYYY-MM-DD'), 1, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Bednarek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Douglas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Joel', 'Pereira', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dagerstal', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Gurgul', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gísli', 'Thórdarson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Jagiełło', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stjepan', 'Loncar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kristoffer', 'Velde', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mario', 'González', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adriel', 'Ba Loua', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wiktor', 'Koptas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Grzesik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paulo', 'Henrique', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rahil', 'Mammadov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cichocki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Christos', 'Donis', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renat', 'Dadashov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paulius', 'Golubickas', v_a_id));
    register_goal(v_match_id, get_p_id('Filip', 'Bednarek', v_h_id), 60, 1);
    reg_sub(v_match_id, get_p_id('Elias', 'Andersson', v_h_id), get_p_id('Alex', 'Douglas', v_h_id), 56);

    -- ROUND 8: Widzew Łódź vs Piast Gliwice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Widzew Łódź');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Piast Gliwice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-06', 'YYYY-MM-DD'), 1, 3, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Biegański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Krajewski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Kozlovský', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żyro', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luis', 'Silva', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartłomiej', 'Pawłowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Lewandowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Lewandowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hilary', 'Gong', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Sobol', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Kerk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartlomiej', 'Jelonek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miguel', 'Muñoz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Akim', 'Zedadka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Huk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Levis', 'Pitan', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miłosz', 'Szczepański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tihomir', 'Kostadinov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Grzegorz', 'Tomasiewicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andreas', 'Katsantonis', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Rosołek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Erik', 'Jirka', v_a_id));
    register_goal(v_match_id, get_p_id('Bartłomiej', 'Pawłowski', v_h_id), 10, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 10, 'ASSIST', v_match_id, get_p_id('Mikołaj', 'Biegański', v_h_id));
    register_goal(v_match_id, get_p_id('Erik', 'Jirka', v_a_id), 13, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 13, 'ASSIST', v_match_id, get_p_id('Levis', 'Pitan', v_a_id));
    register_goal(v_match_id, get_p_id('Akim', 'Zedadka', v_a_id), 19, 0);
    register_goal(v_match_id, get_p_id('Levis', 'Pitan', v_a_id), 25, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 25, 'ASSIST', v_match_id, get_p_id('Grzegorz', 'Tomasiewicz', v_a_id));
    reg_sub(v_match_id, get_p_id('Juan', 'Ibiza', v_h_id), get_p_id('Bartłomiej', 'Pawłowski', v_h_id), 49);

    -- ROUND 8: Lechia Gdańsk vs Śląsk Wrocław
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lechia Gdańsk');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Śląsk Wrocław');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-06', 'YYYY-MM-DD'), 2, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Gutowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bujar', 'Pllana', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Borys', 'Jesionowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Loup-Diwan', 'Gueho', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Wójtowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Zhelizko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rifet', 'Kapic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Kardas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Camilo', 'Mena', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Sezonienko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Bobcek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Loska', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Petkov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yegor', 'Matsenko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Llinares', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tudor', 'Băluță', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcin', 'Cebula', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Kowalski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Świerczok', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Samiec-Talar', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Musiolik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Wiśniewski', v_a_id));
    register_goal(v_match_id, get_p_id('Camilo', 'Mena', v_h_id), 37, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 37, 'ASSIST', v_match_id, get_p_id('Rifet', 'Kapic', v_h_id));
    register_goal(v_match_id, get_p_id('Camilo', 'Mena', v_h_id), 61, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 61, 'ASSIST', v_match_id, get_p_id('Rifet', 'Kapic', v_h_id));
    register_goal(v_match_id, get_p_id('Tudor', 'Băluță', v_a_id), 57, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 57, 'ASSIST', v_match_id, get_p_id('Yegor', 'Matsenko', v_a_id));

    -- ROUND 8: Motor Lublin vs Zagłębie Lubin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Motor Lublin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Zagłębie Lubin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-06', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Jez', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Wójcik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Kruk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krystian', 'Palacz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Stolarski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Gasior', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Kubica', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Łabojko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Mráz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Ceglarz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mbaye', 'Ndiaye', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Hładun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleks', 'Ławniczak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jaroslaw', 'Jach', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Nalepa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Michalski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Grzybek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Josip', 'Corluka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kurminowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Kowalski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Dąbrowski', v_a_id));
    register_goal(v_match_id, get_p_id('Kamil', 'Kruk', v_h_id), 76, 1);
    register_goal(v_match_id, get_p_id('Aleks', 'Ławniczak', v_a_id), 52, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 52, 'ASSIST', v_match_id, get_p_id('Dawid', 'Kurminowski', v_a_id));
    reg_card(v_match_id, get_p_id('Paweł', 'Stolarski', v_h_id), 56, 'YELLOW_CARD');

    -- ROUND 8: Korona Kielce vs Górnik Zabrze
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Korona Kielce');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Górnik Zabrze');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-06', 'YYYY-MM-DD'), 2, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Zapytowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milosz', 'Trojak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Malarczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Pięczek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Pau', 'Resta', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yoav', 'Hofmayster', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Woźniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Martin', 'Remacle', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominick', 'Zator', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Jeleń', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Szala', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Mazurek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Prebsl', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Josema', 'Josema', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matija', 'Marsenić', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Hellebrand', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Ambros', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Tobolik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ousmane', 'Sow', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luka', 'Zahović', v_a_id));
    register_goal(v_match_id, get_p_id('Martin', 'Remacle', v_h_id), 22, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 22, 'ASSIST', v_match_id, get_p_id('Yoav', 'Hofmayster', v_h_id));
    register_goal(v_match_id, get_p_id('Piotr', 'Malarczyk', v_h_id), 21, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 21, 'ASSIST', v_match_id, get_p_id('Milosz', 'Trojak', v_h_id));
    reg_sub(v_match_id, get_p_id('Konstantinos', 'Sotiriou', v_h_id), get_p_id('Łukasz', 'Kamiński', v_h_id), 84);

    -- ROUND 8: GKS Katowice vs Pogoń Szczecin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('GKS Katowice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Pogoń Szczecin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-06', 'YYYY-MM-DD'), 0, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kudła', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Trepka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Komor', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Klemenz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Jędrych', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Shun', 'Shibata', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Milewski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Drachal', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Szymczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Bergier', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Zrelak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kuba', 'Bochniarz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamín', 'Rojas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Danijel', 'Loncar', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Léo', 'Borges', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dimitrios', 'Keramitsis', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Smoliński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alexander', 'Gorgon', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fredrik', 'Ulvestad', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Olaf', 'Korczakowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Efthymios', 'Koulouris', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Bak', v_a_id));
    reg_sub(v_match_id, get_p_id('Rafał', 'Strączek', v_h_id), get_p_id('Lukas', 'Klemenz', v_h_id), 61);

    -- ROUND 8: Stal Mielec vs Cracovia
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Stal Mielec');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Cracovia');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-06', 'YYYY-MM-DD'), 2, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Mądrzyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marvin', 'Senger', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alvis', 'Jaunzems', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Ehmann', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bert', 'Esselink', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Wołkowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Bukowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krystian', 'Getinger', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Cavaleiro', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Robert', 'Dadok', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Henrich', 'Ravas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andreas', 'Skovgaard', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Jaroszyński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gustav', 'Henriksson', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kuba', 'Pestka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ajdin', 'Hasic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Martin', 'Minchev', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Davíd', 'Kristján Olafsson', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamin', 'Kallman', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mick', 'van Buren', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Janasik', v_a_id));
    register_goal(v_match_id, get_p_id('Robert', 'Dadok', v_h_id), 79, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 79, 'ASSIST', v_match_id, get_p_id('Krzysztof', 'Wołkowicz', v_h_id));
    register_goal(v_match_id, get_p_id('Bert', 'Esselink', v_h_id), 65, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 65, 'ASSIST', v_match_id, get_p_id('Jakub', 'Mądrzyk', v_h_id));
    register_goal(v_match_id, get_p_id('Benjamin', 'Kallman', v_a_id), 36, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 36, 'ASSIST', v_match_id, get_p_id('Martin', 'Minchev', v_a_id));
    reg_sub(v_match_id, get_p_id('Ravve', 'Assayag', v_h_id), get_p_id('Krzysztof', 'Wołkowicz', v_h_id), 52);

    -- ROUND 8: Puszcza Niepołomice vs Jagiellonia Białystok
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Puszcza Niepołomice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Jagiellonia Białystok');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-06', 'YYYY-MM-DD'), 0, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kewin', 'Komar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Roman', 'Yakuba', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Mroziński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Sołowiej', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Radecki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Tomalski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Stępień', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klimek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartłomiej', 'Zynel', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Olszewski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lewicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dimitrios', 'Retsos', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Skrzypczak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Łaski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Leon', 'Flach', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aurélien', 'Nguiamba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Marczuk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Silva', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miki', 'Villar', v_a_id));
    register_goal(v_match_id, get_p_id('Aurélien', 'Nguiamba', v_a_id), 22, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 22, 'ASSIST', v_match_id, get_p_id('Leon', 'Flach', v_a_id));
    register_goal(v_match_id, get_p_id('Mateusz', 'Skrzypczak', v_a_id), 70, 0);
    reg_sub(v_match_id, get_p_id('Michał', 'Perchel', v_h_id), get_p_id('Hubert', 'Tomalski', v_h_id), 72);

    -- ROUND 8: Raków Częstochowa vs Legia Warszawa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Raków Częstochowa');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Legia Warszawa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-06', 'YYYY-MM-DD'), 1, 3, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dusan', 'Kuciak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zoran', 'Arsenic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matej', 'Rodin', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ariel', 'Mosór', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milan', 'Rundic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Péter', 'Baráth', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Drachal', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Czyż', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lazaros', 'Lamprou', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jonatan Braut', 'Brunes', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Basse', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Zielinski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergio', 'Barcia', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Steve', 'Kapuadi', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Jędrzejczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Kun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Claude', 'Gonçalves', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Pascal', 'Mozie', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Jędrasik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Gual', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Pekhart', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Blaz', 'Kramer', v_a_id));
    register_goal(v_match_id, get_p_id('Péter', 'Baráth', v_h_id), 87, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 87, 'ASSIST', v_match_id, get_p_id('Matej', 'Rodin', v_h_id));
    register_goal(v_match_id, get_p_id('Claude', 'Gonçalves', v_a_id), 84, 0);
    register_goal(v_match_id, get_p_id('Marc', 'Gual', v_a_id), 4, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 4, 'ASSIST', v_match_id, get_p_id('Blaz', 'Kramer', v_a_id));
    register_goal(v_match_id, get_p_id('Jakub', 'Jędrasik', v_a_id), 62, 0);
    reg_sub(v_match_id, get_p_id('Ante', 'Crnac', v_h_id), get_p_id('Adam', 'Basse', v_h_id), 48);

    -- ROUND 9: Lech Poznań vs Piast Gliwice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lech Poznań');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Piast Gliwice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-13', 'YYYY-MM-DD'), 2, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Mrozek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ian', 'Hoffmann', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antonio', 'Milic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Douglas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Salamon', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Brzyski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rasmus', 'Carstensen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Radosław', 'Murawski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bryan', 'Fiabema', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikael', 'Ishak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Daniel', 'Håkans', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Rychta', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Pyrka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Mokwa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ariel', 'Mosór', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Levis', 'Pitan', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tihomir', 'Kostadinov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kopczyński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Leśniak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fabian', 'Piasecki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andreas', 'Katsantonis', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Thierry', 'Gale', v_a_id));
    register_goal(v_match_id, get_p_id('Radosław', 'Murawski', v_h_id), 69, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 69, 'ASSIST', v_match_id, get_p_id('Bryan', 'Fiabema', v_h_id));
    register_goal(v_match_id, get_p_id('Daniel', 'Håkans', v_h_id), 46, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 46, 'ASSIST', v_match_id, get_p_id('Mikael', 'Ishak', v_h_id));
    reg_card(v_match_id, get_p_id('Radosław', 'Murawski', v_h_id), 86, 'YELLOW_CARD');

    -- ROUND 9: Radomiak Radom vs Śląsk Wrocław
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Radomiak Radom');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Śląsk Wrocław');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-13', 'YYYY-MM-DD'), 0, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wiktor', 'Koptas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Saad', 'Agouzoul', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Steve', 'Kingue', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pestka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Burch', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Wolski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Roberto', 'Alves', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paulius', 'Golubickas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renat', 'Dadashov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zié', 'Ouattara', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Leszczyński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Petkov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yegor', 'Matsenko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Llinares', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tudor', 'Băluță', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Petr', 'Schwarz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Świerczok', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Musiolik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Samiec-Talar', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Szymański', v_a_id));
    register_goal(v_match_id, get_p_id('Filip', 'Dąbrowski', v_a_id), 17, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 17, 'ASSIST', v_match_id, get_p_id('Jakub', 'Świerczok', v_a_id));
    register_goal(v_match_id, get_p_id('Sebastian', 'Musiolik', v_a_id), 33, 0);
    reg_sub(v_match_id, get_p_id('Tomasz', 'Krawczyk', v_h_id), get_p_id('Steve', 'Kingue', v_h_id), 63);

    -- ROUND 9: Widzew Łódź vs Zagłębie Lubin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Widzew Łódź');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Zagłębie Lubin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-13', 'YYYY-MM-DD'), 2, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Gikiewicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Therkildsen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Krajewski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Kozlovský', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żyro', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Lewandowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juljan', 'Shehu', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fran', 'Alvarez', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hilary', 'Gong', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Sobol', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luis', 'Silva', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Hładun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleks', 'Ławniczak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Michalski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Nalepa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jaroslaw', 'Jach', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Josip', 'Corluka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Pieńko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Dąbrowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kurminowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jasmin', 'Burić', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_a_id));
    register_goal(v_match_id, get_p_id('Rafał', 'Gikiewicz', v_h_id), 34, 1);
    register_goal(v_match_id, get_p_id('Hubert', 'Sobol', v_h_id), 72, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 72, 'ASSIST', v_match_id, get_p_id('Rafał', 'Gikiewicz', v_h_id));

    -- ROUND 9: Lechia Gdańsk vs Górnik Zabrze
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lechia Gdańsk');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Górnik Zabrze');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-13', 'YYYY-MM-DD'), 0, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Weirauch', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Brylowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Borys', 'Jesionowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Loup-Diwan', 'Gueho', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Elias', 'Olsson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rifet', 'Kapic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergiy', 'Buletsa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karl', 'Wendt', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Camilo', 'Mena', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Bobcek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Sezonienko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Szromnik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Janicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Szala', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Olkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matúš', 'Kmeť', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Hellebrand', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Ambros', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matija', 'Marsenić', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Lukoszek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sinan', 'Bakış', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Tobolik', v_a_id));
    register_goal(v_match_id, get_p_id('Matúš', 'Kmeť', v_a_id), 54, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 54, 'ASSIST', v_match_id, get_p_id('Lukas', 'Ambros', v_a_id));
    register_goal(v_match_id, get_p_id('Patrik', 'Hellebrand', v_a_id), 48, 0);
    register_goal(v_match_id, get_p_id('Aleksander', 'Tobolik', v_a_id), 47, 0);
    register_goal(v_match_id, get_p_id('Sinan', 'Bakış', v_a_id), 52, 0);

    -- ROUND 9: Motor Lublin vs Pogoń Szczecin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Motor Lublin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Pogoń Szczecin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-13', 'YYYY-MM-DD'), 0, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Jez', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Stolarski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Najemski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Murzacz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Kruk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Romanowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mathieu', 'Scalet', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafal', 'Krol', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bradly van', 'Hoeven', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jean-Kévin', 'Augustin', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antonio', 'Sefer', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Legowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamín', 'Rojas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Léo', 'Borges', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benedikt', 'Zech', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lis', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fredrik', 'Ulvestad', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stanislaw', 'Wawrzynowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('João', 'Gamboa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Vahan', 'Bichakhchyan', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klukowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Olaf', 'Korczakowski', v_a_id));
    reg_card(v_match_id, get_p_id('Jean-Kévin', 'Augustin', v_h_id), 80, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Kacper', 'Wełniak', v_h_id), get_p_id('Paweł', 'Stolarski', v_h_id), 69);

    -- ROUND 9: Korona Kielce vs Cracovia
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Korona Kielce');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Cracovia');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-13', 'YYYY-MM-DD'), 1, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Mamla', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Kośmicki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konstantinos', 'Sotiriou', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartłomiej', 'Smolarczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominick', 'Zator', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andrzej', 'Wójcik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milosz', 'Trojak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Mikielewicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Golonka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andreas', 'Skovgaard', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kuba', 'Pestka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Janasik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arttu', 'Hoskonen', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Otar', 'Kakabadze', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ajdin', 'Hasic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Rózga', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamin', 'Kallman', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mick', 'van Buren', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikkel', 'Maigaard', v_a_id));
    register_goal(v_match_id, get_p_id('Konstantinos', 'Sotiriou', v_h_id), 66, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 66, 'ASSIST', v_match_id, get_p_id('Michał', 'Mikielewicz', v_h_id));
    reg_card(v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id), 61, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Yoav', 'Hofmayster', v_h_id), get_p_id('Igor', 'Kośmicki', v_h_id), 81);

    -- ROUND 9: GKS Katowice vs Jagiellonia Białystok
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('GKS Katowice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Jagiellonia Białystok');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-13', 'YYYY-MM-DD'), 2, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Strączek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Jaroszek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Trepka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alan', 'Czerwiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Jędrych', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Drachal', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Nowak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Shun', 'Shibata', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Arak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Bergier', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Zrelak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartłomiej', 'Zynel', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Diéguez', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lewicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jetmir', 'Haliti', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dimitrios', 'Retsos', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Nené', 'Nené', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jesus', 'Imaz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aurélien', 'Nguiamba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Marczuk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Edi', 'Semedo', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Afimico', 'Pululu', v_a_id));
    register_goal(v_match_id, get_p_id('Adam', 'Zrelak', v_h_id), 85, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 85, 'ASSIST', v_match_id, get_p_id('Jakub', 'Arak', v_h_id));
    register_goal(v_match_id, get_p_id('Rafał', 'Strączek', v_h_id), 67, 1);
    register_goal(v_match_id, get_p_id('Dominik', 'Marczuk', v_a_id), 39, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 39, 'ASSIST', v_match_id, get_p_id('Jakub', 'Lewicki', v_a_id));
    register_goal(v_match_id, get_p_id('Dominik', 'Marczuk', v_a_id), 82, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 82, 'ASSIST', v_match_id, get_p_id('Jakub', 'Lewicki', v_a_id));
    reg_card(v_match_id, get_p_id('Shun', 'Shibata', v_h_id), 76, 'YELLOW_CARD');

    -- ROUND 9: Stal Mielec vs Legia Warszawa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Stal Mielec');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Legia Warszawa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-13', 'YYYY-MM-DD'), 2, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kevin', 'Szurlej', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pajnowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Ehmann', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alvis', 'Jaunzems', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bert', 'Esselink', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Domanski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Wołkowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Knap', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Cavaleiro', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ravve', 'Assayag', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gabriel', 'Kobylak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Steve', 'Kapuadi', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Wszołek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergio', 'Barcia', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Leszczyński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Żewłakow', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Jędrasik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Urbański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luquinhas', 'Luquinhas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Migouel', 'Alfarela', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Pekhart', v_a_id));
    register_goal(v_match_id, get_p_id('Karol', 'Knap', v_h_id), 38, 1);
    register_goal(v_match_id, get_p_id('Bert', 'Esselink', v_h_id), 37, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 37, 'ASSIST', v_match_id, get_p_id('Ivan', 'Cavaleiro', v_h_id));
    register_goal(v_match_id, get_p_id('Sergio', 'Barcia', v_a_id), 82, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 82, 'ASSIST', v_match_id, get_p_id('Tomas', 'Pekhart', v_a_id));
    reg_card(v_match_id, get_p_id('Marco', 'Ehmann', v_h_id), 60, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Marvin', 'Senger', v_h_id), get_p_id('Maciej', 'Domanski', v_h_id), 74);

    -- ROUND 9: Puszcza Niepołomice vs Raków Częstochowa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Puszcza Niepołomice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Raków Częstochowa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-13', 'YYYY-MM-DD'), 1, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kewin', 'Komar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Sołowiej', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michal', 'Siplak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Crăciun', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Radecki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Georgiy', 'Zhukov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Zieliński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klimek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Serafin', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Trelowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matej', 'Rodin', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pestka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ariel', 'Mosór', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milan', 'Rundic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Drachal', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gustav', 'Berggren', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tobiasz', 'Mras', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Walczak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Basse', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Leonardo', 'Rocha', v_a_id));
    register_goal(v_match_id, get_p_id('Georgiy', 'Zhukov', v_h_id), 86, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 86, 'ASSIST', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_h_id));
    register_goal(v_match_id, get_p_id('Leonardo', 'Rocha', v_a_id), 85, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 85, 'ASSIST', v_match_id, get_p_id('Tobiasz', 'Mras', v_a_id));
    register_goal(v_match_id, get_p_id('Milan', 'Rundic', v_a_id), 55, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 55, 'ASSIST', v_match_id, get_p_id('Dawid', 'Drachal', v_a_id));
    register_goal(v_match_id, get_p_id('Gustav', 'Berggren', v_a_id), 85, 0);
    register_goal(v_match_id, get_p_id('Ariel', 'Mosór', v_a_id), 11, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 11, 'ASSIST', v_match_id, get_p_id('Leonardo', 'Rocha', v_a_id));

    -- ROUND 10: Lech Poznań vs Śląsk Wrocław
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lech Poznań');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Śląsk Wrocław');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 2, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Mędrala', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Gurgul', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Douglas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Salamon', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ian', 'Hoffmann', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stjepan', 'Loncar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Kozubal', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Jagiełło', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bryan', 'Fiabema', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adriel', 'Ba Loua', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Walemark', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Leszczyński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Petkov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yegor', 'Matsenko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Llinares', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jose', 'Pozo', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcin', 'Cebula', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Świerczok', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Samiec-Talar', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Musiolik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tudor', 'Băluță', v_a_id));
    register_goal(v_match_id, get_p_id('Antoni', 'Kozubal', v_h_id), 39, 1);
    register_goal(v_match_id, get_p_id('Stjepan', 'Loncar', v_h_id), 67, 1);
    register_goal(v_match_id, get_p_id('Yegor', 'Matsenko', v_a_id), 88, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 88, 'ASSIST', v_match_id, get_p_id('Jose', 'Pozo', v_a_id));
    register_goal(v_match_id, get_p_id('Tudor', 'Băluță', v_a_id), 13, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 13, 'ASSIST', v_match_id, get_p_id('Marcin', 'Cebula', v_a_id));
    reg_card(v_match_id, get_p_id('Mateusz', 'Mędrala', v_h_id), 70, 'YELLOW_CARD');

    -- ROUND 10: Piast Gliwice vs Zagłębie Lubin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Piast Gliwice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Zagłębie Lubin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 0, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Frantisek', 'Plach', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miguel', 'Nóbrega', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lewicki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Akim', 'Zedadka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Huk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Chrapek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Dziczek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Grzegorz', 'Tomasiewicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fabian', 'Piasecki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Thierry', 'Gale', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Erik', 'Jirka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jasmin', 'Burić', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jaroslaw', 'Jach', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleks', 'Ławniczak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Michalski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Nalepa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Orlikowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Josip', 'Corluka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kurminowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Pieńko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kajetan', 'Szmyt', v_a_id));
    register_goal(v_match_id, get_p_id('Kajetan', 'Szmyt', v_a_id), 84, 0);
    register_goal(v_match_id, get_p_id('Damian', 'Michalski', v_a_id), 23, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 23, 'ASSIST', v_match_id, get_p_id('Jaroslaw', 'Jach', v_a_id));
    register_goal(v_match_id, get_p_id('Josip', 'Corluka', v_a_id), 57, 0);
    register_goal(v_match_id, get_p_id('Damian', 'Michalski', v_a_id), 45, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 45, 'ASSIST', v_match_id, get_p_id('Jasmin', 'Burić', v_a_id));
    reg_card(v_match_id, get_p_id('Erik', 'Jirka', v_h_id), 37, 'YELLOW_CARD');

    -- ROUND 10: Radomiak Radom vs Górnik Zabrze
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Radomiak Radom');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Górnik Zabrze');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 0, 3, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Kikolski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cichocki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zié', 'Ouattara', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Steve', 'Kingue', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pestka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Roberto', 'Alves', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paulius', 'Golubickas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Woźniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renat', 'Dadashov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rahil', 'Mammadov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Majchrowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Josema', 'Josema', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Mazurek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Szala', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matúš', 'Kmeť', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matija', 'Marsenić', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Ambros', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Hellebrand', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Tobolik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Podolski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sondre', 'Liseth', v_a_id));
    register_goal(v_match_id, get_p_id('Sondre', 'Liseth', v_a_id), 11, 0);
    register_goal(v_match_id, get_p_id('Josema', 'Josema', v_a_id), 34, 0);
    register_goal(v_match_id, get_p_id('Sondre', 'Liseth', v_a_id), 19, 0);
    reg_card(v_match_id, get_p_id('Rahil', 'Mammadov', v_h_id), 7, 'YELLOW_CARD');

    -- ROUND 10: Widzew Łódź vs Pogoń Szczecin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Widzew Łódź');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Pogoń Szczecin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 4, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Biegański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Therkildsen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żyro', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Krajewski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Kozlovský', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Kerk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Lewandowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fran', 'Alvarez', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hilary', 'Gong', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Sobol', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Gikiewicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kuba', 'Bochniarz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luizão', 'Luizão', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mariusz', 'Malec', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Linus', 'Wahlqvist', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Zawadzki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fredrik', 'Ulvestad', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('João', 'Gamboa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Kurzawa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Olaf', 'Korczakowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renyer', 'Renyer', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Bak', v_a_id));
    register_goal(v_match_id, get_p_id('Hubert', 'Sobol', v_h_id), 11, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 11, 'ASSIST', v_match_id, get_p_id('Sebastian', 'Kerk', v_h_id));
    register_goal(v_match_id, get_p_id('Rafał', 'Gikiewicz', v_h_id), 77, 1);
    register_goal(v_match_id, get_p_id('Sebastian', 'Kerk', v_h_id), 17, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 17, 'ASSIST', v_match_id, get_p_id('Rafał', 'Gikiewicz', v_h_id));
    register_goal(v_match_id, get_p_id('Rafał', 'Gikiewicz', v_h_id), 36, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 36, 'ASSIST', v_match_id, get_p_id('Marcel', 'Krajewski', v_h_id));
    register_goal(v_match_id, get_p_id('Renyer', 'Renyer', v_a_id), 66, 0);
    reg_card(v_match_id, get_p_id('Mateusz', 'Żyro', v_h_id), 29, 'YELLOW_CARD');

    -- ROUND 10: Lechia Gdańsk vs Cracovia
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lechia Gdańsk');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Cracovia');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 2, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Sarnavskyi', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bujar', 'Pllana', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miłosz', 'Kałahur', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Conrado', 'Conrado', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Borys', 'Jesionowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Biegański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Zhelizko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Viunnyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Camilo', 'Mena', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maksym', 'Khlan', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Głogowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Madejski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andreas', 'Skovgaard', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Janasik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arttu', 'Hoskonen', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kuba', 'Pestka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ajdin', 'Hasic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Davíd', 'Kristján Olafsson', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Amir', 'Al-Ammari', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamin', 'Kallman', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mick', 'van Buren', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jani', 'Atanasov', v_a_id));
    register_goal(v_match_id, get_p_id('Bujar', 'Pllana', v_h_id), 36, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 36, 'ASSIST', v_match_id, get_p_id('Michał', 'Głogowski', v_h_id));
    register_goal(v_match_id, get_p_id('Bogdan', 'Sarnavskyi', v_h_id), 35, 1);
    reg_card(v_match_id, get_p_id('Bogdan', 'Sarnavskyi', v_h_id), 88, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Anton', 'Tsarenko', v_h_id), get_p_id('Jan', 'Biegański', v_h_id), 47);

    -- ROUND 10: Motor Lublin vs Jagiellonia Białystok
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Motor Lublin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Jagiellonia Białystok');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 1, 3, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Brkic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Najemski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Kruk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krystian', 'Palacz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Murzacz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Gasior', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Romanowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mathieu', 'Scalet', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bradly van', 'Hoeven', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jean-Kévin', 'Augustin', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Ceglarz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Suchocki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Norbert', 'Wojtuszek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dusan', 'Stojinovic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lewicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dimitrios', 'Retsos', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Leon', 'Flach', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jesus', 'Imaz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Nené', 'Nené', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Darko', 'Churlinov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Edi', 'Semedo', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miki', 'Villar', v_a_id));
    register_goal(v_match_id, get_p_id('Krystian', 'Palacz', v_h_id), 35, 1);
    register_goal(v_match_id, get_p_id('Nené', 'Nené', v_a_id), 68, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 68, 'ASSIST', v_match_id, get_p_id('Jakub', 'Suchocki', v_a_id));
    register_goal(v_match_id, get_p_id('Edi', 'Semedo', v_a_id), 44, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 44, 'ASSIST', v_match_id, get_p_id('Jakub', 'Lewicki', v_a_id));
    register_goal(v_match_id, get_p_id('Jakub', 'Lewicki', v_a_id), 90, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 90, 'ASSIST', v_match_id, get_p_id('Leon', 'Flach', v_a_id));
    reg_card(v_match_id, get_p_id('Bradly van', 'Hoeven', v_h_id), 82, 'YELLOW_CARD');

    -- ROUND 10: Korona Kielce vs Legia Warszawa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Korona Kielce');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Legia Warszawa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Xavier', 'Dziekoński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartłomiej', 'Smolarczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Kośmicki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Malarczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milosz', 'Trojak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Martin', 'Remacle', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Woźniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Mamla', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominick', 'Zator', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Tobiasz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Steve', 'Kapuadi', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rúben', 'Vinagre', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Kun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Ziolkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Adkonis', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Jędrasik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Szczepaniak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michal', 'Kucharczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Gual', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jean-Pierre', 'Nsame', v_a_id));
    register_goal(v_match_id, get_p_id('Xavier', 'Dziekoński', v_h_id), 83, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 83, 'ASSIST', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_h_id));
    register_goal(v_match_id, get_p_id('Michal', 'Kucharczyk', v_a_id), 82, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 82, 'ASSIST', v_match_id, get_p_id('Marc', 'Gual', v_a_id));

    -- ROUND 10: GKS Katowice vs Raków Częstochowa
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('GKS Katowice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Raków Częstochowa');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 0, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kudła', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Klemenz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Jaroszek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Trepka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Jędrych', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Drachal', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Antczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Danek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Bergier', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Szymczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Zrelak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dusan', 'Kuciak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zoran', 'Arsenic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stratos', 'Svarnas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matej', 'Rodin', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milan', 'Rundic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ben', 'Lederman', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ibrahima', 'Seck', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Makuch', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('David', 'Ezeh', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Basse', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lazaros', 'Lamprou', v_a_id));
    register_goal(v_match_id, get_p_id('Adam', 'Basse', v_a_id), 22, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 22, 'ASSIST', v_match_id, get_p_id('David', 'Ezeh', v_a_id));

    -- ROUND 10: Stal Mielec vs Puszcza Niepołomice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Stal Mielec');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Puszcza Niepołomice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 1, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Jałocha', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Ehmann', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Matras', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marvin', 'Senger', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alvis', 'Jaunzems', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Tkacz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krystian', 'Getinger', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kōki', 'Hinokio', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Cavaleiro', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Robert', 'Dadok', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Perchel', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michal', 'Siplak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Crăciun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Sołowiej', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Abramowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klimek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Tomalski', v_a_id));
    register_goal(v_match_id, get_p_id('Robert', 'Dadok', v_h_id), 90, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 90, 'ASSIST', v_match_id, get_p_id('Marvin', 'Senger', v_h_id));
    reg_sub(v_match_id, get_p_id('Dawid', 'Zieba', v_h_id), get_p_id('Dawid', 'Tkacz', v_h_id), 46);

    -- ROUND 11: Lech Poznań vs Zagłębie Lubin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lech Poznań');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Zagłębie Lubin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-27', 'YYYY-MM-DD'), 4, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Bednarek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Joel', 'Pereira', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antonio', 'Milic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Elias', 'Andersson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Wichtowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sammy', 'Dudek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jesper', 'Karlström', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Afonso', 'Sousa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dino', 'Hotic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mario', 'González', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kornel', 'Lisman', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Hładun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleks', 'Ławniczak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Michalski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jaroslaw', 'Jach', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Nalepa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Pieńko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kajetan', 'Szmyt', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kurminowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Orlikowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id));
    register_goal(v_match_id, get_p_id('Dino', 'Hotic', v_h_id), 27, 1);
    register_goal(v_match_id, get_p_id('Filip', 'Bednarek', v_h_id), 22, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 22, 'ASSIST', v_match_id, get_p_id('Sammy', 'Dudek', v_h_id));
    register_goal(v_match_id, get_p_id('Joel', 'Pereira', v_h_id), 85, 1);
    register_goal(v_match_id, get_p_id('Filip', 'Bednarek', v_h_id), 56, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 56, 'ASSIST', v_match_id, get_p_id('Kornel', 'Lisman', v_h_id));

    -- ROUND 11: Śląsk Wrocław vs Górnik Zabrze
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Śląsk Wrocław');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Górnik Zabrze');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-27', 'YYYY-MM-DD'), 3, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Leszczyński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Petkov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yegor', 'Matsenko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Llinares', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Petr', 'Schwarz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jose', 'Pozo', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Samiec-Talar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Musiolik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żukowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Szymański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Szromnik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Prebsl', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matúš', 'Kmeť', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Olkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Radosław', 'Szafrański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matija', 'Marsenić', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Ambros', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Hellebrand', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Taofeek', 'Ismaheel', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sinan', 'Bakış', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Buksa', v_a_id));
    register_goal(v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id), 42, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 42, 'ASSIST', v_match_id, get_p_id('Jakub', 'Szymański', v_h_id));
    register_goal(v_match_id, get_p_id('Marc', 'Llinares', v_h_id), 41, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 41, 'ASSIST', v_match_id, get_p_id('Sebastian', 'Musiolik', v_h_id));
    register_goal(v_match_id, get_p_id('Piotr', 'Samiec-Talar', v_h_id), 66, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 66, 'ASSIST', v_match_id, get_p_id('Mateusz', 'Żukowski', v_h_id));
    reg_card(v_match_id, get_p_id('Petr', 'Schwarz', v_h_id), 12, 'YELLOW_CARD');

    -- ROUND 11: Piast Gliwice vs Pogoń Szczecin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Piast Gliwice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Pogoń Szczecin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-09-27', 'YYYY-MM-DD'), 4, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Szymański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miguel', 'Muñoz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lewicki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Drapiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Pyrka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miłosz', 'Szczepański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Leśniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Dziczek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jorge', 'Felix', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Rosołek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fabian', 'Piasecki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamín', 'Rojas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Lisowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benedikt', 'Zech', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Léo', 'Borges', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stanislaw', 'Wawrzynowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Smoliński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alexander', 'Gorgon', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Bak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klukowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renyer', 'Renyer', v_a_id));
    register_goal(v_match_id, get_p_id('Miłosz', 'Szczepański', v_h_id), 41, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 41, 'ASSIST', v_match_id, get_p_id('Patryk', 'Dziczek', v_h_id));
    register_goal(v_match_id, get_p_id('Miłosz', 'Szczepański', v_h_id), 26, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 26, 'ASSIST', v_match_id, get_p_id('Maciej', 'Rosołek', v_h_id));
    register_goal(v_match_id, get_p_id('Arkadiusz', 'Pyrka', v_h_id), 3, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 3, 'ASSIST', v_match_id, get_p_id('Karol', 'Szymański', v_h_id));
    register_goal(v_match_id, get_p_id('Jorge', 'Felix', v_h_id), 17, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 17, 'ASSIST', v_match_id, get_p_id('Patryk', 'Dziczek', v_h_id));
    reg_card(v_match_id, get_p_id('Arkadiusz', 'Pyrka', v_h_id), 85, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Ariel', 'Mosór', v_h_id), get_p_id('Fabian', 'Piasecki', v_h_id), 77);
    COMMIT;
END;
/
