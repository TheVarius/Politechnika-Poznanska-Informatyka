-- ZAD 2.1
-- Pierwsza wersja (z błędem WHRE)
/*
CREATE OR REPLACE PROCEDURE Podwyzka IS
BEGIN
    UPDATE Pracownicy
    SET placa_pod = placa_pod * 1.1
        WHRE etat = 'ASYSTENT';
END Podwyzka;
*/

-- Poprawna wersja procedury Podwyzka
CREATE OR REPLACE PROCEDURE Podwyzka IS
BEGIN
  UPDATE Pracownicy
  SET placa_pod = placa_pod * 1.1
  WHERE etat = 'ASYSTENT';
END Podwyzka;
/

-- Wykonanie procedury
-- EXECUTE Podwyzka;

-- ZAD 2.2
CREATE OR REPLACE PROCEDURE NowyPracownik
(p_nazwisko     IN VARCHAR2,
 p_nazwa_zespolu IN VARCHAR2,
 p_nazwisko_szefa IN VARCHAR2,
 p_placa        IN NUMBER) IS

    v_nowy_id_prac Pracownicy.id_prac%TYPE;
    v_id_zesp      Zespoly.id_zesp%TYPE;
    v_id_szefa     Pracownicy.id_prac%TYPE;

BEGIN
    SELECT MAX(id_prac) + 10 INTO v_nowy_id_prac FROM Pracownicy;

    SELECT id_zesp INTO v_id_zesp FROM Zespoly WHERE nazwa = p_nazwa_zespolu;

    SELECT id_prac INTO v_id_szefa FROM Pracownicy WHERE nazwisko = p_nazwisko_szefa;

    INSERT INTO Pracownicy (id_prac, nazwisko, etat, id_szefa, zatrudniony, placa_pod, id_zesp)
    VALUES (v_nowy_id_prac, p_nazwisko, 'STAZYSTA', v_id_szefa, CURRENT_DATE, p_placa, v_id_zesp);

END NowyPracownik;
/

-- ZAD 2.3
CREATE OR REPLACE PROCEDURE NowyPracownik
(p_nazwisko      IN VARCHAR2,
 p_nazwa_zespolu  IN VARCHAR2,
 p_nazwisko_szefa IN VARCHAR2,
 p_placa         IN NUMBER,
 p_nowy_id        OUT NUMBER) IS

    v_id_zesp      Zespoly.id_zesp%TYPE;
    v_id_szefa     Pracownicy.id_prac%TYPE;

BEGIN
    SELECT MAX(id_prac) + 10 INTO p_nowy_id FROM Pracownicy;

    SELECT id_zesp INTO v_id_zesp FROM Zespoly WHERE nazwa = p_nazwa_zespolu;

    SELECT id_prac INTO v_id_szefa FROM Pracownicy WHERE nazwisko = p_nazwisko_szefa;

    INSERT INTO Pracownicy (id_prac, nazwisko, etat, id_szefa, zatrudniony, placa_pod, id_zesp)
    VALUES (p_nowy_id, p_nazwisko, 'STAZYSTA', v_id_szefa, CURRENT_DATE, p_placa, v_id_zesp);

END NowyPracownik;
/

-- ZAD 2.4
DECLARE
    v_id_nowego_pracownika NUMBER;
BEGIN
    NowyPracownik(
            p_placa        => 400,
            p_nazwisko_szefa => 'MORZY',
            p_nazwisko      => 'KOWALSKI',
            p_nazwa_zespolu  => 'SYSTEMY EKSPERCKIE',
            p_nowy_id        => v_id_nowego_pracownika
    );
    DBMS_OUTPUT.PUT_LINE('Wstawiono pracownika KOWALSKI z ID: ' || v_id_nowego_pracownika);
END;
/

-- ZAD 2.5
CREATE OR REPLACE FUNCTION PlacaNetto
(p_placa_brutto IN NUMBER,
 p_podatek      IN NUMBER DEFAULT 20)
    RETURN NUMBER IS
BEGIN
    RETURN p_placa_brutto * (1 - p_podatek / 100);
END PlacaNetto;
/

SELECT nazwisko, placa_pod AS BRUTTO,
       PlacaNetto(placa_pod, 35) AS NETTO
FROM pracownicy
WHERE etat = 'PROFESOR'
ORDER BY nazwisko;

-- ZAD 2.6
SELECT object_name, status
FROM User_Objects
WHERE object_type = 'PROCEDURE'
ORDER BY object_name;

SELECT object_name, status
FROM User_Objects
WHERE object_type = 'FUNCTION'
ORDER BY object_name;

SELECT text
FROM User_Source
WHERE name = 'NOWYPRACOWNIK'
  AND type = 'PROCEDURE'
ORDER BY line;

-- ZAD 2.7
DROP PROCEDURE Podwyzka;
DROP PROCEDURE NowyPracownik;
DROP FUNCTION PlacaNetto;
