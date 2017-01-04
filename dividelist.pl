
append1([], L, L).
append1(X, [], X).
append1(X, Y, [Y|X]).
append1([X|Y], L2, [X|L3]):-
	append1(Y, L2, L3).

dividelist([], L1, L2).
dividelist([X|[Y|Z]], L1, L2):-
	append1(X, L1, R),
	append1(Y, L2, W),
	dividelist(Z, R, W).


div(List, A-list, B-list) :-
    append(A-list, B-list, L-list),
    length(A-list, N),
    length(B-list, N).