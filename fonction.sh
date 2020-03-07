#!/bin/bash

author()
{

echo -e "███████╗██╗   ██╗     ██╗███████╗████████╗ ██╗ ██╗ ██╗██╗ "
echo -e "██╔════╝██║   ██║     ██║██╔════╝╚══██╔══╝██╔╝███║███║╚██╗"
echo -e "███████╗██║   ██║     ██║█████╗     ██║   ██║ ╚██║╚██║ ██║"
echo -e "╚════██║██║   ██║██   ██║██╔══╝     ██║   ██║  ██║ ██║ ██║"
echo -e "███████║╚██████╔╝╚█████╔╝███████╗   ██║   ╚██╗ ██║ ██║██╔╝"
echo -e "╚══════╝ ╚═════╝  ╚════╝ ╚══════╝   ╚═╝    ╚═╝ ╚═╝ ╚═╝╚═╝ "

echo -e "\e[1;92m Author: YassinDaboussi & YoussefSelmi  \e[0m "                                                          

}

menu()
{
author
echo "+++++++++++++++ Bienvenue ($USER) +++++++++++++++++++"
echo "1)  : copier les données connéecte via shell dans le repertoire backup"
echo "2)  : archiver les données de la repertoire backup"
echo "3)  : Compresser les données de la repertoire backup"
echo "4)  : restorer les données"
echo "5)  : helps"
echo "6)  : sauvgarder historique"
echo "0)  : quit"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
}

copie()
{
sudo cp -r /home/$USER /backup
}

archiver()
{
cd /
if [ -a backup ];then 
echo "Dossier backup existe on va archiver maintenant Sous la forme(backup.tar)"
sudo tar cf backup.tar backup/
sudo rm -r backup
else
echo "Dossier backup n'existe pas il faut utiliser (l'option -s) Pour le crée"
fi
}

compresser()
{
cd /
if [ -a "backup.tar" ];then 
echo "Fichier backup.tar existe on va le compresser maintenant Sous la forme(backup.tar.xz)"
sudo xz backup.tar
else
echo "Fichier backup.tar n'existe pas ! il faut utiliser (l'option -s ou/et -ar)" 
fi
}

restorer()
{
cd /
if [ -a "backup.tar.xz"  ];then 
echo "Fichier backup.tar.xz existe on va le decompresser maintenant"
sudo tar xf backup.tar.xz 
sudo rm -r backup.tar.xz 
else
echo "Fichier backup.tar.xz n'existe pas ! il faut utiliser (l'option -s ou/et -ar ou/et -c)" 
fi
}

save_historique()
{
      echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ >> historique.txt
      sudo date >> historique.txt
      sudo id >> historique.txt
      echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ >> historique.txt
      echo "fichier historique.txt été crée avec succées"
}

helps()
{

echo "-s    : copier les données de l'utilisateur connéecte via shell dans user/backup"
echo "-ar   : archiver les données de la repertoire backup"
echo "-c    : Compresser les données de la repertoire backup"
echo "-r    : restorer les données deja archivé"
echo "-g    : afficher le menu graphique"
echo "-m    : afficher le menu textuel"
echo "-h    : afficher le helphelps"
echo "-f : sauvgarder historique"
echo "-t <nom_fichier>    : save "
echo "-o <nom_fichier>    : afficher"

}

helpsyad()
{
yad --title="Projet11 : Youssef selmi && Yassin Dabbousi" --center --no-buttons  --text=" 
 copier      : copier les données connéecte via shell
 archiver    : archiver les données de la repertoire backup
 compresser  : Compresser les données de la repertoire backup
 restorer    : restorer les données
 help        : helps
 save        : sauvgarder historique
 quitter     : quit"
}


save_avec_t()
{

if [ -d /var/project ];then
echo "repertoire (Projet) existe dans Var (/var/project)"
else 
sudo mkdir -p /var/project
fi

if [ -f "$1" ];then
sudo cp $1 /var/project/`date +%F`$1
else echo "et votre fichier ($1) n existe pas"
echo "dans "$(pwd)
fi
 
}
afficher()
{
 find  /var/project/ -name "*$1*"  -type f 
}


yadd()
{
	yad --text="Menu Projet 11" \
			--center \
		--button=gtk-cancel:1 \
		--button=gtk-help:2 \
		--button="Copierles donneés":3 \
		--button="Archiver les données":4 \
		--button="Compresser les donnés":5 \
		--button="restorer les donnés":6 \
		--button=gtk-save:7 \
		--title "Projet 11" \

		boutton=$?


			[[ $boutton -eq 1 ]] && exit 0


			if [[ $boutton -eq 2 ]]; then
                        helpsyad
                        yadd

                        elif  [[ $boutton -eq 3 ]]; then
                        copie
                        yadd

                        elif  [[ $boutton -eq 4 ]]; then
                        archiver
                        yadd

                        elif  [[ $boutton -eq 5 ]]; then
                        compresser
                        yadd

                        elif  [[ $boutton -eq 6 ]]; then
                        restorer
                        yadd

                        elif  [[ $boutton -eq 7 ]]; then
                        save
                        yadd


                       
fi

}
