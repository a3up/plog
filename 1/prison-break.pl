male('Aldo Burrows').
female('Christina Rose Scofield').
male('Lincoln Burrows').
female('Lisa Rix').
male('Michael Scofield').
female('Sara Tancredi').
female('Ella Scofield').

% Parent(Parent, Child)
parent('Aldo Burrows', 'Lincoln Burrows').
parent('Christina Rose Scofield', 'Lincoln Burrows').
parent('Aldo Burrows', 'Michael Scofield').
parent('Christina Rose Scofield', 'Michael Scofield').
parent('Lincoln Burrows', 'LJ Burrows').
parent('Lisa Rix', 'LJ Burrows').
parent('Michael Scofield', 'Ella Scofield').
parent('Sara Tancredi', 'Ella Scofield').

father(Father, Child) :- parent(Father, Child), male(Father).
mother(Mother, Child) :- parent(Mother, Child), female(Mother).
sibling(Sibling, X) :- father(F, Sibling), father(F, X), mother(M, Sibling), mother(M, X), dif(Sibling, X).
brother(Brother, X) :- sibling(Brother, X), male(Brother).
sister(Sister, X) :- sibling(Sister, X), female(Sister).
