#CUDA
![Nvidia CUDA logo](http://images.anandtech.com/doci/6839/nvidia-cuda2.png)  
CUDA (Compute Unified Device Architecture), est une technologie développé par NVIDIA pour ses cartes graphiques en 2007.  
Elle permet d'accéder a la puissance de la carte graphique via une API C, ou des bindings dans des langages plus haut niveau (python-cuda), et a des frameworks(Tensorflow, Caffee).  

Les concurrents de CUDA sont OpenCL, Larrabee, ATI Stream etc..  

#Block/Thread
Un programme (s'exécutant sur un CPU) peut avoir besoin d'appeler des calculs qui seront réalisés par des threads sur le GPU.  
Pour cela il doit s'arranger pour donner a la carte les zones mémoires ou sont stockés les données en input, et ou écrire les données résultantes.  
Ensuite, la fonction est exécuté par autant de threads que nécessaire.  
Les threads sont numérotés, et ils peuvent accéder a leur identifiant. Ainsi, ils peut savoir quelle partie de la mémoire il peut manipuler.  
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

# Alternatives
* [OpenCL](https://en.wikipedia.org/wiki/OpenCL)  
Combinaisons d'API CPU multi-coeurs / GPU  
[Site Nvidia](https://developer.nvidia.com/opencl)