# Machine Host
site du telechargement d'ubuntu 14.04.* (version compatible jetpack le 14/08/16) :
http://releases.ubuntu.com/trusty/

choisir la version compatible avec le processeur ( amd64/i386)

ubuntu-14.04.4-desktop-amd64.iso      
ubuntu-14.04.4-desktop-i386.iso

site de telechargement jetpack dernière version disponible 
https://developer.nvidia.com/embedded/downloads



documentation concernant la création de la clé bootable  :

la clé bootable qe nous avons utilisé à été créée sur ubuntu 16.04 avec l'utilitaire Startup Disk Creator.
la clé à été formatée au format FAT32.	

installation de l'host :

Sur la machine fournie qui nous sert d'host : 
-> accès au bios (afin de changer le boot order pour mettre la clé usb avant les autres) F10
(la clé doit être branchée afin de la faire apparaitre dans le boot order)

choix de la langue : anglais

	install ubuntu

	-download update during installing (pas séléctionner car internet nous faisait défaut)
	-install third-party software
	
	-erase disk and install ubuntu
	-selectionner time-zone and keyboard configuration
	-ubuntu 
	
	
premier lancement de la jetson tk1 voir le QuickStartGuide : aucun soucis


installation ubuntu  

14.04.5-desktop-amd64.iso

faire un checksum à l'aid de la commande md5 et comparer le numéro avec celui sur le site d'ubuntu

formattage en FAT32, start up disk creator

installation normale

utilisateur : m2
pwd 	:	toto


# Jetson TK1
Flashage a l'aide de Nvidia Jetpack
L4T OS

