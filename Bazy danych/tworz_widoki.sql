-- WIDOKI I TRIGGERY DML (INSTEAD OF)
-- PozwalajƒÖ na operacje INSERT/UPDATE/DELETE bezpo≈õrednio na widokach
-- co jest kluczowe dla ≈Çatwej pracy w APEX.

--------------------------------------------------------
-- 1. PI≈ÅKARZE (V_PLAYER)
--------------------------------------------------------
CREATE OR REPLACE VIEW V_PLAYER AS 
SELECT 
    m.member_id, 
    m.first_name, 
    m.last_name, 
    m.first_name || ' ' || m.last_name AS full_name, 
    m.date_of_birth, 
    ROUND((SYSDATE - m.date_of_birth)/365.25) as age, 
    m.nationality, 
    p.position, 
    p.shirt_number, 
    p.height, 
    p.weight, 
    p.preferred_foot, 
    t.name AS team_name, 
    p.club_id 
FROM Member m 
JOIN Player p ON m.member_id = p.member_id 
LEFT JOIN Team t ON p.club_id = t.club_id;
/

CREATE OR REPLACE TRIGGER trg_v_player_dml
INSTEAD OF INSERT OR UPDATE OR DELETE ON V_PLAYER
FOR EACH ROW
DECLARE
    v_id NUMBER;
BEGIN
    IF INSERTING THEN
        -- Je≈õli nie podano member_id, tw√≥rzymy nowego cz≈Çonka
        IF :NEW.member_id IS NULL THEN
            INSERT INTO Member (first_name, last_name, date_of_birth, nationality)
            VALUES (:NEW.first_name, :NEW.last_name, :NEW.date_of_birth, :NEW.nationality)
            RETURNING member_id INTO v_id;
        ELSE
            v_id := :NEW.member_id;
        END IF;

        -- Dodajemy wpis do tabeli Player
        INSERT INTO Player (member_id, position, shirt_number, height, weight, preferred_foot, club_id)
        VALUES (v_id, :NEW.position, :NEW.shirt_number, :NEW.height, :NEW.weight, :NEW.preferred_foot, :NEW.club_id);

    ELSIF UPDATING THEN
        UPDATE Member SET 
            first_name = :NEW.first_name, 
            last_name = :NEW.last_name, 
            date_of_birth = :NEW.date_of_birth, 
            nationality = :NEW.nationality
        WHERE member_id = :OLD.member_id;

        UPDATE Player SET 
            position = :NEW.position, 
            shirt_number = :NEW.shirt_number, 
            height = :NEW.height, 
            weight = :NEW.weight, 
            preferred_foot = :NEW.preferred_foot, 
            club_id = :NEW.club_id
        WHERE member_id = :OLD.member_id;

    ELSIF DELETING THEN
        DELETE FROM Player WHERE member_id = :OLD.member_id;
        DELETE FROM Member WHERE member_id = :OLD.member_id;
    END IF;
END;
/

--------------------------------------------------------
-- 2. TRENERZY (V_COACH) - DODANO KOLUMNƒò CITY
--------------------------------------------------------
CREATE OR REPLACE VIEW V_COACH AS 
SELECT 
    m.member_id, 
    m.first_name, 
    m.last_name, 
    m.first_name || ' ' || m.last_name AS full_name, 
    m.date_of_birth, 
    ROUND((SYSDATE - m.date_of_birth)/365.25) as age, 
    m.nationality, 
    c.license_type, 
    c.years_experience, 
    t.name AS team_name, 
    t.city AS city,
    c.club_id 
FROM Member m 
JOIN Coach c ON m.member_id = c.member_id 
LEFT JOIN Team t ON c.club_id = t.club_id;
/

CREATE OR REPLACE TRIGGER trg_v_coach_dml
INSTEAD OF INSERT OR UPDATE OR DELETE ON V_COACH
FOR EACH ROW
DECLARE
    v_id NUMBER;
BEGIN
    IF INSERTING THEN
        IF :NEW.member_id IS NULL THEN
            INSERT INTO Member (first_name, last_name, date_of_birth, nationality)
            VALUES (:NEW.first_name, :NEW.last_name, :NEW.date_of_birth, :NEW.nationality)
            RETURNING member_id INTO v_id;
        ELSE
            v_id := :NEW.member_id;
        END IF;

        INSERT INTO Coach (member_id, license_type, years_experience, club_id)
        VALUES (v_id, :NEW.license_type, :NEW.years_experience, :NEW.club_id);

    ELSIF UPDATING THEN
        UPDATE Member SET 
            first_name = :NEW.first_name, 
            last_name = :NEW.last_name, 
            date_of_birth = :NEW.date_of_birth, 
            nationality = :NEW.nationality
        WHERE member_id = :OLD.member_id;

        UPDATE Coach SET 
            license_type = :NEW.license_type, 
            years_experience = :NEW.years_experience, 
            club_id = :NEW.club_id
        WHERE member_id = :OLD.member_id;

    ELSIF DELETING THEN
        DELETE FROM Coach WHERE member_id = :OLD.member_id;
        DELETE FROM Member WHERE member_id = :OLD.member_id;
    END IF;
