CREATE SEQUENCE seq_member_id START WITH 1000 INCREMENT BY 1;
CREATE SEQUENCE seq_club_id START WITH 2000 INCREMENT BY 1;
CREATE SEQUENCE seq_stadium_id START WITH 3000 INCREMENT BY 1;
CREATE SEQUENCE seq_league_id START WITH 4000 INCREMENT BY 1;
CREATE SEQUENCE seq_match_id START WITH 5000 INCREMENT BY 1;
CREATE SEQUENCE seq_contract_id START WITH 6000 INCREMENT BY 1;
CREATE SEQUENCE seq_transfer_id START WITH 7000 INCREMENT BY 1;
CREATE SEQUENCE seq_training_id START WITH 8000 INCREMENT BY 1;
CREATE SEQUENCE seq_absence_id START WITH 9000 INCREMENT BY 1;
CREATE SEQUENCE seq_event_id START WITH 10000 INCREMENT BY 1;

CREATE TABLE Member (
                        member_id       NUMBER(10) DEFAULT seq_member_id.NEXTVAL NOT NULL,
                        first_name      VARCHAR2(50) NOT NULL,
                        last_name       VARCHAR2(50) NOT NULL,
                        date_of_birth   DATE NOT NULL,
                        nationality     VARCHAR2(50) NOT NULL,
                        phone           VARCHAR2(20),
                        email           VARCHAR2(50),
                        join_date       DATE DEFAULT SYSDATE NOT NULL,
                        CONSTRAINT pk_member PRIMARY KEY (member_id)
);

CREATE TABLE Team (
                      club_id         NUMBER(10) DEFAULT seq_club_id.NEXTVAL NOT NULL,
                      name            VARCHAR2(50) NOT NULL,
                      country         VARCHAR2(50) NOT NULL,
                      city            VARCHAR2(50) NOT NULL,
                      founded_year    NUMBER(4) NOT NULL,
                      is_managed      NUMBER(1) NOT NULL,
                      CONSTRAINT pk_team PRIMARY KEY (club_id)
);

CREATE TABLE Stadium (
                         stadium_id      NUMBER(10) DEFAULT seq_stadium_id.NEXTVAL NOT NULL,
                         name            VARCHAR2(50) NOT NULL,
                         city            VARCHAR2(20) NOT NULL,
                         capacity        NUMBER(6) NOT NULL,
                         address         VARCHAR2(50) NOT NULL,
                         built_year      NUMBER(4),
                         CONSTRAINT pk_stadium PRIMARY KEY (stadium_id)
);

CREATE TABLE League (
                        league_id       NUMBER(10) DEFAULT seq_league_id.NEXTVAL NOT NULL,
                        name            VARCHAR2(50) NOT NULL,
                        season          VARCHAR2(9) NOT NULL,
                        country         VARCHAR2(20),
                        CONSTRAINT pk_league PRIMARY KEY (league_id)
);

CREATE TABLE Coach (
                       member_id       NUMBER(10) NOT NULL,
                       license_type    VARCHAR2(20),
                       years_experience NUMBER(2),
                       club_id         NUMBER(10),
                       CONSTRAINT pk_coach PRIMARY KEY (member_id)
);

CREATE TABLE Player (
                        member_id       NUMBER(10) NOT NULL,
                        position        VARCHAR2(20) NOT NULL,
                        shirt_number    NUMBER(2) NOT NULL,
                        height          NUMBER(3) NOT NULL,
                        weight          NUMBER(3) NOT NULL,
                        preferred_foot  VARCHAR2(6) NOT NULL,
                        club_id         NUMBER(10),
                        CONSTRAINT pk_player PRIMARY KEY (member_id)
);

CREATE TABLE President (
                           member_id       NUMBER(10) NOT NULL,
                           term_start_date DATE NOT NULL,
                           term_end_date   DATE NOT NULL,
                           club_id         NUMBER(10),
                           CONSTRAINT pk_president PRIMARY KEY (member_id)
);

CREATE TABLE Contract (
                          contract_id     NUMBER(10) DEFAULT seq_contract_id.NEXTVAL NOT NULL,
                          start_date      DATE NOT NULL,
                          end_date        DATE NOT NULL,
                          salary          NUMBER(12,2) NOT NULL,
                          status          VARCHAR2(10) NOT NULL,
                          player_id       NUMBER(10),
                          club_id         NUMBER(10),
                          CONSTRAINT pk_contract PRIMARY KEY (contract_id)
);

CREATE TABLE Match (
                       match_id        NUMBER(10) DEFAULT seq_match_id.NEXTVAL NOT NULL,
                       match_date      DATE NOT NULL,
                       score_home      NUMBER(2) NOT NULL,
                       score_away      NUMBER(2) NOT NULL,
                       league_id       NUMBER(10),
                       away_team_id    NUMBER(10),
                       home_team_id    NUMBER(10),
                       stadium_id      NUMBER(10),
                       CONSTRAINT pk_match PRIMARY KEY (match_id)
);

CREATE TABLE Match_event (
                             event_id        NUMBER(10) DEFAULT seq_event_id.NEXTVAL NOT NULL,
                             minute          NUMBER(3) NOT NULL,
                             event_type      VARCHAR2(20) NOT NULL,
                             match_id        NUMBER(10),
                             player_id       NUMBER(10),
                             CONSTRAINT pk_event PRIMARY KEY (event_id)
);

CREATE TABLE Training (
                          training_id     NUMBER(10) DEFAULT seq_training_id.NEXTVAL NOT NULL,
                          start_time      DATE,
                          duration_min    NUMBER(3),
                          focus           VARCHAR2(20),
                          Team_club_id    NUMBER(10),
                          CONSTRAINT pk_training PRIMARY KEY (training_id)
);

