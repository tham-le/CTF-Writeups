---
title: "USB 51 Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Analyse Forensique"
difficulty: "Intro"
points: 0
tags: ['forensique']
author: "Tham Le"
solved: true
---

# USB 51 Writeup

## Analyse

Le challenge est une capture de trafic réseau (`.pcapng`) contenant des trames USB. Le nom "USB 51" est un jeu de mots avec la Zone 51, suggérant que quelque chose de secret a été transmis.

## Solution

1.  On ouvre la capture avec Wireshark.
2.  L'astuce ici est de ne pas se noyer dans les détails des paquets USB. Un tri par taille de paquet (`Length`) fait immédiatement ressortir un paquet beaucoup plus gros que les autres.
3.  En examinant le contenu de ce paquet, on voit des données qui ressemblent à un en-tête de fichier PDF (`%PDF-`).
4.  On peut extraire les données brutes de ce paquet (clic droit -> "Exporter les octets du paquet") et les enregistrer dans un fichier avec l'extension `.pdf`.
5.  Le fichier PDF ainsi créé contient des informations sur un projet, ainsi qu'une chaîne de caractères en binaire. La conversion de cette chaîne binaire en texte donne le flag.

> **Leçon apprise :** L'analyse de trafic USB peut être complexe, mais il faut souvent commencer par chercher des anomalies évidentes, comme des paquets de taille inhabituelle. Wireshark est un outil extrêmement puissant qui permet d'extraire facilement des données de n'importe quel type de trafic.

## Outils

-   **Wireshark** pour l'analyse de la capture réseau.
