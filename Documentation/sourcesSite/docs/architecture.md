# Architectures GPU Nvidia
Voici une liste des architecture de GPU de Nvidia, de la plus ancienne à la plus récente.

* [Tesla](https://en.wikipedia.org/wiki/Tesla_(microarchitecture)) : 2006  
Premier implementation du ["Unified Shading Architecture"](https://en.wikipedia.org/wiki/Unified_shader_model)

* [Fermi](https://en.wikipedia.org/wiki/Fermi_(microarchitecture))  : 2010  
Premier véritable systeme GPU.

* [Kepler](https://en.wikipedia.org/wiki/Kepler_(microarchitecture))  : 2012  
Moins couteux en energie, plus performant, et plus facilement programmable

* [Maxwell](https://en.wikipedia.org/wiki/Maxwell_(microarchitecture)) : 2014  
Ameliorations des Streaming Multiprocessor, et gain en ratio performance/energie

* [Pascal](https://fr.wikipedia.org/wiki/Pascal_(architecture_de_carte_graphique)) : 2016  
Ameliorations des Streaming Multiprocessor, et Graphics Processor Cluster, 

* [Volta](https://fr.wikipedia.org/wiki/Volta_(architecture))  : A venir  
Devrait figurer [High Bandwidth Memory](https://en.wikipedia.org/wiki/High_Bandwidth_Memory), [Unified Memory](https://en.wikipedia.org/wiki/Graphics_processing_unit#Integrated_graphics), and [NVLink](https://en.wikipedia.org/wiki/NVLink)

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