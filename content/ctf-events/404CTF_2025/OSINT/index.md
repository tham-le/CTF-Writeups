---
title: "OSINT-404CTF Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "OSINT"
difficulty: "Unknown"
points: 0
tags: ['osint']
author: "Tham Le"
solved: false
---

# OSINT-404CTF Writeup

## Analyse

Ce challenge est un challenge d'OSINT (Open Source Intelligence). Le seul fichier fourni est un fichier `.ctd`, qui est un format de fichier utilisé par le logiciel de cartographie mentale `CherryTree`.

L'objectif est de trouver des informations en utilisant des sources ouvertes (principalement Internet) en se basant sur les indices contenus dans le fichier `CherryTree`.

## Solution

1.  **Analyse du fichier `.ctd` :** La première étape est d'ouvrir le fichier `.ctd` avec `CherryTree` pour voir les informations qu'il contient. Il s'agit probablement d'un ensemble de notes, de liens, d'images, etc., qui sont le point de départ de l'enquête.

2.  **Enquête OSINT :** À partir des indices du fichier `CherryTree`, il faut mener une enquête en utilisant des techniques d'OSINT. Cela peut inclure :
    *   Des recherches Google avancées (dorking).
    *   La recherche sur les réseaux sociaux (Facebook, Twitter, LinkedIn, etc.).
    *   L'analyse de métadonnées d'images (EXIF).
    *   La recherche inversée d'images.
    *   L'exploration de sites web archivés (Wayback Machine).
    *   La recherche d'informations sur des personnes, des entreprises, des lieux, etc.

3.  **Résolution :** Le flag est probablement une information que l'on trouve à la fin de cette enquête, comme un nom, une date, un lieu, un mot de passe, etc.

> **Leçon apprise :** Les challenges d'OSINT nécessitent de la patience, de la méthode et une bonne connaissance des outils et techniques de recherche d'informations en sources ouvertes. Il est important de savoir comment croiser les informations et comment vérifier leur fiabilité.

## Outils

-   **CherryTree** pour lire le fichier `.ctd`.
-   Un navigateur web et des moteurs de recherche.
-   Des outils d'OSINT spécialisés (selon les besoins de l'enquête).
