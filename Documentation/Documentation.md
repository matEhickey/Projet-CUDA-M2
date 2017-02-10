## I - Projet CUDA M2


### Séance1: Mise en place des outils pour la gestion du Projet.

Mise en place de l'environnement
- github
- sharelatex
- Trello
- création de groupe facebook

### Séance2:Installation de Ubuntu.
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



## II - Installation de JetPACK L4T
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


### seance 6: Installation et Flashage de la carte JETSON TK-1.
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
 
### Seance 7:activation des 4 cpu de la carte.
Par defaut un seul CPU est actif. Pour activer les 3 autres, nous utilisons les commandes ci-dessous.

echo 0 > /sys/devices/system/cpu/cpuquiet/tegra_cpuquiet/enable
echo 1 > /sys/devices/system/cpu/cpu0/online
echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu2/online
echo 1 > /sys/devices/system/cpu/cpu3/online
echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_govern


### Seance 8: 
## III - Cahier de Charge
### Séance 4 & 5: Redaction du cahier de charge
- La redaction a été faite sur Sharelatex.
- Reunion avec les encadrants & quelques recherches concernant le problème rencontré.



## IV - Decouvert de Cuda
### 1 - Syntaxe
### 2 - Sémantique

## V - Proof of Concept
### 1 - TRESHOLD



Nous avons juste réinventer la roue pour implementer le principe du tresold d'abord en c++(utilisant la librairie Opencv) et ensuite en cuda. 
Le principe est simple, nous comparons les valeurs des pixels d'image par rapport à un seuil donné. si la valeur est superieur au seuil le pixel est mis en blanc sinon en noir. l'image resultant est alors une image blanc-noire.

## 1.1 - Implementation C++

Pour la partie c++ ce n'était pas trop compliqué. Nous avons en effet chargé l'image et ensuite comparé les valeurs de chaque pixel au seuil (seuil = 128) et par la suite construit la nouvelle matrice de pixel et enfin enregistré. Nous avons très vite eu notre nouvelle image qui est bien blanc-noir.

## 1.2 - Implémentation CUDA

Pour la partie Cuda nous avons eu à gérer plusieurs choses. Nous avons d'abord chargé la matrice de pixels envoyé vers le device.la comparaison du pixel avec le seuil et l'affection de la nouvelle de pixel se font dans le code du kernel. Nous enfin récupérer la nouvelle matrice de pixel pour stocker l'image final. A chaque nous avons traité les exceptions moyennant le type d’exception cudaError_t predéfinies dans Cuda. Voici quelques cas dans lesquels nous avons traité ces exceptions 
- pendant l'allocation de la matrice de pixel s'executant côté matériel (cudaMalloc):

- pendant la copie de la matrice (host ->device) tout comme (device -> host) (CudaMemcpy)

- après l'execution du kernel, nous nous assurons que l'exécution s'est bien passé 
(CudaGetLastError: méthode qui retourne les erreurs s'ils en existe)

- pour l'affichage de les exceptions, nous utilisons la fonction CudaGetErrorString() sur notre type d'erreur.


# 1.3 -Compilation :

Nous avons utilisé un makefile simple pour compiler notre programme. Le contenu du makefile est donnée ci-dessous.

- CFLAGS+= `pkg-config --cflags opencv`
- LDFLAGS+=`pkg-config --libs opencv`
- LIBS +=`pkg-config --libs opencv`

- % : %.cu
- 	nvcc $(CFLAGS) $(LIBS) -o $@ $<
	
Ainsi pour compiler, nous tapons cette commande dans le terminal:
make nomfichier

### 2 - Contrours
### 3 - Force Brut
### 4 - Optimisation de la reduction d'un vecteur

## VI - Découverte des frameworks
### Tensorflow
TensorFlow est un système de programmation dans lequel les calculs sont représentés sous forme de graphiques. Les nœuds du graphe sont appelés ops (abréviation de opérations). Un op prend zéro ou plus Tensors, effectue un certain calcul, et produit zéro ou plus Tensors. Dans la terminologie TensorFlow, un Tensor est un tableau multidimensionnel typé. Par exemple, on peut représenter un mini-lot d'images en tant que tableau 4-D de nombres en virgule flottante avec des dimensions [lot, hauteur, largeur, canaux].

Un graphique TensorFlow est une description des calculs. Pour calculer quoi que ce soit, un graphique doit être lancé dans une session. Une session place les opérations graphiques sur les périphériques, comme les CPU ou les GPU, et fournit des méthodes pour les exécuter. Ces méthodes renvoient des tenseurs produits par des ops en tant qu'objets numpy ndarray en Python, et comme des instances tensorflow :: Tensor en C et C ++.
#### 1 - Graphique de calcul

Les programmes TensorFlow sont généralement structurés en une phase de construction, qui assemble un graphe, et une phase d'exécution qui utilise une session pour exécuter des opérations dans le graphe.

Par exemple, il est courant de créer un graphe pour représenter et former un réseau neuronal dans la phase de construction, puis exécuter à plusieurs reprises un ensemble d'opérations d'apprentissage dans le graphe dans la phase d'exécution.

TensorFlow peut être utilisé à partir de programmes C, C ++ et Python. Il est actuellement beaucoup plus facile d'utiliser la bibliothèque Python pour assembler des graphiques, car il fournit un grand nombre de fonctions auxiliaires non disponibles dans les bibliothèques C et C ++.

les 3 etapes pour 
1- Construction du graphique
2- Lancement du graphique dans une session
3- Lancement du graphique dans une session distribuée

Nous prenons un simple exemple de multiplication de deux matrices qui disponible sur le site de tensorflow. 

### TFlearn
### Tegra


## VII - Au delà
## Application pour la reconnaissance des signes des mains
