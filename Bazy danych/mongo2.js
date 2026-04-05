// zad 1
db.students.updateOne(
  {
    nazwisko: "Kowalski",
    oceny: { $elemMatch: { przedmiot: "Matematyka Dyskretna" } }
  },
  {
    $set: {
      "oceny.$.sylabus.tekstSylabusa": "Wstęp do logiki i teorii grafów",
      "oceny.$.sylabus.warunkiZaliczenia": "Egzamin + Projekt",
      "oceny.$.sylabus.ostatniaModyfikacja": new Date("2025-12-15")
    }
  }
);

// zad 2
db.students.updateOne(
  {
    nazwisko: "Poznańska",
    projekty: { $elemMatch: { temat: "Makieta osiedla" } },
    zaliczenia: "Rysunek"
  },
  {
    $set: {
      "projekty.$.ocena": 5,
      "zaliczenia.$": "Rysunek Techniczny"
    }
  }
);

// zad 3
db.lecturers.aggregate([
  {
    $project: {
      nazwisko: 1,
      tytul: 1,
      rok_zatrudnienia: { $year: "$dataZatrudnienia" },
      pensja_roczna: 1
    }
  },
  { $sort: { pensja_roczna: -1 } },
  { $skip: 2 },
  { $limit: 1 }
]);

// zad 4
db.students.aggregate([
  {
    $group: {
      _id: "$kierunek",
      liczba_studentow: { $sum: 1 }
    }
  },
  {
    $match: {
      liczba_studentow: { $gte: 4 }
    }
  }
]);

// zad 5
db.courses.aggregate([
  {
    $lookup: {
      from: "lecturers",
      localField: "wykladowca_id",
      foreignField: "_id",
      as: "prowadzacy"
    }
  },
  {
    $project: {
      nazwa: 1,
      tytul: { $first: "$prowadzacy.tytul" },
      nazwisko: { $first: "$prowadzacy.nazwisko" },
      _id: 0
    }
  }
]);

// zad 6
db.courses.aggregate([
  {
    $lookup: {
      from: "lecturers",
      localField: "wykladowca_id",
      foreignField: "_id",
      as: "prowadzacy"
    }
  },
  {
    $match: {
      "prowadzacy.pokoj": { $regex: "^1" }
    }
  },
  {
    $project: {
      nazwa: 1,
      pokoj: { $first: "$prowadzacy.pokoj" },
      nazwisko: { $first: "$prowadzacy.nazwisko" },
      _id: 0
    }
  }
]);

// zad 7
db.courses.aggregate([
  {
    $lookup: {
      from: "lecturers",
      localField: "wykladowca_id",
      foreignField: "_id",
      as: "prowadzacy"
    }
  },
  {
    $group: {
      _id: { $first: "$prowadzacy.nazwisko" },
      liczba: { $sum: 1 }
    }
  },
  {
    $project: {
      nazwisko: "$_id",
      liczba: 1,
      _id: 0
    }
  },
  { $sort: { liczba: -1 } }
]);

// zad 8
db.students.find(
  {
    dodatkowePunkty: { $not: { $eq: 30 } }
  },
  {
    nazwisko: 1,
    dodatkowePunkty: 1,
    _id: 0
  }
);

// zad 9
db.students.find(
  {
    zainteresowania: {
      $in: ["programowanie", "psychologia"],
      $nin: ["szachy"]
    }
  },
  {
    nazwisko: 1,
    zainteresowania: 1,
    _id: 0
  }
);

// zad 10
db.students.find(
  {
    oceny: {
      $elemMatch: {
        wartosc: { $nin: [2, 5] }
      }
    }
  },
  {
    imie: 1,
    nazwisko: 1,
    "oceny.wartosc": 1,
    _id: 0
  }
);

// zad 11
db.students.aggregate([
  { $unwind: "$oceny" },
  {
    $group: {
      _id: "$nazwisko",
      sredniaOcen: { $avg: "$oceny.wartosc" }
    }
  },
  {
    $project: {
      nazwisko: "$_id",
      sredniaOcen: 1,
      _id: 0
    }
  }
]);

// zad 12
db.students.aggregate([
  { $unwind: "$zainteresowania" },
  {
    $group: {
      _id: "$zainteresowania",
      liczba: { $sum: 1 }
    }
  },
  {
    $project: {
      zainteresowanie: "$_id",
      liczba: 1,
      _id: 0
    }
  }
]);

// zad 13
var prowadzacy = db.lecturers.findOne({ imie: "Alan", nazwisko: "Turing" });
var przedmiot = db.courses.findOne({ nazwa: "Algorytmy", wykladowca_id: prowadzacy ? prowadzacy._id : null });
var student = db.students.findOne({ nazwisko: "Dąbrowski", imie: "Marek" });

if (prowadzacy && przedmiot && student) {
  db.students.updateOne(
    { _id: student._id },
    {
      $push: {
        oceny: {
          przedmiot_id: przedmiot._id,
          wartosc: 5,
          wystawil_id: prowadzacy._id,
          data: new Date()
        }
      }
    }
  );
}

// zad 14
db.students.updateMany(
  {},
  {
    $pull: {
      oceny: {
        wartosc: { $gt: 4 }
      }
    }
  }
);
