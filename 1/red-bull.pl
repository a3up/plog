pilot('Lamb').
pilot('Besenyei').
pilot('Chambliss').
pilot('MacLean').
pilot('Mangold').
pilot('Jones').
pilot('Bonhomme').

% partner(pilot, team)
('Lamb', 'Breitling').
belongs('Besenyei', 'Red Bull').
belongs('Chambliss', 'Red Bull').
belongs('MacLean', 'Mediterranean Racing').
belongs('Mangold', 'Cobra').
belongs('Jones', 'Matador').
belongs('Bonhomme', 'Matador').

% airplane(model, pilot)
airplane('MX2', 'Lamb').
airplane('Edge540', 'Besenyei').
airplane('Edge540', 'Chambliss').
airplane('Edge540', 'MacLean').
airplane('Edge540', 'Mangold').
airplane('Edge540', 'Jones').
airplane('Edge540', 'Bonhomme').

% winner(pilot, circuit)
winner('Jones', 'Porto').
winner('Mangold', 'Budapest').
winner('Mangold', 'Istanbul').

% gates(circuit, number of gates)
gates('Istanbul', 9).
gates('Budapest', 6).
gates('Porto', 5).

% a team is the winner of a circuit if one of its members is also the winner
winner_team(Team, Circuit) :- belongs(Pilot, Team), winner(Pilot, Circuit).

