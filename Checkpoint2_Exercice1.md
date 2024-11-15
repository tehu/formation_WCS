# Exercice 1


## Q.1.1

Le ping client->serveur ne fonctionne pas car les 2 machines ne sont pas sur le même sous-réseau.

Les 2 IP fixes ont un CIDR de 24 bits. Ce qui se traduit par le masque de sous-réseau : 255.255.255.0

- WINSERV est connecté au sous-réseau 172.16.10.0
- CLIENT1 est connecté au sous-réseau 172.16.100.0

Ecran 1 : CLIENT voit sa propre IP mais pas celle de WINSERV

(((Checkpoint2-CLIWIN10_15_11_2024_09_32.png))

### Changer l'IP de la machine CLIENT1

- Cliquer sur Paramètres >> Réseaux & Internet >> Ethernet
- Cliquer sur l'icone de l'interface (connexion limitée)
- Cliquer le bouton Modifier du Paramètre IP
- Passer en manuel, valider l'option IPv4
- Changer l'adresse IP et renseigner les champs masque, passerelle et DNS

Ecran 2 : Paramétrage IPv4 de l'interface réseau de CLIENT1

(Checkpoint2-CLIWIN10_15_11_2024_10_04.mng)

Ecran 3 : CLIENT a une adresse fixe modifiée et voit désormais l'IP de WINSERV

(Checkpoint2-CLIWIN10_15_11_2024_09_43.png)

## Q.1.3

Vérification du DHCP

WINSERV
- Ouvrir le Server Manager
- Cliquer sur menu Tools >> DHCP
- Développer le service winserv et la branche IPv4
- On voit bien que le scope du DHCP est sur le sous-réseau 172.16.10.0

CLIENT1
- Cliquer sur Réseau et Internet >> Interface ethernet
- Basculer l'IP de l'interface en DHCP
- L'adresse obtenue est 172.16.10.20
- C'est la première adresse autorisée sur la plage gérée sur Winserv

(Checkpoint2-CLIWIN10_15_11_2024_10_22.png)

## Q.1.4

CLIENT1 ne peut pas récupérer l'adresse 172.16.10.15 car elle fait partie des plages exclues de la distribution.

On le voit sur cette copie d'écran : plages exclues dans l'Address Pool du sous-réseau.

(Checkpoint2-SRVWIN2022_15_11_2024_10.png)

