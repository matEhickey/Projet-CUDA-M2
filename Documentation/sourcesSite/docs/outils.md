# Outils  
Cette page regroupe les différentes instructions pour collaborer sur les outils dans les meilleurs conditions  

-------------------------------------------------------------------------------------------------


## Github  
_Plateforme de gestion de version_

* Installation
``` 
sudo apt-get install git  
```

* Ajouter le repo
```
git remote add upstream https://github.com/matEhickey/Projet-CUDA-M2  
git fetch upstream  
``` 

* Récupérer les (nouveaux) fichiers  
```
git pull https://github.com/matEhickey/Projet-CUDA-M2
```

* Ajout des changements dans les fichier et dossiers de l'emplacement ou l'on se trouve
```
    git add .
```

* Commit des changements (Titre DESCRIPTIF et CLAIR **OBLIGATOIRE**, descriptions détaillés appréciés)
```
    git commit -a
```

* Envoi des changements
```
git push https://github.com/matEhickey/Projet-CUDA-M2
```  

-------------------------------------------------------------------------------------------------

## Mkdocs
_Outil de production de documentation_  

* Installation
``` 
pip install mkdocs
```

* Nouveau projet
``` 
mkdocs new projectName
```

* Serve (serveur web de developemment, MAJ auto a partir des fichier .md)
``` 
mkdocs serve
```

* Build (génère site web statique)
``` 
mkdocs build
```

* [Markdown syntax](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

* [Mkdocs configuration](http://www.mkdocs.org/user-guide/configuration/)


--------------------------------------------------------------------------------------------------

## Sharelatex
_Plateforme de redaction d'articles collaborative basé sur Latex_  
~~~~
compte => projet.cuda@laposte.net
mdp => projetcuda2016 
~~~~
[Sharelatex](http://sharelatex.com)  
[Latex syntax](https://wch.github.io/latexsheet/)  

