-- SKRYPT GENERUJĄCY LOSOWE TRENINGI MIĘDZY MECZAMI
-- Generuje 3 treningi dla każdego zespołu pomiędzy meczami (co 7 dni)

DECLARE
    CURSOR c_teams IS SELECT club_id, name FROM Team;
    CURSOR c_matches(p_team_id NUMBER) IS 
        SELECT match_date 
        FROM Match 
        WHERE home_team_id = p_team_id OR away_team_id = p_team_id
        ORDER BY match_date;
    
    TYPE t_dates IS TABLE OF DATE;
    v_match_dates t_dates;
    
    v_training_date DATE;
    v_start_hour NUMBER;
    v_duration   NUMBER;
    v_focus      VARCHAR2(50);
    
    TYPE t_focus IS TABLE OF VARCHAR2(50);
    v_focus_list t_focus := t_focus(
        'Bramkarski', 'Strzelecki', 'Stałe fragmenty', 
        'Taktyczny', 'Fizyczny', 'Biegowy', 
        'Defensywny', 'Zespołowy'
    );

BEGIN
    FOR r_team IN c_teams LOOP
        -- Pobierz daty meczów dla danej drużyny
        OPEN c_matches(r_team.club_id);
        FETCH c_matches BULK COLLECT INTO v_match_dates;
        CLOSE c_matches;

        -- Jeśli drużyna ma mecze, generuj treningi między nimi
        IF v_match_dates.COUNT > 1 THEN
            FOR i IN 1..(v_match_dates.COUNT - 1) LOOP
                -- Generuj 3 treningi w 7-dniowym odstępie między meczami
                -- (np. 2, 4 i 6 dzień po meczu)
                FOR j IN 1..3 LOOP
                    -- Wybieramy konkretne dni po meczu, aby nie nachodziły na siebie (2, 4, 6 dzień)
                    v_training_date := v_match_dates(i) + (j * 1.5); -- 1.5, 3, 4.5 dnia po meczu (uproszczone)
                    
                    -- Losowy dzień (między meczami co 7 dni)
                    v_training_date := v_match_dates(i) + CASE j WHEN 1 THEN 2 WHEN 2 THEN 4 ELSE 6 END;
                    
                    -- Losowa pełna godzina od 10 do 15
                    v_start_hour := TRUNC(DBMS_RANDOM.VALUE(10, 16)); 
                    
                    -- Ustawiamy godzinę w dacie
                    v_training_date := TRUNC(v_training_date) + (v_start_hour / 24);
                    
                    -- Losowy duration od 60 do 180 min (1-3h)
                    v_duration := TRUNC(DBMS_RANDOM.VALUE(1, 4)) * 60;
                    
                    -- Losowy focus
                    v_focus := v_focus_list(TRUNC(DBMS_RANDOM.VALUE(1, v_focus_list.COUNT + 1)));

                    INSERT INTO Training (start_time, duration_min, focus, Team_club_id)
                    VALUES (v_training_date, v_duration, v_focus, r_team.club_id);
                END LOOP;
            END LOOP;
        END IF;
    END LOOP;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Pomyślnie wygenerowano treningi dla wszystkich zespołów.');
END;
/
