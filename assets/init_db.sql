CREATE TABLE workers (
       id INT PRIMARY KEY,
       name VARCHAR(254)
);

INSERT INTO workers (
       id,
       name
) VALUES (
  0,
  "Melanie Gunbergh"
), (
   1,
   "Ferran el Diamant"
), (
   2,
   "Alberto Chicote"
), (
   3,
   "Miriam Hatibi"
), (
   4,
   "Slash"
), (
   5,
   "Walt Diseny"
), (
   6,
   "Albert Einstein"
), (
   7,
   "Toni Cruanyes"
), (
   8,
   "El barbas a.k.a. M punto R punto"
), (
   9,
   "Albert Aguado"
), (
   10,
   "Maria Montoro"
), (
   11,
   "Kilian Jornet"
);

CREATE TABLE labordays (
       day INT,
       worker INT,
       works BOOLEAN,
       FOREIGN KEY(day) REFERENCES days(id),
       FOREIGN KEY(worker) REFERENCES workers(id)
);

INSERT INTO labordays (
       day,
       worker,
       works
) VALUES (0, 1, 1),
  (0, 2, 1),
  (0, 3, 1),
  (0, 4, 1),
  (0, 5, 0),
  (0, 6, 0),
  (0, 7, 1),
  (0, 8, 1),
  (0, 9, 0),
  (0, 10, 0),
  (0, 11, 1),
  (0, 12, 1),
  (1, 1, 1),
  (1, 2, 0),
  (1, 3, 1),
  (1, 4, 1),
  (1, 5, 1),
  (1, 6, 1),
  (1, 7, 1),
  (1, 8, 1),
  (1, 9, 0),
  (1, 10, 1),
  (1, 11, 1),
  (1, 12, 0),
  (2, 1, 1),
  (2, 2, 1),
  (2, 3, 0),
  (2, 4, 0),
  (2, 5, 1),
  (2, 6, 1),
  (2, 7, 1),
  (2, 8, 1),
  (2, 9, 1),
  (2, 10, 1),
  (2, 11, 1),
  (2, 12, 0),
  (3, 1, 1),
  (3, 2, 0),
  (3, 3, 1),
  (3, 4, 1),
  (3, 5, 1),
  (3, 6, 1),
  (3, 7, 0),
  (3, 8, 0),
  (3, 9, 1),
  (3, 10, 0),
  (3, 11, 0),
  (3, 12, 1),
  (4, 1, 1),
  (4, 2, 1),
  (4, 3, 0),
  (4, 4, 1),
  (4, 5, 1),
  (4, 6, 1),
  (4, 7, 1),
  (4, 8, 1),
  (4, 9, 1),
  (4, 10, 1),
  (4, 11, 1),
  (4, 12, 0),
  (5, 1, 1),
  (5, 2, 1),
  (5, 3, 1),
  (5, 4, 1),
  (5, 5, 0),
  (5, 6, 1),
  (5, 7, 1),
  (5, 8, 1),
  (5, 9, 1),
  (5, 10, 0),
  (5, 11, 1),
  (5, 12, 1),
  (6, 1, 1),
  (6, 2, 1),
  (6, 3, 1),
  (6, 4, 1),
  (6, 5, 1),
  (6, 6, 1),
  (6, 7, 1),
  (6, 8, 1),
  (6, 9, 0),
  (6, 10, 0),
  (6, 11, 1),
  (6, 12, 1);

CREATE TABLE days (
       id INT PRIMARY KEY,
       name VARCHAR(50)
);


INSERT INTO days (
       id,
       name
) VALUES (
  0,
  "Monday"
), (
   1,
   "Tuesday"
), (
   2,
   "Wednesday"
), (
   3,
   "Thursday"
), (
   4,
   "Friday"
), (
   5,
   "Saturday"
), (
   6,
   "Sunday"
);
