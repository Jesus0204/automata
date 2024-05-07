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

Now according to Geeks for Geeks (2023), a Finite Automaton is the simplest way to recognize patterns, and there are two types of automaton, which are DFA and NFA. A DFA, also known as Deterministic Finite Automata, can only go to one state for a particular input. This means for example, that if the input is the letter *n*, there is only a single state to go to for the letter *n*. On the other hand, a Nondeterministic Finite Automata has two key differences. The first is that Null inputs are accepted, as well that a single input can lead to different states. If the same letter n is given as input, then several states could be followed. 

Considering all of this, I decided to use a *DFA* since my endgame is to only accept these five words as valid and no others. A single path for each of the words can be followed, and there is no need to implement an NFA. Also, an NFA tends to be ambiguous, which would make it harder to implement. A DFA is often easier to implement, and it suits the language and case that I am analyzing, which is why the DFA was chosen. 

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
```prolog
move(initial_state, next_state, symbol).
```

There is also an additional rule which is the accepted state. My automaton only has one accepted state, so if it had several there would be several instances of this rule: 
```prolog
accepting_state(z).
```

The rest of the code has a helper rule which calls the recursive rule, 
```prolog
go_over_automaton(ListtoCheck) :-
```

as well as the base rule,
```prolog
automatonCheck([], InitialState) :-
```

and the recursive rule:
```prolog
automatonCheck([Symbol | RestofList], InitialState) :-
```

All of these rules and the knowledge base are found in the file ```elvish.pl```. If the word is in the language it returns true otherwise, it returns false.

## Test
To run the program, first open ```elvish.pl``` in Prolog or a prolog terminal. To open the file, you must run ["route to the file/elvish.pl"].

### Successful tests
Below are several tests which should return true, since they are the words that were defined in the automaton and the language:
1. ```tengwa.```
2. ```tinco.```
3. ```tuilë.```
4. ```thalias.```
5. ```thalin.```

### Unsuccessful tests
Below are other words which are very similar to the words in the language, but which are not in the language. If the words are run, prolog will return false:
1. ```tengwe.```
2. ```hello.```
3. ```thalian.```
4. ```tuile.```
5. ```thale.```

The tests themselves have the expected result and the result that Prolog gives. It is important to mention that these functions underneath have something similar to this command: ```go_over_automaton([t, e, n, g, w, a]).```. This means that if you want to run a word different from the above words, run ```go_over_automaton([word-to-check]).``` where **word-to-check** is the word put in letters, and each letter is separated with a comma. 

Example: 
To test the word **computer**, you need to run the following command: 
 ```go_over_automaton([c, o, m, p, u, t, e, r]).```

## Analysis

### Time Complexity
Since the program uses recursion and iterates over the knowledge base (by checking each fact once) it assimilates a for a loop. The base case of the recursion is reached when the list in the program is empty, and no additional operation is performed, so it is safe to say that the program has an asymptotic time of O(n). There is no nested "loop", and no matter how many facts are in the knowledge base, it will always iterate over each once, so in that aspect, it is safe to say that the solution to the program is efficient. 

## References
Geeks for Geeks. (June 27, 2023). Introduction of Finite Automata. https://www.geeksforgeeks.org/introduction-of-finite-automata/

LOTR Fandom. (n.d.). Elvish word list. https://lotr.fandom.com/wiki/Elvish_word_list

Wikipedia. (January 19, 2024). Quenya. https://en.wikipedia.org/wiki/Quenya
