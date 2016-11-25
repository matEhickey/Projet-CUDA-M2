# Langage des signes

Mise en place d'un classifieur d'images pour distinguer les différentes lettres du langages des signes francais, et en réaliser une transcription automatique.

Il sera, dans un premier temps, classifié les lettres distinguables sans mouvements (le traitement d'images étant moins complexe que le traitement vidéo), et sans les mots/phrases qui possèdent un signe/mouvements chacuns

## Outils

Tensorflow  
[Dataset](https://sites.google.com/site/autosignlan/source/image-data-set)  
Training : [retrain.py](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/examples/image_retraining/retrain.py)  
Eval : [label.py](https://github.com/llSourcell/tensorflow_image_classifier/blob/master/src/py/label_dir.py)  

## Workflow
Utilisation de docker pour développement indépendant de la machine hôte (dans mon cas, depuis windows).  
Le probleme de docker est qu'il ne peut tirer parti du GPU (sur windows!, sur les systemes compatibles, il existe [nvidia-docker](https://github.com/NVIDIA/nvidia-docker), à tester sur la Jetson donc.)  

### Docker (quick start terminal):  

    docker run -it gcr.io/tensorflow/tensorflow:latest-devel   # Crée un container docker qui contient la derniere version de tensorflow/tensorflow  
    mkdir /tf_files   # Crée un dossier pour récuperer les fichiers utiles  
    exit   # Quite la vm pour y lier les tf_files  
    
    docker run -it -v $HOME/tf_files:/tf_files gcr.io/tensorflow/tensorflow:latest-devel   # lance le container avec /tf_files en commun avec le pc  
    
    # ouverture du terminal du container (si besoin):  
    # docker attach <name>
    
    # Lance l'entrainement sur les fichiers jpg du dossier /tf_files/signSplit      
    cd /tensorflow
    python tensorflow/examples/image_retraining/retrain.py \
        --bottleneck_dir=/tf_files/bottlenecks \
        --how_many_training_steps 4000 \
        --model_dir=/tf_files/inception \
        --output_graph=/tf_files/retrained_graph.pb \
        --output_labels=/tf_files/retrained_labels.txt \
        --image_dir /tf_files/signSplit 
    
    # Lance la prédiction
    python /tf_files/label.py /tf_files/sign/<number>.jpg
    
### Contenu de tf_files
    
    sign/  
        A/  
        B/  
        C/  
    signSplit/  
        A/  
        B/  
        C/
    label_image.py  
    modif.py   # Renomme les fichiers de train  
    splitData.py   # Coupe les données de train
    
convertion images ppm en jpg

    # install imagemagick 
    sudo apt-get install imagemagick
    convert *.ppm %d.jpg
    
## Premiers Résultats
Une classification sur 3 signes distincts avec environ 100 images pour chaque cas d'entrainement mene a une exactitude (final test accuracy) de 94%  

D'autres campagnes de tests automatisés seronts à réaliser pour produire des schémas de performances de ce modeles, pour essayer d'en trouver les faiblesses dans notre contexte de la reconnaissance du langages des signes, pour enfin essayer d'augmenter les performances de classification. 
Les tests s'avèrents relativememnt bons sur le meme dataset (mais des images qu'il n'as pas appris), cependant, apres un test sur une image de l'exterieur du dataset, les resultats sont médiocres.  
Nous avons mis aux point un script de generation de dataset a l'aide de la webcam (linux uniquement, paquets streamer et tkinter necéssaires).  
A tester donc.

### A voir pour la deuxieme expérimentation

[Nvidia docker](https://github.com/NVIDIA/nvidia-docker/wiki/Why%20NVIDIA%20Docker)  
Installation de docker sur ubuntu [3 versions](https://docs.docker.com/engine/installation/linux/ubuntulinux/) ou [16.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)  
[Installation de nvidia-docker](https://github.com/NVIDIA/nvidia-docker)  
[Tensorflow image on nvidia-docker](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/tools/docker)  

 

