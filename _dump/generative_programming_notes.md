# Generative Programming

## p.2
... (1) design the implementation components to fit a common product-line architecture, 
    (2) model the configuration knowledge stating how to translate abstract requirements into specific constellations of components, and
    (3) implement the configuration knowledge using generators

## p.5
### Definition of Generative Programming

Generative Programming is a software engineering paradigm, based on modeling software system families such that, given a particular requirements specification, a highly customized and optimized intermediate or end-product can be automatically manufactured on demand from elementary, reusable implementation components by means of configuration knowledge.

### generative domain model
model of a system family with three elements:
1. specified family members
1. implementation components
    each member can be assembled from them
1. configuration knowledge
    mapping betwween a specification of a member and a finished member

- the terminology used to specify a family member is called the **problem space**
- implementation components with their possible configurations form the **solution space**
 see Figure 1.2

## p.11
### Generators

An example of metaprograms are generators, which take a high-level specification of a system and produce its implementation.

## p.12
### three approachs of building generators

1. from scratch
1. use built-in metaprogramming capabilities of programming languages
    - template metaprogramming
1. extendible programming environments
    - use all advantages of programming language, debugging, syntax check etc.

## p.13
### automatic programming != generative programming

- automatic programming aims only for the highest level of automation
- also involves usually artifical intelligence techniques
- requires huge amounts domain knowledge, even for medium-sized problems

## p.721 ff -- Conceptual Modeling

- we describe concepts by listing their properties
    - distinction by Smith and Medin:
        - features
        - dimensions
- problem, description of natural concepts is often inpossible

### concepts, see figure A-4 p. 729

- probabilistic semantic network (p. 728)
- exemplar representation (p. 729)
- classical view

## p. 20
### Domain Engineering (definition)

Domain Engineering ist the activity of collecting, organizing and storing past experience in building systems or parts of systems in a particular domain int he form of reusable assets (i.e. reusable work products), as well as providing an dequate means for reusing these assets (i.e. retrival, qualification, dissemination, adaptation, assembly and so on) when building new systems.

## p. 21
### difference between domain engineering and software engineering

- conventional software engineering concentrates on satisfying the requirements for a single system
- domain engineering concentrates on providing **reusable** solutions for a family of systems

## p.22
### Three main concepts of domain engineering

- domain analysis
- domain design
- domain implementation

## p. 23
### domain model

- Domain definition: 
    - scope of domain
    - characterise its contents (examples of existing systems in the domain)
    - counterexamples
    - inclusion, exclusion
    - rationale for for including, excluding any given system or capability 
- Domain lexicon: 
    - domain vocabulary
- Domain models:
    - describing concepts in some appropriate modeling formalism
        - state diagrams
        - object diagrams
        - ER-diagrams
        - ...
- Feature models:
    - describes which combinations of features are meaningful

## p. 25
### common domain analysis acitvities

table 2-2

## p. 57
### comparision between software engineering and domain engineering
- requirements analysis | domain analysis
- system design | domain design
- system implementation | domain implementation

## p. 62
### deficiencies of traditional object oriented analysis and design

- No distinction between engineering for reuse and engineering with reuse
    - for reuse: Domain Engineering
    - with reuse: Application Engineering
- no domain scoping phase
- no differentiation between modeling variability within one application and between several applications
- no implementation-independent means of variability modeling

