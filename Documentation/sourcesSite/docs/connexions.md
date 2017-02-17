## Connexions à la carte  
Pour le développement, nous utilisions la carte avec un écran et un clavier matériel.  
Cependant, comme nous travaillions des fois à plusieurs, nous utilisions différents moyens d'accéder a la carte à distance.  

### SSH  
SSH est un type de connexion sécurisé, pour utiliser la carte depuis son terminal.  
Cela permet de compiler/executer des programmes textuels sans problèmes.  
Pour les applications graphiques, l'option de connexion -X permet d'avoir l'affichage des interfaces sur le pc client, sauf dans certains cas, ou un écran physique est requis.  
Pour transferer des fichiers, nous utilisions scp.  
A noter que l'IP par default sur la Jetson TK1 sous L4T_OS est **tegra-ubuntu**. Ce qui évite d'avoir a scanner son réseau, ou a utiliser l'interface pour determiner l'IP.  

**Exemples**  

    # Simple connexion SSH
    ssh -X ubuntu@tegra-ubuntu
    
    # Connexion SSH avec ( si possible ) une interface graphique
    ssh -X ubuntu@tegra-ubuntu
    
    # Upload
    scp file ipDistant:path
    # Download
    scp ipDistant:file path  
    
[Wiki SSH](https://fr.wikipedia.org/wiki/Secure_Shell)  
[How to SCP](http://www.hypexr.org/linux_scp_help.php)

### VNC  
VNC est un type de connexion qui permet l'affichage de  l'écran de l'ordinateur hôte.  
Il permet de lancer les applications graphiques que ssh -X ne permet pas d'éxecuter.  
Cependant, comme les images de l'écran sont envoyés par le réseau, cela peut être lent, ou gourmand en ressources pour le pc hote.  
Certains clients VNC fournissents des options pour limiter la résolution de l'echange, permettant un meilleur framerate, mais une qualité d'image amoindris.  
Il est possible de prendre controle du pc distant totalement, ou si on prefere, cela peut se faire en parralele, et il peut donc y avoir plusieurs utilisateurs en même temps. 
Une solution qui fonctionne bien est [**x11vnc**](https://doc.ubuntu-fr.org/x11vnc)  
[Wiki VNC](https://fr.wikipedia.org/wiki/Virtual_Network_Computing)  

### Serial  
Il est également possible de communiquer avec la carte par le port serial.  
Ceci permet un acces a la caret pour le developement, ou la communication entre différentes machines.   
[Voir](http://www.jetsonhacks.com/2015/12/02/serial-console-nvidia-jetson-tk1development-kit/)  
[Wiki Serial Communication](https://en.wikipedia.org/wiki/Serial_communication)  

### Programmation distribuée / Méthodes distantes  
La carte Jetson TK1, au même titre que le Raspberry, peut être utilisé comme n'importe quel ordinateur.
Ainsi, elle peut executer des programmes distribués, quelque soit la configuration. La carte peut être un serveur, ou le client d'appels à des méthodes dites "distantes", comme Java RMI, les requetes RPC, ou d'autres [outils similaires](https://docs.python.org/2/library/multiprocessing.html).  



[Lien vers les exemples (lien non fonctionel)](.)  



