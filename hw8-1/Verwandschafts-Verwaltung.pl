% Definition der Verheiratet-Relation:
verheiratet(christine, heinz).
verheiratet(hubert,    fritz).
verheiratet(monika,    angelika).
verheiratet(herbert,   maria).
verheiratet(claudia,   kim).

geschlecht(christine, w).
geschlecht(maria, w).
geschlecht(monika, w).
geschlecht(claudia, w).
geschlecht(anna, w).
geschlecht(susanne, w).
geschlecht(karolin, w).
geschlecht(angelika, d).
geschlecht(heinz, m).
geschlecht(fritz, m).
geschlecht(hubert, m).
geschlecht(herbert, m).
geschlecht(kim, m).
geschlecht(andreas, m).
geschlecht(norbert, m).

% Definition der Kind-Eltern-Relation:
kind(herbert,  christine, heinz).
kind(angelika, christine, heinz).
kind(maria,    hubert,    fritz).
kind(karolin,  hubert,    fritz).
kind(susanne,  monika,    angelika).
kind(kim,      monika,    angelika).
kind(andreas,  herbert,   marina).
kind(anna,     claudia,   kim).

vater(Kind,Vater) :- kind(Kind,Vater,_), geschlecht(Vater,m).
vater(Kind,Vater) :- kind(Kind,_,Vater), geschlecht(Vater,m).

mutter(Kind,Mutter) :- kind(Kind,Mutter,_), geschlecht(Mutter,w).
mutter(Kind,Mutter) :- kind(Kind,_,Mutter), geschlecht(Mutter,w).



% ABGABE & BEARBEITUNG

% Grandmother can be found by finding the mother of the mother
grossmutter(Person, Grossmutter) :-
    mutter(Person, Mutter),
    mutter(Mutter, Grossmutter).

% Siblings can be found by finding the children of the same parents that are not the same person
geschwister(Person, Geschwister) :-
    vater(Person, Vater),
    kind(Geschwister, Vater, _),
    Geschwister \= Person.

% Brother can be found by finding male siblings of person
bruder(Person, Bruder) :-
    geschwister(Person, Bruder),
    geschlecht(Bruder, m).

% Aunt can be found by searching for female siblings of persons mother
tante(Person, Tante) :-
    mutter(Person, Mutter),
    geschwister(Mutter, Tante),
    geschlecht(Tante, w).