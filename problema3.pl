% --- reverso de lista
reverso([],[]).

reverso([CabezaLista|ColaLista],Lista):- reverso(ColaLista,Colainvertida),concatenar(Colainvertida,[CabezaLista],Lista).
    % Concatenar
    concatenar([],Lista,Lista).
    concatenar([CabezaLista|ColaLista],Lista2, [CabezaLista|Lista3]):- concatenar(ColaLista,Lista2,Lista3).

% --- palindromo de una lista
palindromo([],[]).
es_palindromo(Entrada):- reverso(Entrada,Entrada), write(Entrada).

% ---- duplicar lista
duplicar_elementos([],[]).
duplicar_elementos([CabezaLista|ColaLista2],[CabezaLista,CabezaLista|Lista3]):- 
    duplicar_elementos(ColaLista2,Lista3).

% ------------ Dividir lista en 2
div(Lista, ListaA, ListaB) :- 
    append(ListaA, ListaB, Lista), 
    length(ListaA, LenghtA), 
    length(ListaB, LenghtB), 
    ((LenghtA-1)=:=LenghtB;(LenghtA+1)=:=LenghtB;LenghtA=:=LenghtB),!.

% ------ Insertar valor en index
insertarElemento(Elem,[],_Pos,[Elem]).
insertarElemento(Elem,Lista,1,[Elem|Lista]).
insertarElemento(Elem,[CabezaLista|ColaLista],Pos,[CabezaLista|ColaElem]):- 
    Pos1 is Pos-1, insertarElemento(Elem,ColaLista,Pos1,ColaElem).