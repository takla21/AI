% questions pour personnages

ask(artiste, X) :-
	format('est un artiste?', [X]),
	read(Reponse),
	Reponse = 'oui'.

ask(acteur, X) :-
	format('est un acteur?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(auteur, X) :-
	format('est un auteur?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(musicien, X) :-
	format('est un musicien?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(realisateur, X) :-
	format('est un realisateur?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(fiction, X) :-
	format('Est un personnage de fiction?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(cinema, X) :-
	format('est-que ce personnage fait du cinema?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(religieux, X) :-
	format('est-que ce personnage est religieux?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(ancien_religieux, X) :-
	format('est-que ce personnage est mort?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(apotre, X) :-
	format('est-que ce personnage avait 12 apotres?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(politique, X) :-
	format('est-que ce personnage a fait de la politique?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(gouverneEtatUSA,Y):-
	format('est-ce que ce personnage est origine de letat de ~w ? ',[Y]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(gouverneEtatURSS,Y):-
	format('est-ce que ce personnage est origine du pays de ~w ? ',[Y]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(paysGouverneUSA,X):-
	format('est-ce que ce personnage a gouverne les etats unis? ',[X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(pilote,X):-
	format('est-ce que ce personnage est un pilote de course? ',[X]),
	read(Reponse),
	Reponse = 'oui'.

ask(piloteOrigine,Y):-
	format('est-ce que ce personnage est originaire de ~w ?',[Y]),
	read(Reponse),
	Reponse = 'oui'.
	

ask(sexe, X) :-
	format('est un homme?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
	
	
	
% question pour objets
	
ask(porteSurSoi, X):-
	format('Est-ce quil arrive que lon puisse se promener longtemps avec cet objet sur soi?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(petit, X):-
	format('est-ce que cet objet est plus petit que un livre?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(trousseau, X):-
	format('est-ce que cet objet se retrouve dans un trousseau de cle?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
	
ask(electricite, X):-
	format('est-ce que cet objet utilise de lelectricite?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(nettoyer, X):-
	format('peut-on nettoyer avec cet objet?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(preparerNourritureAvec, X):-
	format('peut-on preparer de la nourriture avec cet objet?', [X]),
	read(Reponse),
	Reponse = 'oui'.

ask(mangerDedans, X):-
	format('peut-on manger de la nourriture dans cet objet?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(mangerAvec, X):-
	format('peut-on utiliser cet objet pour pouvoir manger avec?', [X]),
	read(Reponse),
	Reponse = 'oui'.

ask(grosElectromenagers, X):-
	format('est ce que lobjet est gros?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(faireDuCafe, X):-
	format('est ce que lobjet peut faire du cafe?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(fermerPorte, X):-
	format('est ce que lon doit fermer une porte pour activer cet objet?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(plancher, X):-
	format('est ce que lon peut nettoyer le plancher avec cet objet?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(lavervaisselle, X):-
	format('est ce que lon peut laver la vaisselle avec cet objet?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(cuisine, X):-
	format('est ce que cet objet fait parti de la cuisine?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(meuble, X):-
	format('est ce que cet objet est un meuble?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(dormirSurObjet, X):-
	format('est ce que on peut dormir sur cet objet?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(surBureau, X):-
	format('est ce que on retrouve souvent cet objet sur un bureau?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(plante, X):-
	format('est ce que cet objet est une plante?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	
ask(instrument, X):-
	format('est ce que cet objet est un instrument de musique?', [X]),
	read(Reponse),
	Reponse = 'oui'.
	

personne(X) :- sexe(X).

sexe(X):-
ask(sexe,X),!,homme(X),homme_personne(X).


% est une femme
sexe(X):-
!,femme(X),\+ homme_personne(X).


% section homme
homme(X):-
ask(artiste,X),!,artiste(X).

homme(X):-
ask(fiction,X),!,fiction(X).

homme(X):-
ask(religieux,X),!,religieux(X).

homme(X):-
ask(politique,X),!,politique(X).

homme(X):-
ask(pilote,X),!,pilote(X).


homme(X):-
producteurJeuxVideo(X).


% section femme
femme(X):-
ask(artiste,X),!,artiste(X).

femme(X):-
ask(fiction,X),!,fiction(X).

femme(X):-
gouverneEgypte(X).


% section artiste
artiste(X):-
ask(acteur,X),!,acteur(X).

artiste(X):-
ask(auteur,X),!,auteur(X).

artiste(X):-
ask(musicien,X),!,musicien(X).

artiste(X):-
ask(realisateur,X),!,realisateur(X).

artiste(X):-
peintre(X).


% section fiction
fiction(X):-
ask(cinema,X),!,cinema(X).

fiction(X):-
jeuxvideo(X).

% section religieux
religieux(X):-
ask(ancien_religieux,X),!,ancien_religieux(X).

ancien_religieux(X):-
ask(apotre,X),!,personnageReligieuxAncienApresJC(X).

ancien_religieux(X):-
personnageReligieuxAncienAvantJC(X).

religieux(X):-
pape(X).


% section politique
politique(X):-
ask(paysGouverneUSA,X),!,gouverneUSA(X).

politique(X):-
gouverneURSS(X).



gouverneUSA(X):-
!,etat(Y),gouvernementUSAOriginaire(X,Y),ask(gouverneEtatUSA,Y),!.

gouverneURSS(X):-
!,pays(Y),gouvernementURSSOriginaire(X,Y),ask(gouverneEtatURSS,Y),!.


% section pilote
pilote(X):-
!,pays(Y),piloteOrigine(X,Y),ask(piloteOrigine,Y),!.



%%%%%%%%%% section objet
objet(X):-
energie(X).


% savoir si utilise energie
energie(X):-
ask(electricite,X),!,electricite(X),electricite_objet(X).

energie(X):-
!,nonelectrique(X),\+ electricite_objet(X).

% electrique

electricite(X):-
ask(cuisine,X),!,cuisine(X).

electricite(X):-
ask(nettoyer,X),!,nettoyer_objet(X).

electricite(X):-
ask(porteSurSoi,X),!,portable(X).

electricite(X):-
eclairage(X).


% non electrique

nonelectrique(X):-
ask(cuisine,X),!,cuisineNonElectrique(X).

nonelectrique(X):-
ask(porteSurSoi,X),!,porteSurSoi(X).

nonelectrique(X):-
ask(nettoyer,X),!,nettoyer(X),nettoyer_objet(X).

nonelectrique(X):-
ask(meuble,X),!,meuble(X).

nonelectrique(X):-
ask(surBureau,X),!,accessoire_bureau(X).

nonelectrique(X):-
ask(plante,X),!,plante(X).

nonelectrique(X):-
instrument(X).


% section nettoyer
nettoyer(X):-
ask(plancher,X),!,epoussette(X).

nettoyer(X):-
ask(lavervaisselle,X),!,produitDetergent(X).

nettoyer(X):-
produitSoinBeaute(X).


% section meuble

meuble(X):-
ask(dormirSurObjet,X),!,dormir(X).

meuble(X):-
support(X).


% section objet a porter sur soi
porteSurSoi(X):-
ask(petit,X),!,petit(X).

petit(X):-
ask(trousseau,X),!,porte_cle(X).

petit(X):-
portemonnaie(X).


porteSurSoi(X):-
bagage(X).


% section cuisine

cuisineNonElectrique(X):-
accessoireVaisselle(X).

cuisine(X):-
electromenager(X).


% section accessoire cuisine
accessoireVaisselle(X):-
ask(preparerNourritureAvec,X),!,accessoire_cuisine(X).

accessoireVaisselle(X):-
ask(mangerDedans,X),!,plat(X).

accessoireVaisselle(X):-
ustensil(X).

% section electromenager

electromenager(X):-
ask(grosElectromenagers,X),!,grosElectromenagers(X).

electromenager(X):-
petitElectromenagers(X).

petitElectromenagers(X):-
ask(faireDuCafe,X),!,machine_a_cafe(X).

petitElectromenagers(X):-
toaster(X).

grosElectromenagers(X):-
ask(fermerPorte,X),!,cuissonInterieur(X).

grosElectromenagers(X):-
cuissonSurPlaque(X).



%%%%% Base de connaissance

% section artiste
acteur(jennifer_lawrence).
acteur(denzel_washington).
auteur(victor_hugo).
auteur(j_k_rowling).
musicien(michael_jackson).
musicien(lady_gaga).
realisateur(quentin_tarantino).
peintre(banksy).

homme_personne(denzel_washington).
homme_personne(victor_hugo).
homme_personne(michael_jackson).
homme_personne(quentin_tarantino).
homme_personne(banksy).

homme_personne(moise).
homme_personne(jesus).
homme_personne(pape_francois).

homme_personne(dwight_d_eisenhower).
homme_personne(richard_nixon).
homme_personne(mikhail_gorbachev).
homme_personne(joseph_staline).
homme_personne(ayrton_senna).
homme_personne(fernando_alonso).
homme_personne(hideo_kojima).

producteurJeuxVideo(hideo_kojima).


% section fiction

jeuxvideo(mario).
cinema(lara_croft).
cinema(james_bond).

homme_personne(mario).
homme_personne(james_bond).

% section religieux

pape(pape_francois).
personnageReligieuxAncienAvantJC(moise).
personnageReligieuxAncienApresJC(jesus).

% section politique


gouverneEgypte(cleopatre).

gouvernementUSAOriginaire(dwight_d_eisenhower,texas).
gouvernementUSAOriginaire(richard_nixon,californie).
gouvernementURSSOriginaire(joseph_staline,georgie).
gouvernementURSSOriginaire(joseph_staline,russie).

etat(texas).
etat(californie).

pays(georgie).
pays(russie).


% section pilote

piloteOrigine(ayrton_senna,bresil).
piloteOrigine(fernando_alonso,espagne).

pays(bresil).
pays(espagne).




% section objet

nettoyer_objet(aspirateur).
nettoyer_objet(balai).
nettoyer_objet(detergent_a_vaisselle).
nettoyer_objet(shampooing).

electricite_objet(aspirateur).
electricite_objet(ordinateur).
electricite_objet(telephone).
electricite_objet(four).
electricite_objet(cuisiniere).
electricite_objet(cafetiere).
electricite_objet(grille_pain).
electricite_objet(lampe).

support(table).
dormir(lit).
accessoire_cuisine(casserole).
ustensil(fourchette).
plat(assiette).
toaster(grille_pain).
cuissonSurPlaque(cuisiniere).
cuissonInterieur(four).
epoussette(balai).
produitDetergent(detergent_a_vaisselle).
produitSoinBeaute(shampooing).
machine_a_cafe(cafetiere).
accessoire_bureau(papier).
eclairage(lampe).
plante(cactus).
instrument(piano).
porte_cle(cle).
bagage(sac_a_dos).
portemonnaie(portefeuille).
portable(telephone).
