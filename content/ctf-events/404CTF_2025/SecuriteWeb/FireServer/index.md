---
title: "FireServer Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "SecuriteWeb"
difficulty: "Unknown"
points: 0
tags: ['web']
author: "Tham Le"
solved: false
---

# FireServer Writeup

## Analyse

Ce challenge de sécurité web nous donne une archive `.zip` contenant les sources d'un serveur web. Le nom "FireServer" pourrait faire référence à Firebase, ou simplement à un serveur "en feu" (vulnérable).

L'objectif est de trouver une vulnérabilité dans le code source du serveur pour obtenir le flag.

## Solution

1.  **Analyse du code source :** La première étape est de décompresser l'archive et d'analyser le code source. Il faut identifier le langage de programmation, le framework web utilisé, et les dépendances.

2.  **Recherche de vulnérabilités :** On recherche des vulnérabilités web classiques dans le code :
    *   **Injections SQL :** Si le serveur utilise une base de données.
    *   **Cross-Site Scripting (XSS) :** Si le serveur affiche des données provenant de l'utilisateur.
    *   **Cross-Site Request Forgery (CSRF) :** Si le serveur ne protège pas les actions sensibles avec des tokens CSRF.
    *   **Server-Side Request Forgery (SSRF) :** Si le serveur fait des requêtes à d'autres serveurs en se basant sur une URL fournie par l'utilisateur.
    *   **Path Traversal :** Si on peut accéder à des fichiers en dehors du répertoire web.
    *   **Vulnérabilités de logique métier :** Des failles dans la logique de l'application qui permettent de contourner les contrôles de sécurité.
    *   **Dépendances vulnérables :** Les bibliothèques utilisées par le serveur peuvent avoir des vulnérabilités connues.

3.  **Exploitation :** Une fois une vulnérabilité identifiée, il faut l'exploiter pour lire le flag, qui se trouve probablement dans un fichier sur le serveur (comme `flag.txt`) ou dans la base de données.

> **Leçon apprise :** L'audit de code source est une compétence fondamentale en sécurité web. Il est important de connaître les vulnérabilités web les plus courantes et de savoir comment les repérer dans le code. L'utilisation d'outils d'analyse statique de code (SAST) peut aider, mais une analyse manuelle est souvent nécessaire.

## Outils

-   Un éditeur de code pour l'analyse du code source.
-   **Burp Suite** ou **OWASP ZAP** pour intercepter et modifier les requêtes HTTP.
-   Des outils d'analyse de vulnérabilités de dépendances (comme `npm audit` pour Node.js, `safety` pour Python, etc.).
