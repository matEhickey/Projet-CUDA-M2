# Nvidia Jetson TK1
Carte semblable au cartes RaspberryPi, a l'exception que la TK1 contient une carte graphique (GPU), un port SATA, mini-PCIe et un ventilateur.  
La Jetson TK1 mesure 5" x 5" (127mm x 127mm).  

Sa puissance lui vient de son composant CPU/GPU/ISP: Le Tegra K1 SOC.  
Ce dernier contient un GPU NVIDIA Kepler avec 192 cœurs NVIDIA CUDA, et un processeur (CPU) quad-core NVIDIA 4-Plus-1™ ARM  Cortex-A15.  
Il possede une mémoire DRAM de Go en DDR3L.  
Il est alimenté en 12V DC, pour une consomation d'énergie moyenne comprise entre 1 et 5 W.  

![Image of the tk1](http://elinux.org/images/2/27/Nvidia-tegra124-jetson-tk1-labelled.jpg)

**Front panel :** Il contrôle les boutons d'alimentation et de réinitialisation et les LED qui permettent d'obtenir des informations sur l'état de l'ordinateur et l'utilisation du disque dur.

Vert =>  Ce sont les LED d'alimentation qui indiquent si la jetson TK1 est allumé, éteinte ou en veille.

Oranges => Ce sont les LED du disque dur, elles indiquent si le disque dur est en mode écriture ou lecture

Rouge =>  Contrôle le bouton d'alimentation qui permet d'allumer ou éteindre la jetson TK1

Bleu => Gère le bouton de réinitialisation pour redémarrer l'ordinateur

**DB-9 :** Le connecteur DB-9 est une prise analogique comportant 9 broches. Il sert essentiellement dans les liaisons permettant la transmission de données asynchrone. Il était beaucoup utilisé pour des périphériques comme les claviers et les souris. Ce type de port a été remplacé par les ports PS/2 et USB de nos jours.

**HDMI :** Abréviation de High Definition Multimedia Interface (Interface Multimédia Haute Définition) est un connecteur et un câble capable de transmettre des flux vidéos et audios de haute qualité et à bande passante élevée Il permet notamment de relier une source vidéo/audio comme un ordinateur à un dispositif compatible comme un écran HD.

**USB :** Abréviation de Universal Serial Bus (Bus Universel en Série) est une interface de type plug-and-play qui permet à la jestson TK1 de communiquer avec d'autres périphèriques. Les périphériques USB peuvent être une souris, un clavier, une clé USB...

**PCIe Ethernet :** C'est le port qui permet de brancher un câble RJ45 pour pouvoir accéder à internet.

**Headphone/microphone :** C'est une prise jack qui est le connecteur le plus utilisé pour la connectique des petits équipements audio comme les casques et micros.

**USB micro-B recovery port :** C'est un port micro USB qui permet de connecter la jetson TK1 au PC hôte pour la lancer en recovery mode.

**Mini PCIe :** Le port mini PCIe est une version plus petite du port PCIe, il est souvent utilisé pour les ordinateurs portables et autres périphériques portables.

**JTAG :** Ce port peut être utilisé pour connecter une sonde à la carte pour identifier les défauts, ce qui permet à un développeur de manipuler la carte. Les développeurs peuvent également l'utiliser pour copier le firmware de la carte.

**Expansion I/O :** Ce sont les ports GPIO (General Purpose Input/Output, littéralement Entrée/Sortie 
pour un Usage Général), ils permettent de pouvoir communiquer avec d'autres circuits électroniques.

**SD card :** C'est un port pour les cartes SD (Abrégé de Secure Digital) qui sont des cartes mémoires de stockage de données numériques.

**Power :** C'est la prise d'alimentation 12 volts pour alimenter la carte.

**SATA :** C'est le port SATA (Abrégé de Serial Advanced Technology Attachment), c'est une norme qui spécifie notamment un format de transfert de données et un format de câble. Ce type de port permet notamment de brancher un disque dur. Celui-ci n'est pas hot-plug c'est à dire qu'il faut que la carte soit éteinte pour brancher le périphèrique.

**Soft power :** Bouton pour démarrer la carte.

**Reset :** Bouton pour réinitialiser la carte.

**Force recovery :** Bouton pour forcer la carte à se lancer en recovery mode.

Source : [Wiki Jetson TK1](http://elinux.org/Jetson_TK1)   
