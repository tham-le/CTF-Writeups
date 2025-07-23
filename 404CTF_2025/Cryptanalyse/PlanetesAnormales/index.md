---
title: "Planètes Anormales Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Cryptanalyse"
difficulty: "Moyen"
points: 0
tags: ['crypto']
author: "Tham Le"
solved: true
---

# Planètes Anormales Writeup

## Analyse

Ce challenge est basé sur la cryptographie sur les courbes elliptiques (ECC). Le programme nous permet de choisir une courbe elliptique parmi une liste prédéfinie, ou d'utiliser une courbe "custom". Le programme génère ensuite une clé privée `d`, calcule le point public `P = d * G` (où `G` est le point générateur de la courbe), et chiffre le flag avec AES en utilisant `d` comme clé.

L'astuce est que l'on peut injecter notre propre nom de courbe, et le programme l'utilise pour créer une courbe personnalisée. La courbe personnalisée utilisée dans le challenge est une courbe elliptique "anormale".

## Solution

1.  **Injection de la courbe :** On peut injecter un nom de courbe qui n'est pas dans la liste des courbes sécurisées. Le programme utilise alors une courbe personnalisée, qui est vulnérable.

2.  **Courbe anormale :** La courbe utilisée est une courbe anormale, ce qui signifie que le nombre de points sur la courbe est égal au nombre premier `p` du corps fini. Cette propriété permet de résoudre le problème du logarithme discret (trouver `d` à partir de `P` et `G`) beaucoup plus facilement que sur une courbe standard.

3.  **Exploitation avec SageMath :** La bibliothèque `SageMath` est un outil très puissant pour les calculs mathématiques, y compris la cryptographie sur les courbes elliptiques. On peut utiliser SageMath pour :
    *   Définir la courbe elliptique anormale.
    *   Utiliser l'attaque sur les courbes anormales pour calculer la clé privée `d` à partir du point public `P` que le serveur nous donne.

4.  **Déchiffrement :** Une fois que l'on a la clé privée `d`, on peut déchiffrer le flag avec AES.

> **Leçon apprise :** La sécurité de la cryptographie sur les courbes elliptiques repose sur le choix de courbes robustes. Des courbes "spéciales" ou "anormales" peuvent être vulnérables à des attaques spécifiques. Il est important de comprendre les propriétés mathématiques des courbes que l'on utilise.

## Outils

-   **Python** pour l'interaction avec le serveur.
-   **SageMath** pour l'exploitation de la vulnérabilité de la courbe elliptique.
