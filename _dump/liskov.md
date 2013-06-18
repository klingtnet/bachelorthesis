# Liskov Substitution Principle

(Agile Design Principles - The Liskov Substitution Principle)[http://www.engr.mun.ca/~theo/Courses/sd/5895-downloads/sd-principles-3.ppt.pdf]

> “If S is a declared subtype of T, objects of type S should behave as objects of type T are expected to behave, if they are treated as objects of type T”

- object of type T1 with a set of properties
- an object of type T2 can be substituted iff it also conforms to those properties

# Typ-Rekonstruktion

## Hindley-Miller

[What is Hindley-Miller? (and why is it so cool)](http://www.codecommit.com/blog/scala/what-is-hindley-milner-and-why-is-it-cool)

> Functionally speaking, Hindley-Milner (or “Damas-Milner”) is an algorithm for inferring value types based on use.  It literally formalizes the intuition that a type can be deduced by the functionality it supports. 
