% concat(X,Y,R) where R is the concatenation of the lists X and Y in order
concat([],L,L).
concat([H|T],L,[H|R]) :-
	append(T,L,R).

% Calculates the inverted list of a list
invert(L,R) :-
	rev(L,[],R).
% Auxiliar function for invert(), the result is being accumulated in the middle variable
rev([H|T],A,R) :-
	rev(T,[H|A],R).
rev([],R,R).

% element(X,L) true if X is an element of the list L
element(X,L) :-
	append(_,[X|_],L).

% last(L,X) where X is the last element of the list L
last(L,X) :-
	append(_,[X],L).

% nth_element(N,L,X) where X is the nth member of the list
nth_element(1,[H|_],H).
nth_element(N,[_|T],R) :-
	N > 1,
	M is N - 1,
	nth_element(M,T,R).

% delete_one(X,L,R) where R is the list L with one occurrence of X removed
delete_one(X,L,R) :-
	append(B,[X|E],L),
	append(B,E,R).

% delete_all(X,L,R) where R is the list L with all occurrences of X removed
delete_all(_,[],[]).
delete_all(X,[X|T],R) :- !,
	delete_all(X,T,R).
delete_all(X,[H|T],[H|R]) :-
	delete_all(X,T,R).

% delete_all_list(X,L,R) where R is the list L with all occurrences of elements of X removed
delete_all_list([],L,L).
delete_all_list([H|T],L,R) :- 
	delete_all(H,L,A),
	delete_all_list(T,A,R).

% before(A,B,L) is true when A occurs before B in the list L
before(X,Y,L) :-
	append(_,[X|E],L),
	append(_,[Y|_],E).

% len(L,N) where N is the number of elements of L
len([],0).
len([_|T],N) :-
	len(T,A),
	N is A + 1.

% count_occurrences(X,L,N) where N is the number of occurrences of X in the list L
count_occurrences(_,[],0).
count_occurrences(X,[X|T],N) :- !,
	count_occurrences(X,T,A),
	N is A + 1.
count_occurrences(X,[_|T],N) :-
	count_occurrences(X,T,N).

% substitute_element(X,Y,L,R) where R is the list L with the X elements substituted by Y
substitute_element(_,_,[],[]).
substitute_element(X,Y,[X|T],[Y|A]) :- !,
	substitute_element(X,Y,T,A).
substitute_element(X,Y,[H|T],[H|A]) :-
	substitute_element(X,Y,T,A).