% Representation of natural numbers by z(ero) or s(uccessor) of a natural.
isPeano(z).
isPeano(s(N)) :- isPeano(N).

% the successor of a natural number:
succ(N,s(N)).

% the predecessor of a natural number:
pred(s(N),N).

% addition on natural numbers:
add(z   ,Y,Y).
add(s(X),Y,s(Z)) :- add(X,Y,Z).

% subtraction on natural numbers:
sub(X,Y,Z) :- add(Y,Z,X).

% multplication on natural numbers:
mult(z, _, z).
mult(s(X),Y,Z) :- mult(X,Y,XY), add(XY,Y,Z).

% less-or-equal relation on natural numbers:
leq(z,_).
leq(s(X),s(Y)) :- leq(X,Y).

% horseman/4 calculates the amount of horses and riders, given the total amount of heads and legs.
horseman(Horses, Riders, TotalHeads, TotalLegs) :-
    add(Horses, Riders, TotalHeads),
    mult(s(s(s(s(z)))), Horses, HorseLegs),
    mult(s(s(z)), Riders, RiderLegs),
    add(HorseLegs, RiderLegs, TotalLegs),
    leq(Horses, TotalHeads),
    leq(Riders, TotalHeads).
