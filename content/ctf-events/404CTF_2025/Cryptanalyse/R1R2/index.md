---
title: "R1R2 Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Cryptanalyse"
difficulty: "Facile"
points: 0
tags: ['crypto']
author: "Tham Le"
solved: true
---

# R1R2 Writeup

## Analyse

Le challenge chiffre un mot de passe en le divisant en deux parties (caractères pairs et impairs), `b` et `c`. Il calcule ensuite `d = b + c` et `e = b * c`. Puis, il génère trois paires de nombres `(x, y)` où `y = x^2 - d*x + e`. Ces paires sont ensuite encodées dans un format binaire spécifique.

## Solution

L'objectif est d'inverser ce processus pour retrouver le mot de passe original.

1.  **Extraction des données :** On commence par parser le chiffré pour extraire les trois paires `(x, y)`.

2.  **Retrouver `d` et `e` :** On a un système de deux équations à deux inconnues (`d` et `e`) :
    *   `y1 = x1^2 - d*x1 + e`
    *   `y2 = x2^2 - d*x2 + e`

    En soustrayant les deux équations, on élimine `e` et on peut calculer `d`. Ensuite, on peut facilement calculer `e`.

3.  **Retrouver `b` et `c` :** On a `d = b + c` et `e = b * c`. C'est un système d'équations du second degré. On peut le résoudre pour trouver `b` et `c`. On sait que `b > c`, ce qui nous permet de choisir la bonne solution.

4.  **Reconstruction du mot de passe :** Une fois `b` et `c` retrouvés, on les convertit en chaînes de caractères et on les entrelace pour reconstruire le mot de passe original.

> **Leçon apprise :** Ce challenge est un bon exemple de la façon dont des concepts mathématiques de base (résolution de systèmes d'équations) peuvent être appliqués à la cryptanalyse. Il montre aussi l'importance de bien comprendre comment les données sont encodées et structurées.

## Outils

-   **Python** pour le script de déchiffrement.
