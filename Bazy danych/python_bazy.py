import psycopg2
import psycopg2.extras
import time

# Sekcja 1: Statystyki pracowników
try:
    with psycopg2.connect(user=un, password=pwd, database=db, port=port, host=hostaddress) as conn:
        with conn.cursor() as cursor:
            cursor.execute("SELECT count(*) FROM pracownicy")
            ogolem = cursor.fetchone()[0]
            print(f"Zatrudniono {ogolem} pracowników, w tym:")
            
            cursor.execute("SELECT count(*), id_zesp FROM pracownicy GROUP BY id_zesp ORDER BY id_zesp")
            for count, zesp in cursor:
                zespol_str = zesp if zesp is not None else "brak zespołu"
                print(f"{count} w zespole {zespol_str},")
except psycopg2.OperationalError as ex:
    print('błąd połączenia z bazą danych: ', ex)

# Sekcja 2: Obsługa błędów bazy danych
try:
    with psycopg2.connect(user=un, password=pwd, database=db, port=port, host=hostaddress) as conn:
        with conn.cursor() as cursor:
            cursor.execute("SELECT count(*) FROM pracownicy")
            print(f"Zatrudniono {cursor.fetchone()[0]} pracowników.")
except psycopg2.errors.UndefinedTable:
    print("podana tabela nie istnieje")
except psycopg2.errors.UndefinedColumn:
    print("podana kolumna nie istnieje")
except psycopg2.errors.SyntaxError:
    print("polecenie nie jest poprawnym zapytaniem SQL")
except psycopg2.OperationalError as ex:
    print('błąd połączenia z bazą danych: ', ex)

# Sekcja 3: Kursor przewijalny
try:
    with psycopg2.connect(user=un, password=pwd, database=db, port=port, host=hostaddress) as conn:
        with conn.cursor(name='kursor_asystenci', scrollable=True) as cursor:
            cursor.execute("SELECT nazwisko, placa_pod FROM pracownicy WHERE etat='ASYSTENT' ORDER BY placa_pod DESC")
            
            cursor.scroll(-1, mode='absolute')
            print(f"Najmniej zarabiający: {cursor.fetchone()}")

            cursor.scroll(-3, mode='absolute')
            print(f"Trzeci najmniej zarabiający: {cursor.fetchone()}")

            cursor.scroll(-2, mode='absolute')
            print(f"Przedostatni w rankingu najmniej zarabiających: {cursor.fetchone()}")
except psycopg2.OperationalError as ex:
    print('błąd połączenia z bazą danych: ', ex)

# Sekcja 4: DML z wykorzystaniem sekwencji
zwolnienia = [150, 200, 230]
zatrudnienia = ["Kandefer", "Rygiel", "Boczar"]

try:
    with psycopg2.connect(user=un, password=pwd, database=db, port=port, host=hostaddress) as conn:
        with conn.cursor() as cursor:
            cursor.execute("CREATE TEMPORARY SEQUENCE IF NOT EXISTS sekwencja_pracownicy START 2000 INCREMENT 10")
            
            for id_prac in zwolnienia:
                cursor.execute("DELETE FROM pracownicy WHERE id_prac = %s", (id_prac,))
            
            for nazwisko in zatrudnienia:
                cursor.execute("INSERT INTO pracownicy(id_prac, nazwisko) VALUES (nextval('sekwencja_pracownicy'), %s)", (nazwisko,))
            conn.commit()
except psycopg2.OperationalError as ex:
    print('błąd połączenia z bazą danych: ', ex)

