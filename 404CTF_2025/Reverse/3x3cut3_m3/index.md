---
title: "3x3cut3_m3 Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Reverse"
difficulty: "Unknown"
points: 0
tags: ['reverse']
author: "Tham Le"
solved: false
---

# 3x3cut3_m3 Writeup

## Analyse

Le challenge est un script PowerShell obfusqué. Le nom "3x3cut3_m3" (execute me) est un indice. L'objectif est de comprendre ce que fait le script et de retrouver le flag.

## Solution

1.  **Désobfuscation :** La première étape est de désobfusquer le script PowerShell. Il existe plusieurs techniques pour cela :
    *   **Analyse manuelle :** Remplacer les noms de variables obfusqués, réindenter le code, et essayer de comprendre la logique pas à pas.
    *   **Désobfuscation dynamique :** Exécuter le script dans un environnement contrôlé (une VM Windows) et utiliser les outils de débogage de PowerShell pour voir ce qu'il fait en temps réel.
    *   **Outils automatisés :** Il existe des outils qui peuvent aider à désobfusquer les scripts PowerShell.

2.  **Analyse du code désobfusqué :** Une fois le script plus lisible, on peut analyser son fonctionnement. Il s'agit probablement d'un algorithme de chiffrement ou d'encodage simple qui manipule une chaîne de caractères pour produire le flag.

3.  **Inversion de l'algorithme :** Après avoir compris l'algorithme, il faut l'inverser pour retrouver le flag à partir de la chaîne de caractères chiffrée (qui est probablement dans le script lui-même).

> **Leçon apprise :** L'obfuscation de scripts (PowerShell, JavaScript, etc.) est une technique courante utilisée par les attaquants pour masquer leurs intentions. Savoir comment désobfusquer ces scripts est une compétence essentielle en reverse engineering et en analyse de malwares.

## Outils

-   **Windows PowerShell ISE** ou **Visual Studio Code** avec l'extension PowerShell pour l'analyse statique.
-   Une machine virtuelle Windows pour l'analyse dynamique.
-   Des outils de désobfuscation PowerShell.
