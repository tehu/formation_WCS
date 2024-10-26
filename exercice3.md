
1. Liste des utilisateurs

```bash
cat /etc/passwd | cut -f1 -d:
```


2. Changer les droits de myfile en rwxr--r--

```bash
chmod 744 myfile
```

3. Les variables d'environnement sont toujours nommées en majuscules. Par convention, on préfère mettre les variables de script tout en minuscules.

    * Généralement, on initialise une variable avec l'opérateur d'affectation =
    * On utilise une variable avec le signe $ précédé

```bash
# initialisation d'une variable
chemin='/var/log/project'
# valeur d'une variable
cd $chemin
```

4. Le shell évalue le bloc de comparaison immédiatement après le __if__. Si l'évaluation est __True__, on exécute le bloc après __then__.

La commande __fi__ détermine la fin de bloc. Eventuellement, on peut utiliser __else__ pour exécuter un bloc de commande alternatif.

```bash
read -p "Quitter ? (O/N)" confirm

if [ $confirm = 'O' ] || [ $confirm = 'o' ]
then
	echo 'vous sortez'; exit
else
	echo 'vous continuez'
fi
```

5. Pour éviter que le shell interprète le symbole $ comme une variable, le délimiteur double quote ou les caractères spéciaux comme pipe, on utilise des simples quotes pour entourer les lignes de caractères.

```bash
echo 'Malgré le prix élevé de 100$, il a dit "Bonjour !" au vendeur :'
echo '- "Bonjour est-ce que ce clavier fonctionne bien ?"'
echo '- "Evidemment ! On peut tout écrire avec, que ce soit des pipe | ou bien des backslash \\ !"'
echo '- "Même des tildes ~ ?"'
echo '- "Evidemment !"'
```

6. On utilise la commande fg avec son numéro de tâche
```bash
fg % 1
```

7. La couche 2 du modèle OSI est la couche Liaison : on y situe des trames de type Ethernet. La couche 3 est celle du Réseau. On y situe des paquets de type IP.

Comme matériels associés, on peut citer :

* les hubs
* les switchs
* les routeurs
* etc.



8. Equivalence Bash ~ Powershell

  cd : Set-Location
  cp : Copy-Item
  mkdir : New-Item
  ls : Get-ChildItem

9. Le payload est la partie effective des données à transmettre. Dans une trame Ethernet, elle peut contenir un paquet IP.

10. Les classes A, B et C n'étaient plus adaptées à la croissance d'Internet. On a adopté la notation CIDR.
