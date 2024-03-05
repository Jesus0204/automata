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
