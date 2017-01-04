side(X1, Y1, X2, Y2, Length):-
	Length is **(+(*(-(X2, X1), 2), (*(-(Y2, Y1), 2))), 0.5).
