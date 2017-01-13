<-- source : https://cvw.cac.cornell.edu/gpu -->

#Optimisation

##Divergence de Threads

Les threads d'un bloc sont regroupés en warps de taille fixe pour l'exécution sur un noyau CUDA, et les threads dans un warp doivent suivre la même trajectoire d'exécution. Tous les threads doivent exécuter la même instruction en même temps. En d'autres termes, les threads ne peuvent pas diverger.

###IF-THEN-ELSE


La construction de code la plus commune qui peut provoquer une divergence de thread sont les branchements conditionnels dans une instruction if-then-else. Si certains threads d'une seule chaîne sont évalués comme «vrais» et d'autres comme «faux», alors les threads «vrai» et «faux» se ramifient à des instructions différentes. Certains threads voudront passer à l'instruction 'then', tandis que d'autres 'else'.

Intuitivement, nous pensons que les instructions seront exécutés en parallèle. Cependant, les threads dans un block ne peut pas diverger,et donc la parrallelisation est donc impossible.CUDA a une solution de contournement qui corrige le problème, mais avec des conséquences assez négatives sur la performance.

Lors de l'exécution de l'instruction if-then-else, CUDA ordonne au warp d'exécuter la première partie puis de passer à la partie else. Lors de l'exécution de la premiere partie (if), tous les threads qui sont évalués à faux (else) sont désactivés. Lorsque l'exécution passe à l'état else, la situation est inversée. Les différentes instructions ne sont donc pas exécutées en parallèle, mais en série. Cette sérialisation peut entraîner une perte de performances significative.


###Exemple de dead_lock :

~~~~

//my_Func_then and my_Func_else are some device functions
if (threadidx.x <16)
{
	myFunc_then();
	__syncthread();
}else if (threadidx >=16)
{
	myFunc_else();
	__syncthread();
}

~~~~

La première partie execute ses instruction puis attend que la seconde partie du block atteigne __syncthread(), cependant la seconde partie ne commence jamais et par conséquent empeche la cloture de la première instruction.


##Mémoire coalescée

Un accès en mémoire est dit coalescé lorsque plusieurs threads d'un warp accèdent en même temps à à de la mémoire globale.
Les conditions suivantes peuvent résulter en un accès non-coalescé, le rendant donc sérializé :

* La mémoire n'est pas séquentielle
* L'accès à la mémoire est faible
* Un accès à la mémoire désaligné

###Accès séquentiel et aligné

Ici l'accès est séquentiel et aligné, il est donc coalescé.

Accès séquentiel et aligné: ![Alt](/img/asa.png "Accès séquentiel et aligné")	


###Accès aligné mais non séquentiel

Ici l'accès n'est pas séquentiel mais aligné. Sur certaines architectures, principalement les plus anciennes ce genre d'acès ne peut pas être effectué en une seule transaction.

Accès aligné mais non séquentiel: ![Alt](/img/nca.png "Accès aligné mais non séquentiel")

###Accès mémoire non aligné

Dans ce cas, l'accès à la mémoire est bien séquentiel mais non aligné, du coup il nous faut une transaction de plus pour charger la derniere valeur si l'alignement mémoire est de 128 Bytes.

####L'alignement 

Les pointeurs alloués par cudaMalloc ou cudaMallocPitch sont garanti d'avoir X bytes alignés (i.e l'adresse est un multiple de X) avec X le nombre de bytes indiqué par le "Texture alignement" (deviceQuery). Pour la Jetson TK1 notre alignement est de 512 bytes.

#####Exemple

~~~~

char *ptr1, *ptr2;

int bytes = 1;

cudaMalloc((void**)&ptr1,bytes);
cudaMalloc((void**)&ptr2,bytes);

~~~~

En supossant que l'adresse retourné par ptr1 est un multiple de 512, alors l'adresse retournée dans ptr2 seras au minimun (ptr1 + 512).
Cette restriction est imposé par le device sur lequel la mémoire est alloué, principalement pour des raisons de performances.





Accès non aligné: ![Alt](/img/uma.png "Accès non aligné")


#####Exemple

Un accès en mémoire coalescé ressemble à ce genre de code. 
~~~~
shared_memory[threadIdx.x]= global_memory[blockIdx.x*blockDim.x + threadIdx.x];
~~~~
L'instruction suivante n'ets quand à elle pas coalescée.
~~~~
stride=4;
shared_memory[threadIdx.x]= global_memory[stride*blockIdx.x*blockDim.x + threadIdx.x*stride];
~~~~









#Rappel

*La mémoire globale est lente, la mémoire "on-chip" est beaucoup plus rapide
*Eviter en tout moment la divergence de threads
*Des accès en mémoire coalescés permettent d'améliorer grandement la performance 














