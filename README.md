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
![Automata Elvish](https://github.com/Jesus0204/automata/assets/65917649/10d7da60-1f07-424a-a12a-ee8363f18f0d)

The automaton is also equivalent to the following regular expression

$(^^T)((hali (as|n))|(inco)|(engwa)|(uilë))$

## Implementation

## Test

## Analysis

## References
LOTR Fandom. (n.d.). Elvish word list. https://lotr.fandom.com/wiki/Elvish_word_list

Wikipedia. (January 19, 2024). Quenya. https://en.wikipedia.org/wiki/Quenya
