% define "and" operator
and(true, true, true).
and(_, _, false).

% define "or" operator
or(false, false, false).
or(_, _, true).

% define "not" operator
not(true, false).
not(false, true).

% implement operations
ex1(X,Y,Z,Res) :-
    and(X, Y, Res1),
    or(Res1, Z, Res).

ex2(X,Y,Z,Res) :-
    and(X, Y, Res1),
    and(Y, Z, Res2),
    or(Res2, Z, Res3),
    or(Res1, Res3, Res).

ex3(X,Y,Z,Res) :-
    and(X, not(Y, Res1), Res2),
    and(Res2, Z, Res3),
    and(Y, Z, Res4),
    or(Res4, Z, Res5),
    or(Res3, Res5, Res).

findall((X, Y, Z), ex1(X, Y, Z, true), List).
findall((X, Y, Z), ex2(X, Y, Z, true), List).
findall((X, Y, Z), ex3(X, Y, Z, true), List).

% Cases of X = true, Y = false, Z = true
% ex1(true, false, true, true).
% ex2(true, false, true, true).
% ex3(true, false, true, true).