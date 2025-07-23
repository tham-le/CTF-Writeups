---
title: "Pix2Num Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Divers"
difficulty: "Unknown"
points: 0
tags: ['misc']
author: "Tham Le"
solved: false
---

# Pix2Num Writeup

## Analyse

Le challenge nous donne une image et un script Python `encrypt.py`. Le script `encrypt.py` prend un nombre, le convertit en une image, et le sauvegarde. Le but est d'inverser ce processus pour retrouver le nombre original à partir de l'image fournie.

Le script de chiffrement fonctionne comme suit :

1.  Il prend un nombre et le convertit en une chaîne de caractères binaire.
2.  Il crée une image carrée dont la taille dépend de la longueur de la chaîne binaire.
3.  Il parcourt les pixels de l'image et modifie la composante bleue de chaque pixel pour y stocker un bit de la chaîne binaire. Si le bit est '1', la composante bleue est impaire, sinon elle est paire.

## Solution

La solution consiste à inverser le processus de "chiffrement".

1.  On ouvre l'image avec une bibliothèque de traitement d'images comme `Pillow` en Python.
2.  On parcourt les pixels de l'image dans le même ordre que le script de chiffrement.
3.  Pour chaque pixel, on examine la composante bleue. Si elle est impaire, on ajoute un '1' à notre chaîne binaire, sinon on ajoute un '0'.
4.  Une fois qu'on a parcouru tous les pixels, on a la chaîne binaire complète. On la convertit en un entier, ce qui nous donne le nombre original.

> **Leçon apprise :** Ce challenge est un exemple de stéganographie simple, où des informations sont cachées dans les bits de poids faible des pixels d'une image (LSB steganography). C'est une technique classique qu'il est bon de connaître.

## Outils

-   **Python** pour le script de déchiffrement.
-   **Pillow** (PIL) pour la manipulation d'images en Python.
