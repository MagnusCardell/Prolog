shape(N):- 
	N > 0.

triangle(Aside, Bside, Cside):- 
	Aside > 0,
	Bside > 0,
	Cside > 0.
quadrant(Aside, Bside, Cside, Dside):- 
	Aside > 0,
	Bside > 0,
	Cside > 0,
	Dside > 0.

hypotenuse(X, Y, Z) :-
	(X >= Y),
	(Y >= Z).

pythagoras(Aside, Bside, Cside):- 
	(hypotenuse(Aside, Bside, Cside) 
		-> Hypo = Aside
		-> Catheti1 = Bside
		-> Catheti2 = Cside
	; hypotenuse(Aside, Cside, Bside)
		-> Hypo =Aside
		-> Catheti1 = Bside
		-> Catheti2 = Cside
	; hypotenuse(Bside, Aside, Cside)
		-> Hypo = Bside
		-> Catheti1 = Aside
		-> Catheti2 = Cside
	; hypotenuse(Bside, Cside, Aside)
		-> Hypo = Bside
		-> Catheti1 = Aside
		-> Catheti2 = Cside
	; hypotenuse(Cside, Aside, Bside)
		-> Hypo = Cside
		-> Catheti1 = Aside
		-> Catheti2 = Bside
	; hypotenuse(Cside, Bside, Aside)
		-> Hypo = Cside
		-> Catheti1 = Aside
		-> Catheti2 = Bside
	),
	Hypopwr2 = **(Hypo, 2),
	Hypopwr2 =:= +(**(Catheti1, 2), **(Catheti2, 2)).

equalsides(Aside, Bside, Cside):-
	Aside =:= Bside,
	Bside =:= Cside.
equalsides(Aside, Bside, Cside, Dside):-
	Aside =:= Bside,
	Aside =:= Cside,
	Aside =:= Dside,
	Bside =:= Cside,
	Bside =:= Dside,
	Cside =:= Dside.
rectCheck(Aside, Bside, Cside, Dside):-
	(+(Aside, Bside) =:= +(Cside, Dside),
	Aside =\= Bside
		-> true
	; +(Aside, Cside) =:= +(Bside, Dside),
	Aside =\= Cside
		-> true
	).

regularCheck(Aside, Bside, Cside, Dside):-
	(Aside =:= Bside -> true
	; Aside =:= Cside -> true
	; Aside =:= Dside -> true
	),
	(Bside =:= Aside -> true
	; Bside =:= Cside -> true
	; Bside =:= Dside -> true
	),
	(Cside =:= Aside -> true
	; Cside =:= Bside -> true
	; Cside =:= Dside -> true
	).

isHorizontal(object):-
	2 =:= +(1, 1).

rightTriangle(Aside, Bside, Cside):- /*Try 5, 4, 3 */
	triangle(Aside, Bside, Cside),
	pythagoras(Aside, Bside, Cside).

equilateralTriangle(Aside, Bside, Cside):-
	triangle(Aside, Bside, Cside),
	equalsides(Aside, Bside, Cside).

isoscelesTriangle(Aside, Bside, Cside):-
	triangle(Aside, Bside, Cside),
	(Aside =:= Bside,
	Bside =\= Cside -> true
	; Bside =:= Cside,
	Cside =\= Aside -> true
	; Cside =:= Aside,
	Aside =\= Bside -> true
	).

regularRectangle(Aside, Bside, Cside, Dside):-
	quadrant(Aside, Bside, Cside, Dside),
	regularCheck(Aside, Bside, Cside, Dside),
	rectCheck(Aside, Bside, Cside, Dside).

rectangle(Aside, Bside, Cside, Dside):-
	quadrant(Aside, Bside, Cside, Dside),
	regularCheck(Aside, Bside, Cside, Dside),
	rectCheck(Aside, Bside, Cside, Dside).

square(Aside, Bside, Cside, Dside):-
	quadrant(Aside, Bside, Cside, Dside),
	equalsides(Aside, Bside, Cside, Dside).

paralellogram(Aside, Bside, Cside, Dside):- 
	quadrant(Aside, Bside, Cside, Dside),
	regularCheck(Aside, Bside, Cside, Dside),
	rectCheck(Aside, Bside, Cside, Dside).

sidelength(Lenght):-
	Lenght > 0.

side(X3, Y3, X2, Y2)

masterRightTriangle(X1, Y1, X2, Y2, X3, Y3):-
	sidelength(oneside(X3, Y3, X2, Y2), 
		twoside(X2, Y2, X1, X2),
		threeside(X1, Y1, X3, Y3)),
		rightTriangle(SideA, SideB, SideC).
masterEquilateralTriangle(X1, Y1, X2, Y2, X3, Y3):-
	sidelength(oneside(X3, Y3, X2, Y2), 
		twoside(X2, Y2, X1, X2),
		threeside(X1, Y1, X3, Y3)),
		equilateralTriangle(SideA, SideB, SideC).
masterIsoscelesTriangle(X1, Y1, X2, Y2, X3, Y3):-
	sidelength(oneside(X3, Y3, X2, Y2), 
		twoside(X2, Y2, X1, X2),
		threeside(X1, Y1, X3, Y3)),
		isoscelesTriangle(SideA, SideB, SideC).
masterRegularRectangle(X1, Y1, X2, Y2, X3, Y3, X4, Y4):-
	sidelength(oneside(X4, Y4, X3, Y3), 
		twoside(X3, Y3, X2, Y2),
		threeside(X2, Y2, X1, Y1),
		fourside(X1, Y1, X4, Y4)),
		regularRectangle(SideA, SideB, SideC, SideD),
		isHorizontal(X1, X2, X3, X4).
masterRectangle(X1, Y1, X2, Y2, X3, Y3, X4, Y4):-
	sidelength(oneside(X4, Y4, X3, Y3), 
		twoside(X3, Y3, X2, Y2),
		threeside(X2, Y2, X1, Y1),
		fourside(X1, Y1, X4, Y4)),
		rectangle(SideA, SideB, SideC, SideD).
masterSquare(X1, Y1, X2, Y2, X3, Y3, X4, Y4):-
	sidelength(oneside(X4, Y4, X3, Y3), 
		twoside(X3, Y3, X2, Y2),
		threeside(X2, Y2, X1, Y1),
		fourside(X1, Y1, X4, Y4)),
		square(SideA, SideB, SideC, SideD).
masterParalellogram(X1, Y1, X2, Y2, X3, Y3, X4, Y4):-
	sidelength(oneside(X4, Y4, X3, Y3), 
		twoside(X3, Y3, X2, Y2),
		threeside(X2, Y2, X1, Y1),
		fourside(X1, Y1, X4, Y4)),
		paralellogram(SideA, SideB, SideC, SideD),
		isSkewed(X1, X2, X3, X4).
