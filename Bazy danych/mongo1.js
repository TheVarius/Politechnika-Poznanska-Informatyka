// MongoServerError: E11000 duplicate key error collection: university.students index: _id_ dup key: { _id: 123 }

// ZAD 1
// Czy wielkości liter są rozróżniane przez dokumenty MongoDB? (Tak/Nie) -> Tak
// Czy użycie cudzysłowu dla nazwy klucza ma znaczenie dla rozróżniania wielkości liter? (Tak/Nie) -> Tak
// Czy można wstawić dokument z wielokrotnie zdefiniowanym tym samym kluczem? (Tak/Nie) -> Nie
// Jeżeli tak, to która wartość zostanie zapisana w bazie danych? (Pierwsza/Ostatnia/Klucz zostanie pominięty) -> Ostatnia (w powłoce JS)

// ZAD2
db.students.insertMany([
  {
    imie: "Robert", nazwisko: "Jankowiak", kierunek: "Fizyka", rok: 1,
    punktyRekrutacyjne: 160, progPunktowy: 160, dataWpisu: new Date("2023-07-01"),
    zainteresowania: ["astronomia", "fizyka", "sport"]
  },
  {
    imie: "Zofia", nazwisko: "Kaczmarek", kierunek: "Informatyka", rok: 2,
    punktyRekrutacyjne: 142, progPunktowy: 140, dataWpisu: new Date("2022-12-31")
  },
  {
    imie: "Grzegorz", nazwisko: "Tyczka", kierunek: "Matematyka", rok: 3,
    punktyRekrutacyjne: 190, progPunktowy: 120, dataWpisu: new Date("2021-05-05"),
    zainteresowania: ["logika", "szachy", "kryptografia", "bieganie"]
  }
]);

// ZAD3
db.students.find({kierunek: "Ekonomia"}, {nazwisko:1, _id:0}); // - daje samo nazwisko
db.students.find({kierunek: "Ekonomia"}, {nazwisko:0, _id:0}); // - daje wszystko oprocz id i nazwiska
// Pojawia sie błąd:
// MongoServerError[Location31254]: Cannot do exclusion on field imie in inclusion projection

// ZAD4
db.students.find(
  { $or: [ {punktyRekrutacyjne: {$gte:140, $lte:160}}, {rok: 5} ] },
  { _id: 0, imie:1, nazwisko:1, rok:1, punktyRekrutacyjne:1 }
);

// ZAD5
db.students.find(
  {rok: {$in: [2, 3]}}, 
  {imie: 1, nazwisko: 1, kierunek: 1, rok: 1, punktyRekrutacyjne: 1, _id: 0}
).sort({
  kierunek: 1,         
  rok: -1,                
  punktyRekrutacyjne: -1 
});

// ZAD6
db.students.find(
  {kierunek: "Informatyka"},
  {imie: 1, nazwisko: 1, punktyRekrutacyjne: 1, _id: 0}
).sort({
  punktyRekrutacyjne: -1
}).skip(2).limit(1);

// ZAD7
db.students.find(
  {rok: {$in:[2,3]}, nazwisko: {$regex:"i$"}, kierunek: {$ne:"Informatyka"}},
  {_id:0, imie:1, nazwisko:1}
);

// ZAD8
db.students.find(
  {
    rok: 2,
    zainteresowania: { $nin: ["programowanie", "szachy"] }
  },
  { _id: 0, nazwisko: 1, imie: 1, zainteresowania: 1 }
);

// Zad9
db.students.updateMany(
  {},
  {
    $pull: {
      zainteresowania: { $regex: "^fi" }
    }
  }
);
// tertaz to (to jest mongo jak cos wiec w sumie nie wiem jakie to rozszerzenie)
