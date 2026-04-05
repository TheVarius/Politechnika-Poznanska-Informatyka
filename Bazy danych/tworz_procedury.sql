CREATE OR REPLACE FUNCTION get_p_id(
p_first IN VARCHAR2,
p_last IN VARCHAR2,
p_club_id IN NUMBER
) RETURN NUMBER IS
v_id NUMBER;
BEGIN
SELECT p.member_id INTO v_id
FROM Player p JOIN Member m ON p.member_id = m.member_id
WHERE m.first_name = p_first AND m.last_name = p_last AND p.club_id = p_club_id AND ROWNUM = 1;
RETURN v_id;
EXCEPTION WHEN NO_DATA_FOUND THEN
RETURN NULL;
END;
/
CREATE OR REPLACE PROCEDURE reg_card(
p_match_id IN NUMBER,
p_player_id IN NUMBER,
p_min IN NUMBER,
p_type IN VARCHAR2
) IS
v_match_date DATE;
v_next_match DATE;
v_club_id NUMBER;
BEGIN
INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id)
VALUES (seq_event_id.NEXTVAL, p_min, p_type, p_match_id, p_player_id);
IF p_type = 'RED_CARD' THEN
SELECT match_date INTO v_match_date FROM Match WHERE match_id = p_match_id;
SELECT club_id INTO v_club_id FROM Player WHERE member_id = p_player_id;
BEGIN
SELECT MIN(match_date) INTO v_next_match
FROM Match
WHERE match_date > v_match_date
AND (home_team_id = v_club_id OR away_team_id = v_club_id);
EXCEPTION
WHEN NO_DATA_FOUND THEN v_next_match := NULL;
END;
IF v_next_match IS NULL THEN
v_next_match := v_match_date + 7;
END IF;
INSERT INTO Unavailability (absence_id, type, start_date, end_date, reason, player_id)
VALUES (
seq_absence_id.NEXTVAL,
'SUSPENSION',
v_match_date,
v_next_match,
'Czerwona kartka',
p_player_id
);
END IF;
COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE reg_injury(
    p_match_id IN NUMBER,
    p_player_id IN NUMBER,
    p_min IN NUMBER,
    p_duration IN NUMBER DEFAULT NULL
) IS
    v_match_date DATE;
    v_duration NUMBER;
    v_injury_type VARCHAR2(20);
    v_rand NUMBER;
BEGIN
    INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id)
    VALUES (seq_event_id.NEXTVAL, p_min, 'INJURY', p_match_id, p_player_id);
    
    SELECT match_date INTO v_match_date FROM Match WHERE match_id = p_match_id;
    
    IF p_duration IS NOT NULL THEN
        v_duration := p_duration;
    ELSE
        v_duration := ROUND(DBMS_RANDOM.VALUE(7, 200));
    END IF;

    v_rand := ROUND(DBMS_RANDOM.VALUE(1, 8));
    CASE v_rand
        WHEN 1 THEN v_injury_type := 'Zerwanie ACL';
        WHEN 2 THEN v_injury_type := 'Naciągnięcie uda';
        WHEN 3 THEN v_injury_type := 'Skręcenie kostki';
        WHEN 4 THEN v_injury_type := 'Wstrząśnienie';
        WHEN 5 THEN v_injury_type := 'Łąkotka';
        WHEN 6 THEN v_injury_type := 'Pachwina';
        WHEN 7 THEN v_injury_type := 'Złamanie';
        ELSE v_injury_type := 'Uraz mięśniowy';
    END CASE;
    
    INSERT INTO Unavailability (absence_id, type, start_date, end_date, reason, player_id)
    VALUES (
        seq_absence_id.NEXTVAL,
        'INJURY',
        v_match_date,
        v_match_date + v_duration,
        v_injury_type,
        p_player_id
    );
    COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE reg_sub(
p_match_id IN NUMBER,
p_in_id IN NUMBER,
p_out_id IN NUMBER,
p_min IN NUMBER
) IS
BEGIN
INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id)
VALUES (seq_event_id.NEXTVAL, p_min, 'SUB_IN', p_match_id, p_in_id);
INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id)
VALUES (seq_event_id.NEXTVAL, p_min, 'SUB_OUT', p_match_id, p_out_id);
COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE register_transfer(
p_player_id IN NUMBER,
p_from_club_id IN NUMBER,
p_to_club_id IN NUMBER,
p_transfer_date IN DATE,
p_fee IN NUMBER,
p_transfer_type IN VARCHAR2
) IS
BEGIN
INSERT INTO Transfer (transfer_id, transfer_date, transfer_fee, transfer_type, player_id, from_club_id, to_club_id)
VALUES (seq_transfer_id.NEXTVAL, p_transfer_date, p_fee, p_transfer_type, p_player_id, p_from_club_id, p_to_club_id);
UPDATE Player SET club_id = p_to_club_id WHERE member_id = p_player_id;
UPDATE Contract
SET status = 'TERMINATED', end_date = p_transfer_date
WHERE player_id = p_player_id AND club_id = p_from_club_id AND status = 'ACTIVE';
COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE extend_contract(
p_player_id IN NUMBER,
p_club_id IN NUMBER,
p_new_end_date IN DATE,
p_new_salary IN NUMBER DEFAULT NULL
) IS
BEGIN
IF p_new_salary IS NULL THEN
UPDATE Contract
SET end_date = p_new_end_date
WHERE player_id = p_player_id AND club_id = p_club_id AND status = 'ACTIVE';
ELSE
UPDATE Contract
SET end_date = p_new_end_date, salary = p_new_salary
WHERE player_id = p_player_id AND club_id = p_club_id AND status = 'ACTIVE';
END IF;
COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE end_unavailability(
p_absence_id IN NUMBER,
p_actual_end_date IN DATE
) IS
BEGIN
UPDATE Unavailability SET end_date = p_actual_end_date WHERE absence_id = p_absence_id;
COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE register_goal (
p_match_id   IN NUMBER,
p_player_id  IN NUMBER,
p_minute     IN NUMBER,
p_is_home    IN NUMBER
) IS
BEGIN
INSERT INTO Match_event (event_id, minute, event_type, match_id, player_id)
VALUES (seq_event_id.NEXTVAL, p_minute, 'GOAL', p_match_id, p_player_id);
COMMIT;
END;
/
