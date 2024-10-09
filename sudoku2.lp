% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

sudoku(X,Y,N) :- initial(X,Y,N).
%every initial instance corresponds to a sudoku grid square

:- sudoku(X,Y,N), sudoku(X,Y,N'), N != N'.
%there cannot be multiple values in the same grid square

1 { sudoku(X,Y,1..n) } 1 :- X = 1..n, Y = 1..n.
%9 rows, 9 columns, with a digit N, 1 <= N <= 9

:- #count { X,Y,N : sudoku(X,Y,N) } != n*n.
%there must be 81 sudoku grid squares

:- sudoku(X,Y,N), sudoku(X',Y',N'), N = N', X' != X, Y = Y'.
:- sudoku(X,Y,N), sudoku(X',Y',N'), N = N', X' = X, Y != Y'.
%columns and rows must all have unique values

subgrid(Y,X,G) :- sudoku(X,Y,N), G = (((Y - 1) / s) * (n / s)) + ((X - 1)/ s) + 1.
%calculate the subgrid for each X,Y location

:- subgrid(X,Y,G), subgrid(X',Y',G'), sudoku(X,Y,N), sudoku(X',Y',N'),
N = N', X' != X, Y != Y', G = G'.
%ensure there are no duplicates within a subgrid

#const s = 3.
#const n = 9.
#show sudoku/3.