# Sekcja 5: Kontrola transakcji
try:
    conn = psycopg2.connect(user=un, password=pwd, database=db, port=port, host=hostaddress)
    conn.autocommit = False
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM etaty")
    print("Etaty początkowe:", cursor.fetchall())

    cursor.execute("INSERT INTO etaty (nazwa) VALUES ('STAŻYSTA')")
    cursor.execute("SELECT * FROM etaty")
    print("Po wstawieniu:", cursor.fetchall())

    conn.rollback()
    cursor.execute("SELECT * FROM etaty")
    print("Po rollbacku:", cursor.fetchall())

    cursor.execute("INSERT INTO etaty (nazwa) VALUES ('STAŻYSTA')")
    conn.commit()
    
    cursor.execute("SELECT * FROM etaty")
    print("Po commicie:", cursor.fetchall())

    cursor.close()
    conn.close()
except psycopg2.OperationalError as ex:
    print('błąd połączenia z bazą danych: ', ex)

# Sekcja 6: Wstawianie zbiorcze zip()
nazwiska = ["Woźniak", "Dąbrowski", "Kozłowski"]
place = [1300, 1700, 1500]
etaty = ["ASYSTENT", "PROFESOR", "ADIUNKT"]

try:
    with psycopg2.connect(user=un, password=pwd, database=db, port=port, host=hostaddress) as conn:
        with conn.cursor() as cursor:
            cursor.execute("CREATE TEMPORARY SEQUENCE IF NOT EXISTS sekwencja_pracownicy START 5000 INCREMENT 10")
            query = "INSERT INTO pracownicy(id_prac, nazwisko, placa_pod, etat) VALUES (nextval('sekwencja_pracownicy'), %s, %s, %s)"
            for n, p, e in zip(nazwiska, place, etaty):
                cursor.execute(query, (n, p, e))
            conn.commit()
except psycopg2.OperationalError as ex:
    print('błąd połączenia z bazą danych: ', ex)

# Sekcja 7: Wydajność - execute_batch
try:
    with psycopg2.connect(user=un, password=pwd, database=db, port=port, host=hostaddress) as conn:
        with conn.cursor() as cursor:
            cursor.execute("CREATE TEMPORARY SEQUENCE IF NOT EXISTS seq_test START 10000")
            dane_seq = [(f'Seq_{x}',) for x in range(2000)]
            dane_batch = [(f'Batch_{x}',) for x in range(2000)]
            query = "INSERT INTO pracownicy (id_prac, nazwisko) VALUES (nextval('seq_test'), %s)"

            start_seq = time.time_ns()
            for row in dane_seq:
                cursor.execute(query, row)
            end_seq = time.time_ns()
            print(f"Czas sekwencyjnie: {end_seq - start_seq} ns")

            start_batch = time.time_ns()
            psycopg2.extras.execute_batch(cursor, query, dane_batch)
            end_batch = time.time_ns()
            print(f"Czas wsadowo: {end_batch - start_batch} ns")
            conn.rollback() 
except psycopg2.OperationalError as ex:
    print('błąd połączenia z bazą danych: ', ex)

# Sekcja 8: Procedury i funkcje PL/pgSQL
sql_function = """
CREATE OR REPLACE FUNCTION zmien_wielkosc_liter (p_id_prac int)
RETURNS INT AS $$
BEGIN
    UPDATE pracownicy SET nazwisko = UPPER(nazwisko) WHERE id_prac = p_id_prac;
    IF FOUND THEN RETURN 1; ELSE RETURN 0; END IF;
END;
$$ LANGUAGE plpgsql;
"""

try:
    with psycopg2.connect(user=un, password=pwd, database=db, port=port, host=hostaddress) as conn:
        with conn.cursor() as cursor:
            cursor.execute(sql_function)
            cursor.execute("SELECT id_prac FROM pracownicy")
            ids = [row[0] for row in cursor.fetchall()]
            
            for i in ids:
                cursor.callproc('zmien_wielkosc_liter', [i])
            
            cursor.execute("SELECT nazwisko FROM pracownicy LIMIT 5")
            print(cursor.fetchall())
            conn.commit()
except psycopg2.OperationalError as ex:
    print('błąd połączenia z bazą danych: ', ex)
