### proof of concept


## TRESHOLD.

Nous avons juste reinventer la roue pour implementer le principe du tresold d'abord en c++(utilisant la librairie Opencv) et ensuite en cuda. 
Le principe est simple, nous comparons les valeurs des pixels d'image par rapport à un seuil donné. si la valeur est superieur au seuil le pixel est mis en blanc sinon en noir. l'image resultant est alors une image blanc-noire.

## Implementation C++

Pour la partie c++ ce n'était pas trop compliqué. Nous avons en effet chargé l'image et ensuite comparé les valeurs de chaque pixel au seuil (seuil = 128) et par la suite construit la nouvelle matrice de pixel et enfin enregistré. Nous avons très vite eu notre nouvelle image qui est bien blanc-noir.

## Implémentation CUDA

Pour la partie Cuda nous avons eu à gérer plusieurs choses. Nous avons d'abord chargé la matrice de pixels envoyé vers le device.la comparaison du pixel avec le seuil et l'affection de la nouvelle de pixel se font dans le code du kernel. Nous enfin récupérer la nouvelle matrice de pixel pour stocker l'image final. A chaque nous avons traité les exceptions moyennant le type d’exception cudaError_t predéfinies dans Cuda. Voici quelques cas dans lesquels nous avons traité ces exceptions 
- pendant l'allocation de la matrice de pixel s'executant côté matériel (cudaMalloc):

- pendant la copie de la matrice (host ->device) tout comme (device -> host) (CudaMemcpy)

- après l'execution du kernel, nous nous assurons que l'exécution s'est bien passé 
(CudaGetLastError: méthode qui retourne les erreurs s'ils en existe)

- pour l'affichage de les exceptions, nous utilisons la fonction CudaGetErrorString() sur notre type d'erreur.


# Compilation :

Nous avons utilisé un makefile simple pour compiler notre programme. Le contenu du makefile est donnée ci-dessous.

CFLAGS+= `pkg-config --cflags opencv`
LDFLAGS+=`pkg-config --libs opencv`
LIBS +=`pkg-config --libs opencv`

% : %.cu
	nvcc $(CFLAGS) $(LIBS) -o $@ $<
