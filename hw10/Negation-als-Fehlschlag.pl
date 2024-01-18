% nodupo/1 is a function that checks a list for duplicates
nodup([]).
nodup([X|Xs]) :- \+ find(X, Xs), nodup(Xs).

% find/2 is a function that checks if an element is in a list
find(_, []) :- false.
find(X, [X|_]).
find(X, [_|Xs]) :- find(X, Xs).

% neq/2 is a function that checks if two elements are equal
neq(X, Y) :- X \= Y.

% remove/3 is a function that removes all occurrences of an element from a list
remove(_, [], []).
remove(X, [X|Xs], Ys) :- remove(X, Xs, Ys).
remove(X, [Y|Xs], [Y|Ys]) :- remove(X, Xs, Ys).

% nub/2 is a function that checks if a list L without its dublicats is equal to a list R
nub([], []).
nub([X|Xs], [Y|Ys]) :-
    remove(X, Xs, Zs), nub(Zs, [Y|Ys]).
nub([X|Xs], [X|Ys]) :-
    nub(Xs, Ys).

% Diese Funktion ist leider nicht ganz korrekt, nub([4,3], [3]) gibt leider true zurück obwohl false rauskommen müsste.