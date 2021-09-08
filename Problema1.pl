% Hechos
pareja(marta,bruce).
pareja(bruce,marta).
pareja(diana,peter).
pareja(peter,diana).
pareja(may,ben).
pareja(ben,may).
pareja(rachel,enrique).
pareja(enrique,rachel).
pareja(pepper,barry).
pareja(barry,pepper).

madre(marta,diana).
madre(marta,may).
madre(marta,rachel).
madre(marta,barry).
madre(diana,mary).
madre(diana,harry).
madre(may,ezio).
madre(may,lorenzo).
madre(may,sergio).
madre(rachel,clark).
madre(rachel,lois).
madre(pepper,lara).
madre(pepper,tony).

padre(bruce,diana).
padre(bruce,may).
padre(bruce,rachel).
padre(bruce,barry).
padre(peter,mary).
padre(peter,harry).
padre(ben,ezio).
padre(ben,lorenzo).
padre(ben,sergio).
padre(enrique,clark).
padre(enrique,lois).
padre(barry,lara).
padre(barry,tony).

hijo(barry,marta).
hijo(barry,bruce).
hijo(harry,diana).
hijo(harry,peter).
hijo(ezio,may).
hijo(ezio,ben).
hijo(lorenzo,may).
hijo(lorenzo,ben).
hijo(sergio,may).
hijo(sergio,ben).
hijo(clark,rachel).
hijo(clark,enrique).
hijo(tony,pepper).
hijo(tony,barry).
hijo(diana,marta).
hijo(diana,bruce).
hijo(may,marta).
hijo(may,bruce).
hijo(rachel,marta).
hijo(rachel,bruce).
hijo(mary,diana).
hijo(mary,peter).
hijo(lois,rachel).
hijo(lois,enrique).
hijo(lara,pepper).
hijo(lara,barry).

hermano(barry,diana).
hermano(barry,may).
hermano(barry,rachel).
hermano(harry,mary).
hermano(ezio,lorenzo).
hermano(ezio,sergio).
hermano(lorenzo,ezio).
hermano(lorenzo,sergio).
hermano(sergio,ezio).
hermano(sergio,lorenzo).
hermano(clark,lois).
hermano(tony,lara).

hermana(diana,may).
hermana(diana,rachel).
hermana(diana,enrique).
hermana(diana,barry).
hermana(may,diana).
hermana(may,rachel).
hermana(may,barry).
hermana(rachel,diana).
hermana(rachel,may).
hermana(rachel,barry).
hermana(mary,harry).
hermana(lois,clark).
hermana(lara,tony).

% Reglas

abuelo(X, Y) :- padre(X, Z),
                (hijo(Y,Z)).

tio(X,Y) :- hermano(X,Z),
    		madre(Z,Y).

primo(X,Y) :- (madre(A,X),padre(B,X),pareja(A,B)),
    	  	(hijo(X,A);hijo(X,B)),
    		(madre(C,Y),padre(D,Y),pareja(D,C)),
    		((hermana(A,C);hermana(A,D));(hermano(B,C))).

culpable(X) :- hermana(Y,X),
    			abuelo(bruce,Y),
    			primo(clark,Y),
    			tio(barry,Y).

obtener_hijos(X,L):- (setof(Y,hijo(Y,X),L);
                          L = []).

graficar_arbol([],NivelAnterior):- write('').
graficar_arbol([Cabeza|Cola],NivelAnterior):-
	(pareja(Cabeza,Z)->  atom_concat('----',NivelAnterior,NivelActual),write(NivelActual),write(Cabeza),write(' - '),write(Z),nl;
        atom_concat('----',NivelAnterior,NivelActual),write(NivelActual),write(Cabeza),nl),
    obtener_hijos(Cabeza,Hijos),
    graficar_arbol(Hijos,NivelActual),
    graficar_arbol(Cola, NivelAnterior).

arbol(X):- (pareja(X,Z)-> graficar_arbol([X],'-> '));
    		(hijo(X,Y)->  write('---> '),write(X));
    		((write('No existe el intengrante en la familia.'),nl)-> false).
