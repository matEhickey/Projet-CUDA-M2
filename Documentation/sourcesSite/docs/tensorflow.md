#Tensorflow
Tensorflow est le framework destiné aux chercheurs en machine-learning, développé par Google (Open-source depuis 2015).  
Il permet de créer des modèles performants, de manière rapide et flexible, et organisé en graphes de flows.  
Les graphes contiennent des noeuds qui permettent des opérations, ou des liens entre noeuds, qui contiennent des tableaux multidimensionnels (des tenseurs).  
Les tenseurs sont des representations interressantes pour l'entrainement de réseaux neuronnaux car ils permettents d'applattir facilement les dimensions, et ainsi, gagne en complexité.
Tensorflow est capable de déployer ses modèles sur de nombreuses architecture matérielles (mobiles, avec/sans GPU, serveurs).  
Tensorflow est une librairie Python, mais il est prévu pour pouvoir réaliser facilement un bindings dans n'importe quel langage en codant un add-on en C++.

Un concurrent a Tensorflow est présent dans le NVIDIA Jetpack, il s'agit de cuDNN qui fourni des implementations rapides a de nombreuses fonctionalités exploitant pleinement le potentiels des GPU pour le machine-learning.