less(i,i(_X)).
less(i,o(_X)).
less(o(N), i(N)).
less(o(N), o(M)) :- less(N,M).
less(i(N), i(M)) :- less(N,M).
less(i(N), o(M)) :- less(N,M).
less(o(N), i(M)) :- less(N,M).

lessTest(A,B,C) :- less(A,C), less(B,C).

% Test query: "lessTest(i,o(i),S).".
% Expected result: 5 solutions, "{S -> i(i)}", "{S -> i(i(A))}",
% "{S -> i(o(A))}", "{S -> o(i(A))}", and "{S -> o(o(A))}".
% Tests renaming.
