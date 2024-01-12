=(X, X).

ehemann(christine, heinz).
ehemann(maria, fritz).
ehemann(monika, herbert).
ehemann(angelika, hubert).

mutter(herbert, christine).
mutter(angelika, christine).
mutter(hubert, maria).
mutter(susanne, monika).
mutter(norbert, monika).
mutter(andreas, angelika).

vater(K, V) :- ehemann(M, V), mutter(K, M).

elter(K, E) :- vater(K, E).
elter(K, E) :- mutter(K, E).

grossvater(E, G) :- elter(E, F), vater(F, G).

vorfahre(N, V) :- vorfahre(N, V2), vorfahre(V2, V).
vorfahre(N, V) :- elter(N, V).

% Test query: "vorfahre(X,Y).".
% Expected result (with dfs): No solutions and non-termination.
% Expected result (with bfs): Multiple solutions, but still
% non-termination.
% Tests completeness of bfs.
