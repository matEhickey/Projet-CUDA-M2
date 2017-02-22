#CUDA
![Nvidia CUDA logo](http://images.anandtech.com/doci/6839/nvidia-cuda2.png)  
CUDA (Compute Unified Device Architecture), est une technologie développé par NVIDIA pour ses cartes graphiques en 2007.  
Elle permet d'accéder a la puissance de la carte graphique via une API C, ou des bindings dans des langages plus haut niveau (python-cuda), et a des frameworks(Tensorflow, Caffee).  

Les concurrents de CUDA sont OpenCL, Larrabee, ATI Stream etc.. 

#Coeurs CUDA
Les coeurs CUDA sont des unités de calculs pas si différentes que celles sur les cartes AMD (stream processor). Ces deux types d'unités de calculs excellent dans l'éxécution de programmes parallèles.


Les différences notables sont que les coeurs CUDA sont plus gros, plus complexe et tourne sur une fréquence plus élevé. Ainsi on ne peut pas comparer le nombre de coeur entre une carte NVIDIA et AMD car il faut plus d'unités de calculs dans les cartes AMD pour égaler les performances d'une carte NVIDIA.


Le compilateur CUDA fait moins d'optimisations et laisse la carte NVIDIA assigné les coeurs dont aura besoin le programme.
Un des points important en faveur de CUDA est le support qu'apporte NVIDIA, c'est pour cela qu'il y a un grand nombre de librairies disponibles pour CUDA.

#Block/Thread
Un programme (s'exécutant sur un CPU) peut avoir besoin d'appeler des calculs qui seront réalisés par des threads sur le GPU.  
Pour cela il doit s'arranger pour donner a la carte les zones mémoires ou sont stockés les données en input, et ou écrire les données résultantes.  
Ensuite, la fonction est exécuté par autant de threads que nécessaire.  
Les threads sont numérotés, et ils peuvent accéder a leur identifiant. Ainsi, il peut savoir quelle partie de la mémoire il peut manipuler.  
Les threads sont répartis dans des blocks CUDA. Cela sert a partagé la mémoire d'une façon plus efficace. En effet, il existe une hiérarchie d'accès à la mémoire.  
La mémoire propre du thread, la mémoire partagé par tout les blocks du thread, et enfin la mémoire globale.  

##Exemple de code CUDA
    #include <stdio.h>
    #include <stdlib.h>
    #include <cuda.h>
    #include <cuda_runtime.h>

    __global__
    void mykernel(float *A1, float *A2, float *R)
    {
        int p = threadIdx.x;
        R[p] = A1[p] + A2[p];
    }
     
    int main()
    {
        float A1[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
        float A2[] = { 10, 20, 30, 40, 50, 60, 70, 80, 90 };
        float R[9];
        int taille_mem = sizeof(float) * 9;

        // on alloue de la memoire sur la carte graphique
        float *a1_device;
        float *a2_device;
        float *r_device;
        cudaMalloc((void**) &a1_device, taille_mem);
        cudaMalloc((void**) &a2_device, taille_mem);
        cudaMalloc((void**) &r_device, taille_mem);

        // on copie les donnees sur la carte
        cudaMemcpy(a1_device, A1, taille_mem, cudaMemcpyHostToDevice);
        cudaMemcpy(a2_device, A2, taille_mem, cudaMemcpyHostToDevice);
            
        //9 additions, aucune boucle !
        mykernel<<<1, 9>>>(a1_device, a2_device, r_device);
        
        // on recupere le resultat
        cudaMemcpy(R, r_device, taille_mem, cudaMemcpyDeviceToHost);
        // sortie à l'ecran
        for(int i = 0; i < 9; i++) {
            printf("%f\n", R[i]);
        }
    }












## En Détail

Un programme CUDA est composé de deux composants primaire : un hôte (host) et un device (le GPU). 
Le code Host tourne sur le CPU, tandis que les fonctions kernel tournent sur le GPU.
L'execution du kernel peut être réalisée totalement indépendament de l'execution de l'host.

![](/img/host_device.png "Host and device")	

Une application commence par executer le concernant l'host CPU, ensuite l'host invoque un kernel GPU sur le device GPU. Le GPU execute ce kernel en parallèle en utilisant de multiples threads. Lorsque le kernel complete son exécution, le CPU reprend son execution du programme d'origine.
(il est possible d'executer plusieur kernel ou bien de ne pas attendre sa fin pour continuer l'exeuction du host, nous détaillerons ceci dans la partie Stream et synchronisation).

### Kernels

CUDA C hérite du C en permettant aux programmers de définir des fonction C, appelées kernels, qui lorsqu'elle sont appellées, sont executées N fois en parallele par N différents threads CUDA, contrainrement à une fois seulement en C. Un kernel est tout simplement une fonction exécutée sur le GPU.

#### Définir un kernel

Un kernel peut être défini de 2 façons différentes avec les mots clés __global__ et __device__.
Le mot clé __global__ signifie que c'est une fonction qui est appelée par le CPU mais exécutée par le GPU alors que le mot clé __device__ signifie que c'est une fonction qui est appelée par le GPU et exécutée par le GPU.
Pour ces fonctions, il n'y a pas de récursion possible, pas de variables statiques et pas de liste de paramètres variable autorisés.

~~~

// Definition du Kernel
__global__ void VecAdd(float* A, float* B, float* C)
{
    int i = threadIdx.x;
    C[i] = A[i] + B[i];
}

~~~

#### Invoquer un Kernel

Invoquer un kernel GPU est très similaire à l'appel d'une fonction. CUDA utilise une synthaxe à base de chevron afin de configurer et d'exectuer un kernel. 
Il faut donc lui indiquer le nombre de blocs et le nombre de threads à utiliser.

~~~

int main()
{
    ...
    // Invocation de Kernel avec N threads sur 1 bloc
    VecAdd<<<nbBlocs, nbThreadParBlocs>>>(A, B, C);
    ...
}

~~~

nbBlocs correspond au nombre de subdivisions que l'on créé dans la grid (voir section ci-dessus) alloué au kernel.
threadsParBloc correspond au nombre de threads que l'on créé pour chaque bloc.
Ici chacun des threads executant VecAdd() performent une addition.  

Ces paramètres doivent être choisi judicieusement par le programmeur cat la performance du programme en dépend. En effet le choix de ces paramètres dépend du problème que l'on veut résoudre et de la puissance du GPU. S'il y a un mauvais choix des paramètres, un trop petit/grand nombres de blocs ou un trop petit/grand nombre de threads, il peut y avoir une perte de performances.

### Grid

La grid (grille) est le nom d'un kernel actif. Lorsque l'on lance plusieurs kernels, chacun à son propre espace de travail, sa grid

![](/img/grid.png "Grid")

### Blocs
Un bloc est un ensemble limité de threads (multiple de 2).
Les blocs composant une grid sont totalement indépendants. Différents blocs sont assignés à différents microprocesseurs (SM pour streaming multiprocesors).
Plusieurs blocs peuvent être présent sur le même SM, mais un bloc ne peut pas être distribué sur plusieurs SM en même temps.
Les threads utilisés dans un bloc peuvent :
    *Se synchroniser ( à l'aide de la fonction __syncthreads qui agit comme une barriere tant que tout les threads du même bloc ne l'ont pas atteinte)
    *Partager de la mémoire (shared memory)
    *Communiquer

### Parraléllisme

L'indépendance des blocs et des kernel permet à CUDA d'être plus évolutifs et plus flexibles. CUDA peut donc supporter plusieurs formes de parralélisme tel que :
*Parraléllisme au niveau des threads : Différents threads exectuent différentes tâches.
*Parraléllisme au niveau des blocs et des grids : Différents blocs ou grids executent différentes tâches.
*Parraléllisme de données : Différents threads and blocks travaillent sur différentes parties de la mémoire.

### Thread ID

Chaque bloc et chaque thread disposent d'un index qui leur est propre, uniquement accesible depuis un kernel actif.
Les variables blockIdx et threadIdx contiennent ces index.
threadIdx est un vecteur à trois dimension, tandis que blockIdx est un vecteur à 2 dimensions. L'index threadIdx est donc lui-même le bloc de threads.
La taille de la grid et d'un bloc est définie respectivement par les variables gridDim et blockDim.

### Warp

Les warps sont des groupes de threads consécutifs. Un warp est executé par un seul coeur CUDA.
A l'execution, un bloc de threads est divisé en un nombre de warp égal au nombre de coeur CUDA dans le SM.
La taille des warps dépend du matériel, par exemple pour la jetson TK1 chaque warp contient 32 threads.
Ce sont ces warps qui nous permettent d'obtenir un style d'execution SMT (Single Instruction Multiple-Thread).
Contrairement au grids et aux blocs, l'implémentation des warps n'est pas accesible aux programmeurs. Cependant, ce modèle d'execution influe sur les performances (plus de détail dans la section Optimisation).

### Hierarchie de la mémoire 

Les threads CUDA ont accès à différents espaces de la mémoire lors de leurs éxecutions. 
Chaque thread dispose d'un espace mémoire privé qui lui est propre.
Chaque thread peut aussi accéder à un espace de mémoire partagée avec tout les threads du même bloc ainsi qu'à la mémoire globale (partagée par tout les kernels).

![](/img/)

L'hote et le device maintiennent leurs propres espaces mémoires en DRAM, réfférés en temps qu'host memory et device memory.

### Thrust vector

Thrust est une librarie basée sur la STL (Standard Template Library). Elle offre une interface haut-niveau permettant de programmer plus facilement des applications CUDA.

Thrust fournit deux containeurs vectoriels : host_vector (stocké sur la mémoiré de l'host) et device_vector (stocké sur la mémoire du GPU).
Ces vecteurs fonctionnent de la même manière que les std::vector disponibles en C++ STL : 
ce sont des conteneurs géneriques (tout type de donnée) pouvant être redimensionnés dynamiquement.
Lorsqu'une fonction Thrust est appellée il vérifie automatique le type d'itérateur utilisé pour déterminer si il doit utiliser une implémentation host ou device.
Ce processus est connu sous le nom de "static dispatching" car  l"implémentation host/device est determinée durant la compilation.

Nous pouvons utiliser des raw_pointers pour accèder aux données sans utiliser les itérateurs.

### Capacité de calcul

La capacité de calcul d'un appareil est représenté par son numéro de version (parfois appellé "SM version").
Ce numéro de version permet d'identifier le nombre de feature supporté par le hardware GPU et est utilisé par les application à l'éxecution pour déterminer les outils et instructions diposnibles pour le GPU.

Les appareils ayant la même architecture diposent du même niveau de revision.
Liste des capacités selon les versions : http://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#compute-capabilities

#### Compilation

NVIDIA fournit un compilateur spécialement prévu pour CUDA. Ce compilateur se nomme nvcc, il effectue toutes les étapes de la compilation c'est à dire l'assemblage, la compilation et l'edition des liens.
Vou pouvez utiliser la ligne de commande suivante pour compiler :

~~~

nvcc monprogramme.cu -o monprogramme.out

~~~

Vous pouvez utiliser aussi les makefile car le compilteur CUDA fonctionne très bien avec ceux-ci.





# Alternatives
* [OpenCL](https://en.wikipedia.org/wiki/OpenCL)  
Combinaisons d'API CPU multi-coeurs / GPU  
[Site Nvidia](https://developer.nvidia.com/opencl)