
DECLARE
    v_player_id NUMBER;
    v_from_id NUMBER;
    v_to_id NUMBER;
BEGIN
    BEGIN
        SELECT club_id INTO v_from_id FROM Team WHERE UPPER(name) = 'JAGIELLONIA BIAŁYSTOK';
        SELECT club_id INTO v_to_id FROM Team WHERE UPPER(name) = 'LEGIA WARSZAWA';
        v_player_id := get_p_id('Jan', 'Kowalski', v_from_id);
        
        INSERT INTO Transfer (transfer_id, transfer_fee, transfer_type, transfer_date, player_id, from_club_id, to_club_id)
        VALUES (seq_transfer_id.NEXTVAL, 500000, 'Transfer definitywny', TO_DATE('2024-11-10', 'YYYY-MM-DD'), v_player_id, v_from_id, v_to_id);
        
        UPDATE Player SET club_id = v_to_id WHERE member_id = v_player_id;
    EXCEPTION WHEN NO_DATA_FOUND THEN NULL; END;

    BEGIN
        SELECT club_id INTO v_from_id FROM Team WHERE UPPER(name) = 'ŚLĄSK WROCŁAW';
        SELECT club_id INTO v_to_id FROM Team WHERE UPPER(name) = 'LECH POZNAŃ';
        v_player_id := get_p_id('Adam', 'Nowak', v_from_id);
        
        INSERT INTO Transfer (transfer_id, transfer_fee, transfer_type, transfer_date, player_id, from_club_id, to_club_id)
        VALUES (seq_transfer_id.NEXTVAL, 750000, 'Wypożyczenie', TO_DATE('2024-11-10', 'YYYY-MM-DD'), v_player_id, v_from_id, v_to_id);
        
        UPDATE Player SET club_id = v_to_id WHERE member_id = v_player_id;
    EXCEPTION WHEN NO_DATA_FOUND THEN NULL; END;

    BEGIN
        SELECT club_id INTO v_from_id FROM Team WHERE UPPER(name) = 'LEGIA WARSZAWA';
        SELECT club_id INTO v_to_id FROM Team WHERE UPPER(name) = 'POGOŃ SZCZECIN';
        v_player_id := get_p_id('Piotr', 'Wisniewski', v_from_id);
        
        INSERT INTO Transfer (transfer_id, transfer_fee, transfer_type, transfer_date, player_id, from_club_id, to_club_id)
        VALUES (seq_transfer_id.NEXTVAL, 300000, 'Transfer definitywny', TO_DATE('2024-11-10', 'YYYY-MM-DD'), v_player_id, v_from_id, v_to_id);
        
        UPDATE Player SET club_id = v_to_id WHERE member_id = v_player_id;
    EXCEPTION WHEN NO_DATA_FOUND THEN NULL; END;

    BEGIN
        SELECT club_id INTO v_from_id FROM Team WHERE UPPER(name) = 'POGOŃ SZCZECIN';
        SELECT club_id INTO v_to_id FROM Team WHERE UPPER(name) = 'GÓRNIK ZABRZE';
        v_player_id := get_p_id('Mateusz', 'Wojcik', v_from_id);
        
        INSERT INTO Transfer (transfer_id, transfer_fee, transfer_type, transfer_date, player_id, from_club_id, to_club_id)
        VALUES (seq_transfer_id.NEXTVAL, 150000, 'Wypożyczenie', TO_DATE('2024-11-10', 'YYYY-MM-DD'), v_player_id, v_from_id, v_to_id);
        
        UPDATE Player SET club_id = v_to_id WHERE member_id = v_player_id;
    EXCEPTION WHEN NO_DATA_FOUND THEN NULL; END;

    BEGIN
        SELECT club_id INTO v_from_id FROM Team WHERE UPPER(name) = 'LECH POZNAŃ';
        SELECT club_id INTO v_to_id FROM Team WHERE UPPER(name) = 'RAKÓW CZĘSTOCHOWA';
        v_player_id := get_p_id('Krzysztof', 'Kaminski', v_from_id);
        
        INSERT INTO Transfer (transfer_id, transfer_fee, transfer_type, transfer_date, player_id, from_club_id, to_club_id)
        VALUES (seq_transfer_id.NEXTVAL, 1000000, 'Transfer definitywny', TO_DATE('2024-11-10', 'YYYY-MM-DD'), v_player_id, v_from_id, v_to_id);
        
        UPDATE Player SET club_id = v_to_id WHERE member_id = v_player_id;
    EXCEPTION WHEN NO_DATA_FOUND THEN NULL; END;

    BEGIN
        SELECT club_id INTO v_from_id FROM Team WHERE UPPER(name) = 'GÓRNIK ZABRZE';
        SELECT club_id INTO v_to_id FROM Team WHERE UPPER(name) = 'ZAGŁĘBIE LUBIN';
        v_player_id := get_p_id('Michal', 'Lewandowski', v_from_id);
        
        INSERT INTO Transfer (transfer_id, transfer_fee, transfer_type, transfer_date, player_id, from_club_id, to_club_id)
        VALUES (seq_transfer_id.NEXTVAL, 450000, 'Transfer definitywny', TO_DATE('2024-11-10', 'YYYY-MM-DD'), v_player_id, v_from_id, v_to_id);
        
        UPDATE Player SET club_id = v_to_id WHERE member_id = v_player_id;
    EXCEPTION WHEN NO_DATA_FOUND THEN NULL; END;

    BEGIN
        SELECT club_id INTO v_from_id FROM Team WHERE UPPER(name) = 'RAKÓW CZĘSTOCHOWA';
        SELECT club_id INTO v_to_id FROM Team WHERE UPPER(name) = 'WIDZEW ŁÓDŹ';
        v_player_id := get_p_id('Tomasz', 'Zielinski', v_from_id);
        
        INSERT INTO Transfer (transfer_id, transfer_fee, transfer_type, transfer_date, player_id, from_club_id, to_club_id)
        VALUES (seq_transfer_id.NEXTVAL, 600000, 'Wypożyczenie', TO_DATE('2024-11-10', 'YYYY-MM-DD'), v_player_id, v_from_id, v_to_id);
        
        UPDATE Player SET club_id = v_to_id WHERE member_id = v_player_id;
    EXCEPTION WHEN NO_DATA_FOUND THEN NULL; END;

    BEGIN
        SELECT club_id INTO v_from_id FROM Team WHERE UPPER(name) = 'ZAGŁĘBIE LUBIN';
        SELECT club_id INTO v_to_id FROM Team WHERE UPPER(name) = 'PIAST GLIWICE';
        v_player_id := get_p_id('Pawel', 'Szymanski', v_from_id);
        
        INSERT INTO Transfer (transfer_id, transfer_fee, transfer_type, transfer_date, player_id, from_club_id, to_club_id)
        VALUES (seq_transfer_id.NEXTVAL, 250000, 'Transfer definitywny', TO_DATE('2024-11-10', 'YYYY-MM-DD'), v_player_id, v_from_id, v_to_id);
        
        UPDATE Player SET club_id = v_to_id WHERE member_id = v_player_id;
    EXCEPTION WHEN NO_DATA_FOUND THEN NULL; END;

    BEGIN
        SELECT club_id INTO v_from_id FROM Team WHERE UPPER(name) = 'WIDZEW ŁÓDŹ';
        SELECT club_id INTO v_to_id FROM Team WHERE UPPER(name) = 'KORONA KIELCE';
        v_player_id := get_p_id('Jakub', 'Dabrowski', v_from_id);
        
        INSERT INTO Transfer (transfer_id, transfer_fee, transfer_type, transfer_date, player_id, from_club_id, to_club_id)
        VALUES (seq_transfer_id.NEXTVAL, 120000, 'Wypożyczenie', TO_DATE('2024-11-10', 'YYYY-MM-DD'), v_player_id, v_from_id, v_to_id);
        
        UPDATE Player SET club_id = v_to_id WHERE member_id = v_player_id;
    EXCEPTION WHEN NO_DATA_FOUND THEN NULL; END;

    BEGIN
        SELECT club_id INTO v_from_id FROM Team WHERE UPPER(name) = 'PIAST GLIWICE';
        SELECT club_id INTO v_to_id FROM Team WHERE UPPER(name) = 'CRACOVIA';
        v_player_id := get_p_id('Szymon', 'Kozlowski', v_from_id);
        
        INSERT INTO Transfer (transfer_id, transfer_fee, transfer_type, transfer_date, player_id, from_club_id, to_club_id)
        VALUES (seq_transfer_id.NEXTVAL, 550000, 'Transfer definitywny', TO_DATE('2024-11-10', 'YYYY-MM-DD'), v_player_id, v_from_id, v_to_id);
        
        UPDATE Player SET club_id = v_to_id WHERE member_id = v_player_id;
    EXCEPTION WHEN NO_DATA_FOUND THEN NULL; END;

    COMMIT;
END;
/
