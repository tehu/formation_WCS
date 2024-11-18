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
PC5| 10.10.4.7/15 | 10.10.0.1 | 10.11.255.254 | 10.11.255.255 |

** Q3.7 **
- PC1, PC3 et PC4 peuvent se voir via l'adresse de diffusion 10.10.255.255
- PC2 et PC5 peuvent se voir via l'adresse de diffusion 10.11.255.255


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


