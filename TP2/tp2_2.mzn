include "globals.mzn";

int: nbTeams;
int: tour = nbTeams - 1;

set of int: equipes = 1..nbTeams;
set of int: tours = 1..tour;

array[equipes, equipes] of int: pv;

array[equipes, 1..tour] of var 1..nbTeams: calendrier;

predicate differentEquipe(int :e) = all_different(a in tours)(calendrier[e,a]);

constraint forall(e in equipes) (differentEquipe(e)); %Contrainte qui empeche de joueur contre la meme equipe

constraint forall(e in equipes, a in tours) ( %Contrainte qui empeche de jouer contre lui-meme
  not (calendrier[e, a] == e)
);

constraint forall(e1 in equipes, e2 in equipes, a in tours) (  %Contrainte qui assure que 2 equipes s'affrontent au meme tour
   calendrier[e1, a] == e2 <-> calendrier[e2, a] == e1
);

constraint forall(e in equipes, a in 4..tour) ( %Contrainte pour eviter 4 match consecutifs a domiciles
   ((pv[e, calendrier[e, a - 1]]  + pv[e, calendrier[e, a - 2]] + pv[e, calendrier[e, a - 3]]) >= 3 ) -> pv[e, calendrier[e, a]] == 0
);

solve satisfy;

output[ show(calendrier[i,j]) ++ (if j == tour then "\n" else " " endif) | i in 1..nbTeams, j in 1..tour];