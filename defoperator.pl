% the defenition of operators in Prolog
%
% here I define words as operators to make the sentence 
% 	"diana was the secretary of the department. "
% a legal function
% try this: 
% ?- diana was X
% ?- diana was the secretary of the X
% ?- X was Y

:-op(300,xfx,was).
:-op(250,xfx,of).
:-op(100,fx,the).
diana was the secretary of the department.


% leftovers

and(X, Y) :-
	X = Y.
supports(floor, table).

:- op(300, xfy, and).
:- op(300, xfx, supports).
