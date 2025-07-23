---
title: "Apprenti Carver Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Analyse Forensique"
difficulty: "Intro"
points: 0
tags: ['forensique']
author: "Tham Le"
solved: true
---

# Apprenti Carver Writeup

## Analyse

Le challenge se présente sous la forme d'une machine virtuelle (VM) au format OVA. L'objectif est de retrouver deux flags. Le nom du challenge, "Apprenti Carver", suggère fortement qu'il faudra utiliser des techniques de récupération de fichiers supprimés (file carving).

## Solution

### Partie 1

La première partie est une introduction simple à l'analyse d'une machine.

1.  Après avoir importé la VM dans VirtualBox et l'avoir démarrée, on se connecte avec les identifiants fournis.
2.  On passe en utilisateur `root` avec la commande `su -` et le même mot de passe.
3.  La commande `history` dans le shell `root` révèle le premier flag, laissé par un précédent utilisateur.

> **Leçon apprise :** Une des premières choses à faire lors de l'analyse d'un système est de vérifier l'historique des commandes et les fichiers de configuration laissés par les utilisateurs. Il est aussi crucial de travailler sur un snapshot de la VM pour ne pas altérer les données originales.

### Partie 2

Pour la seconde partie, il faut récupérer un fichier image supprimé.

1.  L'outil `photorec` est parfait pour cela. Il est important de ne **jamais** écrire les fichiers récupérés sur le même disque que celui que l'on analyse, au risque d'écraser les données que l'on cherche.
2.  La méthode la plus sûre est de configurer un dossier partagé avec la machine hôte pour y sauvegarder les fichiers récupérés.
3.  On lance `photorec` en tant que `root`, on sélectionne le disque de la VM, on filtre pour ne chercher que les images (`png`, `jpg`), et on choisit le dossier partagé comme destination.
4.  Parmi les nombreux fichiers récupérés, on en trouve un qui est une image contenant le flag.

> **Leçon apprise :** Le file carving est une compétence essentielle en forensique. Des outils comme `photorec` ou la suite `Autopsy` sont des standards du domaine. La règle d'or est de ne jamais modifier la source originale.

## Outils

-   **VirtualBox** pour la gestion de la VM.
-   **testdisk/photorec** pour la récupération de fichiers.
