# Architectures GPU Nvidia
Voici une liste des architecture de GPU de Nvidia, de la plus ancienne à la plus récente.
Les noms des architectures des GPU NVIDIA font souvent référence et rendent hommage à de grands scientifiques des derniers siècles.

* [Tesla](https://en.wikipedia.org/wiki/Tesla_(microarchitecture)) : 2006  
Le nom Tesla fait référence à l'ingénieur et inventeur de la fin du XIX et du début du XX ème siècle [Nikola Tesla](https://fr.wikipedia.org/wiki/Nikola_Tesla) d'origine autrichien et naturalisé américain qui a oeuvré dans le domaine de l'électricité et de la mécanique.
Première implémentation du ["Unified Shading Architecture"](https://en.wikipedia.org/wiki/Unified_shader_model). C'est une architecture qui se compose de stream processors homogènes qui peuvent effectuer différentes tâches alors que les générations précédentes étaient constituées d'unités fonctionelles distinctes. Ils sont moins complexe à construire, le débit maximal est plus faible mais largement compensé par la meilleur efficacité dû à leur simplicité d'utilisation.
Amélioration et optimisation du filtrage des textures.
Utilisation de nouvelles technologies pour l'anti-aliasing (anticrénelage en français) qui est une technque qui permet de minimiser les effets de distorsion lors de la représentation d'une image.
C'est une architecture qui a connu quatre finesse de gravure différente : le 90 nm, le 80 nm, le 65 nm et le 55 nm.

* [Fermi](https://en.wikipedia.org/wiki/Fermi_(microarchitecture))  : 2010  
Le nom Fermi provient du physicien italien [Enrico Fermi](https://fr.wikipedia.org/wiki/Enrico_Fermi) naturalisé américain de la première moitié du XX ème siècle qui a fait beaucoup de recherche sur l'énergie nucléaire.
Peu de différence au niveau de l'architecture avec Tesla, juste une amélioration des performances dû à la diminutiuon de la finesse de gravure (40 nm et 28 nm).

* [Kepler](https://en.wikipedia.org/wiki/Kepler_(microarchitecture))  : 2012  
Le nom Kepler est une référence au mathématicien, astronome et astrologue allemand de la fin du XVI ème et du début du XVII ème siècle se nommant [Johannes Kepler](https://fr.wikipedia.org/wiki/Johannes_Kepler) qui a étudié les mouvement des planètes et qui a théorisé les [lois de Kepler](https://fr.wikipedia.org/wiki/Lois_de_Kepler).
Moins couteux en energie, plus performant car un gros travail a été fait pour améliorer les performances de la carte par watt consommé.
La programmatiion sur les GPU est désormais plus facile grâce à la gestion du code qui a été simplifié permettant une plus grande flexibilité dans la programmation GPU.
Kepler utilise une nouvelle architecture pour les streaming multiprocessor qui permet d'améliorer l'efficacité des GPU car ils utilisent une seule vitesse d'horloge unifiée.
GPU Boost est une nouvelle fonctionnalité introduite avec cette architecture qui régule la fréquence du GPU en fonction de sa consommation et de sa température qui sont directement mesurées sur la carte.
Une nouvelle méthode anti-aliasing exclusif à Kepler nommée TXAA.
NVIDIA GPUDirect est une nouvelle fonctionnalité qui a été introduite avec Kepler qui permet à plusieurs GPU dans un ordinateur ou plusieurs GPU dans un serveur de pouvoir échanger des données directement entre eux sans avoir à passer par le CPU.
Hyper-Q est une nouvelle technologie implémenté avec Kepler qui permet au GPU d'exécuté 32 tâches MPI (Message Passing Interface) simultanée alors que les architectures précédentes pouvaient en traiter qu'une seule à la fois. Les temps d'inactivité sont alors réduit et il y a une maximisation de l'utilisation de la puce graphique.
Kepler introduit également la notion de parallélisme dynamique qui permet au GPU de pouvoir lancer lui-même de nouveaux threads en fonction des données pour éviter le plus possible les aller-retour entre le GPU et le CPU, il y a ainsi une réduction du temps de latence.
La finesse de gravure de gravure de cette architecture est le 28 nm.

* [Maxwell](https://en.wikipedia.org/wiki/Maxwell_(microarchitecture)) : 2014  
Le nom Maxwell émane de [James Clerk Maxwell](https://fr.wikipedia.org/wiki/James_Clerk_Maxwell) célèbre physicien et mathématicien écossais et connu pour ses recherches sur l'électromagnétisme avec les [équations de Maxwell](https://fr.wikipedia.org/wiki/%C3%89quations_de_Maxwell).
Ameliorations des Streaming Multiprocessor en revoyant complétement leur organisation interne pour optimiser leur rendement aussi bien énergétique que par unité de surface. dans la génération précédente des noyaux CUDA pouvaient consommer de l'énergie alors qu'ils ne faisaient pas de travail utile.
Le gros travail de NVIDIA sur cette architecture a été le gain en ratio performance/energie.
Amélioration des performances de l'encodage et du décodage des vidéos.
Le Super Résolution Dynamique est une nouvelle fonctionnalité qui permet d'afficher les images dans une résolution plus élevée avec des graphismes plus détaillés avec un filtre de  downscalling qui permet de les afficher sans perte de qualité (par exemple afficher une image en 4K sur un écran 1080p).
VXGI est une nouvelle technologie implémentée avec Maxwell qui permet de créer des effets d'éclairage et de reflets de manière réaliste.
Création d'une nouvelle technologie anti-aliasing nommée MFAA.
Apparition de NVIDIa G-Sync qui permet de supprimer le déchirement de l'image provoqué par une désynchronisation entre le rythme du GPU et la fréquence de rafraîchissement de l'écran.
La finesse de gravure de cette architecture est aussi le 28 nm, cela fait deux architectures consécutives que la finesse de gravure n'a pas diminuée.

* [Pascal](https://fr.wikipedia.org/wiki/Pascal_(architecture_de_carte_graphique)) : 2016  
Le nom Pascal rend hommage à [Blaise Pascal](https://fr.wikipedia.org/wiki/Blaise_Pascal) qui est un méthématicien et physicien français du XVII ème siècle, il a notamment inventé la première machine à calculer.
Ameliorations des performances des Streaming Multiprocessor.
La technologie NVLink introduit avec Pascal permet une liaison à haut bande passante entre le CPU et le GPU ou entre plusieurs GPU. La vitesse de transfert des données est beaucoup plus rapide qu'avec PCI Express.
L'architecture a été aussi conçu pour améliorer les performances dans le domaine du Deep Learning.
La finesse de gravure de cette architecture est le 16 nm basée sur le processus de fabrication FinFET.

* [Volta](https://fr.wikipedia.org/wiki/Volta_(architecture))  : A venir  
Cette architecture est nommée en l'honneur de [Alessandro Volta](https://fr.wikipedia.org/wiki/Alessandro_Volta) grand physicien italien du XVIII et du XIX ème siècle qui est connu pour ses travaux sur l'électricité et pour l'invention de la première pile électrique.
Devrait figurer [High Bandwidth Memory](https://en.wikipedia.org/wiki/High_Bandwidth_Memory) qui est un type de mémoire avec des taux de transfert plus rapide.
La principale innovation de cette architecture serait la [Unified Memory](https://en.wikipedia.org/wiki/Graphics_processing_unit#Integrated_graphics).
La finesse de gravure devrait rester à 16 nm.

Les gains de performance les plus importants constatés entre deux architectures sont quand il y a une diminution de la finesse de gravure, plus la finesse de gravure est basse (16 nm à partir de Pascal) plus les cartes possèdent de transistors sur une même surface. Une baisse ddee la finesse de gravure engendre souvent une baisse de la consommation.
L'autre point qui permet d'améliorer grandement les performances est le type de mémoire utilisé et la fréquence d'utilisation.

# Processeurs SoC
Les processeurs [SoC](https://fr.wikipedia.org/wiki/Syst%C3%A8me_sur_une_puce) sont basé sur un processeur tout en un, comprennant donc plus qu'un simple processeur (en fonction des besoins).  
Ces derniers sont destiné aux appareils mobiles, ou embarqués.  
Nous ne rentrerons en détails dans cette gamme que dans le cas de la carte Jetson TK1

# [Tegra](https://fr.wikipedia.org/wiki/Tegra)
Le processeur Tegra est le composant Nvidia SoC: il contient CPU, GPU, northbridge, southbridge, et une mémoire primaire.  Les premières générations apparaissent en 2008.

# [Tegra K1](https://fr.wikipedia.org/wiki/Tegra#Tegra_K1)
Le processeur TK1 est l'unité centrale de la carte Jetson TK1. 
Il se base sur l'architecture Kepler. 

_Basé sur 4 CPU ARM Cortex-A15 MPCore à 2,3 GHz et gravé en 28 nm en utilisant la technologie trois portes FinFET, il contient 32 ko de cache L1 et supporte jusqu'à 8 Gio de RAM DDR3. Il contient également un GPU Kepler contenant 192 cœurs CUDA supportant OpenGL ES 3.0 et DirectX 11, et pour la première fois dans un SoC ARM, OpenGL, en version 4.4. Il supporte une définition 4K Ultra HDTV et un appareil photo jusqu'à 100MPx._  



# Lectures:  
* [Fonctionnement interne GPU](http://courses.cs.washington.edu/courses/cse471/13sp/lectures/GPUsStudents.pdf)  
* [Architectures modernes GPU](ftp://download.nvidia.com/developer/cuda/seminar/TDCI_Arch.pdf)