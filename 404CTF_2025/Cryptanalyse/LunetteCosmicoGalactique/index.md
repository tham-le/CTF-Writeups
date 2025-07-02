---
title: "Lunette Cosmico-Galactique Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Cryptanalyse"
difficulty: "Difficile"
points: 0
tags: ['crypto']
author: "Tham Le"
solved: true
---

# Lunette Cosmico-Galactique Writeup

## Analyse

Ce challenge combine une vulnérabilité dans un générateur de nombres pseudo-aléatoires (LCG - Linear Congruential Generator) et une cryptanalyse RSA.

Le serveur nous permet d'obtenir des nombres premiers générés par un LCG, ou d'obtenir un flag chiffré avec RSA. Les clés RSA sont générées à partir des nombres premiers issus du même LCG. La graine du LCG est réinitialisée si on demande le flag chiffré.

## Solution

La résolution se fait en plusieurs étapes :

1.  **Récupération des informations :** On se connecte au serveur pour obtenir le flag chiffré (et donc les modules RSA `n1` et `n2`, et les chiffrés `c1` et `c2`). Ensuite, on demande au serveur de nous donner trois nombres premiers consécutifs générés par le LCG.

2.  **Attaque du LCG :** Le LCG est de la forme `X_n+1 = (a * X_n + b) % M`. Les paramètres `a`, `b` et la graine `seed` sont inconnus. Cependant, si on connaît trois états consécutifs du LCG (`X_n`, `X_n+1`, `X_n+2`), on peut retrouver `a` et `b`. Le problème est que le serveur nous donne des nombres premiers, pas les états bruts du LCG. Un état `X_i` est utilisé pour trouver un nombre premier `p_i` en incrémentant `X_i` jusqu'à tomber sur un nombre premier. On peut donc bruteforcer les quelques valeurs entre `p_i` et le nombre premier précédent pour retrouver `X_i`.

3.  **Retrouver la graine :** Une fois `a` et `b` connus, on peut inverser le LCG pour retrouver la graine originale. Il faut inverser 4 fois pour retrouver la graine utilisée pour générer les clés RSA du flag.

4.  **Factorisation et déchiffrement :** Avec la graine, on peut regénérer les nombres premiers `p1`, `q1`, `p2`, `q2` qui ont servi à créer les clés RSA. On peut alors calculer les clés privées et déchiffrer le flag.

> **Leçon apprise :** Les LCG sont connus pour être cryptographiquement faibles. Une connaissance de leur fonctionnement et des attaques classiques est essentielle. Ce challenge montre aussi comment des vulnérabilités dans des composants à priori non liés (un LCG et RSA) peuvent être combinées pour une attaque complète.

## Outils

-   **Python** pour le script d'interaction avec le serveur et la résolution.
-   La bibliothèque **PyCryptodome** pour les opérations RSA.
