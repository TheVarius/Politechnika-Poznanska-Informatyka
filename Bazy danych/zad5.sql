-- zad 1: Generowanie kodu pracownika
SELECT NAZWISKO, SUBSTR(etat, 1,2) || TO_CHAR(ID_PRAC) AS KOD
FROM PRACOWNICY; [cite: 41]

-- zad 2: Zamiana znaków w nazwisku
SELECT NAZWISKO, TRANSLATE(nazwisko,'KLM','XXX') AS wojna_znakom
FROM PRACOWNICY; [cite: 41]

-- zad 3: Pracownicy z literą 'L' w pierwszej połowie nazwiska
SELECT NAZWISKO
FROM PRACOWNICY
WHERE INSTR(NAZWISKO, 'L') > 0
  AND INSTR(NAZWISKO, 'L') <= LENGTH(NAZWISKO) / 2; [cite: 42]

-- zad 4: Podwyżka o 15% (zaokrąglona)
SELECT NAZWISKO, round(PLACA_POD*1.15,0) AS podwyzka
FROM PRACOWNICY; [cite: 43]

-- zad 5: Analiza inwestycji kapitałowej z płacy
SELECT 
  NAZWISKO,
  PLACA_POD,
  ROUND(PLACA_POD * 0.2, 2) AS INWESTYCJA,
  ROUND(PLACA_POD * 0.2 * POWER(1.1, 10), 6) AS KAPITAL,
  ROUND(PLACA_POD * 0.2 * POWER(1.1, 10) - PLACA_POD * 0.2, 6) AS ZYSK
FROM 
  PRACOWNICY; [cite: 43]

-- zad 6: Staż pracowników w roku 2000
SELECT NAZWISKO, ZATRUDNIONY, FLOOR((DATE '2000-01-01' - ZATRUDNIONY)/365) AS STAZ_W_2000
FROM PRACOWNICY; [cite: 44]

-- zad 7: Formatowanie daty zatrudnienia
SELECT NAZWISKO, TO_CHAR(ZATRUDNIONY, 'MONTH, dd yyyy') AS zatrudniony_fmt
FROM PRACOWNICY; [cite: 44]

-- zad 8: Aktualna data
SELECT CURRENT_DATE FROM DUAL; [cite: 45]

-- zad 9: Podział adresów na dzielnice
SELECT nazwa, adres,
CASE
    WHEN adres = 'PIOTROWO 3A' THEN 'NOWE MIASTO'
    WHEN adres IN('STRZELECKA 14', 'MIELZYNSKIEGO 30') THEN 'STARE MIASTO'
    ELSE 'GRUNWALD '
END as dzielnica
FROM ZESPOLY; [cite: 45]

-- zad 10: Porównanie płacy do progu 480
SELECT NAZWISKO, PLACA_POD,
       CASE
           WHEN PLACA_POD = 480 THEN 'Dokładnie 480'
           WHEN PLACA_POD > 480 THEN 'Powyżej 480'
           WHEN PLACA_POD < 480 THEN 'Poniżej 480'
           END as PROG
FROM PRACOWNICY; [cite: 46]

-- zad 11: Warunkowe filtrowanie płac według zespołów
SELECT NAZWISKO, ID_ZESP, PLACA_POD
FROM PRACOWNICY
WHERE
    CASE ID_ZESP
        WHEN 10 THEN CASE WHEN PLACA_POD >= 1070.10 THEN 1 ELSE 0 END
        WHEN 20 THEN CASE WHEN PLACA_POD >= 616.60 THEN 1 ELSE 0 END
        WHEN 30 THEN CASE WHEN PLACA_POD >= 502 THEN 1 ELSE 0 END
        WHEN 40 THEN CASE WHEN PLACA_POD >= 1350 THEN 1 ELSE 0 END
        ELSE 0
    END = 1
ORDER BY ID_ZESP, PLACA_POD; [cite: 47, 48]

-- zad 12: Staż pracowników w różnych latach zależnie od etatu
SELECT nazwisko, etat,
       CASE
           WHEN etat IN ('DYREKTOR', 'PROFESOR') THEN floor((DATE '2000-01-01' - zatrudniony)/365)
       END AS staz_w_2000,
       CASE
           WHEN etat IN ('ADIUNKT', 'ASYSTENT') THEN floor((DATE '2010-01-01' - zatrudniony)/365)
       END AS staz_w_2010,
       CASE
           WHEN etat IN ('STAZYSTA', 'SEKRETARKA') THEN floor((DATE '2020-01-01' - zatrudniony)/365)
       END as staz_w_2020
FROM pracownicy
ORDER BY staz_w_2000, staz_w_2010, staz_w_2020; [cite: 49, 50]
