#SET-UP

##Telechargements
###Ubuntu
L'utilisation de jetpack pour une carte jetson TK1 requiert l'utilisation d'ubuntu 14.04 sur la machine HOST
Téléchargement disponible ici : http://releases.ubuntu.com/14.04/.
Vérifier l'intégrité de l'ISO téléchargé en faisant un checksum : Comparer le résultat de md5 ISO_FILE.iso avec les numéros disponibles sur le site précendent (http://releases.ubuntu.com/14.04/MD5SUMS)

###Jetpack
Les dernieres versions de Jetson sont disponibles en téléchargement sur ce site : https://developer.nvidia.com/embedded/jetpack (login requis)  
Version physique utilisée : ...

##Installation d'Ubuntu sur la machine HOST



##Jetpack et Flashage de la carte 

**ATTENTION AU PROXY DE L'UNIVERSITE DU MAINE
utiliser les commandes  
export http=http://proxy.univ-lemans.fr:3128  
export http=http://proxy.univ-lemans.fr:3128  
export http=http://proxy.univ-lemans.fr:3128**  

ou bien rajouter ces trois lignes au fichier .bashrc pour une utilisation permanente.

Lancer jetpack avec les droit root.

La liste des différents actions qui vont être réalisées par JetPack s'affiche (Pour une reprise du set-up de la carte jetson après un flashage, choisir custom et desactiver le flashage).  

Dans un premier temps jetpack télecharge les différents composants à installer, tout en les installant sur la machine HOST, puis réalise un flashage de la carte sous la distribution L4T (linux for tegra) 24.2 (Pour notre version de jetpack).

![Jetpack Choix](https://github.com/matEhickey/Projet-CUDA-M2/blob/master/Documentation/sourcesSite/img/jetpack_choice.png?raw=true)

Suivre ensuite les instructions concernant le flashage (mise hors tension de la carte et liaison usb avec l'HOST).  
Une fois le flashage réalisé, Jetpack installe différentes librairies et exemples sur la carte via le réseau (la carte doit donc disposer d'un accès un internet tout comme l'HOST).


**ATTENTION AU PROXY DE L'UNIVERSITE DU MAINE**, ce dernier peut mettre en echec l'installation de quelques libraries et forcer une installation en ligne de commande sur la carte de ces dernieres.

  
## Post-Flashage

Utilisez les commandes suivantes afin d'active les différents cpu :

: ::

  echo 0 > /sys/devices/system/cpu/cpuquiet/tegra_cpuquiet/enable
  echo 1 > /sys/devices/system/cpu/cpu0/online
  echo 1 > /sys/devices/system/cpu/cpu1/online
  echo 1 > /sys/devices/system/cpu/cpu2/online
  echo 1 > /sys/devices/system/cpu/cpu3/online

Verifiez l'activation à l'aide de la commande :

##Verification de l'installation

#. Vérifiez la version du driver: ``/proc/driver/nvidia/version``: ::
  
    # cat /proc/driver/nvidia/version
     NVRM version: NVIDIA UNIX ppc64le Kernel Module  352.39  Fri Aug 14 17:10:41 PDT 2015
     GCC version:  gcc version 4.8.5 20150623 (Red Hat 4.8.5-4) (GCC) 

#. Vérifiez la version du toolkit CUDA ::

    # nvcc -V
     nvcc: NVIDIA (R) Cuda compiler driver
     Copyright (c) 2005-2015 NVIDIA Corporation
     Built on Tue_Aug_11_14:31:50_CDT_2015
     Cuda compilation tools, release 7.5, V7.5.17

#. Vérifiez le travail des GPUS CUDA en compilant les exemples ``deviceQuery`` ou ``bandwidthTest``.

   * Compilez les examples:

     **[Ubuntu]:** ::

        cd ~/
        apt-get install cuda-samples-7-0 -y
        cd /usr/local/cuda-7.0/samples 
        make 

   * Compilez ``deviceQuery``: ::

        # ./bin/ppc64le/linux/release/deviceQuery   
          ./deviceQuery Starting...
          CUDA Device Query (Runtime API) version (CUDART static linking)
          Detected 4 CUDA Capable device(s)
          Device 0: "Tesla K80"
            CUDA Driver Version / Runtime Version          7.5 / 7.5
            CUDA Capability Major/Minor version number:    3.7
            Total amount of global memory:                 11520 MBytes (12079136768 bytes)
            (13) Multiprocessors, (192) CUDA Cores/MP:     2496 CUDA Cores
            GPU Max Clock rate:                            824 MHz (0.82 GHz)
            Memory Clock rate:                             2505 Mhz
            Memory Bus Width:                              384-bit
            L2 Cache Size:                                 1572864 bytes
            ............
            deviceQuery, CUDA Driver = CUDART, CUDA Driver Version = 7.5, CUDA Runtime Version = 7.5, NumDevs = 4, Device0 = Tesla K80, Device1 = Tesla K80, Device2 = Tesla K80, Device3 = Tesla K80
            Result = PASS
   
   * Compilez ``bandwidthTest``: ::
 
        # ./bin/ppc64le/linux/release/bandwidthTest
          [CUDA Bandwidth Test] - Starting...
          Running on...
          Device 0: Tesla K80
          Quick Mode
          Host to Device Bandwidth, 1 Device(s)
          PINNED Memory Transfers
            Transfer Size (Bytes)        Bandwidth(MB/s)
            33554432                     7765.1
          Device to Host Bandwidth, 1 Device(s)
          PINNED Memory Transfers
            Transfer Size (Bytes)        Bandwidth(MB/s)
            33554432                     7759.6
          Device to Device Bandwidth, 1 Device(s)
          PINNED Memory Transfers
            Transfer Size (Bytes)        Bandwidth(MB/s)
            33554432                     141485.3
          Result = PASS
    Les exemples CUDA ne sont pas fait pour mesurer les performances. Les résultats peuvent varier quand le GPU Boost est activé.
  





