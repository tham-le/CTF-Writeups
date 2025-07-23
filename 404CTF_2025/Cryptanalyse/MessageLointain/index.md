---
title: "Message Lointain Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Cryptanalyse"
difficulty: "Intro"
points: 0
tags: ['crypto']
author: "Tham Le"
solved: true
---

# Message Lointain Writeup

## Analyse

Le challenge nous donne un message chiffré et le code Python qui a servi à le chiffrer. Il s'agit d'un chiffrement par substitution monoalphabétique. Chaque caractère du message original est remplacé par un autre caractère, et le même caractère original donnera toujours le même caractère chiffré.

La fonction de chiffrement est la suivante : pour chaque caractère `c` du message, on prend son index `x` dans un alphabet `charset`, on calcule `y = 2^x mod (n+1)` où `n` est la taille de l'alphabet, et le caractère chiffré est celui à l'index `y` dans `charset`.

## Solution

Puisqu'il s'agit d'un chiffrement par substitution monoalphabétique et que nous connaissons l'algorithme de chiffrement, la solution est simple :

1.  On crée une table de correspondance (un dictionnaire Python) qui associe chaque caractère chiffré au caractère original.
2.  Pour cela, on chiffre tous les caractères de l'alphabet `charset` avec la fonction fournie, et on stocke les correspondances.
3.  Ensuite, on parcourt le message chiffré, et pour chaque caractère, on cherche son équivalent en clair dans notre table de correspondance.

> **Leçon apprise :** Les chiffrements par substitution monoalphabétique sont les plus simples à casser, surtout quand on connaît l'alphabet et l'algorithme. La première étape est toujours de construire la table de substitution inverse.

## Outils

-   **Python** pour le script de déchiffrement.
