-- Zad 3.1
CREATE OR REPLACE TRIGGER PoPoleceniu
    AFTER UPDATE ON Pracownicy
BEGIN
    DBMS_OUTPUT.PUT_LINE('Zmieniono dane tabeli Pracownicy!');
END;
/

UPDATE Pracownicy
SET placa_pod = placa_pod * 1.1;

-- Zad 3.2
CREATE OR REPLACE TRIGGER PoPoleceniu
    AFTER INSERT OR DELETE OR UPDATE ON Pracownicy
DECLARE
    vKomunikat VARCHAR(50);
BEGIN
    CASE
        WHEN INSERTING THEN
            vKomunikat := 'Wstawiono dane do tabeli Pracownicy!';
        WHEN DELETING THEN
            vKomunikat := 'Usunięto dane z tabeli Pracownicy!';
        WHEN UPDATING THEN
            vKomunikat := 'Zmieniono dane tabeli Pracownicy!';
        END CASE;
    DBMS_OUTPUT.PUT_LINE(vKomunikat);
END;
/

INSERT INTO Pracownicy(id_prac, nazwisko, placa_pod)
VALUES((SELECT MAX(id_prac) + 10 FROM Pracownicy), 'TESTOWY', 200);

UPDATE Pracownicy
SET placa_pod = placa_pod * 1.1
WHERE nazwisko = 'TESTOWY';

DELETE FROM Pracownicy
WHERE nazwisko = 'TESTOWY';


-- Zad 3.3
CREATE TABLE DziennikOperacji(
    data DATE,
    typ VARCHAR(10) CHECK(typ IN ('INSERT', 'UPDATE', 'DELETE')),
    tabela VARCHAR(128),
    liczba_rekordow NUMBER(10),
    PRIMARY KEY (data, typ, tabela)
);

CREATE OR REPLACE TRIGGER LogujOperacje
    AFTER INSERT OR UPDATE OR DELETE ON Zespoly
DECLARE
    v_typ_operacji VARCHAR(10);
    v_liczba_rekordow NUMBER;
BEGIN
    IF INSERTING THEN
        v_typ_operacji := 'INSERT';
    ELSIF UPDATING THEN
        v_typ_operacji := 'UPDATE';
    ELSE
        v_typ_operacji := 'DELETE';
    END IF;

    SELECT COUNT(*) INTO v_liczba_rekordow FROM Zespoly;

    INSERT INTO DziennikOperacji(data, typ, tabela, liczba_rekordow)
    VALUES (CURRENT_DATE, v_typ_operacji, 'ZESPOLY', v_liczba_rekordow);
END;
/

-- Zad 3.4
CREATE OR REPLACE TRIGGER PokazPlace
    BEFORE UPDATE OF placa_pod ON Pracownicy
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Pracownik ' || :OLD.nazwisko);
    DBMS_OUTPUT.PUT_LINE('Płaca przed modyfikacja: ' || :OLD.placa_pod);
    DBMS_OUTPUT.PUT_LINE('Płaca po modyfikacji: ' || :NEW.placa_pod);
END;
/

-- Zad 3.5
CREATE OR REPLACE TRIGGER PokazPlace
    BEFORE UPDATE OF placa_pod ON Pracownicy
    FOR EACH ROW
    WHEN (OLD.placa_pod <> NEW.placa_pod)
BEGIN
    DBMS_OUTPUT.PUT_LINE('Pracownik ' || :OLD.nazwisko);
    DBMS_OUTPUT.PUT_LINE('Płaca przed modyfikacją: ' || :OLD.placa_pod);
    DBMS_OUTPUT.PUT_LINE('Płaca po modyfikacji: ' || :NEW.placa_pod);
END;
/

UPDATE Pracownicy p
SET placa_pod = (SELECT MAX(placa_pod) FROM Pracownicy WHERE id_zesp = p.id_zesp)
WHERE id_zesp = 20;

-- Zad 3.6
CREATE OR REPLACE TRIGGER WymuszajPlace
    BEFORE INSERT OR UPDATE OF placa_pod ON Pracownicy
    FOR EACH ROW
    WHEN (NEW.etat IS NOT NULL)
DECLARE
    vPlacaMin Etaty.placa_min%TYPE;
    vPlacaMax Etaty.placa_max%TYPE;
BEGIN
    SELECT placa_min, placa_max
    INTO vPlacaMin, vPlacaMax
    FROM Etaty WHERE nazwa = :NEW.etat;

    IF :NEW.placa_pod NOT BETWEEN vPlacaMin AND vPlacaMax THEN
        RAISE_APPLICATION_ERROR(-20001, 'Płaca poza zakresem dla etatu!');
    END IF;
