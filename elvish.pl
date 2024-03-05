% Create the knowledge base with states and characters
move(a, b, t). 
move(b, c, h).
move(b, h, e).
move(b, l, i).
move(b, o, u).
move(c, d, a).
move(d, e, l).
move(e, f, i).
move(f, g, a).
move(f, z, n).
move(g, z, s).
move(h, i, n).
move(i, j, g).
move(j, k, w).
move(k, z, a).
move(l, m, n).
move(m, n, c).
move(n, z, o).
move(o, p, i).
move(p, q, l).
move(q, z, ë).

% Accepting state
accepting_state(z).

go_over_automaton(ListtoCheck) :-
    % Call the other function, with the first state in the automaton which is A
    automatonCheck(ListtoCheck, a).

% Base case where the entire list has been seen. Check if it is an accepted state
automatonCheck([], InitialState) :-
    accepting_state(InitialState).

% If the list still has elements to go through
automatonCheck([Symbol | RestofList], InitialState) :-
    % Check if the Initial state and the symbol are connected in knowledge base
    move(InitialState, NextState, Symbol),
    % If they are then call the function again until base case
    automatonCheck(RestofList, NextState).