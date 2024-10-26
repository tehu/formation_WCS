#! /bin/bash

if [ $# -eq 0 ]
  then
    echo "Il manque les noms d'utilisateurs en argument - Fin du script"
    exit 1
fi

for utilisateur in $*
do
	# cherche le nom de l'utilisateur en début de ligne / renvoie 0 ou 1
    existe=$(grep -c ^"$utilisateur": /etc/passwd)
    if [ $existe -eq 1 ]
     then
       echo "L'utilisateur $utilisateur existe déjà"
     else
       # on suppose que l'exécuteur du script a les droits sudo
       sudo useradd -m -s /bin/bash -p $utilisateur $utilisateur
       if [ $? -eq 0 ]
         then
           echo  "L'utilisateur $utilisateur a été créé"
       else
           echo "Erreur lors de la création de l'utilisateur $utilisateur"
      fi
    fi
done
