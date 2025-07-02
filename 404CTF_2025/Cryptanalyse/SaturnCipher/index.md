---
title: "Saturn Cipher Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Cryptanalyse"
difficulty: "Moyen"
points: 0
tags: ['crypto']
author: "Tham Le"
solved: true
---

# Saturn Cipher Writeup

## Analyse

Le challenge implémente une version simplifiée d'AES. Le chiffrement consiste en 1337 tours d'une fonction qui applique un XOR avec une clé, une substitution via une S-box, et une permutation via une P-box. La clé, la S-box et la P-box sont inconnues.

Nous avons accès à un serveur qui peut chiffrer des données pour nous (attaque à texte clair choisi), mais avec un nombre de requêtes limité.

## Solution

L'observation clé est que chaque octet du texte clair est chiffré indépendamment des autres et se retrouve toujours à la même position dans le texte chiffré. Cela réduit considérablement la complexité de l'attaque.

1.  **Déterminer la taille du flag :** On envoie des textes clairs de différentes tailles au serveur. Le padding étant constant, on peut facilement repérer la taille qui a le plus d'octets en commun avec le flag chiffré, ce qui nous donne la taille du flag.

2.  **Attaque par octet :** Puisque chaque octet est chiffré indépendamment, on peut se concentrer sur un seul octet à la fois. Pour chaque position `i` dans le flag, on veut trouver l'octet `c` du texte clair original.

3.  Pour cela, on envoie au serveur un texte clair composé uniquement de l'octet que l'on veut tester, répété sur toute la longueur du flag (par exemple, `b'\x00\x00\x00...'`). On compare l'octet à la position `i` dans le chiffré retourné avec l'octet à la même position dans le flag chiffré. Si les deux octets sont identiques, alors l'octet que l'on a testé est le bon octet en clair pour cette position.

4.  On répète ce processus pour chaque position et pour chaque valeur d'octet possible (de 0 à 255) jusqu'à retrouver tout le flag.

> **Leçon apprise :** Même des algorithmes de chiffrement qui semblent complexes peuvent être vulnérables si leur conception présente des faiblesses. L'indépendance du chiffrement de chaque octet est ici la faille critique. Les attaques à texte clair choisi sont très puissantes, surtout quand on peut observer directement l'impact d'une modification du clair sur le chiffré.

## Outils

-   **Python** pour le script d'attaque.
