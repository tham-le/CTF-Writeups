---
title: "HeliosDEX Writeup"
date: "2025-06-30"
ctf: "Cyber Apocalypse 2025"
category: "Blockchain"
difficulty: "Easy"
points: 0
tags: ['blockchain']
author: "Tham Le"
solved: true
---

# HeliosDEX Writeup

## Analyse

Ce challenge concerne un "Decentralized Exchange" (DEX). Les challenges de DEX impliquent souvent des manipulations de prix ou l'exploitation de la logique de trading.

## Solution

Les vulnérabilités courantes dans les DEX incluent :

-   **Manipulation de l'oracle de prix :** Si le DEX utilise un oracle de prix interne basé sur le ratio des réserves de la pool, il peut être vulnérable à une manipulation via un "flash loan". Un attaquant emprunte une grande quantité d'un token, l'échange dans la pool pour faire chuter artificiellement le prix de l'autre token, effectue une action à ce prix manipulé (comme acheter un autre actif à bas prix), puis rembourse le flash loan.
-   **Erreurs de calcul dans les swaps :** Des erreurs dans la formule de calcul des montants échangés peuvent permettre à un attaquant de gagner plus de tokens qu'il ne le devrait.
-   **Front-running :** Un attaquant observe une transaction légitime dans le mempool et soumet sa propre transaction avec un gaz plus élevé pour qu'elle soit exécutée avant, profitant ainsi de l'impact de la transaction légitime sur le marché.

La solution consistera probablement à écrire un contrat intelligent qui exécute une de ces attaques, probablement en utilisant un flash loan pour manipuler le prix et drainer les fonds du DEX.

> **Leçon apprise :** La sécurité des DEX est un domaine complexe. Il est crucial de ne pas se fier à des oracles de prix internes manipulables et d'utiliser des mécanismes résistants aux flash loans, comme des oracles basés sur des moyennes de prix pondérées dans le temps (TWAP).

## Outils

-   **Foundry** ou **Hardhat** pour développer et tester le contrat d'attaque.
-   Des fournisseurs de flash loans comme **Aave** ou **Uniswap** (ou un mock local pour le challenge).
