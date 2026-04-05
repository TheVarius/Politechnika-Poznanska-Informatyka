-- =======================================================
-- TEST 1: Studenci i Kierunki
-- =======================================================

-- zad 1: Liczba wszystkich studentów
SELECT count(STUDENT_ID) as ile_studentow
FROM STUDENCI;

-- zad 2: Kierunki studiów z określonym rodzajem
SELECT nazwa, symbol
FROM KIERUNKI_STUDIOW
where RODZAJ_STUDIOW is not null
order by NAZWA;

-- zad 3: Liczba studentów na poszczególnych kierunkach
SELECT nazwa, symbol, count(STUDENT_ID)
FROM KIERUNKI_STUDIOW join STUDENCI
on KIERUNEK = SYMBOL
where RODZAJ_STUDIOW is not null
group by nazwa, symbol
order by NAZWA;

-- zad 4: Top 3 kierunki z największą liczbą studentów
SELECT nazwa as top3, symbol, count(STUDENT_ID) as "liczba studentow"
FROM KIERUNKI_STUDIOW join STUDENCI
on KIERUNEK = SYMBOL
where RODZAJ_STUDIOW is not null
group by nazwa, symbol
order by "liczba studentow" desc
FETCH FIRST 3 ROWS ONLY;

-- zad 5: Liczba studentów według rodzaju studiów
SELECT
    r.NAZWA AS RODZAJ_STUDIOW,
    r.SYMBOL AS SYMBOL_RODZAJU, 
    COUNT(s.STUDENT_ID) AS "LICZBA_STUDENTOW"
FROM
    STUDENCI s
    JOIN KIERUNKI_STUDIOW k ON s.KIERUNEK = k.SYMBOL
    JOIN RODZAJE_STUDIOW r ON k.RODZAJ_STUDIOW = r.SYMBOL
GROUP BY
    r.NAZWA, r.SYMBOL
ORDER BY
    "LICZBA_STUDENTOW" DESC;

-- zad 5 (wariant 2): Liczba studentów według kategorii studiów
SELECT
    kk.NAZWA AS RODZAJ_STUDIOW,
    kk.SYMBOL AS SYMBOL_RODZAJU,
    COUNT(s.STUDENT_ID) AS "LICZBA_STUDENTOW"
FROM
    STUDENCI s
    JOIN KIERUNKI_STUDIOW k ON s.KIERUNEK = k.SYMBOL
    JOIN RODZAJE_STUDIOW r ON k.RODZAJ_STUDIOW = r.SYMBOL
    JOIN KATEGORIE_STUDIOW kk on kk.SYMBOL = r.KATEGORIA_STUDIOW
GROUP BY
    kk.NAZWA, kk.SYMBOL
ORDER BY
    "LICZBA_STUDENTOW";

