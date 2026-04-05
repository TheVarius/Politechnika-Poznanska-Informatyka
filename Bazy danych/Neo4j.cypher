// Zad1
MERGE (k:Kolo {nazwa: 'AIClub'});

MATCH (s:Student) WHERE s.kierunek = 'Informatyka'
WITH k, s
MERGE (s)-[:NALEZY_DO]->(k);

MATCH (s1:Student)-[:NALEZY_DO]->(k:Kolo {nazwa: 'AIClub'}),
      (s2:Student)-[:NALEZY_DO]->(k)
WHERE (s1)-[:ZNA]->(s2)
MERGE (s1)-[:WSPOLPRACUJE_Z]->(s2);

// Zad2
MATCH (s:Student {kierunek: 'Informatyka'})
SET s.rok = 1;

// Zad3
MATCH (s1:Student), (s2:Student)
WHERE s1.kierunek = s2.kierunek 
  AND s1 <> s2 
  AND NOT (s1)-[:ZNA]-(s2)
MERGE (s1)-[:POTENCJALNIE_ZNA]->(s2);

// Zad4
MATCH (s:Student)
WHERE NOT (s)--() 
DELETE s;

MATCH (s:Student {kierunek: 'Bioinformatyka'})
DETACH DELETE s;

// Zad5
MATCH (s:Student)
RETURN s.kierunek, collect(s.imie) AS lista_studentow
ORDER BY s.kierunek;


// CZĘŚĆ 3
// Zad1
MATCH (a:Person)-[:ACTED_IN]->(m:Movie)<-[:ACTED_IN]-(co_actor:Person)
RETURN a.name AS Aktor, count(DISTINCT co_actor) AS Liczba_wspolpracownikow
ORDER BY Liczba_wspolpracownikow DESC
LIMIT 5;

// Zad2
MATCH (a:Person)-[:ACTED_IN]->(m:Movie)<-[:DIRECTED]-(d:Person)
RETURN a.name AS Aktor, d.name AS Rezyser, count(m) AS Wspolne_filmy
ORDER BY Wspolne_filmy DESC
LIMIT 5;

// Zad3
MATCH (a:Person)-[:ACTED_IN]->(m:Movie)-[:HAS_GENRE]->(g:Genre)
RETURN a.name AS Aktor, count(DISTINCT g) AS Liczba_gatunkow
ORDER BY Liczba_gatunkow DESC
LIMIT 5;

// Zad4
MATCH (target:Movie {title: "Apollo 13"})-[:HAS_GENRE]->(g:Genre)<-[:HAS_GENRE]-(rec:Movie)
MATCH (rec)<-[:ACTED_IN]-(a:Person {name: "Tom Hanks"})
WHERE rec <> target
RETURN rec.title AS Rekomendowany_Film, collect(g.name) AS Wspolne_gatunki, count(g) AS Zgodnosc
ORDER BY Zgodnosc DESC;

// Zad5
MATCH (m1:Movie {title: "The Matrix"}), (m2:Movie {title: "The Matrix Revolutions"})
MATCH p = shortestPath((m1)-[*]-(m2))
RETURN p;


// CZĘŚĆ 4
// Zad1
CALL gds.graph.project(
  'grafGatunki',
  ['Movie', 'Genre'],
  {
    HAS_GENRE: {orientation: 'UNDIRECTED'}
  }
);

// Zad2
CALL gds.pageRank.stream('grafGatunki', {
  maxIterations: 20,
  dampingFactor: 0.85
})
YIELD nodeId, score
RETURN gds.util.asNode(nodeId).title AS Film_lub_Gatunek, 
       labels(gds.util.asNode(nodeId)) AS Typ, 
       score
ORDER BY score DESC
LIMIT 20;

// Zad3 
// A)
CALL gds.pageRank.stream('grafGatunki')
YIELD nodeId, score
WITH gds.util.asNode(nodeId) AS n, score
WHERE 'Movie' IN labels(n)
RETURN n.title AS Film, score
ORDER BY score DESC
LIMIT 5;

// B) 
CALL gds.pageRank.stream('grafGatunki')
YIELD nodeId, score
WITH gds.util.asNode(nodeId) AS n, score
WHERE 'Genre' IN labels(n)
RETURN n.name AS Gatunek, score
ORDER BY score DESC
LIMIT 5;

// C)
// Gatunki mają najwyższy wynik, bo łączy się z nimi mnóstwo filmów. 
// Filmy zyskują punkty głównie dzięki temu, że należą do tych popularnych kategorii.
