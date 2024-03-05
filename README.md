# Evidence: 1 Implementation of Lexical Analysis
Jesús Alejandro Cedillo Zertuche A01705442

## Description
The language that I chose is the elven language (also called Quenya) which according to Wikipedia (2024) "is a constructed language, one of those devised by J. R. R. Tolkien for the Elves in his Middle-earth fiction." Tolkien based the language on Finnish, Latin, and Old English.

The words that I chose to model are specifically these 5 words: 
1. Tengwa - Quenya word for 'Letter', plural form "Tengwar" means 'Letters'.
2. Tinco - metal
3. Tuilë - Quenya word for "spring"
4. Thalias - Bravery
5. Thalin - Dauntless

I decided to use a *DFA* since my endgame is to only accept these five words as valid and no others, and it is quite easier to implement and ensure that no other words are accepted.

## Models
I only decided to generate one automaton for this language, since the following automaton represents the five words in the language. It is important to mention that the automaton is only valid for the following alphabet: 

$\sum_{} = {a, c, e, ë, g, h, i, l, n, o, s, T, u, w}$

Any other character not in the alphabet, and not explicitly in the automaton (within an arc) is not accepted.

Here is the automaton that I designed: 
![Automata Elvish](https://github.com/Jesus0204/automata/blob/main/Automata%20Elvish.png)

The automaton is also equivalent to the following regular expression

(^ $T)((hali (as|n))|(inco)|(engwa)|(uilë))$

## Implementation
For me to implement my lexical analysis I used the automaton to create a Knowledge base in Prolog. The knowledge base has the initial state, the next state, and the symbol that moves from one state to the other. This is modeled in the following way: 

```
move(initial_state, next_state, symbol).
```

There is also an additional rule which is the accepted state. My automaton only has one accepted state, so if it had several there would be several instances of this rule. 

```
accepting_state(z).
```

The rest of the code has a helper rule which calls the recursive rule called ```go_over_automaton(ListtoCheck)``` as well as the base rule ```automatonCheck([], InitialState)``` and the recursive rule ```automatonCheck([Symbol | RestofList], InitialState)```.

All of these rules and the knowledge base are found in the file ```elvish.pl```. If the word is in the language it returns true otherwise, it returns false.

## Test
To run the program, first open ```elvish.pl``` in Prolog or a prolog terminal.  
Below are several tests to test the program and see if a certain word is found in the language:
1. ```go_over_automaton([t, e, n, g, w, a]).```
2. ```go_over_automaton([t, e, n, g, w, e]).```
3. ```go_over_automaton([h, e, l, l, o]).```
4. ```go_over_automaton([t, i, n, c, o]).```
5. ```go_over_automaton([t, h, a, l, i, n]).```
6. ```go_over_automaton([t, h, a, l, i, a, s]).```
7. ```go_over_automaton([t, h, a, l, i, a, n]).```
8. ```go_over_automaton([t, u, i, l, ë]).```
9. ```go_over_automaton([t, u, i, l, e]).```
10. ```go_over_automaton([t, h, a, l, e]).```

The tests are also found in the file ```elvish_test.pl```.

## Analysis

## References
LOTR Fandom. (n.d.). Elvish word list. https://lotr.fandom.com/wiki/Elvish_word_list

Wikipedia. (January 19, 2024). Quenya. https://en.wikipedia.org/wiki/Quenya