-- zad 6: Hierarchiczne zestawienie liczby studentów (Kategorie -> Rodzaje -> Kierunki)
WITH
    CTE_STUDENCI_KIERUNKI AS (
        SELECT
            s.KIERUNEK AS SYMBOL_KIERUNKU,
            COUNT(s.STUDENT_ID) AS LICZBA_STUDENTOW_KIERUNEK
        FROM
            SPHD_DANE.STUDENCI s
        GROUP BY
            s.KIERUNEK
    ),
    CTE_KIERUNKI AS (
        SELECT
            '-- ' || k_all.NAZWA AS NAZWA,
            (SELECT rs.SYMBOL FROM SPHD_DANE.RODZAJE_STUDIOW rs WHERE rs.SYMBOL = k_all.RODZAJ_STUDIOW) || '-' || k_all.SYMBOL AS SCIEZKA,
            'kier.' AS OPIS,
            sk.LICZBA_STUDENTOW_KIERUNEK AS LICZBA_STUDENTOW
        FROM
            SPHD_DANE.KIERUNKI_STUDIOW k_all
            JOIN CTE_STUDENCI_KIERUNKI sk ON k_all.SYMBOL = sk.SYMBOL_KIERUNKU
    ),
    CTE_RODZAJE AS (
        SELECT
            '- ' || rs.NAZWA AS NAZWA,
            (SELECT kat.SYMBOL FROM SPHD_DANE.KATEGORIE_STUDIOW kat WHERE kat.SYMBOL = rs.KATEGORIA_STUDIOW) || '-' || rs.SYMBOL AS SCIEZKA,
            'rodzaj' AS OPIS,
            COUNT(s.STUDENT_ID) AS LICZBA_STUDENTOW
        FROM
            SPHD_DANE.STUDENCI s
            JOIN SPHD_DANE.KIERUNKI_STUDIOW k ON s.KIERUNEK = k.SYMBOL
            JOIN SPHD_DANE.RODZAJE_STUDIOW rs ON k.RODZAJ_STUDIOW = rs.SYMBOL
        GROUP BY
            rs.NAZWA, rs.SYMBOL, rs.KATEGORIA_STUDIOW
    ),
    CTE_KATEGORIE AS (
        SELECT
            kat.NAZWA AS NAZWA,
            kat.SYMBOL AS SCIEZKA,
            'kat.' AS OPIS,
            COUNT(s.STUDENT_ID) AS LICZBA_STUDENTOW
        FROM
            SPHD_DANE.STUDENCI s
            JOIN SPHD_DANE.KIERUNKI_STUDIOW k ON s.KIERUNEK = k.SYMBOL
            JOIN SPHD_DANE.RODZAJE_STUDIOW rs ON k.RODZAJ_STUDIOW = rs.SYMBOL
            JOIN SPHD_DANE.KATEGORIE_STUDIOW kat ON rs.KATEGORIA_STUDIOW = kat.SYMBOL
        GROUP BY
            kat.NAZWA, kat.SYMBOL
    )
SELECT NAZWA, SCIEZKA, OPIS, LICZBA_STUDENTOW FROM CTE_KATEGORIE
UNION ALL
SELECT NAZWA, SCIEZKA, OPIS, LICZBA_STUDENTOW FROM CTE_RODZAJE
UNION ALL
SELECT NAZWA, SCIEZKA, OPIS, LICZBA_STUDENTOW FROM CTE_KIERUNKI
ORDER BY SCIEZKA;

-- =======================================================
-- TEST 2: Geografia i Płeć Studentów
-- =======================================================

-- zad 1: Studenci według województw
SELECT WOJEWODZTWO, count(STUDENT_ID)
from STUDENCI join MIASTA using(miasto_id)
group by WOJEWODZTWO
order by WOJEWODZTWO;

-- zad 2: Top 5 województw z największą liczbą studentów
SELECT WOJEWODZTWO, count(STUDENT_ID) as liczba
from STUDENCI join MIASTA using(miasto_id)
group by WOJEWODZTWO
order by liczba desc
fetch first 5 row only;

-- zad 3: Studenci według miast i województw
SELECT m.WOJEWODZTWO, m.NAZWA, count(STUDENT_ID) as liczba 
from STUDENCI s left join MIASTA m using(miasto_id)
group by m.WOJEWODZTWO, m.NAZWA
order by WOJEWODZTWO, nazwa;

-- zad 4: Udział procentowy studentów z poszczególnych miast w ramach województwa
WITH
    LiczbaStudentowMiasto AS (
        SELECT
            m.WOJEWODZTWO,
            m.NAZWA AS MIASTO,
            COUNT(s.STUDENT_ID) AS LICZBA_STUDENTOW_MIASTO
        FROM
            SPHD_DANE.MIASTA m
            JOIN SPHD_DANE.STUDENCI s ON m.MIASTO_ID = s.MIASTO_ID
        GROUP BY
            m.WOJEWODZTWO, m.NAZWA
    ),
    LiczbaStudentowWojewodztwo AS (
        SELECT
            WOJEWODZTWO,
            SUM(LICZBA_STUDENTOW_MIASTO) AS LICZBA_STUDENTOW_WOJEWODZTWO
        FROM
            LiczbaStudentowMiasto
        GROUP BY
            WOJEWODZTWO
    )
