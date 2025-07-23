---
title: "Reversconstrictor Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Reverse"
difficulty: "Unknown"
points: 0
tags: ['reverse']
author: "Tham Le"
solved: false
---

# Reversconstrictor Writeup

## Analyse

Le challenge est un binaire Linux, et son nom "Reversconstrictor" est un jeu de mots avec "constricteur" et "reverse". Cela suggère que le programme est compressé ou "packé" d'une manière ou d'une autre.

Le challenge est fourni avec des indices, notamment un script Python `chall.py` qui a probablement servi à générer le binaire.

## Solution

1.  **Analyse du packer :** Le script `chall.py` utilise probablement une technique pour compresser ou obfusquer le code original. Il faut analyser ce script pour comprendre comment le binaire a été généré. Il peut s'agir d'un packer simple (comme UPX) ou d'un packer personnalisé.

2.  **Décompression / Désobfuscation :** Une fois qu'on a compris le fonctionnement du packer, il faut l'inverser pour retrouver le binaire original. Si c'est un packer connu, il existe peut-être des outils pour le décompresser automatiquement. Sinon, il faudra scripter la décompression.

3.  **Analyse du binaire original :** Une fois le binaire original obtenu, on peut l'analyser comme un challenge de reverse engineering classique, en utilisant l'analyse statique et dynamique (Ghidra, gdb, etc.).

4.  **Résolution :** L'algorithme du binaire original est probablement une vérification de mot de passe ou un chiffrement simple. Il faut le comprendre et l'inverser pour trouver le flag.

> **Leçon apprise :** Les packers sont souvent utilisés pour rendre le reverse engineering plus difficile. Savoir comment les identifier et les défaire est une compétence importante. L'analyse du code qui a généré le binaire (quand il est disponible) est un avantage considérable.

## Outils

-   **Python** pour analyser le script de packing et potentiellement le décompresser.
-   Des outils d'analyse de packers comme **Detect It Easy (DIE)**.
-   **Ghidra**, **IDA Pro**, **gdb** pour l'analyse du binaire décompressé.
