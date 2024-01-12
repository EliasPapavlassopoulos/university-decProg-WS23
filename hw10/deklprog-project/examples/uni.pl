=(X, X).

% Test query: "=(A,B).".
% Expected result: One solution, "{A -> B}" or some equivalent solution, e.g.,
% "{A -> C, B -> C}".

% Test query: "=(A,f(A)).".
% Expected result: No solutions.
% If a solution is yield, it is most likely that no occur check is implemented.

% Test query: "=(f(A,B),f(f(C),g(D))).".
% Expected result: One solution, "{A -> f(C), B -> g(D)}".

% Test query: "=(f(A,B),f(f(C),g(A))).".
% Expected result: One solution, "{A -> f(C), B -> g(f(C))}".
% This test case checks whether the substitution obtained in one step of the
% unification algorithm is correctly applied to both terms.

% Test query: "=(f(A,B),g(C,D)).".
% Expected result: No solutions.
% If a solution is yield, than the disagreement set most likely does not
% correctly handle functors of different name.

% Test query: "=(f(A,B),f(C,D,E)).".
% Expected result: No solutions.
% If a solution is yield, than the disagreement set most likely does not
% correctly handle functors of different arity.

% Test query: "=(p(A,B,C,D,E,F,G,H,I,J,K,L,M),p(f(B,B),f(C,C),f(D,D),f(E,E),f(F,F),f(G,G),f(H,H),f(I,I),f(J,J),f(K,K),f(L,L),f(M,M),f(N,N))).".
% Expected result: One solution, too long to display here.
% This test case demonstrates the exponential runtime of the unification
% algorithm. CAUTION: This may take too long to compute!

% Test query: "=(p(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R),p(f(B,B),f(C,C),f(D,D),f(E,E),f(F,F),f(G,G),f(H,H),f(I,I),f(J,J),f(K,K),f(L,L),f(M,M),f(N,N),f(O,O),f(P,P),f(Q,Q),f(R,R),f(S,S))).".
% Expected result: One solution, too long to display here.
% This test case demonstrates the exponential runtime of the unification
% algorithm. CAUTION: This may take too long to compute!

% Test query: "=(p(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y),p(f(B,B),f(C,C),f(D,D),f(E,E),f(F,F),f(G,G),f(H,H),f(I,I),f(J,J),f(K,K),f(L,L),f(M,M),f(N,N),f(O,O),f(P,P),f(Q,Q),f(R,R),f(S,S),f(T,T),f(U,U),f(V,V),f(W,W),f(X,X),f(Y,Y),f(Z,Z))).".
% Expected result: One solution, too long to display here.
% This test case demonstrates the exponential runtime of the unification
% algorithm. CAUTION: This may take too long to compute!
