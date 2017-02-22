# Force Brute  

## Présentation  

En informatique la recherche par force brute est une méthode qui consiste à tester toutes les solutions possibles à un problème donné jusqu'à trouver la bonne solution.
Dans notre cas nous nous sommes intéressé à essayer de trouver un mot de passe de plusieurs longueurs possibles.
L'intérêt de cette méthode est qu'elle permet de trouver n'importe quel mot de passe dans un temps fini peut importe la protection qui est utilisé pour les mots de passe.
L'inconvénient de la méthode est que plus la longueur du mot de passe à trouver augmente plus le temps de calcul pour trouver celui-ci est long.
On considère que si C représente le nombre de caractères possibles et que N représente la longueur du mot de passe alors le nombre maximum de possibilités à tester est : C^N.  


## Pourquoi la force brute ?  

L'objectif d'implémenter un algorithme de force brute dans le cadre du projet est de se familiariser avec CUDA. 
Le second objectif est de proposer un comparatif entre une version parallèle de l'algorithme (CUDA exécuté sur le GPU) et une version séquentielle (C exécuté sur le CPU).  


## Implémentation en C (CPU)  

Pour implémenter l'algorithme de force brute en C, on a utilisé une fonction récursive qui permet de déterminer chaque caractère du mot de passe pour une longueur donnée.
Voici ci-dessous le code de cette fonction :  

    void forceBrute(int longMDP, int profondeur, char mdpTrouve[50]){
    	int i;
    	
    	// Test si la longueur de mot de passe actuelle est équivalente à la profondeur de la récursivité
    		// Si oui on test si le mot de passe formé correspond au mot de passe cherché
    			// Si oui on met fin au programme
    	if(longMDP == profondeur){
    		mdpTrouve[profondeur] = '\0';
    		if(strcmp(mdp,mdpTrouve) == 0){
    			printf("Le mot de passe est %s\n", mdpTrouve);
    			gettimeofday(&finProgramme,0);
    			dureeProgramme = timedifference_msec(debutProgramme,finProgramme);
    			printf("le temps d'execution du programme est : %.3f ms\n",dureeProgramme); 
    			exit(1);
    		}
    		return;
    	}
    	
		// On itère sur les caractères possibles pour un mot de passe
		// On attribut le caractère actuel à la position équivalente à la profondeur
		// on rappel cette même fonction en augmentant la profondeur jusqu'à atteindre la longueur de mot de passe souhaité
    	for(i=32;i<=127;i++){
    		mdpTrouve[profondeur] = (char) i;
    		forceBrute(longMDP,profondeur+1,mdpTrouve);		
    	}
    }  
    
Grâce à cette fonction on peut tester chaque mot de passe séquentiellement pour n'importe quelle longueur de mot de passe voulu.
Dans le main du programme on itère sur cette fonction jusqu'à atteindre la longueur du mot de passe que l'on cherche et jusqu'à ce qu'il soit trouvé.  

### Améliorations possibles de l'implémentation en C  

Pour améliorer la version C et donc CPU, il faudrait utiliser des threads pour paralléliser la recherche du mot de passe et en théorie gagner du temps.
La version actuelle avec la fonction récursive ralenti le programme surtout si la longueur du mot de passe est grande car dans ce cas il y aura beaucoup d'appel de la fonction récursive ce qui alourdi beaucoup.  


##  Implémentation en CUDA (GPU)  