END;
/

-- Zad 3.7
CREATE SEQUENCE seq_zespoly START WITH 51; 

CREATE OR REPLACE TRIGGER UzupelnijID
    BEFORE INSERT ON Zespoly
    FOR EACH ROW
BEGIN
    :NEW.id_zesp := seq_zespoly.NEXTVAL;
END;
/

INSERT INTO Zespoly (nazwa, adres) VALUES ('NOWY', 'brak');

SELECT * FROM Zespoly WHERE nazwa = 'NOWY';

-- Zad 3.8
CREATE OR REPLACE TRIGGER PoUsunieciu
    AFTER DELETE ON Pracownicy
    FOR EACH ROW
DECLARE
    vLiczba PLS_INTEGER;
BEGIN
    SELECT COUNT(*) INTO vLiczba
    FROM Pracownicy;
    DBMS_OUTPUT.PUT_LINE('Pracowników po DELETE: ' || vLiczba);
END;
/

-- Zad 3.9
ALTER TABLE Zespoly ADD liczba_pracownikow NUMBER(3);

UPDATE Zespoly z
SET liczba_pracownikow = (SELECT count(*) FROM Pracownicy WHERE id_zesp = z.id_zesp);

CREATE OR REPLACE TRIGGER LiczPracownikow
AFTER INSERT OR DELETE OR UPDATE OF id_zesp ON Pracownicy
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        UPDATE Zespoly SET liczba_pracownikow = NVL(liczba_pracownikow, 0) + 1 WHERE id_zesp = :NEW.id_zesp;
    END IF;
    
    IF DELETING THEN
        UPDATE Zespoly SET liczba_pracownikow = NVL(liczba_pracownikow, 0) - 1 WHERE id_zesp = :OLD.id_zesp;
    END IF;
    
    IF UPDATING THEN
        UPDATE Zespoly SET liczba_pracownikow = NVL(liczba_pracownikow, 0) - 1 WHERE id_zesp = :OLD.id_zesp;
        UPDATE Zespoly SET liczba_pracownikow = NVL(liczba_pracownikow, 0) + 1 WHERE id_zesp = :NEW.id_zesp;
    END IF;
END;
/

-- Zad 3.10
ALTER TABLE Pracownicy DISABLE ALL TRIGGERS;
SELECT trigger_name, status FROM User_Triggers WHERE table_name = 'PRACOWNICY';

-- Zad 3.11
SELECT trigger_name FROM User_Triggers
WHERE table_name IN ('PRACOWNICY', 'ZESPOLY');

DROP TRIGGER PoPoleceniu;
DROP TRIGGER PokazPlace;
DROP TRIGGER WymuszajPlace;
DROP TRIGGER PoUsunieciu;
DROP TRIGGER LiczPracownikow;
DROP TRIGGER LogujOperacje;
DROP TRIGGER UzupelnijID;

-- Zadanie samodzielne:
CREATE OR REPLACE VIEW Szefowie (szef, pracownicy) AS
SELECT s.nazwisko, COUNT(p.id_prac)
FROM Pracownicy s JOIN Pracownicy p ON (s.id_prac = p.id_szefa)
GROUP BY s.nazwisko, s.id_prac;

CREATE OR REPLACE TRIGGER UsunSzefa
    INSTEAD OF DELETE ON Szefowie
    FOR EACH ROW
DECLARE
    v_id_szefa_do_usuniecia Pracownicy.id_prac%TYPE;
    v_liczba_podwladnych_szefow NUMBER;
BEGIN
    SELECT id_prac INTO v_id_szefa_do_usuniecia FROM Pracownicy WHERE nazwisko = :OLD.szef;

    SELECT COUNT(*)
    INTO v_liczba_podwladnych_szefow
    FROM Pracownicy
    WHERE id_szefa IN (SELECT id_prac FROM Pracownicy WHERE id_szefa = v_id_szefa_do_usuniecia);

    IF v_liczba_podwladnych_szefow > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Jeden z podwladnych usuwanego pracownika jest szefem innych pracownikow. Usuwanie anulowane!');
    END IF;

    DELETE FROM Pracownicy WHERE id_szefa = v_id_szefa_do_usuniecia;
    DELETE FROM Pracownicy WHERE id_prac = v_id_szefa_do_usuniecia;
END;
/
