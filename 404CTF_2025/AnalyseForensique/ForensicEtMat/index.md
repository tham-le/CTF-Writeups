---
title: "Forensic et Mat Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Analyse Forensique"
difficulty: "Facile"
points: 0
tags: ['forensique']
author: "Tham Le"
solved: true
---

# Forensic et Mat Writeup

## Analyse

Ce challenge se compose de deux parties, chacune basée sur l'analyse d'un fichier de logs d'événements Windows (`.evtx`).

## Solution

### Partie 1

Pour la première partie, il s'agit d'une simple exploration du fichier `Security.evtx`.

1.  On ouvre le fichier avec l'Observateur d'événements de Windows ou un outil équivalent sur Linux (comme `evtx_dump`).
2.  L'astuce est de ne pas se perdre dans la masse d'événements. En triant par ID d'événement, on peut se concentrer sur les événements les plus pertinents pour une investigation de sécurité (création d'utilisateur, modification de groupe, etc.).
3.  Le flag se trouve dans la description de l'un de ces événements.

### Partie 2

La deuxième partie est plus complexe car des événements ont été supprimés du fichier `CTFCORP_Security.evtx`.

1.  Même si un événement est supprimé, des traces peuvent subsister. Il faut examiner les détails de chaque événement, en particulier les informations qui ne sont pas affichées par défaut.
2.  En cherchant des événements liés à l'utilisateur `svc-x`, on trouve plusieurs événements suspects : l'ajout de l'utilisateur au groupe Administrateurs, la création d'une tâche planifiée suspecte, et une tentative échouée de suppression des journaux.
3.  Le flag est une concaténation d'informations provenant de ces trois événements. Il faut faire attention à la conversion des timestamps, qui ne sont pas au format Unix standard.

> **Leçon apprise :** L'analyse des journaux d'événements est une compétence fondamentale en forensique Windows. Il est important de savoir quels sont les ID d'événements les plus importants et de ne pas hésiter à fouiller dans les détails de chaque événement, même ceux qui semblent corrompus ou supprimés.

## Outils

-   **Observateur d'événements Windows** ou un équivalent pour l'analyse des fichiers `.evtx`.
-   Un convertisseur de timestamp en ligne.
