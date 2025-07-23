---
title: "SpaceRadio Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "SecuriteMaterielle"
difficulty: "Unknown"
points: 0
tags: ['hardware']
author: "Tham Le"
solved: false
---

# SpaceRadio Writeup

## Analyse

Ce challenge de sécurité matérielle nous donne un fichier `chall.iq`. Les fichiers `.iq` contiennent des données I/Q (In-phase and Quadrature), qui sont une représentation des signaux radio. Le nom "SpaceRadio" confirme qu'il s'agit d'analyser un signal radio.

L'objectif est de démoduler le signal et d'extraire les informations qu'il contient, probablement le flag.

## Solution

1.  **Analyse du signal :** On utilise un logiciel de radio logicielle (SDR) comme `GQRX` ou un outil d'analyse de signaux comme `Inspectrum` pour visualiser le signal I/Q. On peut ainsi déterminer le type de modulation (AM, FM, ASK, FSK, PSK, etc.), le débit de symboles (baud rate), et d'autres paramètres du signal.

2.  **Démodulation :** Une fois les paramètres du signal connus, on peut utiliser un outil comme `GNU Radio Companion` pour créer un diagramme de flux qui démodule le signal. Le diagramme de flux prendra en entrée le fichier `.iq` et sortira les données démodulées.

3.  **Extraction du flag :** Les données démodulées peuvent être sous forme de bits, de caractères ASCII, ou d'un autre format. Il faut les analyser pour retrouver le flag.

> **Leçon apprise :** L'analyse de signaux radio est un domaine fascinant de la sécurité. La connaissance des différents types de modulation et l'utilisation d'outils comme GNU Radio sont des compétences clés. La patience et l'expérimentation sont nécessaires pour trouver les bons paramètres de démodulation.

## Outils

-   **GQRX**, **Inspectrum**, ou **Universal Radio Hacker (URH)** pour l'analyse du signal.
-   **GNU Radio Companion** pour la démodulation.
-   **Python** pour le traitement des données démodulées.
