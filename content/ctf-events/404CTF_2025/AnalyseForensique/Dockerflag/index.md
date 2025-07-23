---
title: "Dockerflag Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Analyse Forensique"
difficulty: "Facile"
points: 0
tags: ['forensique']
author: "Tham Le"
solved: true
---

# Dockerflag Writeup

## Analyse

Le challenge nous est donné sous la forme d'une archive `.tar` qui est un export d'une image Docker. Le but est de trouver un flag caché à l'intérieur.

## Solution

1.  On commence par charger l'image Docker avec la commande `docker load < dockerflag.tar`.
2.  Ensuite, on lance un conteneur à partir de cette image et on y ouvre un shell pour l'explorer : `docker run -it --rm <image_id> /bin/sh`.
3.  Une exploration rapide du conteneur ne révèle rien d'intéressant. Le fichier `.env` mentionné dans le code source de l'application est absent.
4.  L'astuce consiste à analyser les couches de l'image Docker. Une image Docker est composée de plusieurs couches (layers), et chaque couche représente une modification par rapport à la précédente. Un fichier ajouté puis supprimé peut encore exister dans une couche précédente.
5.  En décompressant l'archive `.tar`, on trouve plusieurs autres archives, une pour chaque couche de l'image. Dans l'une d'elles, on trouve un dossier `.git`.
6.  Après avoir extrait ce dossier `.git`, on peut utiliser les commandes `git` pour explorer l'historique des modifications. La commande `git log --stat` permet de voir les fichiers modifiés dans chaque commit.
7.  On repère un commit où un fichier `.env` a été supprimé. Il suffit alors de faire un `git checkout <commit_hash>^ -- .env` pour restaurer le fichier tel qu'il était avant ce commit.
8.  Le fichier `.env` ainsi restauré contient le flag.

> **Leçon apprise :** Les images Docker peuvent contenir des informations sensibles dans leurs différentes couches, même si elles ne sont pas visibles dans la version finale de l'image. Il est important de toujours analyser l'historique et les couches d'une image Docker lors d'une investigation.

## Outils

-   **Docker** pour la manipulation de l'image et du conteneur.
-   **Git** pour l'analyse de l'historique des modifications.
