---
title: "Eldorion Writeup"
date: "2025-06-30"
ctf: "Cyber Apocalypse 2025"
category: "Blockchain"
difficulty: "Very Easy"
points: 0
tags: ['blockchain']
author: "Tham Le"
solved: true
---

# Eldorion Writeup

## Analyse

Ce challenge est une introduction simple à la sécurité des contrats intelligents. Il s'agit probablement d'une vulnérabilité très courante et facile à repérer.

## Solution

La solution la plus probable pour un challenge de ce niveau est une des suivantes :

-   **Visibilité de fonction incorrecte :** Une fonction qui devrait être privée ou interne est déclarée comme publique ou externe, permettant à n'importe qui de l'appeler.
-   **Reentrancy simple :** Le contrat fait un appel externe à une adresse contrôlée par l'attaquant avant de mettre à jour son état, permettant à l'attaquant de rappeler la fonction et de drainer les fonds.
-   **Dépassement d'entier (Integer Overflow/Underflow) :** Une opération arithmétique sur un entier provoque un dépassement ou un sous-passement, menant à un état inattendu. (Moins probable sur les versions récentes de Solidity sans `unchecked`)
-   **Clé privée hardcodée :** Une clé privée est laissée en clair dans le code du contrat ou dans une transaction de déploiement.

En examinant le code, on trouvera probablement l'une de ces failles évidentes. Il suffira alors d'écrire une simple transaction ou un contrat d'attaque pour l'exploiter.

> **Leçon apprise :** Toujours vérifier les bases de la sécurité des contrats intelligents : visibilité des fonctions, ordre des opérations (checks-effects-interactions), et gestion des erreurs arithmétiques.

## Outils

-   **Remix IDE**, **Foundry** ou **Hardhat** pour l'analyse et l'interaction avec le contrat.
