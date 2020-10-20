:- use_module(library(lists)).

% graph data
connected(a,b).
connected(f,i).
connected(a,c).
connected(f,j).
connected(b,d).
connected(f,k).
connected(b,e).
connected(g,l).
connected(b,f).
connected(g,m).
connected(c,g).
connected(k,n).
connected(d,h).
connected(l,o).
connected(d,i).
connected(i,f).
connected(X,Y,1) :-
	connected(X,Y).

% depth_path(X,Y,P) finds a path P that starts in X and ends in Y using the depth search
depth_path(X,Y,P) :-
	depth_path(X,Y,[],P).
depth_path(X,X,_,[X]) :- !.
depth_path(X,Z,A,[X|P]) :-
	connected(X,Y,_),
	\+member(Y,A),
	depth_path(Y,Z,[Y|A],P).

% weight(P,N) calculates the weight N of the path P
weight([],0).
weight([_],0).
weight([A,B|T],W) :-
	connected(A,B,W1),
	weight([B|T],W2),
	W is W1 + W2.

% fastest_path(X,Y,M) finds the fastest path M between X and Y in a weighted graph
fastest_path(X,Y,F) :-
	findall(P1,depth_path(X,Y,P1),P),
	min_member(weight,F,P).

% path(X,Y,P) finds a path P that starts in X and ends in Y
path(X,Y,P) :-
	depth_path(X,Y,P).
