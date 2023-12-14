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
