DECLARE
PROCEDURE add_coach (
p_first_name IN VARCHAR2,
p_last_name  IN VARCHAR2,
p_birth_date IN DATE,
p_nat        IN VARCHAR2,
p_team_name  IN VARCHAR2,
p_exp        IN NUMBER
) IS
v_club_id NUMBER;
v_member_id NUMBER;
v_join DATE;
BEGIN
BEGIN
SELECT club_id INTO v_club_id FROM Team WHERE name = p_team_name;
EXCEPTION WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Nie znaleziono klubu: ' || p_team_name);
RETURN;
END;
v_join := SYSDATE - DBMS_RANDOM.VALUE(0, 2555);
INSERT INTO Member (first_name, last_name, date_of_birth, nationality, join_date, phone, email)
VALUES (
p_first_name,
p_last_name,
p_birth_date,
p_nat,
v_join,
TO_CHAR(ROUND(DBMS_RANDOM.VALUE(100, 999))) || ' ' ||
TO_CHAR(ROUND(DBMS_RANDOM.VALUE(100, 999))) || ' ' ||
TO_CHAR(ROUND(DBMS_RANDOM.VALUE(100, 999))),
LOWER(REPLACE(p_first_name, ' ', '')) || '.' || LOWER(REPLACE(p_last_name, ' ', '')) || '@gmail.com'
)
RETURNING member_id INTO v_member_id;
INSERT INTO Coach (member_id, license_type, years_experience, club_id)
VALUES (v_member_id, 'UEFA PRO', p_exp, v_club_id);
INSERT INTO Contract (contract_id, start_date, end_date, salary, status, player_id, club_id)
VALUES (seq_contract_id.NEXTVAL, v_join, SYSDATE + DBMS_RANDOM.VALUE(0, 1095), ROUND(DBMS_RANDOM.VALUE(10000, 60000), 2), 'ACTIVE', v_member_id, v_club_id);
END;
BEGIN
add_coach('Tomasz', 'Tułacz', TO_DATE('1969-12-29', 'YYYY-MM-DD'), 'Polska', 'Puszcza Niepołomice', 10);
add_coach('Rafał', 'Górak', TO_DATE('1973-01-11', 'YYYY-MM-DD'), 'Polska', 'GKS Katowice', 6);
add_coach('Adrian', 'Siemieniec', TO_DATE('1992-01-13', 'YYYY-MM-DD'), 'Polska', 'Jagiellonia Białystok', 2);
add_coach('Mateusz', 'Stolarski', TO_DATE('1993-01-03', 'YYYY-MM-DD'), 'Polska', 'Motor Lublin', 1);
add_coach('Niels', 'Frederiksen', TO_DATE('1970-11-05', 'YYYY-MM-DD'), 'Dania', 'Lech Poznań', 15);
add_coach('Jacek', 'Zieliński', TO_DATE('1961-03-22', 'YYYY-MM-DD'), 'Polska', 'Korona Kielce', 25);
add_coach('Daniel', 'Myśliwiec', TO_DATE('1985-11-20', 'YYYY-MM-DD'), 'Polska', 'Widzew Łódź', 5);
add_coach('Aleksandar', 'Vukovic', TO_DATE('1979-08-25', 'YYYY-MM-DD'), 'Serbia', 'Piast Gliwice', 10);
add_coach('Marek', 'Papszun', TO_DATE('1974-08-08', 'YYYY-MM-DD'), 'Polska', 'Raków Częstochowa', 15);
add_coach('Gonçalo', 'Feio', TO_DATE('1990-01-17', 'YYYY-MM-DD'), 'Portugalia', 'Legia Warszawa', 5);
add_coach('Jacek', 'Magiera', TO_DATE('1977-01-01', 'YYYY-MM-DD'), 'Polska', 'Śląsk Wrocław', 12);
add_coach('Robert', 'Kolendowicz', TO_DATE('1980-09-26', 'YYYY-MM-DD'), 'Polska', 'Pogoń Szczecin', 1);
add_coach('Jan', 'Urban', TO_DATE('1962-05-14', 'YYYY-MM-DD'), 'Polska', 'Górnik Zabrze', 20);
add_coach('Marcin', 'Włodarski', TO_DATE('1982-09-02', 'YYYY-MM-DD'), 'Polska', 'Zagłębie Lubin', 10);
add_coach('Szymon', 'Grabowski', TO_DATE('1981-04-04', 'YYYY-MM-DD'), 'Polska', 'Lechia Gdańsk', 8);
add_coach('Dawid', 'Kroczek', TO_DATE('1989-09-20', 'YYYY-MM-DD'), 'Polska', 'Cracovia', 3);
add_coach('Janusz', 'Niedźwiedź', TO_DATE('1982-01-23', 'YYYY-MM-DD'), 'Polska', 'Stal Mielec', 10);
add_coach('Bruno', 'Baltazar', TO_DATE('1977-07-06', 'YYYY-MM-DD'), 'Portugalia', 'Radomiak Radom', 12);
COMMIT;
END;
/
