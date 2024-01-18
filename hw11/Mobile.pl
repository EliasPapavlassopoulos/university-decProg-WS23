% mobile/2 contains a fish and a weight
mobile(fisch(Weight), Weight).

%bridge/2 is contains two weights
% mobile/2 has to check if both attached mobiles have the same weight
% If so: Bridge/2 is also a mobile
mobile(bruecke(Mobile1, Mobile2), TotalWeight) :-
    mobile(Mobile1, Weight1),
    mobile(Mobile2, Weight2),
    Weight1 == Weight2,
    TotalWeight is Weight1 + Weight2 + 1.

% | ?- mobile(bruecke(fisch(1),fisch(1)),2). -> false (1+1+1 != 2)
% | ?- mobile(bruecke(fisch(1),fisch(1)),3). -> true (1+1+1 == 3)

% Why does mobile(X, 3) work?
% If mobile/2 gets a weigth as input it calculates the required mobiles that result in the same weight as given.