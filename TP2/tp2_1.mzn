include "globals.mzn";

enum Nationalite = { Anglais, Espagnol, Ukrainien, Norvegien, Japonais };
enum Couleur = { Rouge, Vert, Blanc, Jaune, Bleu };
enum Animal = { Chien, Escargot, Renard, Cheval, Zebre };
enum Profession = { Sculpteur, Diplomate, Medecin, Violoniste, Acrobate };
enum Boisson = { Cafe, The, Lait, Orange, Eau };

int : N = 5;
set of int: maisons = 1..N;

array[maisons] of var Nationalite: nationalites;
array[maisons] of var Couleur: couleurs;
array[maisons] of var Animal: animaux;
array[maisons] of var Profession: professions;
array[maisons] of var Boisson: boissons;

constraint all_different(m in maisons)(nationalites[m]);
constraint all_different(m in maisons)(couleurs[m]);
constraint all_different(m in maisons)(animaux[m]);
constraint all_different(m in maisons)(professions[m]);
constraint all_different(m in maisons)(boissons[m]);

%hint 1
constraint forall(m in maisons) (
  nationalites[m] == Anglais <-> couleurs[m] == Rouge
);

%hint 2
constraint forall(m in maisons) (
  nationalites[m] == Espagnol <-> animaux[m] == Chien
);

%hint 3
constraint forall(m in maisons) (
  couleurs[m] == Vert <-> boissons[m] == Cafe
);

%hint 4
constraint forall(m in maisons) (
  nationalites[m] == Ukrainien <-> boissons[m] == The
);

%hint 5 --
constraint forall(m in maisons) (
  couleurs[m + 1] == Vert <-> couleurs[m] == Blanc
);

%hint 6
constraint forall(m in maisons) (
  professions[m] == Sculpteur <-> animaux[m] == Escargot
);

%hint 7 --
constraint forall(m in maisons) (
  professions[m] == Diplomate <-> couleurs[m] == Jaune
);

%hint 8
constraint boissons[3] == Lait;

%hint 9
constraint nationalites[1] == Norvegien;

%hint 10
constraint forall(m in maisons) (
  animaux[m] == Renard <-> professions[m + 1] == Medecin xor professions[m - 1] == Medecin
);

%hint 11 --
constraint forall(m in maisons) (
  professions[m] == Diplomate <-> animaux[m + 1] == Cheval xor animaux[m - 1] == Cheval
);

%hint 12
constraint forall(m in maisons) (
  professions[m] == Violoniste <-> boissons[m] == Orange
);

%hint 13
constraint forall(m in maisons) (
  nationalites[m] == Japonais <-> professions[m] == Acrobate
);

%hint 14
constraint forall(m in maisons) (
  nationalites[m] == Norvegien <-> couleurs[m + 1] == Bleu xor couleurs[m - 1] == Bleu
);

solve satisfy;

%output[ "Qui boit de l'eau? " ++ show(nationalites[m]) ++ "\n" | m in 1..N where fix(boissons[m]) == Eau];
%output[ "Qui a un zebre? " ++ show(nationalites[m]) ++ "\n" | m in 1..N where fix(animaux[m]) == Zebre];