---
title: "You Spin Me Round Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Cryptanalyse"
difficulty: "Moyen"
points: 0
tags: ['crypto']
author: "Tham Le"
solved: true
---

# You Spin Me Round Writeup

## Analyse

Ce challenge est un autre exemple de cryptographie sur les courbes elliptiques. Le programme nous donne un point public `P` sur une courbe, et le flag chiffré avec une clé dérivée de la coordonnée `x` de `P`. Le point `P` est le résultat d'une multiplication scalaire `d * G`, où `d` est la clé privée et `G` est le point générateur.

La vulnérabilité ici est que la courbe est définie sur un corps fini `GF(p)`, où `p` est un nombre premier de la forme `2^k - c` pour un petit `c`. De plus, l'ordre de la courbe est un nombre premier, ce qui la rend vulnérable à une attaque de type "Smart's attack".

## Solution

L'attaque de Smart est une attaque sur le problème du logarithme discret sur les courbes elliptiques (ECDLP) pour certaines courbes spécifiques.

1.  **Identifier la vulnérabilité :** On reconnaît que la courbe est vulnérable à l'attaque de Smart en examinant les paramètres de la courbe, en particulier la forme du nombre premier `p`.

2.  **Appliquer l'attaque de Smart :** L'attaque de Smart permet de transformer le problème du logarithme discret sur la courbe elliptique en un problème de logarithme discret dans un corps fini, qui est beaucoup plus facile à résoudre. La bibliothèque `SageMath` implémente cette attaque.

3.  **Calcul de la clé privée :** On utilise `SageMath` pour appliquer l'attaque de Smart et retrouver la clé privée `d`.

4.  **Déchiffrement :** Une fois `d` connue, on peut recalculer le point `P`, prendre sa coordonnée `x`, et l'utiliser comme clé pour déchiffrer le flag.

> **Leçon apprise :** Encore une fois, le choix des paramètres de la courbe elliptique est crucial pour sa sécurité. Des courbes qui semblent robustes à première vue peuvent être vulnérables à des attaques spécifiques si leurs paramètres ont des propriétés mathématiques particulières. La connaissance de ces attaques est essentielle pour un cryptanalyste.

## Outils

-   **SageMath** pour l'implémentation de l'attaque de Smart.
