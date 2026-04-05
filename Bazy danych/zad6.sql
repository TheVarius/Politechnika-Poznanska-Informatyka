-- zad 1: Złączenie pracowników z zespołami
SELECT NAZWISKO, ETAT, ID_ZESP, NAZWA
FROM PRACOWNICY INNER JOIN ZESPOLY USING (ID_ZESP)
ORDER BY NAZWISKO; [cite: 51]

-- zad 2: Pracownicy z wybranych zespołów (10, 20)
SELECT NAZWISKO, ETAT, ID_ZESP, NAZWA
FROM PRACOWNICY INNER JOIN ZESPOLY USING (ID_ZESP)
WHERE ID_ZESP IN(10,20)
ORDER BY NAZWISKO; [cite: 52]

-- zad 3: Sprawdzenie widełek płacowych dla etatów
SELECT NAZWISKO, ETAT, PLACA_POD, PLACA_MIN, PLACA_MAX
FROM PRACOWNICY INNER JOIN ETATY
ON ETAT = NAZWA
ORDER BY ETAT, NAZWISKO; [cite: 53]

-- zad 4: Warunek poprawności płacy
SELECT NAZWISKO, ETAT, PLACA_POD, PLACA_MIN, PLACA_MAX,
       CASE
           WHEN PLACA_POD BETWEEN PLACA_MIN AND PLACA_MAX THEN 'OK'
           ELSE 'NO'
           END as WARUNEK
FROM PRACOWNICY INNER JOIN ETATY
ON ETAT = NAZWA
ORDER BY ETAT, NAZWISKO; [cite: 54]

-- zad 5: Wykaz pracowników z płacą poza widełkami
SELECT NAZWISKO, ETAT, PLACA_POD, PLACA_MIN, PLACA_MAX,
       CASE
           WHEN PLACA_POD BETWEEN PLACA_MIN AND PLACA_MAX THEN 'OK'
           ELSE 'NO'
           END as WARUNEK
FROM PRACOWNICY INNER JOIN ETATY
ON ETAT = NAZWA
WHERE PLACA_POD NOT BETWEEN PLACA_MIN AND PLACA_MAX
ORDER BY ETAT, NAZWISKO; [cite: 55]

-- zad 6: Kategorie płacowe na podstawie zakresów
SELECT nazwisko, etat, placa_pod, placa_min, placa_max, nazwa AS kat_plac
FROM pracownicy INNER JOIN etaty
ON placa_pod BETWEEN placa_min AND placa_max
ORDER BY nazwisko; [cite: 56]

-- zad 7: Kategorie płacowe tylko dla sekretarek
SELECT nazwisko, etat, placa_pod, placa_min, placa_max, nazwa AS kat_plac
FROM pracownicy INNER JOIN etaty
ON placa_pod BETWEEN placa_min AND placa_max
WHERE NAZWA = 'SEKRETARKA'
ORDER BY nazwisko; [cite: 57]

-- zad 8: Relacja pracownik-szef (Self-join)
SELECT p.nazwisko as pracownik, p.ID_PRAC, s.nazwisko as szef, p.ID_SZEFA
FROM pracownicy p INNER JOIN pracownicy s
ON s.ID_PRAC = p.ID_SZEFA
ORDER BY p.nazwisko; [cite: 58]

-- zad 10: Statystyki zespołów
SELECT NAZWA, COUNT(*) AS LICZBA_PRACOWNIKOW, AVG(PLACA_POD) AS SREDNIA_PLACA
FROM PRACOWNICY INNER JOIN ZESPOLY USING (ID_ZESP)
GROUP BY NAZWA; [cite: 59]

-- zad 11: Etykietowanie wielkości zespołów
SELECT NAZWA,
       CASE
           WHEN COUNT(*) <= 2 THEN 'MALY'
           WHEN COUNT(*) BETWEEN 3 AND 6 THEN 'SREDNI'
           WHEN COUNT(*) > 6 THEN 'DUZY'
       END AS ETYKIETA
FROM PRACOWNICY INNER JOIN ZESPOLY USING (ID_ZESP)
GROUP BY NAZWA; [cite: 60]
