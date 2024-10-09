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

{ sudoku(X,Y,1..n) } 1 :- X=1..n, Y=1..n.
%4 rows, 4 columns, with a digit N, 1 <= N <= 4

:- { sudoku(X,Y,N) } != n*n.
%there must be 16 sudoku grid squares

:- sudoku(X,Y,N), sudoku(X',Y',N'), N = N', X' != X, Y = Y'.
:- sudoku(X,Y,N), sudoku(X',Y',N'), N = N', X' = X, Y != Y'.
%columns and rows must all have unique values

subgrid(Y,X,G) :- sudoku(X,Y,N), G = (((Y - 1) / s) * (n / s)) + ((X - 1)/ s) + 1.
%calculate the subgrid for each X,Y location

#const s = 2.
#const n = 4.
#show sudoku/3.
