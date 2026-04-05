CREATE OR REPLACE TRIGGER trg_check_active_contracts
BEFORE INSERT OR UPDATE ON Contract
FOR EACH ROW
WHEN (NEW.status = 'ACTIVE')
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Contract
    WHERE player_id = :NEW.player_id 
      AND status = 'ACTIVE'
      AND contract_id != NVL(:NEW.contract_id, -1);
      
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'BŁĄD: Piłkarz posiada już aktywny kontrakt w innym klubie!');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_check_match_overlap
BEFORE INSERT ON Match_event
FOR EACH ROW
WHEN (NEW.event_type = 'ENTRY')
DECLARE
    v_match_date DATE;
    v_overlap_count NUMBER;
BEGIN
    SELECT match_date INTO v_match_date FROM Match WHERE match_id = :NEW.match_id;

    SELECT COUNT(*) INTO v_overlap_count
    FROM Match_event me
    JOIN Match m ON me.match_id = m.match_id
    WHERE me.player_id = :NEW.player_id
      AND me.event_type = 'ENTRY'
      AND TRUNC(m.match_date) = TRUNC(v_match_date)
      AND m.match_id != :NEW.match_id;

    IF v_overlap_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'BŁĄD: Ten piłkarz już gra w innym meczu w tym dniu!');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_check_availability
BEFORE INSERT ON Match_event
FOR EACH ROW
WHEN (NEW.event_type = 'ENTRY')
DECLARE
    v_match_date DATE;
    v_is_unavailable NUMBER;
BEGIN
    SELECT match_date INTO v_match_date FROM Match WHERE match_id = :NEW.match_id;

    SELECT COUNT(*) INTO v_is_unavailable
    FROM Unavailability
    WHERE player_id = :NEW.player_id
      AND TRUNC(v_match_date) BETWEEN TRUNC(start_date) AND TRUNC(NVL(end_date, SYSDATE+10000));

    IF v_is_unavailable > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'BŁĄD: Piłkarz (ID: ' || :NEW.player_id || ') jest kontuzjowany lub zawieszony i nie może grać! Data meczu: ' || TO_CHAR(v_match_date, 'YYYY-MM-DD'));
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_check_player_team_match
BEFORE INSERT ON Match_event
FOR EACH ROW
WHEN (NEW.event_type = 'ENTRY')
DECLARE
    v_home_id NUMBER;
    v_away_id NUMBER;
    v_player_club_id NUMBER;
BEGIN
    SELECT home_team_id, away_team_id INTO v_home_id, v_away_id 
    FROM Match WHERE match_id = :NEW.match_id;
    
    SELECT club_id INTO v_player_club_id 
    FROM Player WHERE member_id = :NEW.player_id;

    IF v_player_club_id != v_home_id AND v_player_club_id != v_away_id THEN
        RAISE_APPLICATION_ERROR(-20004, 'BŁĄD: Wybrany piłkarz nie należy do żadnej z drużyn biorących udział w tym meczu!');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_check_unique_matchup
BEFORE INSERT ON Match
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Match
    WHERE home_team_id = :NEW.home_team_id
      AND away_team_id = :NEW.away_team_id
      AND league_id = :NEW.league_id
      AND match_id != NVL(:NEW.match_id, -1);
      
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20005, 'BŁĄD: Taki mecz już istnieje!');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_check_assist_sync
BEFORE INSERT OR UPDATE ON Match_event
FOR EACH ROW
WHEN (NEW.event_type = 'ASSIST')
DECLARE
    v_goal_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_goal_count
    FROM Match_event
    WHERE match_id = :NEW.match_id
      AND minute = :NEW.minute
      AND event_type = 'GOAL';
      
    IF v_goal_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20006, 'BŁĄD: Asysta musi być powiązana z golem w tej samej minucie!');
    END IF;
END;
/

