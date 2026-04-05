-- zad 1: Pracownicy i ich zespoły (uwzględnia pracowników bez zespołów)
SELECT NAZWISKO, ID_ZESP, NAZWA
FROM PRACOWNICY LEFT JOIN ZESPOLY USING (ID_ZESP)
ORDER BY NAZWISKO; [cite: 61]

-- zad 2: Wszystkie zespoły i ich pracownicy
SELECT ID_ZESP, NAZWA, nvl(NAZWISKO,'brak')
FROM PRACOWNICY RIGHT JOIN ZESPOLY USING (ID_ZESP)
ORDER BY NAZWA; [cite: 62]

-- zad 3: Pełne zestawienie pracowników i zespołów
SELECT nvl(NAZWISKO,'brak'), nvl(NAZWA,'brak')
FROM PRACOWNICY full join ZESPOLY USING (ID_ZESP)
ORDER BY NAZWISKO; [cite: 63]

-- zad 4: Statystyki płacowe według zespołów (z pustymi zespołami)
SELECT NAZWA as zespol, count(ID_PRAC), sum(PLACA_POD)
FROM PRACOWNICY full join ZESPOLY USING (ID_ZESP)
group by NAZWA; [cite: 64]

-- zad 5: Zespoły bez pracowników
SELECT NAZWA as zespol
FROM PRACOWNICY right join ZESPOLY USING (ID_ZESP)
where NAZWISKO is null
group by NAZWA; [cite: 65]

-- zad 6: Relacja pracownik-szef (uwzględnia pracowników bez szefa)
SELECT p.nazwisko as nazwisko, p.ID_PRAC, s.nazwisko as szef, p.ID_SZEFA
FROM PRACOWNICY p left join PRACOWNICY s
ON p.ID_SZEFA = s.ID_PRAC
order by p.NAZWISKO; [cite: 66]

-- zad 7: Liczba podwładnych dla każdego pracownika-szefa
SELECT s.NAZWISKO AS Szef, COUNT(p.ID_PRAC) AS Liczba_Podwladnych
FROM PRACOWNICY s LEFT JOIN PRACOWNICY p 
    ON p.ID_SZEFA = s.ID_PRAC
GROUP BY s.NAZWISKO
ORDER BY s.NAZWISKO; [cite: 67]

-- zad 8: Pełne dane o pracowniku, szefie i zespole
SELECT p.nazwisko as nazwisko, p.etat, p.PLACA_POD, e.nazwa, s.nazwisko as szef
FROM PRACOWNICY p left join PRACOWNICY s ON p.ID_SZEFA = s.ID_PRAC
LEFT JOIN ZESPOLY e on p.ID_ZESP = e.ID_ZESP
order by p.NAZWISKO; [cite: 68]

-- zad 9: Iloczyn kartezjański pracowników i zespołów
SELECT NAZWISKO, NAZWA
from PRACOWNICY cross join ZESPOLY; [cite: 69]

-- zad 10: Liczność kombinacji pracownik-zespół-etat
SELECT count(*)
from PRACOWNICY cross join ZESPOLY
cross join etaty; [cite: 69]

-- zad 11: Etaty wspólne dla osób zatrudnionych w 1992 i 1993 (INTERSECT)
SELECT etat
from PRACOWNICY
where extract(year from ZATRUDNIONY) = 1992
INTERSECT 
SELECT etat
from PRACOWNICY
where extract(year from ZATRUDNIONY) = 1993; [cite: 70]
