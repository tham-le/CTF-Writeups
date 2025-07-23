---
title: "Cbizarre2-2 Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Reverse"
difficulty: "Unknown"
points: 0
tags: ['reverse']
author: "Tham Le"
solved: false
---

# Cbizarre2-2 Writeup

## Analyse

Le challenge est un binaire Linux. Le nom "Cbizarre" suggère qu'il est écrit en C et qu'il a un comportement étrange. L'objectif est de comprendre ce que fait le programme et de trouver le flag.

## Solution

1.  **Analyse statique :** La première étape est d'analyser le binaire avec des outils comme `file`, `strings`, et un désassembleur comme `Ghidra` ou `IDA Pro`.
    *   `file` nous donnera des informations sur le type de binaire (32-bit, 64-bit, etc.).
    *   `strings` peut révéler des chaînes de caractères intéressantes, comme des messages d'erreur, des noms de fonctions, ou même le flag.
    *   `Ghidra` ou `IDA Pro` nous permettront de désassembler le code et de l'analyser en détail.

2.  **Analyse dynamique :** On peut exécuter le programme dans un débogueur comme `gdb` pour voir son comportement en temps réel. On peut mettre des points d'arrêt, examiner la mémoire et les registres, et suivre l'exécution pas à pas.

3.  **Compréhension de l'algorithme :** En combinant l'analyse statique et dynamique, on peut comprendre l'algorithme du programme. Il s'agit probablement d'une vérification de mot de passe ou d'un algorithme de chiffrement. Le comportement "bizarre" pourrait être une technique d'anti-debugging ou d'obfuscation.

4.  **Résolution :** Une fois l'algorithme compris, on peut soit trouver le bon input qui donne le flag, soit inverser l'algorithme pour le retrouver.

> **Leçon apprise :** Le reverse engineering de binaires est un processus itératif qui combine l'analyse statique et dynamique. La patience et la méthode sont essentielles. La connaissance de l'assembleur et du fonctionnement des systèmes d'exploitation est un plus.

## Outils

-   **file**, **strings** pour une première analyse.
-   **Ghidra** ou **IDA Pro** pour l'analyse statique.
-   **gdb** pour l'analyse dynamique.