SELECT
    LSM.WOJEWODZTWO,
    LSM.MIASTO,
    LSM.LICZBA_STUDENTOW_MIASTO,
    LSW.LICZBA_STUDENTOW_WOJEWODZTWO,
    ROUND((LSM.LICZBA_STUDENTOW_MIASTO * 100.0) / LSW.LICZBA_STUDENTOW_WOJEWODZTWO, 2) AS PROCENT_UDZIAL
FROM
    LiczbaStudentowMiasto LSM
    JOIN LiczbaStudentowWojewodztwo LSW ON LSM.WOJEWODZTWO = LSW.WOJEWODZTWO
ORDER BY
    LSM.WOJEWODZTWO, LSM.MIASTO;

-- zad 5: Podział studentów według województw i płci
SELECT m.WOJEWODZTWO, s.plec, count(STUDENT_ID) as liczba
from STUDENCI s left join MIASTA m using(miasto_id)
where m.WOJEWODZTWO is not null
group by m.WOJEWODZTWO, s.plec
order by m.WOJEWODZTWO, liczba;

-- zad 7: Liczba mężczyzn w województwach (przykład CASE)
SELECT
    m.WOJEWODZTWO,
    SUM(CASE WHEN s.plec = 'mężczyzna' THEN 1 ELSE 0 END) AS mezczyzni
FROM
    STUDENCI s
    JOIN MIASTA m USING(miasto_id)
WHERE
    m.WOJEWODZTWO IS NOT NULL
GROUP BY
    m.WOJEWODZTWO
ORDER BY
    m.WOJEWODZTWO;

-- =======================================================
-- TEST 3: Oceny i Wyniki
-- =======================================================

-- zad 1: Całkowita liczba wystawionych ocen
SELECT count(ocena) from oceny;

-- zad 2: Liczba ocen w poszczególnych latach akademickich
SELECT ROK_AKADEMICKI, count(ocena) as oceny from oceny
group by ROK_AKADEMICKI
order by oceny;

-- zad 3: Rok z największą liczbą ocen
SELECT ROK_AKADEMICKI, count(ocena) as oceny from oceny
group by ROK_AKADEMICKI
order by oceny desc
fetch first 1 row only;

-- zad 4: Liczba ocen w semestrach roku 2006/07
SELECT ROK_AKADEMICKI, RODZAJ_SEMESTRU, count(ocena) as oceny from oceny
where ROK_AKADEMICKI = '2006/07'
group by ROK_AKADEMICKI, RODZAJ_SEMESTRU
order by oceny desc
fetch first 2 row only;

-- zad 5: Kategoryzacja ocen (wybitne, średnie, słabe)
SELECT
    CASE
        WHEN ocena >= 4.5 THEN 'oceny wybitne'
        WHEN ocena BETWEEN 3.5 AND 4 THEN 'oceny średnie'
        WHEN ocena <= 3 THEN 'oceny słabe'
    END AS KATEGORIA,
    COUNT(ocena) AS LICZBA_OCEN
FROM
    oceny
WHERE
    RODZAJ_SEMESTRU = 'zimowy' and ROK_AKADEMICKI = '2006/07' and ocena is not null
GROUP BY
    CASE
        WHEN ocena >= 4.5 THEN 'oceny wybitne'
        WHEN ocena BETWEEN 3.5 AND 4 THEN 'oceny średnie'
        WHEN ocena <= 3 THEN 'oceny słabe'
    END;

-- zad 6: TOP 10 najlepszych i 10 najgorszych studentów pod względem średniej
WITH
    SrednieOcenStudentow AS (
        SELECT
            o.STUDENT_ID,
            ROUND(AVG(o.OCENA), 2) AS SREDNIA_OCEN
        FROM
            OCENY o
        WHERE
            o.ROK_AKADEMICKI = '2006/07'
            AND o.RODZAJ_SEMESTRU = 'zimowy'
            AND o.OCENA IS NOT NULL
        GROUP BY
            o.STUDENT_ID
        HAVING
            COUNT(o.OCENA) > 0
    ),
    RankingStudentow AS (
        SELECT
            STUDENT_ID,
            SREDNIA_OCEN,
            ROW_NUMBER() OVER (ORDER BY SREDNIA_OCEN DESC) AS Rnk_Desc,
            ROW_NUMBER() OVER (ORDER BY SREDNIA_OCEN ASC) AS Rnk_Asc
        FROM
            SrednieOcenStudentow
    )
