# 📞 Mini infrastructure VoIP avec Asterisk 

## 1. 🎯 Objectif
Installer et configurer un serveur VoIP avec Asterisk  sur Ubuntu permettant des appels internes entre 2 utilisateurs via le protocole SIP.

## 2. Installation de Asterisk 
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
Pour accéder à la console Asterisk :
````
sudo asterisk -rvv
````
## 3. ⚙️ Configuration des comptes pjsip
### 📁 Emplacement des fichiers de configuration de base 

Les fichiers de conf essentiels sont :
````
/etc/asterisk/pjsip.conf
````
````
/etc/asterisk/extension.conf
````
### 📞 Configuration du fichier pjsip.conf 

Il faut éditer le fichier en faisant :
````
sudo nano /etcasterisk/pjsip.conf
````
La config qu'il faut mettre est :
````
[transport-udp]
type=transport
protocol=udp
bind=0.0.0.0

[6001]
type=endpoint
context=internal
disallow=all
allow=ulaw
auth=6001-auth
aors=6001

[6001-auth]
type=auth
auth_type=userpass
username=6001
password=pass6001

[6001]
type=aor
max_contacts=1

[6002]
type=endpoint
context=internal
disallow=all
allow=ulaw
auth=6002-auth
aors=6002

[6002-auth]
type=auth
auth_type=userpass
username=6002
password=pass6002

[6002]
type=aor
max_contacts=1
````

### ☎️ Configuration du fichier extensions.conf 
Il faut éditer le fichier en faisant :
````
sudo nano /etcasterisk/extensions.conf
````
La config qu'il faut mettre est :
````
[internal]
exten => 6001,1,Dial(PJSIP/6001,20)
exten => 6002,1,Dial(PJSIP/6002,20)
````
## 🔄 4. Redémarrage du serveur 
````
sudo systemctl restart asterisk
````
Il est aussi possible de recharger la config depuis la console Asterisk 
````
sudo asterisk -rvv
````
En faisant  :

````
sip reload
dialplan reload
````
## 📱 5. Configuration des clients (Softphone)

Différent logiciels sont utilisables pour la configuration des clients. 
Celui que nous utilisons est <a href="https://www.linphone.org/home/">Linphone</a>

Les paramètres à configurer sur le softphone sont:
  - Usernam : 6001 / 6002
  - Password : pass6001 / pass6002
  - IP du serveur
  - Protocole : UDP

