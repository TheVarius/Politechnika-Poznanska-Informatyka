-- ZAD 1.1
DECLARE
    vLiczba1 NUMBER := 15.75;
    vLiczba2 NUMBER := 4.25;
    vSuma    NUMBER;
BEGIN
    vSuma := vLiczba1 + vLiczba2;
END;
/

-- ZAD 1.2
DECLARE
    vNazwisko Pracownicy.nazwisko%TYPE;
    vEtat     Pracownicy.etat%TYPE;
BEGIN
    vNazwisko := 'Gajowy';
    vEtat     := 'ASYSTENT';
END;
/

-- ZAD 1.3
DECLARE
    vNazwisko  Pracownicy.nazwisko%TYPE;
    vEtat      Pracownicy.etat%TYPE;
    vPlacaPod  Pracownicy.placa_pod%TYPE;
BEGIN
    vNazwisko := 'Gajowy';
    vEtat     := 'ASYSTENT';
    vPlacaPod := 100000;
END;
/
-- ORA-06502: PL/SQL: błąd liczby lub wartości: zbyt duża precyzja liczby

-- ZAD 1.4
DECLARE
    vLiczba1 NUMBER := 10.2356000;
    vLiczba2 NUMBER := 0.0000001;
    vSuma    NUMBER;
BEGIN
    vSuma := vLiczba1 + vLiczba2;
    DBMS_OUTPUT.PUT_LINE('Wynik dodawania ' || vLiczba1 || ' i ' || vLiczba2 || ': ' || vSuma);
END;
/

-- ZAD 1.5
DECLARE
    vPromien NUMBER := 5;
    cPI      CONSTANT NUMBER(3,2) := 3.14;
    vObwod   NUMBER;
    vPole    NUMBER;
BEGIN
    vObwod := 2 * cPI * vPromien;
    vPole  := cPI * vPromien * vPromien;

    DBMS_OUTPUT.PUT_LINE('Obwód koła o promieniu równym ' || vPromien || ': ' || vObwod);
    DBMS_OUTPUT.PUT_LINE('Pole koła o promieniu równym ' || vPromien || ': ' || vPole);
END;
/

-- ZAD 1.6 
DECLARE
    vNazwisko  Pracownicy.nazwisko%TYPE;
    vEtat      Pracownicy.etat%TYPE;
    vPlacaPod  Pracownicy.placa_pod%TYPE;
BEGIN
    SELECT nazwisko, etat, placa_pod
    INTO vNazwisko, vEtat, vPlacaPod
    FROM Pracownicy
    WHERE id_prac = 120;

    DBMS_OUTPUT.PUT_LINE('Pracownik ' || vNazwisko || ' pracuje jako ' || vEtat || ' i zarabia ' || vPlacaPod || '.');
END;
/

-- ZAD 1.7
DECLARE
    vPracownik Pracownicy%ROWTYPE;
BEGIN
    SELECT *
    INTO vPracownik
    FROM Pracownicy
    WHERE placa_pod = (SELECT MAX(placa_pod) FROM Pracownicy);

    DBMS_OUTPUT.PUT_LINE('Najlepiej zarabiający pracownik to ' || vPracownik.nazwisko || '.');
    DBMS_OUTPUT.PUT_LINE('Pracuje on jako ' || vPracownik.etat || ' i zarabia ' || vPracownik.placa_pod || '.');
END;
/

-- ZAD 1.8
DECLARE
    vNazwisko  Pracownicy.nazwisko%TYPE;
    vEtat      Pracownicy.etat%TYPE;
    vPlacaPod  Pracownicy.placa_pod%TYPE;
BEGIN
    SELECT nazwisko, etat, placa_pod
    INTO vNazwisko, vEtat, vPlacaPod
    FROM Pracownicy
    WHERE id_prac IN (120, 130);
END;
/
-- ORA-01422: dokładne pobranie zwraca większą liczbę wierszy niż zamówiono

-- ZAD 1.9
DECLARE
    vPracownik  Pracownicy%ROWTYPE;
    vPlacaRazem NUMBER;
    vPremia     NUMBER;
