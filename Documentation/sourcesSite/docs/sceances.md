## Séance1: Mise en place des outils pour la gestion du Projet.

Mise en place de l'environnement
- github
- sharelatex
- Trello
- création de groupe facebook

## Séance2:Installation de Ubuntu.
- téléchargement du fichier image depuis le site du telechargement d'ubuntu 14.04.* (version compatible jetpack le 14/08/16) :
http://releases.ubuntu.com/trusty/ 
- choix de la version compatible avec le processeur ( amd64/i386)
 ubuntu-14.04.4-desktop-amd64.iso      
 ubuntu-14.04.4-desktop-i386.iso

- on peut verifier si le fichier est bien téléchargé (pas endomagé). Pour se faire, nous utilisons la commande md5 dans mac ou linux (Commande: sudo md5 nom_fichier_image). elle (la commande) traite l'entrée et renvoie un numéro qui est à comparer avec le site de téléchargement.
- avant de commencer l'installation assurez-vous de flasher ce fichier dans une clé Usb ou de le graver dans un cd ou dvd, pour pouvoir booter dessus(demarrer le système)
- modifier l'ordre de boot du systéme dans le menu BIOS( mettre USB en premier).
 accès au bios (afin de changer le boot order pour mettre la clé usb avant les autres) F10 (la clé doit être branchée afin de la faire apparaitre dans le boot order)

Voici quelques étapes de l'installation
- choix de la langue : anglais
- install ubuntu
- download update during installing (pas séléctionner car internet nous faisait défaut)
- install third-party software
- erase disk and install ubuntu
- selectionner time-zone and keyboard configuration
- ubuntu

#### Probléme1: problème d'installation de ubuntu.
	liée au blockage de téléchargement des paquets par le serveur de l'université
	Utilisation des CheckSum pour verifer l'integrité du fichier Image.


### Séance3:Telechargement de JetPackL4T et installation.

#### Probléme2: problème de téléchargement des paquets JetPack. 
	ce problème est lié au problèmes de proxy.


### Séance4:Installation de JetPackL4T & flashage de la carte.


Voici quelques étapes suivi durant l'installation de JetPackL4T.

- téléchargement du fichier d'installation du JETPACK depuis le site internet de nvidia : https://developer.nvidia.com/embedded/downloads
	NB: Il faut avoir un compte pour pouvoir télécharger JetPack.

- A la base le fichier n'a pas de droit d'execution. Nous lui ajoutons donc le droit d'execution avec la Commande suivante: --- chmod +x nomfichier.run

- Et enfin nous lançons l'execution de ce fichier avec la commande suivante : 
- ./nomfichier.run 
	NB: soyez sur que la carte est branché à la machine qui execute ce programme et qu'elle est également connecté à internet.
	
#### Probléme3: problème d'installation des paquets JetPack.
	La connexion internet bloque systématiquement le téléchargement de paquets depuis internet si le proxy de la fac n'est pas correctement renseigné.

l'installation ne marche pas. Pour se faire, nous avons les commandes suivantes 
- sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com votre_n°_de_clé
- sudo apt-get update --fix-missing

pour garder certains dependence lorsque le upgrade les supprimes.
- sudo apt-get dist-upgrade

Les proxy ne marchent toujours pas. Il faut le forçer en utilisant les commandes ci-dessous.

- cd /etc/apt/apt.conf.d/
- touch 95proxies
- Acquire::http::proxy "adresse";
- Acquire::ftp::proxy "adresse";
- Acquire::https::proxy "adresse";

Toutes ces tentatives n'aboutissent à rien. Mais après avoir reglé le proxy, le téléchargement marche correctement. Ci - dessous les commande pour regler le proxy.

- sudo su "on saisit le mot de passe"
- export http_proxy='adresse à saisir'
- export https_proxy='adresse à saisir'
- export ftp_proxy='adresse à saisir'
  
#### Problème4: problème de flash de la carte.
	la machine n'arrive pas à donner une adresse ip à la carte car celle-ci n'est pas connu par le réseau. Nous avons essayer plusieurs techniques en vain. Il a fallu faire part à l'administrateur reseau pour résoudre ce probleme. Ci-dessous quelques commande qu'on a utilisé mais qui n'ont pas abouti.

sudo dhclient eth0
ifconfig eth0 192.168.0.1
gestion de l'adresse ip: enter cette commande sur un terminal dans la machine hote après qu'elle ai été demarré.
setxkbmap fr


## seance 6: Installation et Flashage de la carte JETSON TK-1.
Nous avons recommencer les etapes de la séance 3 qui se sont interrompués à cause du proxy et continuer. JETSON TK-1 telecharge plusieurs fichiers depuis internet pour son fonctionnement interne. Mais il s'arrête à cause du proxy.

Nous étions obligé de suspendre l'opération juste après le flashage et de recommencer à partir de la postInstallation.
à la fin du Flah, la machine donne à la carte une adresse ip que voici 172.18.41.199.
Après avoir Flasher la carte, nous allons ajouter les proxy de la fac en editant le fichier .bashrc.
Maintenant, nous pouvons lancer la postInstallation qui va telecharger des paquets depuis internet. Toutesfois, certains telechargements n'ont pas marché. Nous avons fait ça manuellement dans la carte avant de pouvoir continuer.
Voici entre autres quelques bibliothéques téléchargées par JETPACK L4T:

- Common
	- Tegra Graphics Debugger
	- Tegra System Profiler
	- Documentation
	- VisionWorks pack On Host
		- VisionWorks on Host
		- VisionWorks Plus On Target
		- VisionWorks Objects Trackers on Host
		- VisionWorks References
- GameWorks Samples 
- For Jetson TK1
	- CUDA Toolkit for Ubuntu 14.04
	- Linux for Tegra(TK1)
	- CUDA Toolkit for L4T
	- Compile GameWorks Sample
	- Compile CUDA Sample
	- PerfKit CuDNN Package
	- OpenCV for Tegra
	- VisionWorks Pack On TK1 Target
		- VisionWorks On Target
		- VisionWorks Plus(SFM) On Target
		- VisionWorks Objects Tracking On Target

#### Problème5: problème de flash de la carte (1).
	Pour resoudre definitivement le problème de proxy, nous avons editer le fichier .bashrc et nous lui avons ajouter à la fin les lignes suivantes.

http_proxy "adresse"
ftp_proxy "adresse"
https_proxy "adresse"
Après avoir resolu ce problème l'installation ne s'interromp pas et le flashage est effectif.
 
## Seance 7:activation des 4 cpu de la carte.
Par defaut un seul CPU est actif. Pour activer les 3 autres, nous utilisons les commandes ci-dessous.

echo 0 > /sys/devices/system/cpu/cpuquiet/tegra_cpuquiet/enable
echo 1 > /sys/devices/system/cpu/cpu0/online
echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu2/online
echo 1 > /sys/devices/system/cpu/cpu3/online
echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_govern


## Seance 8: 

### Séance 4 & 5: Redaction du cahier de charge
- La redaction a été faite sur Sharelatex.
- Reunion avec les encadrants & quelques recherches concernant le problème rencontré.



