  
% Inicio de predicado, llama otros predicados
sudoku(F1C1, F1C2, F1C3, F1C4, F2C1, F2C2, F2C3, F2C4, F3C1, F3C2, F3C3, F3C4, F4C1, F4C2, F4C3, F4C4) :- 
  resolver(F1C1, F1C2, F1C3, F1C4, F2C1, F2C2, F2C3, F2C4, F3C1, F3C2, F3C3, F3C4, F4C1, F4C2, F4C3, F4C4),
	printsudoku(F1C1, F1C2, F1C3, F1C4),
	printsudoku(F2C1, F2C2, F2C3, F2C4),
	printsudoku(F3C1, F3C2, F3C3, F3C4),
	printsudoku(F4C1, F4C2, F4C3, F4C4).

% Imprimir los valores en orden
printsudoku(A, B, C, D) :- write(' '), write(A), write('  '), write(B), write('  '), write(C), write('  '), write(D), nl.

% Resuelve los valores para cada posicion
resolver(F1C1, F1C2, F1C3, F1C4, F2C1, F2C2, F2C3, F2C4, F3C1, F3C2, F3C3, F3C4, F4C1, F4C2, F4C3, F4C4) :-
	validarNumeros(F1C1, F1C2, F1C3, F1C4), % primera fila
	validarNumeros(F2C1, F2C2, F2C3, F2C4), % segunda fila
	validarNumeros(F3C1, F3C2, F3C3, F3C4), % tercera fila
	validarNumeros(F4C1, F4C2, F4C3, F4C4), % cuarta fila
	validarNumeros(F1C1, F2C1, F3C1, F4C1), % primera columna
	validarNumeros(F1C2, F2C2, F3C2, F4C2), % segunda columna
	validarNumeros(F1C3, F2C3, F3C3, F4C3), % tercera columna
	validarNumeros(F1C4, F2C4, F3C4, F4C4), % cuarta columna
	validarNumeros(F1C1, F1C2, F2C1, F2C2), % block de arriba para la izquierda
	validarNumeros(F1C3, F1C4, F2C3, F2C4), % block de arriba para la derecha
	validarNumeros(F3C1, F3C2, F4C1, F4C2), % block de abajo para la izquierda
	validarNumeros(F3C3, F3C4, F4C3, F4C4). % block de abajo para la derecha

% Determine si cada cuadrado de una fila, columna o bloque está

% validarNumeros
validarNumeros(A, B, C, D) :- num(A), num(B), num(C), num(D), A\=B, A\=C, A\=D, B\=C, B\=D, C\=D.

% Initialize numbers
num(1). num(2). num(3). num(4).