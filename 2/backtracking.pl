exec(X,Y) :- p(X,Y).
exec(X,X) :- s(X).
p(X,Y) :- q(X), r(Y).
p(X,Y) :- s(X), r(Y). 
q(a).
q(b).
r(c).
r(d).
s(e).

% Faça  um  esboço  da  árvore  de  execução  para  a  consulta exec(X,Y).
%
% exec(X,Y) ───> p(X,Y)	─┬─> q(X), r(Y) ─┬─> X=a ─┬─> Y=c
%			 │		 │	  └─> Y=d
%			 │		 └─> X=b ─┬─> Y=c	
%			 │			  └─> Y=d
%			 └─> s(X), r(Y) ───> X=e ─┬─> Y=c
%						  └─> Y=d 
% exec(X,X) ───> s(X) ─────────────────────> X=e ───> Y=e

