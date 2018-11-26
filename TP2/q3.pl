
% la variable A correspond au nom du tableau. Ce dernier renvoie tous les cours que lon doit prendre
% La variable R represente le cours que lon veut prendre
% la variable X represente un cours dans tous les elements du tableau
coursAPrendreComplet(R, A):-
% set du tableau A
 setof(X, requis(R, X, []), A).

 % On cherche le cours que lon a de besoin et retourne ce cours qui est alors la variable Y selon la variable X qui est le cours actuel
requis(X,Y,A):-
coursDemande(X,Y).

% On cherche un cours Z qui est prealable ou corequis a X
requis(X,Y,A):-
coursDemande(X,Z),
% on sassure que Z ne fait pas parti de du tableau A pour eviter les doublons. Alors on peut donc utiliser la recursion pour trouver un cours pour cette variable Y
not(member(Z,A)),
requis(Z,Y,[Z|A]),
X\=Y.

coursDemande(X,Y):-
corequisDoubleSens(X,Y);
prerequis(X,Y).

corequisDoubleSens(X,Y):-
corequis(X,Y);
% effet mirroir au lieu de reecrire la meme chose dans la base de connaissance
corequis(Y,X).


% section base de connaissance


prerequis(inf1010,inf1005c).

prerequis(log1000,inf1005c).

prerequis(inf1600,inf1005c).
prerequis(inf1600,inf1500).

prerequis(inf2010,inf1010).

prerequis(log2410,inf1010).
prerequis(log2410,log1000).

prerequis(inf2705,inf2010).
prerequis(inf2705,mth1007).

corequis(inf2705,log2990).

corequis(inf1900,inf1600).
corequis(inf1900,log1000).
corequis(inf1900,inf2205).

corequis(inf2010,log2810).


cours(inf1010).
cours(inf2010).
cours(inf2705).
cours(inf1600).
cours(inf1900).
cours(inf2205).
cours(log1000).
cours(log2810).
cours(log2990).
cours(inf1005C).
cours(inf1500).
cours(log2410).
cours(mth1007).
