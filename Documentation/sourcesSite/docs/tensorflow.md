# Introduction
TensorFlow est un système de programmation dans lequel les calculs sont représentés sous forme de graphiques. Les nœuds du graphe sont appelés ops (abréviation de opérations). Un op prend zéro ou plus Tensors, effectue un certain calcul, et produit zéro ou plus Tensors. Dans la terminologie TensorFlow, un Tensor est un tableau multidimensionnel typé. Par exemple, on peut représenter un mini-lot d'images en tant que tableau 4-D de nombres en virgule flottante avec des dimensions [lot, hauteur, largeur, canaux].

Un graphique TensorFlow est une description des calculs. Pour calculer quoi que ce soit, un graphique doit être lancé dans une session. Une session place les opérations graphiques sur les périphériques, comme les CPU ou les GPU, et fournit des méthodes pour les exécuter. Ces méthodes renvoient des tenseurs produits par des ops en tant qu'objets numpy ndarray en Python, et comme des instances tensorflow :: Tensor en C et C ++.  


# Structure d'un programme

Les programmes TensorFlow sont généralement structurés en une phase de construction, qui assemble un graphe, et une phase d'exécution qui utilise une session pour exécuter des opérations dans le graphe.

Par exemple, il est courant de créer un graphe pour représenter et former un réseau neuronal dans la phase de construction, puis exécuter à plusieurs reprises un ensemble d'opérations d'apprentissage dans le graphe dans la phase d'exécution.

TensorFlow peut être utilisé à partir de programmes C, C ++ et Python. Il est actuellement beaucoup plus facile d'utiliser la bibliothèque Python pour assembler des graphiques, car il fournit un grand nombre de fonctions auxiliaires non disponibles dans les bibliothèques C et C ++.


Nous prenons un simple exemple de multiplication de deux matrices qui disponible sur le site de tensorflow. 

```python
import tensorflow as tf

#construction du graphe de calcul
matrix1 = tf.constant([[3., 3.]])
matrix2 = tf.constant([[2.],[2.]])
product = tf.matmul(matrix1, matrix2)

#Lancement du graphique dans une session
with tf.Session() as sess:
	print sess.run(product)

#Lancement du graphique dans une session distribué
with tf.Session("grpc://localhost:2222") as sess:
	print sess.run(product)
```



