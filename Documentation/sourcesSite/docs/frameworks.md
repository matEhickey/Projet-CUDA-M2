# Frameworks

Il existe de nombreux langages , librairies et frameworks avec lequels on peut utiliser la puissance des GPU en fonction de ses besoins.

-----------------------------------------------------------------------------------------------------------------------

## Bindings
### CUDA C
Librairies bas niveau pour l'utilisation des threads CUDA  
[CUDA C Programmming](https://docs.nvidia.com/cuda/cuda-c-programming-guide/)

### PyCUDA
Bindings Python pour les librairies CUDA. Permet d'integrer des kernels CUDA dans du code python  
[PyCUDA](https://mathema.tician.de/software/pycuda/)

-----------------------------------------------------------------------------------------------------------------------

##Librairies
### AmgX
Resolveur de problèmes utilisé pour les simulations physique nottament, dans les domaines de l'industrie.  
[AmgX](https://developer.nvidia.com/amgx)

### CuDNN
Librairies d'implémentations de réseau neuronnaux de type Deep-Leearning.
Peut être utilisé pour accélerer le travail d'autre frameworks de machine learning tel que Caffe, Tensorflow, Theano, Torch, CNTK etc..  
[Compatibles](https://developer.nvidia.com/deep-learning-frameworks)  
[CuDNN](https://developer.nvidia.com/cuDNN)

### CuFFT
Transformation de Fourrier rapide via GPU  
[CuFFT](https://developer.nvidia.com/cuFFT)

### IndeX
Visualisation de données météorologiques.  
[Index](https://developer.nvidia.com/index)

### NvGRAPH
Librairies regroupant des algorythmes d'analyse et traitements de graphes contenant plus de 2 milliars d'arretes.  
[Index](https://developer.nvidia.com/nvGRAPH)

### CUDA Maths library
Ensemble de fonctions mathématiques optimisé pour GPU  
[CUDA Maths library](https://developer.nvidia.com/cuda-math-library

### OpenCV
Librairie Open Source de Vision par ordinateur (Computer Vision), de traitement d'images, et de machine learning  
[OpenCV](https://developer.nvidia.com/opencv)

------------------------------------------------------------------------------------------------------------------------
## Frameworks
Nous avons étudié différents frameworks GPU pour déterminer nos besoins réels pour notre application finale.  
Notre choix se portait initialement sur Tensorflow, qui est le cador actuel dans le domaine de l'IA, et qui nous a été fortement conseillé, cependant nous voulions tester ses concurents pour justifier l'utilisation de Tensorflow.  
Pour la rapidité des différents essais, ainsi que la préservation du systeme, nous avons décidé d'utilisé la plateforme Docker, qui nous permet l'installation de mini-vm préconfiguré avec les logiciels nécessaire a nos besoins.  
Cependant, ces tests se faisant sur les heures personelles, nous utilisions docker, et non nvidia-docker qui ne fonctionne pas sur Windows, ainsi, l'utilisation des GPU n'était pas possible, de toute facon, le but étant de comparer les frameworks d'inteligence entre eux, les resultats de classifications (et la simplicité avec laquelle les programmes se codent) nous interessais plus que les temps d'éxecutions.  
Nous avons estimé, que notre probleme (transcription des signes), est assez proche du probleme de classification d'image mnist, qui consiste a classifier des chiffres écrit à la main.  
Exemples de code pour résoudre le probleme de classification de [mnist](http://yann.lecun.com/exdb/mnist/)

### Caffe  
Deep-learning framework, optimisé pour GPU  
[Caffe](http://caffe.berkeleyvision.org/)  
[mnist caffee](http://caffe.berkeleyvision.org/gathered/examples/mnist.html)  
[docker](https://hub.docker.com/r/kaixhin/caffe/)  

### CNTK
Microsoft cognitive Toolkit  
[CNTK](https://www.microsoft.com/en-us/research/product/cognitive-toolkit/)  
[mnist cntk](https://github.com/Microsoft/CNTK/blob/master/Examples/Image/Classification/MLP/MLP_MNIST.cntk)  
[docker](https://hub.docker.com/r/microsoft/cntk/)  


### Theano
Librairie de calcul mathématiques, notamment multidimensions, optimisé pour les GPU.  
[Theano](http://deeplearning.net/software/theano/)  
[mnist theano](https://github.com/lisa-lab/DeepLearningTutorials/blob/master/code/convolutional_mlp.py)  
[docker](https://hub.docker.com/r/kaixhin/theano/)  

### Torch
Framework à but scientifique qui supporte de nombreux algorythmes, en optimisant par GPU  
[Torch](http://torch.ch/)  
[mnist torch](https://github.com/torch/demos/blob/master/train-a-digit-classifier/dataset-mnist.lua)  
[docker](https://hub.docker.com/r/kaixhin/torch/)  

### Tensorflow
Tensorflow est le framework d'inteligence porté par Google, il semble le framework le plus complet, avec des tas de fonctionnalités et domaines d'application.  
La communauté est très active et de nombreuses ressources sont déja disponibles.  
Tensorflow est prévu pour le déployement sur de nombreux type de machines, comme les serveurs distribués, les ordinateurs personnels, ou encore les smartphones, que la machine dispose d'un GPU ou non.  
[Tensorflow](http://tensorflow.org)  
[mnist tensorflow](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/examples/tutorials/mnist/mnist.py)  
[docker](https://hub.docker.com/r/tensorflow/tensorflow/)  

### Keras
Keras est une surcouche utilisant ou Tensorflow, ou Theano, en simplifiant grandement l'écriture du code.  
En effet, le paradygmes par flow et tenseur est assez compliqué a imaginer, et encore plus à mettre en place.  
Avec Keras, la mise en place est simplifié au maximum, ne reste que les soucis de modélisation de notre problèmes.  
[Keras](https://keras.io/)  
[mnist keras](https://github.com/fchollet/keras/blob/master/examples/mnist_cnn.py)  
![sortie kerras mnist](img/kerrasMnist.png)
[docker](https://hub.docker.com/r/gw000/keras/)

### Tflearn  
TFLearn fourni une interface à tensorflow de manière simplifé.  
Le code est beaucoup lisible, compréhensible, et est améliorable avec du vrai code Tensorflow au besoin.  

### OpenCV  
Après les résultats, plutot mauvais que nous ayons obtenu avec les classifiers d'images simples pour nos datasets d'images de mains, nous avons décider d'améliorer les images avec des pré-prétraitements, qui nous permettraient d'utiliser d'analyser des zones plus discriminantes de l'image, et avec des dimensions plus petites, ce qui devrait améliorer nos résultats, et les vitesses d'entrainements/de classification.  
Nous avons commencer par regarder les solutions que propose Nvidia (Nvidia Vision-works), mais nous avons trouvés des résultats comparatifs (Fichier a retrouver!!!)[.] et Vision-works est pour la majorité des problèmes plus lent que la version GPU de OpenCV, qui lui, est open-source, dispose d'une très large communauté, et possède des bindings dans de nombreux langages. 
On voit sur ce document que Nvidia-VisionWorks est surtout fait pour détecter des angles mouveant sur des flux vidéos.  
J'ai donc décidé d'essayer les versions C++, Java(via processing), et Python de OpenCV.  
Mon choix final se porte sur Python, car le groupe de projet maitrise bien ce langage, et que si nous utilisons Tensorflow, Tflearn, Keras etc, nous serions amener a le faire en Python.  
L'amélioration de la vitesse des traitements via la version C++ étant minime, je préfere l'écarter du au temps nécessaire pour développer.  
Enfin, la version Java était très bien, surtout grace processing, qui simplifie grandement la pratique de Java pour des applications graphiques, ainsi que par sa communauté.  

Ne distinguant aucune réelle différence dans les API en fonction du langage utilisé, j'ai décider pour définir le modèle des traitements en processing, car les modifications de codes et tests sont les plus rapides, et lorsque le modele nous semblera fonctionnel, de le porter sur Python.  

##See Also

[Liste de librairies accélérées par GPU](https://developer.nvidia.com/gpu-accelerated-libraries)  
[Liste de frameworks](https://developer.nvidia.com/deep-learning-frameworks)
[Comparaison entre différents frameworks de Deep-Learning](https://en.wikipedia.org/wiki/Comparison_of_deep_learning_software)  
[MindMap de différents modeles d'algorythmes de Machine-Learning](http://www.wangbo.info/img/mlmindmap.png)  
[TF Learn](http://tflearn.org/)  
