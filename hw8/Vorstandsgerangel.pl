% Eine Rebellions-Zelle möchte einen dreiköpfigen Vorstand bestehend aus einem Vorsitzenden, einem Kassenwart und einem Sekretär zusammenstellen. Als Kandidaten stehen Luke Skywalker, Han Solo, Mon Mothma und Leia Organa zur Wahl. Es gibt jedoch verschiedene Randbedingungen, die die Möglichkeiten zur Bildung eines Vorstands einschränken:

% Solo und Mothma wollen nicht gemeinsam in den Vorstand.
% Solo steht nur für den Vorstand zur Verfügung, wenn Organa Vorsitzende wird.
% Organa geht nur dann in den Vorstand, wenn auch Skywalker diesem angehört.
% Skywalker will nicht in den Vorstand, wenn Solo sich um die Kasse kümmert.
% Mothma tritt dem Vorstand nicht bei, falls Organa Sekretärin wird.
% Schreiben Sie ein Prolog-Programm, das alle möglichen Vorstände berechnet. Nehmen sie dabei keine Umformungen an den Regeln vor.

% Hinweis: Achten Sie darauf, doppelte Lösungen zu vermeiden! Doppelte Lösungen entstehen dadurch, dass die gleiche Lösung über unterschiedliche Wege berechnet werden kann. Beispielsweise wird für das Programm

% p(atom).
% p(X) :- q(X).
% q(atom).
% die folgenden Lösungen berechnet.

% ?- p(A).
% A = atom ;
%A = atom.
% Hier kommt die Lösung A = atom doppelt vor, weil neben p(atom) die Lösung auch durch die zweite Zeile p(X) :- q(X) abgeleitet werden kann. Solche Dopplungen werden verhindert, wenn es zu jeder Lösung nur  einen eindeutigen Pfad gibt.



% ABGABE & BEARBEITUNG
% Candidates
candidate(luke_skywalker).
candidate(han_solo).
candidate(mon_mothma).
candidate(leia_organa).

% Board positions
position(vorsitzender).
position(kassenwart).
position(sekretär).

% Rules
valid_board(Board) :-
    permutation([vorsitzender, kassenwart, sekretär], Board), % Generate all possible board configurations
    \+ member(vorsitzender, Board), % Solo and Mothma cannot be in the board together
    \+ member(kassenwart, Board), % Solo cannot be kassenwart if Organa is not vorsitzender
    \+ member(sekretär, Board), % Mothma cannot be sekretär if Organa is vorsitzender
    (member(han_solo, Board) -> member(leia_organa, Board) ; true), % Solo is available only if Organa is vorsitzender
    (member(leia_organa, Board) -> member(luke_skywalker, Board) ; true). % Organa is in the board only if Skywalker is also in the board

% Query
?- findall(Board, valid_board(Board), Boards).
