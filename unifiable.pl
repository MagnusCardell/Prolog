unifiable([], P, T).
unifiable([X|Y], P, T):-
	match(X, P, Z),
	unifiable(Y, P, [Z|T]).

match(X, X, X).
match(X, P, Z).