SELECT STUDENT_ID, SREDNIA_OCEN FROM RankingStudentow WHERE Rnk_Desc <= 10
UNION ALL
SELECT STUDENT_ID, SREDNIA_OCEN FROM RankingStudentow WHERE Rnk_Asc <= 10
ORDER BY SREDNIA_OCEN DESC;

-- zad 7: TOP 3 kierunki z najwyższą średnią ocen
WITH
    SrednieOcenyNaKierunkach AS (
        SELECT
            ks.SYMBOL AS SYMBOL_KIERUNKU,
            ks.NAZWA AS NAZWA_KIERUNKU,
            ROUND(AVG(o.OCENA), 2) AS SREDNIA_OCEN
        FROM
            OCENY o
            JOIN STUDENCI s ON o.STUDENT_ID = s.STUDENT_ID
            JOIN KIERUNKI_STUDIOW ks ON s.kierunek = ks.SYMBOL
        WHERE
            o.ROK_AKADEMICKI = '2006/07'
            AND o.RODZAJ_SEMESTRU = 'zimowy'
            AND o.OCENA IS NOT NULL
        GROUP BY
            ks.SYMBOL, ks.NAZWA
    )
SELECT
    NAZWA_KIERUNKU AS TOP_3_KIERUNKI,
    SYMBOL_KIERUNKU AS SYMBOL,
    SREDNIA_OCEN
FROM
    SrednieOcenyNaKierunkach
ORDER BY
    SREDNIA_OCEN DESC
FETCH FIRST 3 ROWS ONLY;

-- zad 8: Top 5 przedmiotów z najwyższą średnią na 3 najlepszych kierunkach
WITH
    Top3Kierunki AS (
        SELECT
            ks.SYMBOL AS SYMBOL_KIERUNKU,
            ks.NAZWA AS NAZWA_KIERUNKU
        FROM
            OCENY o
            JOIN STUDENCI s ON o.STUDENT_ID = s.STUDENT_ID
            JOIN KIERUNKI_STUDIOW ks ON s.kierunek = ks.SYMBOL
        WHERE
            o.ROK_AKADEMICKI = '2006/07'
            AND o.RODZAJ_SEMESTRU = 'zimowy'
            AND o.OCENA IS NOT NULL
        GROUP BY ks.SYMBOL, ks.NAZWA
        ORDER BY AVG(o.OCENA) DESC
        FETCH FIRST 3 ROWS ONLY
    ),
    SrednieOcenPrzedmiotowNaKierunku AS (
        SELECT
            tk.SYMBOL_KIERUNKU,
            p.NAZWA AS NAZWA_PRZEDMIOTU,
            ROUND(AVG(o.OCENA), 2) AS SREDNIA_OCEN,
            ROW_NUMBER() OVER (PARTITION BY tk.SYMBOL_KIERUNKU ORDER BY AVG(o.OCENA) DESC) AS Rnk
        FROM
            OCENY o
            JOIN STUDENCI s ON o.STUDENT_ID = s.STUDENT_ID
            JOIN Top3Kierunki tk ON s.kierunek = tk.SYMBOL_KIERUNKU
            JOIN PRZEDMIOTY p ON o.PRZEDMIOT_ID = p.PRZEDMIOT_ID
        WHERE
            o.ROK_AKADEMICKI = '2006/07'
            AND o.RODZAJ_SEMESTRU = 'zimowy'
            AND o.OCENA IS NOT NULL
        GROUP BY
            tk.SYMBOL_KIERUNKU, p.PRZEDMIOT_ID, p.NAZWA
    )
SELECT
    SYMBOL_KIERUNKU AS TOP_3_KIERUNKI,
    NAZWA_PRZEDMIOTU AS TOP_5_PRZEDMIOTY,
    SREDNIA_OCEN
FROM
    SrednieOcenPrzedmiotowNaKierunku
WHERE
    Rnk <= 5
ORDER BY
    SYMBOL_KIERUNKU ASC,
    SREDNIA_OCEN DESC;
