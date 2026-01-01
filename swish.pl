% ==============================
% tp- prolog Marie Paule Yvette
% ==============================

:- discontiguous couleur/2.
:- discontiguous mange/2.

% --- Partie 1 : Faits ---
couleur(pomme, rouge).
couleur(ballon, bleu).
couleur(citron, jaune).
couleur(carotte, orange).

mange(romain, pomme).
mange(lea, citron).
mange(sarah, pomme).
mange(bob, carotte).
mange(claire, banane).

type(pomme, fruit).
type(citron, fruit).
type(banane, fruit).

% --- Partie 2 : Règles ---
aime(X, Y) :- mange(X, Y).

aime_fruit(P) :- 
    mange(P, F),
    type(F, fruit).

meme_couleur(X, Y) :- 
    couleur(X, C),
    couleur(Y, C),
    X \= Y.

aiment_la_meme_chose(A, B) :- 
    mange(A, X),
    mange(B, X),
    A \= B.

% --- Partie 3 : Listes ---
longueur([], 0).
longueur([_|T], N) :- 
    longueur(T, N1),
    N is N1 + 1.

somme([], 0).
somme([H|T], S) :- 
    somme(T, S1),
    S is H + S1.

% --- Partie 4 : Famille ---
homme(pierre).  homme(luc).  homme(andre).
femme(marie).  femme(sara).

parent(pierre, luc).
parent(marie, luc).
parent(andre, pierre).
parent(sara, marie).

pere(P, E) :- homme(P), parent(P, E).
mere(M, E) :- femme(M), parent(M, E).
grand_parent(GP, E) :- parent(GP, X), parent(X, E).

ancetre(A, E) :- parent(A, E).
ancetre(A, E) :- parent(A, X), ancetre(X, E).

frere_ou_soeur(A, B) :- parent(P, A), parent(P, B), A \= B.

% --- Partie 5 : Logique ---
membre(X, [X|_]).
membre(X, [_|T]) :- membre(X, T).

max_liste([X], X).
max_liste([H|T], Max) :- 
    max_liste(T, MaxT),
    (H > MaxT -> Max = H ; Max = MaxT).
