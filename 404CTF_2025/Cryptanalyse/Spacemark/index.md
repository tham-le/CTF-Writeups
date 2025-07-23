---
title: "Spacemark Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Cryptanalyse"
difficulty: "Moyen"
points: 0
tags: ['crypto']
author: "Tham Le"
solved: true
---

# Spacemark Writeup

## Analyse

Le challenge nous présente un service qui génère des "Spacemarks", qui sont des sortes de signatures numériques. Le service nous donne la possibilité de générer une clé publique, de signer un message, ou de vérifier une signature. Le flag est dans un message signé par le service, mais nous n'avons pas la clé privée.

L'algorithme de signature est une variante de DSA (Digital Signature Algorithm). La vulnérabilité réside dans la génération du nombre aléatoire `k` utilisé dans la signature. `k` est généré en prenant les 32 bits de poids faible du hash du message. C'est une erreur classique, car si `k` est prédictible ou se répète, la clé privée peut être compromise.

## Solution

L'attaque est une attaque classique sur DSA lorsque `k` est connu.

1.  **Obtenir deux signatures avec le même `k` :** On demande au service de signer deux messages différents, `m1` et `m2`. Comme `k` dépend du hash du message, on peut choisir deux messages qui ont le même hash sur les 32 bits de poids faible. Par exemple, on peut prendre un message `m1` et chercher un `m2` tel que `hash(m1) & 0xFFFFFFFF == hash(m2) & 0xFFFFFFFF`. Cela se fait par bruteforce.

2.  **Calcul de la clé privée :** L'équation de la signature DSA est `s = (k^-1 * (H(m) + x*r)) mod q`, où `x` est la clé privée. Si on a deux signatures `(r, s1)` et `(r, s2)` pour deux messages `m1` et `m2` avec le même `k`, on a :
    *   `s1 = (k^-1 * (H(m1) + x*r)) mod q`
    *   `s2 = (k^-1 * (H(m2) + x*r)) mod q`

    On peut alors résoudre ce système d'équations pour trouver `x`, la clé privée.

3.  **Vérification :** Une fois la clé privée obtenue, on peut l'utiliser pour signer nos propres messages et vérifier que la signature correspond à celle générée par le service. On peut aussi l'utiliser pour déchiffrer le message contenant le flag (si le challenge l'exige) ou pour se faire passer pour le service.

> **Leçon apprise :** La sécurité de DSA (et de son équivalent sur courbes elliptiques, ECDSA) repose de manière critique sur la génération d'un `k` aléatoire et imprédictible pour chaque signature. Toute faiblesse dans la génération de `k` peut entraîner une compromission totale de la clé privée.

## Outils

-   **Python** pour le script d'attaque.
-   La bibliothèque **PyCryptodome** pour les opérations de signature.