CREATE TABLE Transfer (
                          transfer_id     NUMBER(10) DEFAULT seq_transfer_id.NEXTVAL NOT NULL,
                          transfer_fee    NUMBER(12,2) NOT NULL,
                          transfer_type   VARCHAR2(50) NOT NULL,
                          transfer_date   DATE NOT NULL,
                          player_id       NUMBER(10),
                          to_club_id      NUMBER(10),
                          from_club_id    NUMBER(10),
                          CONSTRAINT pk_transfer PRIMARY KEY (transfer_id)
);

CREATE TABLE Unavailability (
                                absence_id      NUMBER(10) DEFAULT seq_absence_id.NEXTVAL NOT NULL,
                                type            VARCHAR2(20) NOT NULL,
                                start_date      DATE NOT NULL,
                                end_date        DATE,
                                reason          VARCHAR2(20),
                                player_id       NUMBER(10),
                                CONSTRAINT pk_unavail PRIMARY KEY (absence_id)
);

ALTER TABLE Coach ADD CONSTRAINT Coach_Member_FK FOREIGN KEY ( member_id ) REFERENCES Member ( member_id );
ALTER TABLE Coach ADD CONSTRAINT Coach_Team_FK FOREIGN KEY ( club_id ) REFERENCES Team ( club_id );
ALTER TABLE Player ADD CONSTRAINT Player_Member_FK FOREIGN KEY ( member_id ) REFERENCES Member ( member_id );
ALTER TABLE Player ADD CONSTRAINT Player_Team_FK FOREIGN KEY ( club_id ) REFERENCES Team ( club_id );
ALTER TABLE President ADD CONSTRAINT President_Member_FK FOREIGN KEY ( member_id ) REFERENCES Member ( member_id );
ALTER TABLE President ADD CONSTRAINT President_Team_FK FOREIGN KEY ( club_id ) REFERENCES Team ( club_id );
ALTER TABLE Contract ADD CONSTRAINT Contract_Member_FK FOREIGN KEY ( player_id ) REFERENCES Member ( member_id );
ALTER TABLE Contract ADD CONSTRAINT Contract_Team_FK FOREIGN KEY ( club_id ) REFERENCES Team ( club_id );
ALTER TABLE Match_event ADD CONSTRAINT Match_event_Match_FK FOREIGN KEY ( match_id ) REFERENCES Match ( match_id );
ALTER TABLE Match_event ADD CONSTRAINT Match_event_Player_FK FOREIGN KEY ( player_id ) REFERENCES Player ( member_id );
ALTER TABLE Match ADD CONSTRAINT Match_League_FK FOREIGN KEY ( league_id ) REFERENCES League ( league_id );
ALTER TABLE Match ADD CONSTRAINT Match_Stadium_FK FOREIGN KEY ( stadium_id ) REFERENCES Stadium ( stadium_id );
ALTER TABLE Match ADD CONSTRAINT Match_Team_FK FOREIGN KEY ( home_team_id ) REFERENCES Team ( club_id );
ALTER TABLE Match ADD CONSTRAINT Match_Team_FKv2 FOREIGN KEY ( away_team_id ) REFERENCES Team ( club_id );
ALTER TABLE Training ADD CONSTRAINT Training_Team_FK FOREIGN KEY ( Team_club_id ) REFERENCES Team ( club_id );
ALTER TABLE Transfer ADD CONSTRAINT Transfer_Player_FK FOREIGN KEY ( player_id ) REFERENCES Player ( member_id );
ALTER TABLE Transfer ADD CONSTRAINT Transfer_Team_FK FOREIGN KEY ( from_club_id ) REFERENCES Team ( club_id );
ALTER TABLE Transfer ADD CONSTRAINT Transfer_Team_FKv2 FOREIGN KEY ( to_club_id ) REFERENCES Team ( club_id );
ALTER TABLE Unavailability ADD CONSTRAINT Unavailability_Player_FK FOREIGN KEY ( player_id ) REFERENCES Player ( member_id );

CREATE OR REPLACE FUNCTION get_total_goals(p_player_id IN NUMBER)
    RETURN NUMBER
    IS
    v_goals NUMBER := 0;
BEGIN
    SELECT COUNT(*)
    INTO v_goals
    FROM Match_event
    WHERE player_id = p_player_id
      AND event_type = 'GOAL';

    RETURN v_goals;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;
END;
/

CREATE OR REPLACE PROCEDURE register_goal (
    p_match_id   IN NUMBER,
    p_player_id  IN NUMBER,
    p_minute     IN NUMBER,
    p_is_home    IN NUMBER
)
    IS
BEGIN
    INSERT INTO Match_event (match_id, player_id, minute, event_type)
    VALUES (p_match_id, p_player_id, p_minute, 'GOAL');

    UPDATE Match
    SET score_home = score_home + (CASE WHEN p_is_home = 1 THEN 1 ELSE 0 END),
        score_away = score_away + (CASE WHEN p_is_home = 0 THEN 1 ELSE 0 END)
    WHERE match_id = p_match_id;

    COMMIT;
END;
/

CREATE INDEX idx_member_lastname ON Member(last_name);
CREATE INDEX idx_match_date ON Match(match_date);
CREATE INDEX idx_team_name ON Team(name);
CREATE INDEX idx_contract_status ON Contract(status);
CREATE INDEX idx_player_position ON Player(position);
CREATE INDEX idx_member_nationality ON Member(nationality);
CREATE INDEX idx_event_type ON Match_event(event_type);