END;
/

--------------------------------------------------------
-- 3. PREZESI (V_PRESIDENT)
--------------------------------------------------------
CREATE OR REPLACE VIEW V_PRESIDENT AS 
SELECT 
    m.member_id, 
    m.first_name, 
    m.last_name, 
    m.first_name || ' ' || m.last_name AS full_name, 
    t.name AS team_name, 
    pr.term_start_date, 
    pr.term_end_date, 
    pr.club_id 
FROM Member m 
JOIN President pr ON m.member_id = pr.member_id 
LEFT JOIN Team t ON pr.club_id = t.club_id;
/

CREATE OR REPLACE TRIGGER trg_v_president_dml
INSTEAD OF INSERT OR UPDATE OR DELETE ON V_PRESIDENT
FOR EACH ROW
DECLARE
    v_id NUMBER;
BEGIN
    IF INSERTING THEN
        IF :NEW.member_id IS NULL THEN
            INSERT INTO Member (first_name, last_name, date_of_birth, nationality)
            VALUES (:NEW.first_name, :NEW.last_name, SYSDATE-10000, 'USA') -- Domy≈õlnie
            RETURNING member_id INTO v_id;
        ELSE
            v_id := :NEW.member_id;
        END IF;

        INSERT INTO President (member_id, term_start_date, term_end_date, club_id)
        VALUES (v_id, :NEW.term_start_date, :NEW.term_end_date, :NEW.club_id);

    ELSIF UPDATING THEN
        UPDATE Member SET first_name = :NEW.first_name, last_name = :NEW.last_name WHERE member_id = :OLD.member_id;
        UPDATE President SET 
            term_start_date = :NEW.term_start_date, 
            term_end_date = :NEW.term_end_date, 
            club_id = :NEW.club_id 
        WHERE member_id = :OLD.member_id;

    ELSIF DELETING THEN
        DELETE FROM President WHERE member_id = :OLD.member_id;
        DELETE FROM Member WHERE member_id = :OLD.member_id;
    END IF;
END;
/

--------------------------------------------------------
-- 4. WIDOK MECZ”W Z RUNDAMI (V_MATCH_DETAILS)
--------------------------------------------------------
CREATE OR REPLACE VIEW V_MATCH_DETAILS AS
SELECT 
    m.match_id,
    m.match_date,
    DENSE_RANK() OVER (PARTITION BY m.league_id ORDER BY m.match_date) AS round,
    th.name AS home_team_name,
    m.score_home,
    m.score_away,
    ta.name AS away_team_name,
    s.name AS stadium_name,
    l.name AS league_name,
    m.league_id,
    m.home_team_id,
    m.away_team_id
FROM Match m
JOIN Team th ON m.home_team_id = th.club_id
JOIN Team ta ON m.away_team_id = ta.club_id
JOIN Stadium s ON m.stadium_id = s.stadium_id
JOIN League l ON m.league_id = l.league_id;
/

--------------------------------------------------------
-- 5. TRANSFERY (V_TRANSFER) - LOGIKA DODAWANIA PO NAZWISKU
--------------------------------------------------------
CREATE OR REPLACE VIEW V_TRANSFER AS
SELECT 
    t.transfer_id,
    m.first_name || ' ' || m.last_name AS player_name,
    t.from_club_id,
    tc1.name AS from_club_name,
    t.to_club_id,
    tc2.name AS to_club_name,
    t.transfer_type,
    t.transfer_fee,
    t.transfer_date
FROM Transfer t
JOIN Player p ON t.player_id = p.member_id
JOIN Member m ON p.member_id = m.member_id
LEFT JOIN Team tc1 ON t.from_club_id = tc1.club_id
LEFT JOIN Team tc2 ON t.to_club_id = tc2.club_id;
/

CREATE OR REPLACE TRIGGER trg_v_transfer_dml
INSTEAD OF INSERT ON V_TRANSFER
FOR EACH ROW
DECLARE
    v_player_id NUMBER;
BEGIN
    -- 1. Szukamy id pi≥karza na podstawie wpisanego tekstu (ImiÍ Nazwisko)
    BEGIN
        SELECT member_id INTO v_player_id
        FROM Member
        WHERE UPPER(first_name || ' ' || last_name) = UPPER(:NEW.player_name)
           OR UPPER(last_name) = UPPER(:NEW.player_name);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20020, 'B£•D: Nie znaleziono pi≥karza o nazwie: ' || :NEW.player_name);
        WHEN TOO_MANY_ROWS THEN
            RAISE_APPLICATION_ERROR(-20021, 'B£•D: Znaleziono wielu pi≥karzy o tym nazwisku. Podaj pe≥ne imiÍ i nazwisko.');
    END;

    -- 2. Wstawiamy rekord do tabeli Transfer
    INSERT INTO Transfer (player_id, from_club_id, to_club_id, transfer_type, transfer_fee, transfer_date)
    VALUES (v_player_id, :NEW.from_club_id, :NEW.to_club_id, :NEW.transfer_type, :NEW.transfer_fee, :NEW.transfer_date);
END;
/

