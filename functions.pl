% defined functions of included functors in Prolog 
% and some other useful functions

member1(X, [X|_]).
member1(X, [_|Y]):-
	member1(X, Y).

member2(X, L):-
	append1(_, [X|_], L).

member3(X, L):-
	delete1(X, L, _).

islist1([]).
islist1([_|Y]):-
	islist1(Y).

%merges two equal length lists 
merge([], [], []).
merge([X|Xs], [Y|Ys], [X=Y|Zs]) :- 
	merge(Xs, Ys, Zs).

% tail recursive append
append1([], L, L).
append1([X|Y], L2, [X|L3]):-
	append1(Y, L2, L3).

listlen1([], 0).
listlen1([_|Y], N):-
	listlen1(Y, N1),
	N is N1+1.

listlen2(L, N):-
	lenacc1(L, 0, N).

lenacc1([], A, A).
lenacc1([_|Y], A, N):- 
	A1 is A+1,
	lenacc1(Y, A1, N).

add1(X, L, [X|L]).

delete1(X, [X|T], T).
delete1(X, [Y|T], [Y|T1]):-
	delete1(X, T, T1).

insert1(X, L, BL):-
	delete1(X, BL, L).

sublist1(X, Y):-
	append1(Y, _, X2),
	appen1(_, X2, X).

permutation1([], []).
permutation1([X|L], P):-
	permutation1(L, L1),
	insert1(X, L1, P).

permutation2([], []).
permutation2(L, [X|P]):-
	delete1(X, L, L1),
	permutation2(L1, P).

% ?- is_sum(4, X). results in X = 1+1+1+1
is_sum(1, 1):- !. 
is_sum(N, Res):-
	N1 is N-1,
	is_sum(N1, Res1),
	Res = Res1 + 1.

max(X, Y, X):-
	X >= Y, !, 
	max(X, Y, Y).