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
Librairie de machine utilisant les ressources matérielles au mieux (possibilité de calculs distribués sur plusieurs GPU).  
[Tensorflow](http://tensorflow.org)  
[mnist tensorflow](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/examples/tutorials/mnist/mnist.py)  
[docker](https://hub.docker.com/r/tensorflow/tensorflow/)  

### Keras
Keras est une librairies haut niveau utilisant Tensorflow ou Theanos, pour expérimenter des réseaux neuronaux de manière rapide et instinctive.  
[Keras](https://keras.io/)  
[mnist keras](https://github.com/fchollet/keras/blob/master/examples/mnist_cnn.py)  
![sortie kerras mnist](img/kerrasMnist.png)
[docker](https://hub.docker.com/r/gw000/keras/)


##See Also

[Liste de librairies accélérées par GPU](https://developer.nvidia.com/gpu-accelerated-libraries)  
[Liste de frameworks](https://developer.nvidia.com/deep-learning-frameworks)
[Comparaison entre différents frameworks de Deep-Learning](https://en.wikipedia.org/wiki/Comparison_of_deep_learning_software)  
[MindMap de différents modeles d'algorythmes de Machine-Learning](http://www.wangbo.info/img/mlmindmap.png)  
[TF Learn](http://tflearn.org/)  
