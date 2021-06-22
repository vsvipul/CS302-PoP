escapesthrough(O, M) :- invoke(M, X), member(Y, X), escapesthroughhelp(Y, O, []).

escapesthroughhelp(Y, O, _) :- alloc(Y, O), !.
escapesthroughhelp(Y, O, L) :- \+ memberchk((Y, O), L), store(Y, _, A), escapesthroughhelp(A, O, [(Y, O) | L]), !.
escapesthroughhelp(Y, O, L) :- \+ memberchk((Y, O), L), copy(Y, A), escapesthroughhelp(A, O, [(Y, O) | L]), !.
escapesthroughhelp(Y, O, L) :- \+ memberchk((Y, O), L), load(Y, C, D), store(C, D, A), escapesthroughhelp(A, O, [(Y, O) | L]), !.
escapesthroughhelp(Y, O, L) :- \+ memberchk((Y, O), L), load(Y, C, D), copyhelp(C, E, []), store(E, D, A), escapesthroughhelp(A, O, [(Y, O) | L]), !.
escapesthroughhelp(Y, O, L) :- \+ memberchk((Y, O), L), load(Y, C, D), lscopyhelp(C, E, []), store(E, D, A), escapesthroughhelp(A, O, [(Y, O) | L]), !.
escapesthroughhelp(Y, O, L) :- \+ memberchk((Y, O), L), load(Y, C, D), bothcopyhelp(C, E, []), store(E, D, A), escapesthroughhelp(A, O, [(Y, O) | L]), !.

copyhelp(C, E, L) :- \+ memberchk((C, E), L), copy(C, E); copy(C, F), copyhelp(F, E, [(C, E) | L]), !.
lscopyhelp(C, E, L) :- \+ memberchk((C, E), L), load(C, X, Y), store(X, Y, E); load(C, X, Y), store(X, Y, F), lscopyhelp(F, E, [(C, E) | L]), !.

bothcopyhelp(C, E, L) :- \+ memberchk((C, E), L), copy(C, D), load(D, X, Y), store(X, Y, E); copy(C, D), load(D, X, Y), store(X, Y, F), bothcopyhelp(F, E, [(C, E) | L]), !.
bothcopyhelp(C, E, L) :- \+ memberchk((C, E), L), load(C, X, Y), store(X, Y, D), copy(D, E); load(C, X, Y), store(X, Y, D), copy(D, F), bothcopyhelp(F, E, [(C, E) | L]), !.

escapes(Z) :- invoke(M, _), escapesthrough(Z, M),!.

allescapeshelp(A, M) :- alloc(_, A), escapesthrough(A, M).
allescapes(M, L) :- setof(A, allescapeshelp(A, M), L).
