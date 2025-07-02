---
title: "The LDAP Chronicles Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Realiste"
difficulty: "Unknown"
points: 0
tags: ['realiste']
author: "Tham Le"
solved: false
---

# The LDAP Chronicles Writeup

## Analyse

Ce challenge, également dans la catégorie "Réaliste", porte sur le protocole LDAP (Lightweight Directory Access Protocol). LDAP est très utilisé en entreprise pour la gestion des annuaires d'utilisateurs (comme Active Directory).

Le challenge consiste probablement à exploiter une mauvaise configuration ou une vulnérabilité dans un serveur LDAP pour obtenir des informations (noms d'utilisateur, mots de passe, etc.) ou un accès.

## Solution

Les attaques sur les serveurs LDAP sont variées :

-   **Anonymous Binds :** Si le serveur autorise les connexions anonymes, on peut souvent lister une grande partie de l'annuaire sans authentification.
-   **Injection LDAP :** Similaire à l'injection SQL, on peut tenter d'injecter des filtres LDAP malveillants pour contourner l'authentification ou extraire des informations.
-   **Bruteforce de mots de passe :** On peut tenter de deviner les mots de passe des utilisateurs de l'annuaire.
-   **Exposition d'informations sensibles :** L'annuaire peut contenir des informations sensibles dans les attributs des utilisateurs (descriptions, commentaires, etc.).

La solution impliquera probablement l'utilisation d'outils comme `ldapsearch`, `nmap` (avec ses scripts NSE pour LDAP), ou des outils plus spécialisés comme `ldapdomaindump`.

> **Leçon apprise :** Les annuaires LDAP sont une cible de choix pour les attaquants car ils centralisent les informations sur les utilisateurs et les ressources d'un réseau. La sécurisation des serveurs LDAP est donc primordiale.

## Outils

-   **ldapsearch** pour les requêtes LDAP en ligne de commande.
-   **nmap** avec les scripts NSE pour l'énumération LDAP.
-   Des clients graphiques LDAP comme **JXplorer** ou **Apache Directory Studio**.