Pour implémenter l'algorithme de force brute en CUDA, on a créé le kernel (fonction qui est exécuté sur le GPU par plusieurs threads) suivant :  

    __global__ void bruteForce2(char *mdp,char *mdpDebut,char *mdpTrouve,int longMdp,int nbThread){
        char *mdpIter;
        int retenu;
        int i;
        int j;
    
        mdpIter = (char *)malloc((longMdp+1)*sizeof(char));
    
        // Recopie du mot de passe de départ dans une variable locale
        // Sinon chaque thread itère sur la même variable
        for(i=0;i<=longMdp;i++){
            mdpIter[i] = mdpDebut[i];
        }
    
        // Ajout au mot de passe de départ le numéro du thread actuel
        mdpIter[longMdp-1] += threadIdx.x;
    
        while(1){
            // Compare le mot de passe actuel au mot de passe à trouver
            // S'ils sont équivalent on quitte sinon on continue
            for(i=0;i<=longMdp;i++){
                if(mdpIter[i] != mdp[i]){
                    break;
                }
    
                if(i==longMdp){
                    for(j=0;j<=longMdp;j++){
                        mdpTrouve[j] = mdpIter[j];
                    }
    
                    return;
                }       
            }
            
            // Ajout au mot de pass actuel le nombre de threads
            mdpIter[longMdp-1] += nbThread;
    
            // Gestion des "retenu" suite à l'addition précédente
            // Vérication que chaque caractère du mot de passe est dans les caractères autorisés
            if(mdpIter[longMdp-1] > 127){
                if(longMdp == 1){
                    return;
                }
                retenu = mdpIter[longMdp-1] - 128;
                mdpIter[longMdp-1] = (char) 32+retenu;
                for(i=longMdp-2;i>=0;i--){
                    mdpIter[i] += 1;
                    if(mdpIter[i] > 127){
                        if(i == 0){
                            return;
                        }
                        for(j=i;j<=longMdp-2;j++){
                            mdpIter[j] = (char) 32;
                        }
                    }
                    else{
                        break;
                    }
                }
            }
        }
    }  

Grâce à cette fonction chaque thread recherche le mot de passe de façon synchrone, ils testent tous des possibilités différentes en même temps.
Le premier mot de passe que test chaque thread est le mot de passe de départ auquel on ajoute le numéro du thread.
Puis après tous les threads ajoute au mot de passe actuel le nombre de thread qui ont été lancé.
Dans le main du programme on itère jusqu'à la longueur du mot de passe.  

### Améliorations possibles de l'implémentation en CUDA  

Actuellement l'algorithme en Cuda n'est pas encore optimisé, pour une longueur de mot de passe donnée si un thread trouve le bon mot de passe les autres threads continuent à chercher le mot de passe jusqu'à avoir testé toutes les possibilités de cette longueur.
Plus le mot de passe est long plus cette implémentation va continuer à itérer pour rien (perte de temps) alors que le bon mot de passe aura été trouvé.  


## Comparaison des deux versions  

En théorie, pour les mots de passe de longueur courte (3 à 4 caractères maximum) le CPU trouve le mot de passe plus rapidemnt car sur la version GPU le temps de lui allouer les variables c'est trop lent par rapport à la faible longueur du mot de passe.
Pour les mots de passe plus long (5 à 6 caractères minimum) la version GPU trouvera le mot de passe plus rapidement car la perte de temps à l'allocation des variables est largement compensé par la parallélisation des tâches.  

Dans les faits avec nos implémentations la version GPU est quasiment toujours plus lente à cause du problème d'optimisation signifié dans la rubrique au dessus.  


## Améliorations et optimisation possible de l'algorithme de force brute  

### Attaque basée sur l'utilisation d'un dictionnaire  

Les utilisateurs ont tendance à choisir des mot de passe plus facile à retenir plutôt que des mots de passe aléatoire.
Dans ce cas il est préférable d'utiliser un dictionnaire recenssant les mots de passe les plus courant et les mots courants de la langue de l'utilisateur et de tester ces mots de passe en priorité.  

### Attaque basée sur des règles  

L'algorithme utilise des règles pour tester des variantes de mot de passe en se servant par exemple d'une partie du nom d'utilisateur.  

### Attaque basée sur la puissance de calcul  

Un ordinateur simple est capable de tester plusieurs centaines de milliers de combinaisons de mot de passe mais lorsque cela n'est plus suffisant, les utilisateurs de de la force brute peuvent avoir recours à des botnet, ce sont des réseaux d'ordinateurs zombies détournés à l'insu de leurs propriétaires.