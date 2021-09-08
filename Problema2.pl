% Hechos
pareja(analucia,lamar).
pareja(lamar,analucia).
pareja(diana,pedro).
pareja(pedro,diana).
pareja(soledad,jonas).
pareja(jonas,soledad).
pareja(ruth,feliciano).
pareja(feliciano,ruth).

madre(analucia,pedro).
madre(analucia,ruth).
madre(diana,jonas).
madre(ruth,ines).
madre(ruth,manuel).
madre(soledad,daniel).
madre(soledad,constancia).

padre(lamar,pedro).
padre(lamar,ruth).
padre(pedro,jonas).
padre(feliciano,ines).
padre(feliciano,manuel).
padre(jonas,daniel).
padre(jonas,constancia).

hijo(pedro,lamar).
hijo(ruth,lamar).
hijo(pedro,analucia).
hijo(ruth,analucia).
hijo(jonas,diana).
hijo(jonas,pedro).
hijo(ines,ruth).
hijo(manuel,ruth).
hijo(ines,feliciano).
hijo(manuel,feliciano).
hijo(daniel,soledad).
hijo(constancia,soledad).
hijo(daniel,jonas).
hijo(constancia,jonas).

hermano(pedro,ruth).
hermano(manuel,ines).
hermano(daniel,constancia).

hermana(ruth,pedro).
hermana(ines,manuel).
hermana(constancia,daniel).

% Reglas
abuelo(X, Y) :- padre(X, Z),
                (hijo(Y,Z)).

abuela(X, Y) :- madre(X, Z),
                (hijo(Y,Z)).

tio(X,Y) :- hermano(X,Z),
    		(madre(Z,Y);padre(Z,Y)).

tia(X,Y) :- hermana(X,Z),
    		(madre(Z,Y);padre(Z,Y)).

primo(X,Y) :- (madre(A,X),padre(B,X),pareja(A,B)),
    	  	(hijo(X,A);hijo(X,B)),
    		(madre(C,Y),padre(D,Y),pareja(D,C)),
    		((hermana(A,C);hermana(A,D));(hermano(B,C))).

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