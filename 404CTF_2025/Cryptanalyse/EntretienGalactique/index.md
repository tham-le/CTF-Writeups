---
title: "Entretien Galactique Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Cryptanalyse"
difficulty: "Facile"
points: 0
tags: ['crypto']
author: "Tham Le"
solved: true
---

# Entretien Galactique Writeup

## Analyse

Le challenge nous demande de résoudre 100 fois de suite un système de trois équations à trois inconnues, en moins de 5 secondes à chaque fois. Les équations sont de la forme :

-   x + y + z = A
-   x² + y² + z² = B
-   x³ + y³ + z³ = C

Où A, B et C sont des constantes données par le serveur.

## Solution

Il s'agit d'un problème mathématique classique. La résolution manuelle est fastidieuse et trop lente pour le temps imparti. Il faut donc scripter la solution.

La bibliothèque Python `sympy` est parfaite pour la résolution symbolique de systèmes d'équations. On peut définir les inconnues `x`, `y`, `z` comme des symboles et passer les trois équations à la fonction `solve` de `sympy`.

Le script se connecte au serveur, parse les valeurs de A, B et C, résout le système avec `sympy`, et envoie la solution au serveur. Ce processus est répété 100 fois.

> **Leçon apprise :** Pour les challenges de cryptographie basés sur des problèmes mathématiques, il est souvent plus simple et rapide d'utiliser une bibliothèque de calcul formel comme `sympy` plutôt que de tenter de réimplémenter les algorithmes de résolution.

## Outils

-   **Python** pour le script de résolution.
-   **Sympy** pour la résolution du système d'équations.
