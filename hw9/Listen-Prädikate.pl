% definition of append from lecture
append([],L,L).
append([E|R],L,[E|RL]) :- append(R,L,RL).

% lookup/3 returns true if tupel from K and V is elemnt of KVs
lookup(K, KVs, V) :- append(_, [(K, V)|_], KVs).

% member/2 returns true if E is at least two times in L
member2(E, L) :-
    append(_, [E|R], L),
    append(_, [E|_], R),
    R \= [E].

% reverse_naive/2 is only true if Xs is the reverse of Ys
reverse_naive([], []).
reverse_naive([X|Xs], Ys) :-
    reverse_naive(Xs, R),
    append(R, [X], Ys).

% reverse_efficient/2 is true if Xs is the reverse of Ys
reverse_efficient(Xs, Ys) :-
    reverse_efficient(Xs, [], Ys).
reverse_efficient([], Acc, Acc).
reverse_efficient([X|Xs], Acc, Ys) :-
    reverse_efficient(Xs, [X|Acc], Ys).