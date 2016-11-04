# CPU/GPU

La différence de performance entre les CPU et les GPU est due à la parallélisation des calculs.  
Les programmes s'éxecutant de maniere classique, cad par un processeurs, se font majoritairement de manière séquencielle, malgré les efforts des processeurs multi-coeurs et des programmes multithreadés.  
Le GPU répond a ce problème en proposant un parallélisme extrême, passant par un nouveau paradigme de programmation, car dépendant de l'implémentation matérielle de la carte de calcul.  
Ainsi, un GP peut être représenté par un grand nombre de processeurs collé les uns à coté des autres, faisant des calculs simple, mais de manière totalement parallèle.  
![Comparaison](http://blog-test.goldenhelix.com/wp-content/uploads/2010/10/cpu_vs_gpu.png)
```
Les CPU incluent un nombre restreint de cœurs optimisés pour le traitement en série, alors que  
les GPU intègrent des milliers de cœurs conçus pour traiter efficacement de nombreuses tâches simultanées.
```

[Lien](http://www.nvidia.fr/object/gpu-computing-fr.html)