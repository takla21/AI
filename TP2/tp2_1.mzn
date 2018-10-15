include "globals.mzn";

int: N; % Taille du problème
int: nationalite; % {anglais, espagnol, ukrainien, norvegien, japonais}
int: couleur; % {rouge, vert, blanche, jaune, bleue}
int: animaux; % {chien, escargot, renard, cheval, zebre}
int: profession; % {sculpteur, diplomate, medecin, violoniste, acrobate}
int: boisson; % {cafe, the, lait, orange, eau}

set of int: maisons = 1..N;

array[maisons, 1..5] of var 1..N: relations;

predicate differentObjet(int :o) = all_different(m in 1..N)(relations[m,o]);
predicate voisin(var int:m, int:o1, int: o2, int: v1, int: v2) =
if m = 1 then
     (relations[m, o1] = v1 <-> relations[m + 1, o2] = v2)
else 
  if m = 5 then
     (relations[m, o1] = v1 <-> relations[m - 1, o2] = v2)
  else
     (relations[m, o1] = v1 <-> relations[m + 1, o2] = v2 xor relations[m - 1, o2] = v2)
  endif
endif;

constraint forall(o in 1..N) (differentObjet(o));

constraint forall(m in maisons) (
  relations[m, couleur] == 1 <-> relations[m, nationalite] == 1 %hint 1
);

constraint forall(m in maisons) (
  relations[m, animaux] == 1 <-> relations[m, nationalite] == 2 %hint 2
);

constraint forall(m in maisons) (
  relations[m, couleur] == 2 <-> relations[m, boisson] == 1 %hint 3
);

constraint forall(m in maisons) (
  relations[m, nationalite] == 3 <-> relations[m, boisson] == 2 %hint 4
);

constraint forall(m in maisons) (
  relations[m, couleur] == 2 <-> relations[m + 1, couleur] == 3 %hint 5
);

constraint forall(m in maisons) (
  relations[m, profession] == 1 <-> relations[m, animaux] == 2 %hint 6
);

constraint forall(m in maisons) (
  relations[m, profession] == 2 <-> relations[m, couleur] == 4 %hint 7
);

constraint relations[((N - 1) div 2) + 1,boisson] == 3; %hint 8

constraint relations[1,nationalite] == 4; %hint 9

constraint forall(m in maisons) (
  relations[m, profession] == 3 <-> relations[m + 1, animaux] == 3 xor relations[m - 1, animaux] == 3 %hint 10
);

constraint forall(m in maisons) (
  relations[m, profession] == 2 <-> relations[m + 1, animaux] == 4 xor relations[m - 1, animaux] == 4 %hint 11
);

constraint forall(m in maisons) (
  relations[m, profession] == 4 <-> relations[m, boisson] == 4 %hint 12
);

constraint forall(m in maisons) (
  relations[m, profession] == 5 <-> relations[m, nationalite] == 5 %hint 13
);

constraint forall(m in maisons) (
  relations[m, profession] == 4 <-> relations[m + 1, couleur] == 5 xor relations[m - 1, couleur] == 5 %hint 14
);

solve satisfy;

output[ show(relations[i,j]) ++ (if j == N then "\n" else " " endif) | i in 1..N, j in 1..N];