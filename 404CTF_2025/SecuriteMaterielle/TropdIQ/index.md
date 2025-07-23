---
title: "TropdIQ Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "SecuriteMaterielle"
difficulty: "Unknown"
points: 0
tags: ['hardware']
author: "Tham Le"
solved: false
---

# TropdIQ Writeup

## Analyse

Similaire au challenge "SpaceRadio", "TropdIQ" nous donne un fichier `chall.iq`. Le nom est un jeu de mots sur "Trop d'IQ" (trop de QI / trop de données I/Q), ce qui suggère que le signal pourrait être plus complexe ou bruité que dans le challenge précédent.

## Solution

La méthodologie est la même que pour "SpaceRadio", mais il faudra probablement plus de travail pour trouver les bons paramètres et nettoyer le signal.

1.  **Analyse avancée du signal :** Il faudra peut-être utiliser des techniques plus avancées pour analyser le signal, comme l'analyse de la densité spectrale de puissance (PSD) ou l'utilisation de filtres pour éliminer le bruit.

2.  **Démodulation complexe :** Le type de modulation pourrait être plus complexe (QAM, OFDM, etc.), ce qui nécessitera un diagramme de flux plus élaboré dans GNU Radio.

3.  **Correction d'erreurs :** Le signal pourrait contenir des erreurs de transmission. Il faudra peut-être implémenter un code de correction d'erreurs (comme un code de Hamming ou un code de Reed-Solomon) pour retrouver les données originales.

> **Leçon apprise :** Les signaux radio du monde réel sont souvent bruités et complexes. La capacité à filtrer le bruit, à identifier des modulations complexes, et à corriger les erreurs est essentielle pour un analyste de signaux.

## Outils

-   **GQRX**, **Inspectrum**, **URH**.
-   **GNU Radio Companion**.
-   **Python** avec des bibliothèques comme **NumPy** et **SciPy** pour le traitement du signal.