-- Trigger trg_enforce_league_id usunięty, aby pozwolić na dynamiczne ID ligi (np. 4100)

        WHILE v_idx IS NOT NULL LOOP
            v_id := v_match_ids(v_idx);
            UPDATE Match m
            SET 
                score_home = (
                    SELECT COUNT(*) 
                    FROM Match_event me 
                    JOIN Player p ON me.player_id = p.member_id
                    WHERE me.match_id = v_id 
                      AND me.event_type = 'GOAL'
                      AND p.club_id = m.home_team_id
                ),
                score_away = (
                    SELECT COUNT(*) 
                    FROM Match_event me 
                    JOIN Player p ON me.player_id = p.member_id
                    WHERE me.match_id = v_id 
                      AND me.event_type = 'GOAL'
                      AND p.club_id = m.away_team_id
                )
            WHERE m.match_id = v_id;
            v_idx := v_match_ids.NEXT(v_idx);
        END LOOP;
    END AFTER STATEMENT;
END;
/

CREATE OR REPLACE TRIGGER trg_check_unavailability_overlap
BEFORE INSERT OR UPDATE ON Unavailability
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Unavailability
    WHERE player_id = :NEW.player_id
      AND absence_id != NVL(:NEW.absence_id, -1)
      AND (
          (:NEW.start_date BETWEEN start_date AND NVL(end_date, SYSDATE+10000))
          OR
          (start_date BETWEEN :NEW.start_date AND NVL(:NEW.end_date, SYSDATE+10000))
      );
      
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20008, 'BŁĄG: Ten piłkarz ma już przypisaną inną nieobecność w tym terminie!');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_coach_uniqueness
BEFORE INSERT OR UPDATE ON Coach
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    IF :NEW.club_id IS NOT NULL THEN
        SELECT COUNT(*) INTO v_count
        FROM Coach
        WHERE club_id = :NEW.club_id
          AND member_id != NVL(:NEW.member_id, -1);
        
        IF v_count > 0 THEN
            RAISE_APPLICATION_ERROR(-20009, 'BŁĄD: Ten klub ma już przypisanego trenera!');
        END IF;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_president_uniqueness
BEFORE INSERT OR UPDATE ON President
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    IF :NEW.club_id IS NOT NULL THEN
        SELECT COUNT(*) INTO v_count
        FROM President
        WHERE club_id = :NEW.club_id
          AND member_id != NVL(:NEW.member_id, -1)
          AND (
              (:NEW.term_start_date BETWEEN term_start_date AND term_end_date)
              OR (term_start_date BETWEEN :NEW.term_start_date AND :NEW.term_end_date)
          );
        
        IF v_count > 0 THEN
            RAISE_APPLICATION_ERROR(-20010, 'BŁĄD: Ten klub ma już prezesa w tym terminie!');
        END IF;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_contract_integrity
BEFORE INSERT OR UPDATE ON Contract
FOR EACH ROW
BEGIN
    IF :NEW.end_date <= :NEW.start_date THEN
        RAISE_APPLICATION_ERROR(-20011, 'BŁĄD: Data zakończenia kontraktu musi być po dacie rozpoczęcia!');
    END IF;
    IF :NEW.salary <= 0 THEN
        RAISE_APPLICATION_ERROR(-20012, 'BŁĄD: Wynagrodzenie musi być większe od zera!');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_match_self_play
BEFORE INSERT OR UPDATE ON Match
FOR EACH ROW
BEGIN
    IF :NEW.home_team_id = :NEW.away_team_id THEN
        RAISE_APPLICATION_ERROR(-20013, 'BŁĄD: Drużyna nie może grać meczu z samą sobą!');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_match_default_scores
BEFORE INSERT ON Match
FOR EACH ROW
BEGIN
    IF :NEW.score_home IS NULL THEN
        :NEW.score_home := 0;
    END IF;
    IF :NEW.score_away IS NULL THEN
        :NEW.score_away := 0;
    END IF;
END;
/
