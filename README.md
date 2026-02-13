# 📞 Mini infrastructure VoIP avec Asterisk 20

## 🎯 Objectif
Installer et configurer un serveur VoIP avec Asterisk 18 sur Ubuntu permettant des appels internes entre trois utilisateurs via le protocole SIP.

## Installation de Asterisk 20
Il faut d'abord faire la mise à jour du système.
```
sudo apt update && sudo apt upgrade
```
Une fois fait, il est possible de faire l'installation de Asterisk :
```
sudo apt install asterisk -y
```
Et vérifier si le service est actif
````
sudo systemctl status asterisk
````
Si le service n'est pas actif au démarrage 
````
sudo systemctl start asterisk
sudo systemctl enable asterisk
````
## Configuration de Asterisk 
Pour accéder à la console Asterisk :
````
sudo asterisk -rvv
````

