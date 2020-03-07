#!/bin/bash

. fonction.sh

author


if [ $# != "0" ];then


			while getopts "ft:o:chsmgra" opt
			do
					case $opt in
                                        f)save_historique
                                        
                                                ;;

					s) copie
						
						;;
                                        c) compresser
						
						;;	                                 
					r) restorer
                                                
						;;
					h) helps
                                               
						;;
					o)
                                        if [[ $2 ]];then
                                        afficher $2
                                        else
                                        helps 
                                        fi

					       ;;
					t)
                                        if [[ $2 ]];then
                                        save_avec_t $2
                                        else
                                        helps 
                                        fi
                                         	;;
                                        g) yadd
                                               
						;;
                                        m) menu 
        while (true)
	do

		echo "Votre choix : "
	read choix
	case $choix in

			1)
	clear
	echo "Vous avez Selectioner la fonction de copier"
	copie
	menu
			;;

			2)
	clear
	echo "Vous avez Selectioner la fonction de l'archiver"
	archiver
	menu
			;;

			3)
	clear
	echo "Vous avez Selectioner la fonction de compresser"
	compresser
	menu
			;;

                        4)
	clear
	echo "Vous avez Selectioner la fonction de restorer"
	restorer
	menu
			;;

			5)
	clear
	echo "Vous avez Selectioner la fonction Help"
	helps
	menu
			;;

			6)
	clear
	echo "Vous avez Selectioner la fonction de sauvgarder (historique)"
	save
	menu
			;;

			0)
	clear
	echo "Au revoir ($USER)"
			exit
			;;


			*)
	clear
	echo "mauvais choix"		 			
	menu
			;;
	
	esac

	done                                              
						;;
					a) 
                                           var1=$OPTARG
						;;
					*)
					echo "Veuillez verifier votre choix"	
					exit
				esac

                                if [[ $var1 == "r" ]];then

				archiver	
				fi
                             done










else


     interface=5

      while  [[ $interface != "0" &&  $interface != "1"  ]]
	do
		echo "Menu Graphique/Menu textuel ?: (1:(graphique) , 0:(textuel) )"
		read interface
	done


	if [ $interface == "1" ];then
		yadd

		else 

        clear
	menu
      fi



	while (true)
	do

		echo "Votre choix : "
	read choix
	case $choix in

			1)
	clear
	echo "Vous avez Selectioner la fonction de copier"
	copie
	menu
			;;

			2)
	clear
	echo "Vous avez Selectioner la fonction de l'archiver"
	archiver
	menu
			;;

			3)
	clear
	echo "Vous avez Selectioner la fonction de compresser"
	compresser
	menu
			;;

                        4)
	clear
	echo "Vous avez Selectioner la fonction de restorer"
	restorer
	menu
			;;

			5)
	clear
	echo "Vous avez Selectioner la fonction Help"
	helps
	menu
			;;

			6)
	clear
	echo "Vous avez Selectioner la fonction de sauvgarder (historique)"
	save
	menu
			;;

			0)
	clear
	echo "Au revoir ($USER)"
			exit
			;;


			*)
	clear
	echo "mauvais choix"		 			
	menu
			;;
	
	esac

	done

fi