BEGIN
    SELECT *
    INTO vPracownik
    FROM Pracownicy
    WHERE placa_pod = (SELECT MAX(placa_pod) FROM Pracownicy);

    vPlacaRazem := vPracownik.placa_pod + NVL(vPracownik.placa_dod, 0);

    IF vPlacaRazem < 1000 THEN
        vPremia := 100;
    ELSIF vPlacaRazem < 5000 THEN
        vPremia := 500;
    ELSIF vPlacaRazem < 7000 THEN
        vPremia := 1000;
    ELSE
        vPremia := 2000;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Najlepiej zarabiający pracownik to ' || vPracownik.nazwisko || '.');
    DBMS_OUTPUT.PUT_LINE('Pracuje on jako ' || vPracownik.etat || ' i zarabia ' || vPracownik.placa_pod || '.');
    DBMS_OUTPUT.PUT_LINE('Jego premia to ' || vPremia || '.');
END;
/

-- ZAD 1.10
DECLARE
    vPracownik  Pracownicy%ROWTYPE;
    vPlacaRazem NUMBER;
    vPremia     NUMBER;
    vStazPracy  NUMBER;
    vStatus     VARCHAR2(50);
BEGIN
    SELECT *
    INTO vPracownik
    FROM Pracownicy
    WHERE placa_pod = (SELECT MAX(placa_pod) FROM Pracownicy);

    vPlacaRazem := vPracownik.placa_pod + NVL(vPracownik.placa_dod, 0);
    IF vPlacaRazem < 1000 THEN vPremia := 100;
    ELSIF vPlacaRazem < 5000 THEN vPremia := 500;
    ELSIF vPlacaRazem < 7000 THEN vPremia := 1000;
    ELSE vPremia := 2000;
    END IF;

    vStazPracy := EXTRACT (YEAR FROM (CURRENT_DATE - vPracownik.zatrudniony) YEAR TO MONTH);

    CASE
        WHEN vStazPracy < 1 THEN vStatus := 'żółtodziób';
        WHEN vStazPracy < 2 THEN vStatus := 'ledwo zaczął';
        WHEN vStazPracy < 3 THEN vStatus := 'już coś wie';
        ELSE vStatus := 'doświadczony pracownik';
        END CASE;

    DBMS_OUTPUT.PUT_LINE('Najlepiej zarabiający pracownik to ' || vPracownik.nazwisko || '.');
    DBMS_OUTPUT.PUT_LINE('Pracuje on jako ' || vPracownik.etat || ' i zarabia ' || vPracownik.placa_pod || '.');
    DBMS_OUTPUT.PUT_LINE('Jego premia to ' || vPremia || '.');
    DBMS_OUTPUT.PUT_LINE(vPracownik.nazwisko || ' to ' || vStatus || '.');
END;
/

-- ZAD 1.11
DECLARE
    vNazwisko Pracownicy.nazwisko%TYPE;
    vIdPrac   Pracownicy.id_prac%TYPE;
BEGIN
    FOR i IN 10..20 LOOP
            vIdPrac := i * 10;
            BEGIN
                SELECT nazwisko
                INTO vNazwisko
                FROM Pracownicy
                WHERE id_prac = vIdPrac;

                DBMS_OUTPUT.PUT_LINE(vIdPrac || ': ' || vNazwisko);

            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    NULL;
            END;
        END LOOP;
END;
/

-- ZAD 1.12
BEGIN
    FOR prac IN (SELECT id_prac, nazwisko
                 FROM Pracownicy
                 WHERE id_prac BETWEEN 100 AND 200
                 ORDER BY id_prac)
        LOOP
            DBMS_OUTPUT.PUT_LINE(prac.id_prac || ': ' || prac.nazwisko);
        END LOOP;
END;
/

-- ZAD 1.13
DECLARE
    vNowyIdZesp Zespoly.id_zesp%TYPE;
    vIdSysRozpr Zespoly.id_zesp%TYPE;
BEGIN
    SELECT MAX(id_zesp) + 10
    INTO vNowyIdZesp
    FROM Zespoly;

    INSERT INTO Zespoly (id_zesp, nazwa, adres)
    VALUES (vNowyIdZesp, 'SYSTEMY BAZODANOWE', 'PIOTROWO 2');

    DBMS_OUTPUT.PUT_LINE('Utworzyliśmy nowy zespół o ID: ' || vNowyIdZesp);

    SELECT id_zesp
    INTO vIdSysRozpr
    FROM Zespoly
    WHERE nazwa = 'SYSTEMY ROZPROSZONE';

    UPDATE Pracownicy
    SET id_zesp = vNowyIdZesp
    WHERE id_zesp = vIdSysRozpr AND placa_pod < 500;

    DBMS_OUTPUT.PUT_LINE('Jest w nim ' || SQL%ROWCOUNT || ' pracowników.');

END;
/
