---
title: "Gorfoustral Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "IA"
difficulty: "Unknown"
points: 0
tags: ['ia']
author: "Tham Le"
solved: false
---

# Gorfoustral Writeup

## Analyse

Ce challenge porte sur l'intelligence artificielle, et plus spécifiquement sur les modèles de langage (LLM) de type Transformer. Le challenge se compose de deux parties et nous est donné avec un environnement de développement `gym` (utilisé pour l'apprentissage par renforcement) et un notebook Jupyter de présentation.

L'objectif est de comprendre le fonctionnement interne d'un modèle de type Transformer pour en extraire des informations ou le manipuler.

## Solution

### Partie 1

La première partie consiste probablement à analyser l'architecture du Transformer et à comprendre comment il traite les données. Il faut probablement utiliser des techniques d'interprétabilité des modèles pour visualiser les poids d'attention et comprendre comment le modèle prend ses décisions.

### Partie 2

La deuxième partie est probablement plus complexe et pourrait impliquer une forme d'attaque sur le modèle, comme une attaque par injection de prompt (prompt injection) ou une attaque visant à extraire des données d'entraînement confidentielles (data extraction attack).

La solution implique probablement d'utiliser la bibliothèque `transformer_lens` (mentionnée dans le notebook) pour "disséquer" le modèle et comprendre son fonctionnement interne à un niveau très bas.

> **Leçon apprise :** Les challenges d'IA sont un domaine émergent en CTF. Ils nécessitent une bonne compréhension des concepts de base du machine learning et des architectures de modèles spécifiques (comme les Transformers). Les techniques d'interprétabilité et de sécurité des modèles d'IA sont des compétences de plus en plus importantes.

## Outils

-   **Python** et **Jupyter Notebook** pour l'expérimentation.
-   **PyTorch** ou **TensorFlow** (selon ce qu'utilise le challenge).
-   **Transformer Lens** pour l'analyse du modèle.
-   **Gym** pour l'environnement d'apprentissage par renforcement.
