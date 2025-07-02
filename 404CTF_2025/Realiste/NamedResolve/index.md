---
title: "NamedResolve Writeup"
date: "2025-06-30"
ctf: "404CTF 2025"
category: "Realiste"
difficulty: "Unknown"
points: 0
tags: ['realiste']
author: "Tham Le"
solved: false
---

# NamedResolve Writeup

## Analyse

Ce challenge fait partie de la catégorie "Réaliste", ce qui suggère qu'il est basé sur un scénario d'attaque plausible dans un environnement d'entreprise. Le nom "NamedResolve" fait probablement référence au service DNS `named` (souvent utilisé avec BIND).

Le challenge consiste probablement à exploiter une mauvaise configuration ou une vulnérabilité dans un serveur DNS pour obtenir des informations ou un accès.

## Solution

Les attaques possibles sur un serveur DNS sont nombreuses :

-   **Transfert de zone DNS (AXFR) :** Si le serveur DNS est mal configuré, il peut autoriser un transfert de zone à n'importe qui, ce qui permet de lister tous les enregistrements DNS d'un domaine.
-   **DNS Cache Snooping :** Tenter de déterminer si un enregistrement DNS est dans le cache du serveur pour en déduire des informations sur les sites visités par les utilisateurs du réseau.
-   **DNS Spoofing / Cache Poisoning :** Tenter d'injecter de faux enregistrements DNS dans le cache du serveur pour rediriger le trafic.
-   **Vulnérabilités logicielles :** Le serveur BIND lui-même peut avoir des vulnérabilités connues (CVE) qu'il faut exploiter.

La solution dépendra du scénario exact du challenge, mais elle impliquera probablement l'utilisation d'outils comme `dig`, `nslookup`, ou des scripts spécialisés pour interagir avec le serveur DNS et exploiter la faille.

> **Leçon apprise :** La sécurité des serveurs DNS est souvent négligée, alors qu'ils sont un composant critique de l'infrastructure réseau. Une bonne configuration et une veille sur les vulnérabilités sont essentielles.

## Outils

-   **dig** et **nslookup** pour les requêtes DNS.
-   **nmap** pour scanner les ports et les versions des services.
-   Des scripts Python avec des bibliothèques comme `dnspython` pour des interactions plus complexes.
