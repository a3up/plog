% -----------------------------------------------
%           factorial(Number, Result)
% -----------------------------------------------
factorial(0,1).
factorial(N,F) :-
	N > 0,
	M is N - 1,
	factorial(M, FM),
	F is N * FM.

% -----------------------------------------------
%             fibonacci(Number, Result)
% -----------------------------------------------
fibonacci(0,1).
fibonacci(1,1).
fibonacci(N,F) :-
	N > 1,
	N1 is N - 1,
	fibonacci(N1,F1),
	N2 is N - 2,
	fibonacci(N2,F2),
	F is F1 + F2.

% -----------------------------------------------
%                 is_prime(Number)
% -----------------------------------------------
is_prime(2).
is_prime(3).
is_prime(N) :-
	integer(N),
	P > 3,
	P mod 2 =\= 0,
	\+has_factor(P,3).

% has_factor(Number, Smaller number to test)
has_factor(N,M) :- 
	N mod L =:= 0.
has_factor(N,M) :-
	M * M < N,
	M2 is M + 2,
	has_factor(N,M2).
