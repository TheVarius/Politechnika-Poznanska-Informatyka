
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

    -- ROUND 1: Lech Poznań vs Puszcza Niepołomice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lech Poznań');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Puszcza Niepołomice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-19', 'YYYY-MM-DD'), 1, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Mędrala', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Elias', 'Andersson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Salamon', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maksymilian', 'Pingot', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Joel', 'Pereira', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Kozubal', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Afonso', 'Sousa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tymoteusz', 'Gmur', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Szymczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adriel', 'Ba Loua', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bryan', 'Fiabema', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kewin', 'Komar', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michal', 'Siplak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Mroziński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Sołowiej', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Crăciun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Radecki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Georgiy', 'Zhukov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klimek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_a_id));
    register_goal(v_match_id, get_p_id('Afonso', 'Sousa', v_h_id), 3, 1);
    reg_injury(v_match_id, get_p_id('Elias', 'Andersson', v_h_id), 52, 14);

    -- ROUND 1: Raków Częstochowa vs Stal Mielec
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Raków Częstochowa');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Stal Mielec');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-19', 'YYYY-MM-DD'), 1, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Trelowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matej', 'Rodin', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stratos', 'Svarnas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zoran', 'Arsenic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Racovitan', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jesus', 'Díaz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adriano', 'Adriano', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tobiasz', 'Mras', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Leonardo', 'Rocha', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('David', 'Ezeh', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Walczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kevin', 'Szurlej', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Ehmann', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Matras', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bert', 'Esselink', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pajnowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Knap', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Domanski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matthew', 'Guillaumier', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ravve', 'Assayag', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Cavaleiro', v_a_id));
    register_goal(v_match_id, get_p_id('Tomasz', 'Walczak', v_h_id), 15, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 15, 'ASSIST', v_match_id, get_p_id('Stratos', 'Svarnas', v_h_id));
    reg_card(v_match_id, get_p_id('Zoran', 'Arsenic', v_h_id), 65, 'YELLOW_CARD');
    reg_card(v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_a_id), 87, 'RED_CARD');
    reg_sub(v_match_id, get_p_id('Ibrahima', 'Seck', v_h_id), get_p_id('David', 'Ezeh', v_h_id), 73);

    -- ROUND 1: Legia Warszawa vs GKS Katowice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Legia Warszawa');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('GKS Katowice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-19', 'YYYY-MM-DD'), 3, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Banasik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Artur', 'Jędrzejczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Steve', 'Kapuadi', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Leszczyński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Wszołek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oliwier', 'Olewiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Strzałek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Urbański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Chodyna', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michal', 'Kucharczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Blaz', 'Kramer', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Strączek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Klemenz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Kaduk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Jędrych', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alan', 'Czerwiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Nowak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Gruszkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Shun', 'Shibata', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Bergier', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Arak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Zrelak', v_a_id));
    register_goal(v_match_id, get_p_id('Wojciech', 'Banasik', v_h_id), 3, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 3, 'ASSIST', v_match_id, get_p_id('Paweł', 'Wszołek', v_h_id));
    register_goal(v_match_id, get_p_id('Jan', 'Leszczyński', v_h_id), 51, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 51, 'ASSIST', v_match_id, get_p_id('Michal', 'Kucharczyk', v_h_id));
    register_goal(v_match_id, get_p_id('Blaz', 'Kramer', v_h_id), 32, 1);
    reg_card(v_match_id, get_p_id('Wojciech', 'Banasik', v_h_id), 1, 'YELLOW_CARD');
    reg_card(v_match_id, get_p_id('Shun', 'Shibata', v_a_id), 20, 'RED_CARD');

    -- ROUND 1: Jagiellonia Białystok vs Korona Kielce
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Jagiellonia Białystok');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Korona Kielce');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-19', 'YYYY-MM-DD'), 1, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Suchocki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Sacek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Kovacik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dusan', 'Stojinovic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Norbert', 'Wojtuszek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Leon', 'Flach', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jesus', 'Imaz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lamine', 'Diaby-Fadiga', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Silva', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Darko', 'Churlinov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kristoffer', 'Hansen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Zapytowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Pau', 'Resta', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milosz', 'Trojak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Kośmicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominick', 'Zator', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Martin', 'Remacle', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Woźniak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Kwiatkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Malarczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konstantinos', 'Sotiriou', v_a_id));
    register_goal(v_match_id, get_p_id('Jakub', 'Suchocki', v_h_id), 2, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 2, 'ASSIST', v_match_id, get_p_id('Lamine', 'Diaby-Fadiga', v_h_id));
    register_goal(v_match_id, get_p_id('Milosz', 'Trojak', v_a_id), 50, 0);
    register_goal(v_match_id, get_p_id('Pau', 'Resta', v_a_id), 90, 0);
    register_goal(v_match_id, get_p_id('Tomasz', 'Krawczyk', v_a_id), 49, 0);
    register_goal(v_match_id, get_p_id('Piotr', 'Malarczyk', v_a_id), 2, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 2, 'ASSIST', v_match_id, get_p_id('Konstantinos', 'Sotiriou', v_a_id));
    reg_sub(v_match_id, get_p_id('Wojciech', 'Łaski', v_h_id), get_p_id('Tomas', 'Silva', v_h_id), 75);

    -- ROUND 1: Cracovia vs Motor Lublin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Cracovia');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Motor Lublin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-19', 'YYYY-MM-DD'), 1, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Burek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arttu', 'Hoskonen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Glik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Jugas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Janasik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Sokołowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Pomietlo', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mauro', 'Perkovic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamin', 'Kallman', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mick', 'van Buren', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gustav', 'Henriksson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Rosa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Wójcik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bright', 'Ede', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marek', 'Bartos', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Murzacz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Gasior', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mathieu', 'Scalet', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergi', 'Samper', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Mráz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Król', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jean-Kévin', 'Augustin', v_a_id));
    register_goal(v_match_id, get_p_id('Patryk', 'Sokołowski', v_h_id), 3, 1);

    -- ROUND 1: Pogoń Szczecin vs Lechia Gdańsk
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Pogoń Szczecin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Lechia Gdańsk');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-19', 'YYYY-MM-DD'), 3, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Legowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benedikt', 'Zech', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Zawadzki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mariusz', 'Malec', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lis', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Przyborek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stanislaw', 'Wawrzynowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fredrik', 'Ulvestad', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klukowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renyer', 'Renyer', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Bak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Sarnavskyi', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Wójtowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Brylowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Elias', 'Olsson', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bujar', 'Pllana', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Anton', 'Tsarenko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Biegański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergiy', 'Buletsa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Camilo', 'Mena', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Głogowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Bobcek', v_a_id));
    register_goal(v_match_id, get_p_id('Benedikt', 'Zech', v_h_id), 53, 1);
    register_goal(v_match_id, get_p_id('Benedikt', 'Zech', v_h_id), 88, 1);
    register_goal(v_match_id, get_p_id('Stanislaw', 'Wawrzynowicz', v_h_id), 33, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 33, 'ASSIST', v_match_id, get_p_id('Lukasz', 'Legowski', v_h_id));
    reg_card(v_match_id, get_p_id('Adrian', 'Przyborek', v_h_id), 90, 'YELLOW_CARD');

    -- ROUND 1: Górnik Zabrze vs Widzew Łódź
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Górnik Zabrze');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Widzew Łódź');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-19', 'YYYY-MM-DD'), 0, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Szromnik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Erik', 'Janza', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Prebsl', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kryspin', 'Szcześniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Olkowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Ambros', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Hellebrand', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matija', 'Marsenić', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Tobolik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ousmane', 'Sow', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abbati', 'Abdullahi', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Biegański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Therkildsen', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luis', 'Silva', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Krajewski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żyro', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Kerk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Kwiatkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Sypek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hilary', 'Gong', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Sobol', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    reg_card(v_match_id, get_p_id('Marcel', 'Krajewski', v_a_id), 86, 'RED_CARD');
    reg_sub(v_match_id, get_p_id('Filip', 'Majchrowicz', v_h_id), get_p_id('Erik', 'Janza', v_h_id), 85);

    -- ROUND 1: Zagłębie Lubin vs Radomiak Radom
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Zagłębie Lubin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Radomiak Radom');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-19', 'YYYY-MM-DD'), 1, 4, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Matys', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Michalski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Nalepa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jaroslaw', 'Jach', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleks', 'Ławniczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Grzybek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kurminowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Hładun', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kajetan', 'Szmyt', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wiktor', 'Koptas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Grzesik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paulo', 'Henrique', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zié', 'Ouattara', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Saad', 'Agouzoul', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paulius', 'Golubickas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Christos', 'Donis', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Kaput', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renat', 'Dadashov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cichocki', v_a_id));
    register_goal(v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_h_id), 73, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 73, 'ASSIST', v_match_id, get_p_id('Kajetan', 'Szmyt', v_h_id));
    register_goal(v_match_id, get_p_id('Paulo', 'Henrique', v_a_id), 13, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 13, 'ASSIST', v_match_id, get_p_id('Zié', 'Ouattara', v_a_id));
    register_goal(v_match_id, get_p_id('Abdoul', 'Tapsoba', v_a_id), 38, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 38, 'ASSIST', v_match_id, get_p_id('Zié', 'Ouattara', v_a_id));
    register_goal(v_match_id, get_p_id('Saad', 'Agouzoul', v_a_id), 19, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 19, 'ASSIST', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_a_id));
    register_goal(v_match_id, get_p_id('Mateusz', 'Cichocki', v_a_id), 31, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 31, 'ASSIST', v_match_id, get_p_id('Paulo', 'Henrique', v_a_id));
    reg_card(v_match_id, get_p_id('Mateusz', 'Grzybek', v_h_id), 46, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Jan', 'Kowalski', v_h_id), get_p_id('Damian', 'Michalski', v_h_id), 84);

    -- ROUND 1: Śląsk Wrocław vs Piast Gliwice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Śląsk Wrocław');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Piast Gliwice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-19', 'YYYY-MM-DD'), 0, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Loska', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Petkov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yegor', 'Matsenko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Llinares', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Pokorný', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Szymański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Szymański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Świerczok', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Musiolik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Samiec-Talar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcin', 'Cebula', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Szymański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Czerwiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Huk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Akim', 'Zedadka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Levis', 'Pitan', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Karbowy', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miłosz', 'Szczepański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Chrapek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jorge', 'Felix', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Rosołek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Thierry', 'Gale', v_a_id));
    reg_card(v_match_id, get_p_id('Yegor', 'Matsenko', v_h_id), 18, 'YELLOW_CARD');
    reg_card(v_match_id, get_p_id('Michał', 'Chrapek', v_a_id), 74, 'RED_CARD');
    reg_sub(v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_h_id), get_p_id('Jakub', 'Szymański', v_h_id), 66);

    -- ROUND 2: Lech Poznań vs Stal Mielec
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lech Poznań');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Stal Mielec');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-26', 'YYYY-MM-DD'), 2, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Mędrala', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antonio', 'Milic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Wichtowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Douglas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Gurgul', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rasmus', 'Carstensen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stjepan', 'Loncar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tymoteusz', 'Gmur', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dino', 'Hotic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Daniel', 'Håkans', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikael', 'Ishak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Jałocha', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pajnowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Ehmann', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Matras', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marvin', 'Senger', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Kądzior', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Wołkowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Pyry', 'Hannola', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Cavaleiro', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Robert', 'Dadok', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ravve', 'Assayag', v_a_id));
    register_goal(v_match_id, get_p_id('Rasmus', 'Carstensen', v_h_id), 43, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 43, 'ASSIST', v_match_id, get_p_id('Daniel', 'Håkans', v_h_id));
    register_goal(v_match_id, get_p_id('Rasmus', 'Carstensen', v_h_id), 11, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 11, 'ASSIST', v_match_id, get_p_id('Alex', 'Douglas', v_h_id));
    register_goal(v_match_id, get_p_id('Marco', 'Ehmann', v_a_id), 63, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 63, 'ASSIST', v_match_id, get_p_id('Krzysztof', 'Wołkowicz', v_a_id));
    register_goal(v_match_id, get_p_id('Ravve', 'Assayag', v_a_id), 59, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 59, 'ASSIST', v_match_id, get_p_id('Marco', 'Ehmann', v_a_id));
    reg_card(v_match_id, get_p_id('Daniel', 'Håkans', v_h_id), 2, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Jesper', 'Karlström', v_h_id), get_p_id('Alex', 'Douglas', v_h_id), 72);

    -- ROUND 2: Puszcza Niepołomice vs GKS Katowice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Puszcza Niepołomice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('GKS Katowice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-26', 'YYYY-MM-DD'), 0, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Perchel', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michal', 'Siplak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Roman', 'Yakuba', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Mroziński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Szymański', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klimek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Stępień', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kudła', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Trepka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Jaroszek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Kaduk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alan', 'Czerwiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Mak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Grzegorz', 'Rogala', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Nowak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Zrelak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Szymczak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Bergier', v_a_id));
    register_goal(v_match_id, get_p_id('Mateusz', 'Mak', v_a_id), 2, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 2, 'ASSIST', v_match_id, get_p_id('Grzegorz', 'Rogala', v_a_id));
    register_goal(v_match_id, get_p_id('Dawid', 'Kudła', v_a_id), 56, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 56, 'ASSIST', v_match_id, get_p_id('Bartosz', 'Nowak', v_a_id));
    reg_card(v_match_id, get_p_id('Dawid', 'Szymonowicz', v_h_id), 30, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Dawid', 'Abramowicz', v_h_id), get_p_id('Michał', 'Perchel', v_h_id), 77);

    -- ROUND 2: Raków Częstochowa vs Korona Kielce
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Raków Częstochowa');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Korona Kielce');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-26', 'YYYY-MM-DD'), 3, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Trelowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ariel', 'Mosór', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pestka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zoran', 'Arsenic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stratos', 'Svarnas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fran', 'Tudor', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Makuch', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Drachal', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Walczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Leonardo', 'Rocha', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lazaros', 'Lamprou', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Mikielewicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominick', 'Zator', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Malarczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Pięczek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Pau', 'Resta', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andrzej', 'Wójcik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Martin', 'Remacle', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Kośmicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Mamla', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Zapytowski', v_a_id));
    register_goal(v_match_id, get_p_id('Fran', 'Tudor', v_h_id), 43, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 43, 'ASSIST', v_match_id, get_p_id('Kacper', 'Trelowski', v_h_id));
    register_goal(v_match_id, get_p_id('Patryk', 'Makuch', v_h_id), 70, 1);
    register_goal(v_match_id, get_p_id('Kamil', 'Pestka', v_h_id), 18, 1);
    register_goal(v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id), 66, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 66, 'ASSIST', v_match_id, get_p_id('Pau', 'Resta', v_a_id));
    reg_sub(v_match_id, get_p_id('David', 'Ezeh', v_h_id), get_p_id('Tomasz', 'Walczak', v_h_id), 49);

    -- ROUND 2: Legia Warszawa vs Motor Lublin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Legia Warszawa');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Motor Lublin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-26', 'YYYY-MM-DD'), 2, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Tobiasz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Wszołek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Ziolkowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Burch', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergio', 'Barcia', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Kapustka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juergen', 'Elitim', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maxi', 'Oyedele', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Blaz', 'Kramer', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jean-Pierre', 'Nsame', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jordan', 'Majchrzak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Jez', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Najemski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Wójcik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bright', 'Ede', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marek', 'Bartos', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafal', 'Krol', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Romanowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Łabojko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antonio', 'Sefer', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Król', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Mráz', v_a_id));
    register_goal(v_match_id, get_p_id('Sergio', 'Barcia', v_h_id), 41, 1);
    register_goal(v_match_id, get_p_id('Paweł', 'Wszołek', v_h_id), 25, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 25, 'ASSIST', v_match_id, get_p_id('Kacper', 'Tobiasz', v_h_id));
    reg_sub(v_match_id, get_p_id('Claude', 'Gonçalves', v_h_id), get_p_id('Jan', 'Ziolkowski', v_h_id), 71);

    -- ROUND 2: Jagiellonia Białystok vs Lechia Gdańsk
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Jagiellonia Białystok');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Lechia Gdańsk');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-26', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Suchocki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('João', 'Moutinho', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Norbert', 'Wojtuszek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dusan', 'Stojinovic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lewicki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jarosław', 'Kubicki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Eryk', 'Kozłowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Mazurek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Edi', 'Semedo', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kristoffer', 'Hansen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Pietuszewski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Sarnavskyi', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Borys', 'Jesionowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Wójtowicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miłosz', 'Kałahur', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andrei', 'Chindriș', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Viunnyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Bajko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karl', 'Wendt', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Bobcek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Głogowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Camilo', 'Mena', v_a_id));
    register_goal(v_match_id, get_p_id('Eryk', 'Kozłowski', v_h_id), 87, 1);
    register_goal(v_match_id, get_p_id('Camilo', 'Mena', v_a_id), 33, 0);

    -- ROUND 2: Cracovia vs Widzew Łódź
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Cracovia');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Widzew Łódź');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-26', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Madejski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Janasik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andreas', 'Skovgaard', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gustav', 'Henriksson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Jugas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Biedrzycki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Otar', 'Kakabadze', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Sokołowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamin', 'Kallman', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mick', 'van Buren', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Henrich', 'Ravas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Krzywański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żyro', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Kozlovský', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luis', 'Silva', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Therkildsen', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Woźniak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Lewandowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Kerk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hilary', 'Gong', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Sobol', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Biegański', v_a_id));
    register_goal(v_match_id, get_p_id('Otar', 'Kakabadze', v_h_id), 38, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 38, 'ASSIST', v_match_id, get_p_id('Benjamin', 'Kallman', v_h_id));
    register_goal(v_match_id, get_p_id('Bartosz', 'Lewandowski', v_a_id), 39, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 39, 'ASSIST', v_match_id, get_p_id('Hilary', 'Gong', v_a_id));

    -- ROUND 2: Pogoń Szczecin vs Radomiak Radom
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Pogoń Szczecin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Radomiak Radom');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-26', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Kamiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Linus', 'Wahlqvist', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamín', 'Rojas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benedikt', 'Zech', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lis', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Łukasiak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('João', 'Gamboa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Wędrychowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klukowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Olaf', 'Korczakowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Bak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wiktor', 'Koptas', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Saad', 'Agouzoul', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Burch', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cichocki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pestka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Francisco', 'Ramos', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Christos', 'Donis', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renat', 'Dadashov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bruno', 'Jordão', v_a_id));
    register_goal(v_match_id, get_p_id('Jakub', 'Lis', v_h_id), 77, 1);
    register_goal(v_match_id, get_p_id('Tomasz', 'Krawczyk', v_a_id), 48, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 48, 'ASSIST', v_match_id, get_p_id('Renat', 'Dadashov', v_a_id));
    reg_card(v_match_id, get_p_id('Mateusz', 'Bak', v_h_id), 84, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Mariusz', 'Malec', v_h_id), get_p_id('Krzysztof', 'Kamiński', v_h_id), 50);

    -- ROUND 2: Górnik Zabrze vs Piast Gliwice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Górnik Zabrze');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Piast Gliwice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-26', 'YYYY-MM-DD'), 4, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Szromnik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matúš', 'Kmeť', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kryspin', 'Szcześniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Erik', 'Janza', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Olkowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Hellebrand', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Ambros', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matija', 'Marsenić', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Tobolik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sinan', 'Bakış', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sondre', 'Liseth', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Szymański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Czerwiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miguel', 'Muñoz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Mokwa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miguel', 'Nóbrega', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Grzegorz', 'Tomasiewicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Karbowy', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Leśniak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andreas', 'Katsantonis', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jorge', 'Felix', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Rosołek', v_a_id));
    register_goal(v_match_id, get_p_id('Matija', 'Marsenić', v_h_id), 65, 1);
    register_goal(v_match_id, get_p_id('Matúš', 'Kmeť', v_h_id), 4, 1);
    register_goal(v_match_id, get_p_id('Michał', 'Szromnik', v_h_id), 83, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 83, 'ASSIST', v_match_id, get_p_id('Sondre', 'Liseth', v_h_id));
    register_goal(v_match_id, get_p_id('Aleksander', 'Tobolik', v_h_id), 37, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 37, 'ASSIST', v_match_id, get_p_id('Patrik', 'Hellebrand', v_h_id));
    register_goal(v_match_id, get_p_id('Miguel', 'Nóbrega', v_a_id), 67, 0);
    reg_sub(v_match_id, get_p_id('Yosuke', 'Furukawa', v_h_id), get_p_id('Aleksander', 'Tobolik', v_h_id), 54);

    -- ROUND 2: Zagłębie Lubin vs Śląsk Wrocław
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Zagłębie Lubin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Śląsk Wrocław');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-07-26', 'YYYY-MM-DD'), 0, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jasmin', 'Burić', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Michalski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jaroslaw', 'Jach', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Nalepa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleks', 'Ławniczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Kowalski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Orlikowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Krawczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kurminowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Makowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Pieńko', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Loska', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Petkov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yegor', 'Matsenko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Llinares', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jose', 'Pozo', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Szymański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcin', 'Cebula', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żukowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Samiec-Talar', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Świerczok', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Pokorný', v_a_id));
    register_goal(v_match_id, get_p_id('Piotr', 'Samiec-Talar', v_a_id), 21, 0);
    register_goal(v_match_id, get_p_id('Tomasz', 'Loska', v_a_id), 56, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 56, 'ASSIST', v_match_id, get_p_id('Jose', 'Pozo', v_a_id));

    -- ROUND 3: Lech Poznań vs GKS Katowice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lech Poznań');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('GKS Katowice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-02', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Mrozek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Gurgul', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antonio', 'Milic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Wichtowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maksymilian', 'Pingot', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Radosław', 'Murawski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jesper', 'Karlström', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Afonso', 'Sousa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adriel', 'Ba Loua', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Walemark', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dino', 'Hotic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Przemyslaw', 'Peksa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Komor', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alan', 'Czerwiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Klemenz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Kaduk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Milewski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Gruszkowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Shun', 'Shibata', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Arak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Szymczak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Bergier', v_a_id));
    register_goal(v_match_id, get_p_id('Michał', 'Gurgul', v_h_id), 84, 1);
    register_goal(v_match_id, get_p_id('Jakub', 'Kaduk', v_a_id), 75, 0);

    -- ROUND 3: Stal Mielec vs Korona Kielce
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Stal Mielec');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Korona Kielce');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-02', 'YYYY-MM-DD'), 1, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Dybowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Matras', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Ehmann', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pajnowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alvis', 'Jaunzems', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Knap', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fryderyk', 'Gerbowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Wołkowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Cavaleiro', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ravve', 'Assayag', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Niedbała', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Pięczek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartłomiej', 'Smolarczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Pau', 'Resta', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Malarczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Kamiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Martin', 'Remacle', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yoav', 'Hofmayster', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Kośmicki', v_a_id));
    register_goal(v_match_id, get_p_id('Ivan', 'Cavaleiro', v_h_id), 26, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 26, 'ASSIST', v_match_id, get_p_id('Mateusz', 'Matras', v_h_id));
    register_goal(v_match_id, get_p_id('Martin', 'Remacle', v_a_id), 40, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 40, 'ASSIST', v_match_id, get_p_id('Michał', 'Niedbała', v_a_id));
    register_goal(v_match_id, get_p_id('Igor', 'Kośmicki', v_a_id), 15, 0);
    reg_card(v_match_id, get_p_id('Krzysztof', 'Wołkowicz', v_h_id), 37, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Krystian', 'Getinger', v_h_id), get_p_id('Marco', 'Ehmann', v_h_id), 72);

    -- ROUND 3: Puszcza Niepołomice vs Motor Lublin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Puszcza Niepołomice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Motor Lublin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-02', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kewin', 'Komar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Roman', 'Yakuba', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michal', 'Siplak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Mroziński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Serafin', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Stępień', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Georgiy', 'Zhukov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klimek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Zieliński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Brkic', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Wójcik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Kruk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Luberecki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hervé', 'Matthys', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Łabojko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Kubica', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Wolski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mbaye', 'Ndiaye', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Mráz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Król', v_a_id));
    register_goal(v_match_id, get_p_id('Mateusz', 'Cholewiak', v_h_id), 57, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 57, 'ASSIST', v_match_id, get_p_id('Konrad', 'Stępień', v_h_id));
    register_goal(v_match_id, get_p_id('Krzysztof', 'Kubica', v_a_id), 72, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 72, 'ASSIST', v_match_id, get_p_id('Samuel', 'Mráz', v_a_id));

    -- ROUND 3: Raków Częstochowa vs Lechia Gdańsk
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Raków Częstochowa');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Lechia Gdańsk');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-02', 'YYYY-MM-DD'), 2, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dusan', 'Kuciak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Racovitan', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pestka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zoran', 'Arsenic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stratos', 'Svarnas', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Vasilios', 'Sourlis', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Vladyslav', 'Kochergin', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adriano', 'Adriano', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lazaros', 'Lamprou', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Walczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ante', 'Crnac', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Gutowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Loup-Diwan', 'Gueho', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miłosz', 'Kałahur', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Andrei', 'Chindriș', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bujar', 'Pllana', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karl', 'Wendt', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Zhelizko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Piła', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Sezonienko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Camilo', 'Mena', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Bobcek', v_a_id));
    register_goal(v_match_id, get_p_id('Lazaros', 'Lamprou', v_h_id), 86, 1);
    register_goal(v_match_id, get_p_id('Ante', 'Crnac', v_h_id), 67, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 67, 'ASSIST', v_match_id, get_p_id('Tomasz', 'Walczak', v_h_id));
    register_goal(v_match_id, get_p_id('Camilo', 'Mena', v_a_id), 18, 0);
    register_goal(v_match_id, get_p_id('Ivan', 'Zhelizko', v_a_id), 39, 0);
    reg_sub(v_match_id, get_p_id('Michael', 'Ameyaw', v_h_id), get_p_id('Zoran', 'Arsenic', v_h_id), 53);

    -- ROUND 3: Legia Warszawa vs Widzew Łódź
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Legia Warszawa');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Widzew Łódź');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-02', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gabriel', 'Kobylak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Leszczyński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergio', 'Barcia', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Wszołek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Radovan', 'Pankov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Kapustka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Claude', 'Gonçalves', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleksander', 'Wyganowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Migouel', 'Alfarela', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michal', 'Kucharczyk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jean-Pierre', 'Nsame', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Gikiewicz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Krajewski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juan', 'Ibiza', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luis', 'Silva', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żyro', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Kerk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Lewandowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fran', 'Alvarez', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hilary', 'Gong', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Sobol', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    register_goal(v_match_id, get_p_id('Aleksander', 'Wyganowski', v_h_id), 20, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 20, 'ASSIST', v_match_id, get_p_id('Jean-Pierre', 'Nsame', v_h_id));
    register_goal(v_match_id, get_p_id('Bartosz', 'Lewandowski', v_a_id), 68, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 68, 'ASSIST', v_match_id, get_p_id('Juan', 'Ibiza', v_a_id));
    reg_sub(v_match_id, get_p_id('Wojciech', 'Urbański', v_h_id), get_p_id('Radovan', 'Pankov', v_h_id), 66);

    -- ROUND 3: Jagiellonia Białystok vs Radomiak Radom
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Jagiellonia Białystok');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Radomiak Radom');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-02', 'YYYY-MM-DD'), 2, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sławomir', 'Abramowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Lewicki', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Kovacik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Diéguez', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Olszewski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Nené', 'Nené', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Taras', 'Romanczuk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Stypułkowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomas', 'Silva', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Darko', 'Churlinov', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Marczuk', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Kikolski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paulo', 'Henrique', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Zié', 'Ouattara', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Saad', 'Agouzoul', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cichocki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bruno', 'Jordão', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Kaput', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adam', 'Woźniak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Renat', 'Dadashov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abdoul', 'Tapsoba', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Francisco', 'Ramos', v_a_id));
    register_goal(v_match_id, get_p_id('Peter', 'Kovacik', v_h_id), 64, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 64, 'ASSIST', v_match_id, get_p_id('Darko', 'Churlinov', v_h_id));
    register_goal(v_match_id, get_p_id('Jakub', 'Lewicki', v_h_id), 22, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 22, 'ASSIST', v_match_id, get_p_id('Taras', 'Romanczuk', v_h_id));
    reg_card(v_match_id, get_p_id('Adam', 'Woźniak', v_a_id), 35, 'RED_CARD');
    reg_sub(v_match_id, get_p_id('Mateusz', 'Skrzypczak', v_h_id), get_p_id('Peter', 'Kovacik', v_h_id), 68);

    -- ROUND 3: Cracovia vs Piast Gliwice
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Cracovia');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Piast Gliwice');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-02', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Burek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arttu', 'Hoskonen', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kuba', 'Pestka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Wójcik', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Paweł', 'Jaroszyński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Rakoczy', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Martin', 'Minchev', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Rózga', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Benjamin', 'Kallman', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mick', 'van Buren', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Oskar', 'Lachowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Rychta', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miguel', 'Muñoz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Czerwiński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Pyrka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Levis', 'Pitan', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patryk', 'Dziczek', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kopczyński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tihomir', 'Kostadinov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Erik', 'Jirka', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fabian', 'Piasecki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Thierry', 'Gale', v_a_id));
    register_goal(v_match_id, get_p_id('Oskar', 'Wójcik', v_h_id), 18, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 18, 'ASSIST', v_match_id, get_p_id('Oskar', 'Lachowicz', v_h_id));
    register_goal(v_match_id, get_p_id('Patryk', 'Dziczek', v_a_id), 80, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 80, 'ASSIST', v_match_id, get_p_id('Levis', 'Pitan', v_a_id));

    -- ROUND 3: Pogoń Szczecin vs Śląsk Wrocław
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Pogoń Szczecin');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Śląsk Wrocław');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-02', 'YYYY-MM-DD'), 0, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Kamiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Wojciech', 'Lisowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luizão', 'Luizão', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dimitrios', 'Keramitsis', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mariusz', 'Malec', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Smoliński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stanislaw', 'Wawrzynowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Fredrik', 'Ulvestad', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klukowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Vahan', 'Bichakhchyan', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Efthymios', 'Koulouris', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafał', 'Leszczyński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alex', 'Petkov', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yegor', 'Matsenko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marc', 'Llinares', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krzysztof', 'Wiśniewski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Świerczok', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Samiec-Talar', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Musiolik', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcin', 'Cebula', v_a_id));
    reg_sub(v_match_id, get_p_id('Rafał', 'Kurzawa', v_h_id), get_p_id('Luizão', 'Luizão', v_h_id), 46);

    -- ROUND 3: Górnik Zabrze vs Zagłębie Lubin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Górnik Zabrze');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Zagłębie Lubin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-02', 'YYYY-MM-DD'), 1, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Jeleń', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matúš', 'Kmeť', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kryspin', 'Szcześniak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Erik', 'Janza', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Mazurek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matija', 'Marsenić', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Ambros', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Patrik', 'Hellebrand', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sinan', 'Bakış', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukas', 'Podolski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Abbati', 'Abdullahi', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dominik', 'Hładun', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Michalski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jaroslaw', 'Jach', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Nalepa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Aleks', 'Ławniczak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Damian', 'Dąbrowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Orlikowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tomasz', 'Makowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Kurminowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Kowalczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_a_id));
    register_goal(v_match_id, get_p_id('Matúš', 'Kmeť', v_h_id), 58, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 58, 'ASSIST', v_match_id, get_p_id('Mateusz', 'Jeleń', v_h_id));

    -- ROUND 4: Lech Poznań vs Korona Kielce
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Lech Poznań');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Korona Kielce');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-09', 'YYYY-MM-DD'), 0, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Bednarek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Salamon', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ian', 'Hoffmann', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Gurgul', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maciej', 'Wichtowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Tymoteusz', 'Gmur', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Stjepan', 'Loncar', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Gísli', 'Thórdarson', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Szymczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dino', 'Hotic', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kornel', 'Lisman', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marcel', 'Zapytowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konstantinos', 'Sotiriou', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Milosz', 'Trojak', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Malarczyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Igor', 'Kośmicki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Jankowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Yoav', 'Hofmayster', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Xavier', 'Dziekoński', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Niedbała', v_a_id));
    register_goal(v_match_id, get_p_id('Szymon', 'Kozłowski', v_a_id), 72, 0);
    register_goal(v_match_id, get_p_id('Szymon', 'Kozłowski', v_a_id), 9, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 9, 'ASSIST', v_match_id, get_p_id('Marcel', 'Zapytowski', v_a_id));
    reg_card(v_match_id, get_p_id('Dino', 'Hotic', v_h_id), 28, 'YELLOW_CARD');
    reg_sub(v_match_id, get_p_id('Alex', 'Douglas', v_h_id), get_p_id('Dino', 'Hotic', v_h_id), 58);

    -- ROUND 4: GKS Katowice vs Motor Lublin
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('GKS Katowice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Motor Lublin');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-09', 'YYYY-MM-DD'), 1, 1, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Przemyslaw', 'Peksa', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Jędrych', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alan', 'Czerwiński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Jaroszek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Łukasz', 'Trepka', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Alan', 'Bród', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Marzec', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Adrian', 'Danek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Arak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sebastian', 'Bergier', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Szymczak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Rosa', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Arkadiusz', 'Najemski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Luberecki', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hervé', 'Matthys', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Krystian', 'Palacz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Sergi', 'Samper', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kaan', 'Caliskaner', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Rafal', 'Krol', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Samuel', 'Mráz', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bradly van', 'Hoeven', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Król', v_a_id));
    register_goal(v_match_id, get_p_id('Alan', 'Bród', v_h_id), 47, 1);
    register_goal(v_match_id, get_p_id('Kacper', 'Rosa', v_a_id), 30, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 30, 'ASSIST', v_match_id, get_p_id('Filip', 'Luberecki', v_a_id));
    reg_card(v_match_id, get_p_id('Jakub', 'Arak', v_h_id), 88, 'YELLOW_CARD');
    reg_card(v_match_id, get_p_id('Arkadiusz', 'Najemski', v_a_id), 49, 'RED_CARD');
    reg_sub(v_match_id, get_p_id('Lukas', 'Klemenz', v_h_id), get_p_id('Przemyslaw', 'Peksa', v_h_id), 48);

    -- ROUND 4: Stal Mielec vs Lechia Gdańsk
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Stal Mielec');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Lechia Gdańsk');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-09', 'YYYY-MM-DD'), 2, 0, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Karol', 'Dybowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kamil', 'Pajnowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marvin', 'Senger', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Marco', 'Ehmann', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bert', 'Esselink', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Zieba', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Wlazło', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Matthew', 'Guillaumier', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Robert', 'Dadok', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ravve', 'Assayag', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Gutowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Conrado', 'Conrado', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bujar', 'Pllana', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Brylowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Miłosz', 'Kałahur', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Biegański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ivan', 'Zhelizko', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bogdan', 'Viunnyk', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Głogowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Maksym', 'Khlan', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Kacper', 'Sezonienko', v_a_id));
    register_goal(v_match_id, get_p_id('Lukasz', 'Wolsztynski', v_h_id), 69, 1);
    register_goal(v_match_id, get_p_id('Kamil', 'Pajnowski', v_h_id), 50, 1);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 50, 'ASSIST', v_match_id, get_p_id('Dawid', 'Zieba', v_h_id));
    reg_card(v_match_id, get_p_id('Marco', 'Ehmann', v_h_id), 64, 'YELLOW_CARD');
    reg_card(v_match_id, get_p_id('Conrado', 'Conrado', v_a_id), 64, 'RED_CARD');

    -- ROUND 4: Puszcza Niepołomice vs Widzew Łódź
    SELECT club_id INTO v_h_id FROM Team WHERE UPPER(name) = UPPER('Puszcza Niepołomice');
    SELECT club_id INTO v_a_id FROM Team WHERE UPPER(name) = UPPER('Widzew Łódź');
    SELECT stadium_id INTO v_stadium_id FROM Stadium WHERE city = (SELECT city FROM Team WHERE club_id = v_h_id) AND ROWNUM = 1;
    INSERT INTO Match (match_id, match_date, score_home, score_away, league_id, home_team_id, away_team_id, stadium_id)
    VALUES (seq_match_id.NEXTVAL, TO_DATE('2024-08-09', 'YYYY-MM-DD'), 0, 2, v_league_id, v_h_id, v_a_id, v_stadium_id)
    RETURNING match_id INTO v_match_id;
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michał', 'Perchel', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Szymonowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Michal', 'Siplak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Piotr', 'Mroziński', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Ioan-Calin', 'Revenco', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Dawid', 'Abramowicz', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Szymon', 'Kozłowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Antoni', 'Klimek', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Cholewiak', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Konrad', 'Stępień', v_h_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mikołaj', 'Biegański', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Mateusz', 'Żyro', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Peter', 'Therkildsen', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Juan', 'Ibiza', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Luis', 'Silva', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Bartosz', 'Lewandowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Filip', 'Dąbrowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jakub', 'Łukowski', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hilary', 'Gong', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Hubert', 'Sobol', v_a_id));
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 0, 'ENTRY', v_match_id, get_p_id('Jan', 'Krzywański', v_a_id));
    register_goal(v_match_id, get_p_id('Luis', 'Silva', v_a_id), 77, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 77, 'ASSIST', v_match_id, get_p_id('Hilary', 'Gong', v_a_id));
    register_goal(v_match_id, get_p_id('Hilary', 'Gong', v_a_id), 42, 0);
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id) VALUES (seq_event_id.NEXTVAL, 42, 'ASSIST', v_match_id, get_p_id('Bartosz', 'Lewandowski', v_a_id));
    reg_card(v_match_id, get_p_id('Filip', 'Dąbrowski', v_h_id), 79, 'YELLOW_CARD');
    COMMIT;
END;
/
