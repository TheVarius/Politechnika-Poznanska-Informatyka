
DECLARE
    v_member_id NUMBER;
    v_club_id   NUMBER;

    PROCEDURE add_p_prezes(
        p_first_name  IN VARCHAR2,
        p_last_name   IN VARCHAR2,
        p_club_name   IN VARCHAR2,
        p_start_date  IN DATE,
        p_end_date    IN DATE,
        p_nationality IN VARCHAR2 DEFAULT 'Polska'
    ) IS
    BEGIN
        SELECT club_id INTO v_club_id FROM Team WHERE UPPER(name) = UPPER(p_club_name);

        INSERT INTO Member (first_name, last_name, date_of_birth, nationality)
        VALUES (p_first_name, p_last_name, TO_DATE('1970-01-01', 'YYYY-MM-DD'), p_nationality)
        RETURNING member_id INTO v_member_id;

        INSERT INTO President (member_id, term_start_date, term_end_date, club_id)
        VALUES (v_member_id, p_start_date, p_end_date, v_club_id);

        DBMS_OUTPUT.PUT_LINE('Dodano prezesa: ' || p_first_name || ' ' || p_last_name || ' (' || p_club_name || ')');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('BŁĄD: Nie znaleziono klubu: ' || p_club_name);
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('BŁĄD przy dodawaniu: ' || p_first_name || ' ' || p_last_name || ' - ' || SQLERRM);
    END;

BEGIN
    
    
    add_p_prezes('Wojciech', 'Pertkiewicz', 'Jagiellonia Białystok', TO_DATE('2022-02-01', 'YYYY-MM-DD'), TO_DATE('2026-06-30', 'YYYY-MM-DD'));
    add_p_prezes('Patryk', 'Załęczny', 'Śląsk Wrocław', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2027-06-30', 'YYYY-MM-DD'));
    add_p_prezes('Dariusz', 'Mioduski', 'Legia Warszawa', TO_DATE('2017-03-22', 'YYYY-MM-DD'), TO_DATE('2028-12-31', 'YYYY-MM-DD'));
    add_p_prezes('Jarosław', 'Mroczek', 'Pogoń Szczecin', TO_DATE('2011-02-01', 'YYYY-MM-DD'), TO_DATE('2026-12-31', 'YYYY-MM-DD'));
    add_p_prezes('Karol', 'Klimczak', 'Lech Poznań', TO_DATE('2011-11-01', 'YYYY-MM-DD'), TO_DATE('2026-06-30', 'YYYY-MM-DD'));
    add_p_prezes('Piotr', 'Obidziński', 'Raków Częstochowa', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2027-06-30', 'YYYY-MM-DD'));
    add_p_prezes('Dariusz', 'Czernik', 'Górnik Zabrze', TO_DATE('2020-01-27', 'YYYY-MM-DD'), TO_DATE('2025-06-30', 'YYYY-MM-DD'));
    add_p_prezes('Paweł', 'Jeż', 'Zagłębie Lubin', TO_DATE('2024-05-15', 'YYYY-MM-DD'), TO_DATE('2028-06-30', 'YYYY-MM-DD'));
    add_p_prezes('Michał', 'Rydz', 'Widzew Łódź', TO_DATE('2023-05-23', 'YYYY-MM-DD'), TO_DATE('2027-12-31', 'YYYY-MM-DD'));
    add_p_prezes('Łukasz', 'Lewiński', 'Piast Gliwice', TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2028-06-30', 'YYYY-MM-DD'));
    add_p_prezes('Jacek', 'Klimek', 'Stal Mielec', TO_DATE('2020-12-23', 'YYYY-MM-DD'), TO_DATE('2026-06-30', 'YYYY-MM-DD'));
    add_p_prezes('Jarosław', 'Pieprzyca', 'Puszcza Niepołomice', TO_DATE('2010-01-01', 'YYYY-MM-DD'), TO_DATE('2030-12-31', 'YYYY-MM-DD'));
    add_p_prezes('Mateusz', 'Dróżdż', 'Cracovia', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2028-06-30', 'YYYY-MM-DD'));
    add_p_prezes('Karol', 'Jakubczyk', 'Korona Kielce', TO_DATE('2024-06-05', 'YYYY-MM-DD'), TO_DATE('2028-06-30', 'YYYY-MM-DD'));
    add_p_prezes('Sławomir', 'Stempniewski', 'Radomiak Radom', TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2030-12-31', 'YYYY-MM-DD'));
    add_p_prezes('Jakub', 'Grabowski', 'Lechia Gdańsk', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2028-06-30', 'YYYY-MM-DD'));
    add_p_prezes('Krzysztof', 'Nowak', 'GKS Katowice', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2027-06-30', 'YYYY-MM-DD'));
    add_p_prezes('Zbigniew', 'Jakubas', 'Motor Lublin', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2030-12-31', 'YYYY-MM-DD'));

    COMMIT;
END;
/
