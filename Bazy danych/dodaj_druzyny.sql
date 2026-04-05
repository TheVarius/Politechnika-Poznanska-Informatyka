DECLARE
v_l_id NUMBER;
v_s_id NUMBER;
v_c_id NUMBER;
PROCEDURE add_team(p_name VARCHAR2, p_city VARCHAR2, p_founded NUMBER,
p_stadium VARCHAR2, p_capacity NUMBER, p_address VARCHAR2, p_built NUMBER) IS
BEGIN
BEGIN
SELECT stadium_id INTO v_s_id FROM Stadium WHERE name = p_stadium;
EXCEPTION WHEN NO_DATA_FOUND THEN
INSERT INTO Stadium (name, city, capacity, address, built_year)
VALUES (p_stadium, p_city, p_capacity, p_address, p_built)
RETURNING stadium_id INTO v_s_id;
END;
BEGIN
SELECT club_id INTO v_c_id FROM Team WHERE name = p_name;
UPDATE Team SET stadium_id = v_s_id WHERE club_id = v_c_id;
EXCEPTION WHEN NO_DATA_FOUND THEN
INSERT INTO Team (name, country, city, founded_year, is_managed, stadium_id)
VALUES (p_name, 'Polska', p_city, p_founded, 0, v_s_id);
END;
END;
BEGIN
BEGIN
SELECT league_id INTO v_l_id FROM League WHERE name='PKO BP Ekstraklasa' AND season='2024/2025';
EXCEPTION WHEN NO_DATA_FOUND THEN
INSERT INTO League (name, season, country) VALUES ('PKO BP Ekstraklasa', '2024/2025', 'Polska') RETURNING league_id INTO v_l_id;
END;
add_team('Jagiellonia Białystok', 'Białystok', 1920, 'Stadion Miejski w Białymstoku', 22372, 'Słoneczna 1', 2014);
add_team('Śląsk Wrocław', 'Wrocław', 1947, 'Tarczyński Arena', 45105, 'Aleja Śląska 1', 2011);
add_team('Legia Warszawa', 'Warszawa', 1916, 'Stadion Wojska Polskiego', 31800, 'Łazienkowska 3', 1930);
add_team('Pogoń Szczecin', 'Szczecin', 1948, 'Stadion Miejski im. Floriana Krygiera', 21163, 'Karłowicza 28', 2022);
add_team('Lech Poznań', 'Poznań', 1922, 'Enea Stadion', 42837, 'Bułgarska 17', 1980);
add_team('Górnik Zabrze', 'Zabrze', 1948, 'Stadion im. Ernesta Pohla', 24563, 'Roosevelta 81', 1934);
add_team('Raków Częstochowa', 'Częstochowa', 1921, 'Miejski Stadion Piłkarski Raków', 5500, 'Limanowskiego 83', 1955);
add_team('Zagłębie Lubin', 'Lubin', 1946, 'Stadion Zagłębia Lubin', 16068, 'Skłodowskiej-Curie 98', 2009);
add_team('Widzew Łódź', 'Łódź', 1910, 'Stadion Widzewa', 18018, 'Piłsudskiego 138', 2017);
add_team('Piast Gliwice', 'Gliwice', 1945, 'Stadion Miejski w Gliwicach', 9913, 'Okrzei 20', 2011);
add_team('Stal Mielec', 'Mielec', 1939, 'Stadion Miejski w Mielcu', 6864, 'Solskiego 1', 2013);
add_team('Puszcza Niepołomice', 'Niepołomice', 1923, 'Stadion Miejski w Niepołomicach', 2118, 'Kusocińskiego 2', 1954);
add_team('Cracovia', 'Kraków', 1906, 'Stadion Cracovii', 15016, 'Kałuży 1', 2010);
add_team('Korona Kielce', 'Kielce', 1973, 'Suzuki Arena', 15500, 'Ściegiennego 8', 2006);
add_team('Radomiak Radom', 'Radom', 1910, 'Stadion im. Braci Czachorów', 8800, 'Struga 63', 2023);
add_team('Lechia Gdańsk', 'Gdańsk', 1945, 'Polsat Plus Arena', 41620, 'Pokoleń Lechii Gdańsk 1', 2011);
add_team('GKS Katowice', 'Katowice', 1964, 'Stadion GKS Katowice', 6710, 'Bukowa 1', 1955);
add_team('Motor Lublin', 'Lublin', 1950, 'Arena Lublin', 15400, 'Stadionowa 1', 2014);
COMMIT;
END;
/
