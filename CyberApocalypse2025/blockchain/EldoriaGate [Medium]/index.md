---
title: "EldoriaGate Writeup"
date: "2025-06-30"
ctf: "Cyber Apocalypse 2025"
category: "Blockchain"
difficulty: "Medium"
points: 0
tags: ['blockchain']
author: "Tham Le"
solved: true
---

# EldoriaGate Writeup

## Analyse

Ce challenge de blockchain nous présente deux contrats intelligents Solidity : `EldoriaGate.sol` et `EldoriaGateKernel.sol`. Le but est de passer la "porte" en devenant un "Usurper" sans laisser de trace.

Le contrat `EldoriaGate` est la façade, tandis que `EldoriaGateKernel` gère la logique interne d'authentification en utilisant de l'assembleur Yul de bas niveau. La vulnérabilité se trouve dans la manière dont le noyau gère les types de données et les dépassements (overflows).

## Solution

1.  **Analyse du code :** En analysant `EldoriaGateKernel.sol`, on remarque que la fonction `authenticate` utilise de l'assembleur Yul pour vérifier le `msg.value` et la phrase de passe. L'utilisation de Yul permet de contourner les vérifications de type et de dépassement de Solidity.

2.  **Déclenchement de l'overflow :** La fonction `authenticate` assigne des rôles à l'utilisateur. Si on envoie exactement 255 en `msg.value` et une phrase de passe valide, le masque de bits des rôles subit un dépassement (overflow), ce qui conduit à un comportement non défini (Undefined Behavior - UB).

3.  **Devenir l'Usurpateur :** Ce comportement non défini nous accorde des privilèges inattendus, nous permettant de passer la porte en tant qu'"Usurper".

> **Leçon apprise :** L'utilisation d'assembleur de bas niveau comme Yul dans les contrats intelligents peut introduire des vulnérabilités subtiles, en particulier des dépassements d'entiers, si les vérifications ne sont pas effectuées manuellement. C'est un rappel que même si Solidity offre des protections, elles peuvent être contournées.

## Outils

-   **Foundry** ou **Hardhat** pour interagir avec le contrat.
-   **Python** avec la bibliothèque `web3.py` pour scripter l'interaction.
