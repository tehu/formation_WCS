## Exercice 3

** Q3.1 **
Le matériel réseau A est un Switch

** Q3.2 **
Le matériel réseau B est un Routeur
Il sert de passerelle pour le réseau 10.10.0.0/16

** Q3.3 **
f0/0 et g1/0 : les identifiants des interfaces réseaux

** Q3.4 **
CIDR : le nombre de bits significatifs pour déterminer l'adresse du sous-réseau

** Q3.5 **
10.10.255.254 : l'adresse du routeur


** Q3.6 **

PC | Adr Réseau   | Première  | Dernière      | Adr Diffusion |
---|--------------|-----------|---------------|---------------|
PC1| 10.10.0.0/16 | 10.10.0.1 | 10.10.255.254 | 10.10.255.255 |
PC2| 10.11.0.0/16 | 10.11.0.1 | 10.11.255.254 | 10.11.255.255 |
PC5| 10.10.0.0/15 | 10.10.0.1 | 10.11.255.254 | 10.11.255.255 |

** Q3.7 **
- PC1, PC3 et PC4 peuvent se voir via l'adresse de diffusion 10.10.255.255
- PC2 et PC5 ne peuvent communiquer, car ils ne sont pas sur le même sous-réseau


** Q3.8 **
PC1, PC3 et PC4 sont sur le même sous-réseau que l'interface f0/0 du routeur
et donc accéder au réseau extérieur 172.16.5.0/24

** Q3.9 **
PC2 accède au réseau des routeurs et PC3 est isolé et ne peut voir que PC5

** Q3.10 **
- Par exemple, on peut installer un serveur DHCP sur PC1 qui gère le sous-réseau 10.10.4.0/24
- PC1 a l'adresse fixe 10.10.4.1
- L'interface f0/0 du routeur B se fait attribuer l'adresse fixe 10.10.4.10
- Le DHCP gère une plage d'adresses dynamique comprise entre 10.10.4.20 et 10.10.4.240
- Les autres PCs ont leur interface réseau basculé en DHCP avec comme adresse passerelle celle de PC1

----

## Fichier 1

** Q3.11 **
Adr MAC du matériel : 00:50:79:66:68:00 / l'interface réseau de PC1

** Q3.12 **
C'est une suite de 5 pings de PC1 en direction de PC4 avec à chaque fois, une réponse (checksum) correcte

** Q3.13 **
- __ request __ : PC1 / IP 10.10.4.1 / MAC 00:50:79:66:68:00
- __ reply   __ : PC4 / IP 10.10.4.2 / MAC 00:50:79:66:68:03

** Q3.14 **
Protocole ARP (Address Resolution Protocol)
- permet de résoudre le lien entre addresse IP et adresse MAC, après interrogation sur l'IP de diffusion

** Q3.15 **
- Le switch B a relayé les demandes en broadcast sur toutes ses liaisons, puis a transmis les pings request & reply entre PC1 et PC4
- Le routeur A n'a pas eu de rôle (?)


## Fichier 2

** Q3.16 **
PC3 (10.10.80.3) initialise la communication

** Q3.17 **
Le protocole ICMP (ping) est utilisé. Il sert à voir si une adresse est accessible sur le réseau.

** Q3.18 **
La communication a échoué, car l'adresse cible 10.11.80.2 n'est ni sur le même sous-réseau, ni accessible via routage.

** Q3.19 **
Le routeur B 10.10.255.254 a renvoyé un paquet message d'erreur car l'adresse cible ne figure pas dans ses tables de routage.

** Q3.20 **
- A a un rôle neutre et rediffuse les paquets ICMP qu'il reçoit
- B reçoit la requête et la traite (voir réponse précédente)

## Fichier 3

** Q3.21 **
Communication initialisée par PC4 (IP 10.10.4.2) vers l'IP 172.16.5.253 dans le cloud.

** Q3.22 **
L'adresse MAC de PC4 ne correspond à l'adresse MAC donnée dans le tableau en début d'exercice. PC4 a essayé de joindre l'IP dans le Cloud par une autre interface.

** Q3.23 **
Cette requête n'a pas été faite sur le réseau local.
Peut-être s'agit-il d'une interface WiFi ?


