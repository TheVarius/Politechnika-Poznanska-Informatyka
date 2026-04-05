// zad 1
db.students.find({ nazwisko: "Kowalski" }).explain("executionStats");

db.students.find({ nazwisko: "Wiśniewska" }).explain("executionStats");

db.students
  .find({ nazwisko: "Kowalski" })
  .sort({ imie: 1 })
  .explain("executionStats");

db.students
  .find({ nazwisko: "Kowalski" })
  .sort({ imie: -1 })
  .explain("executionStats");

// PlanCacheKey się zmienił ze względu na to, żę dodanie sortowania wraz z jego kierunku zmienia kształt zapytania.


// zad 2
db.students.createIndex({ nazwisko: 1 });
// Nie wyskakuje żaden błąd ale nie tworzymy nowego indeksu, wciąż wypisujemy nazwisko_1.


// zad 3
db.students.find({ nazwisko: "Nowak" }).explain("executionStats");

// Zamiast COLSCAN pojawia się IXSCAN


// zad 4
db.students.createIndex({ imie: 1 });

db.students
  .find({ nazwisko: "Nowak" })
  .sort({ imie: 1 })
  .explain("executionStats");
// Wygrał plan co korzystał z indeksu nazwisko_1


// zad 5
db.students.dropIndexes();

db.students.createIndex({ nazwisko: 1 });
db.students.createIndex({ nazwisko: 1, imie: -1 });

db.students
  .find({ nazwisko: "Nowak" })
  .sort({ imie: 1 })
  .explain("executionStats");

// Optymalizator wybrał plan wykorzystujący indeks złożony, ze względu na to, że pozwalał on na jednoczesne zrealizowanie selekcję i sortowania bez wykonywania dodatkowego etapu Sort.


// zad 6
db.students.dropIndexes();

db.students.createIndex({ nazwisko: 1, kierunek: 1 });

db.students
  .find({ nazwisko: "Kowalski", kierunek: "Informatyka" })
  .explain("executionStats");


// zad 7
db.students.createIndex({
  kierunek: 1,
  nrIndeksu: 1,
  dataPrzyjecia: 1
});

db.students
  .find({
    kierunek: "Informatyka",
    nrIndeksu: { $gte: 2000, $lte: 5000 }
  })
  .sort({ dataPrzyjecia: 1 })
  .explain("executionStats");

// executionTimeMillisEstimate: 58ms
// Z indeksem: executionTimeMillisEstimate: 1ms


// zad 8
db.students.createIndex({ punktyRekrutacyjne: 1 });

db.students.find({ _id: 100 }).explain("executionStats");

db.students
  .find({ punktyRekrutacyjne: 160 })
  .explain("executionStats");


// zad 9
// db.students.createIndex({ nazwisko: 1 }, { unique: true })
// Powyższa linia może wygenerować: E11000 duplicate key error collection jeśli w bazie są duplikaty


// zad 10
db.students.aggregate([
  { $match: { "oceny.wartosc": 5 } },
  { $unwind: "$oceny" },
  { $match: { "oceny.wartosc": 5 } },
  {
    $lookup: {
      from: "courses",
      localField: "oceny.przedmiot_id",
      foreignField: "_id",
      as: "course"
    }
  },
  { $unwind: "$course" },
  { $match: { "course.nazwa": "Finanse Publiczne (2)" } },
  {
    $project: {
      _id: 0,
      imie: 1,
      nazwisko: 1,
      ocena: "$oceny.wartosc",
      nazwaPrzedmiotu: "$course.nazwa"
    }
  }
]);
