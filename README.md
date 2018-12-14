# Introduction
Makes it easier those are using Hyperledger Composer. Using this you can able to run some basic command for creating a Business network Application 
# Before going to use it !!
##### NOTE
If you already install your environment then skip these steps       
#### 1 . Installation of development environment 
##### Step-1
Make a Directory in ``home/host_name/`` 
``
mkdir ~/fabric-dev-servers && cd ~/fabric-dev-servers
``
##### Step-2
```
curl -O https://raw.githubusercontent.com/hyperledger/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.tar.gz
tar -xvf fabric-dev-servers.tar.gz
```
___
##### Step-3
### Download and start the docker images
```sh
./downloadFabric.sh 
./startFabric.sh 
```
***Note***:
**For error:** Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get http://%2Fvar%2Frun%2Fdocker.sock/v1.38/images/json: dial unix /var/run/docker.sock: connect: permission denied
**Do:** ``sudo chmod 666 /var/run/docker.sock``
##### Step-4
#### For non-destructive restarts of dev environment
```sh
curl -O https://github.com/acloudfan/HLF-Windows-Fabric-Tool/blob/master/fabricUtil.sh
chmod 755 fabricUtil.sh
```
**First time launch:**
```sh
./startFabric.sh
```
**After that:**
```sh
./fabricUtil.sh stop
./fabricUtil.sh start
```
___
#### To get docker images:
```sh
docker images
```
```
REPOSITORY                   TAG                 IMAGE ID            CREATED             SIZE
hyperledger/fabric-ca        1.2.0               66cc132bd09c        2 months ago        252MB
hyperledger/fabric-ccenv     1.2.0               6acf31e2d9a4        2 months ago        1.43GB
hyperledger/fabric-orderer   1.2.0               4baf7789a8ec        2 months ago        152MB
hyperledger/fabric-peer      1.2.0               82c262e65984        2 months ago        159MB
hyperledger/fabric-couchdb   0.4.10              3092eca241fc        2 months ago        1.61GB
```
#### And, the running containers:
```sh
docker ps
```
```
CONTAINER ID        IMAGE                               COMMAND                  CREATED             STATUS              PORTS                                            NAMES
3010cb6c712b        hyperledger/fabric-peer:1.2.0       "peer node start"        2 minutes ago       Up 2 minutes        0.0.0.0:7051->7051/tcp, 0.0.0.0:7053->7053/tcp   peer0.org1.example.com
72afa9a59096        hyperledger/fabric-couchdb:0.4.10   "tini -- /docker-ent…"   2 minutes ago       Up 2 minutes        4369/tcp, 9100/tcp, 0.0.0.0:5984->5984/tcp       couchdb
a253164631d4        hyperledger/fabric-ca:1.2.0         "sh -c 'fabric-ca-se…"   2 minutes ago       Up 2 minutes        0.0.0.0:7054->7054/tcp                           ca.org1.example.com
9a14513db2a1        hyperledger/fabric-orderer:1.2.0    "orderer"                2 minutes ago       Up 2 minutes        0.0.0.0:7050->7050/tcp                          orderer.example.com
```
___
### Installation of Yeoman
```sh
npm install -g yo
```
___
### Installation of  hyperledger-composer yo generator
```sh
npm install -g generator-hyperledger-composer
```
___
### Check installed generators
```sh
yo --generators
```
___
### Creating a BNA
- Generate BNA scaffolding using the Yo generator. 
```sh
yo hyperledger-composer
```
___
### To change the HLF version
```sh
export FABRIC_VERSION=hlfv1
export FABRIC_VERSION=hlfv11
export FABRIC_VERSION=hlfv12
```
___
# How to use !!
##### Step-1
First you go to the Download page( Where you download this file ) and give .sh file permission by using 
```
chmod 777 magic.sh
```
##### Step-2
#### Note 
**If you are interested to make a shell script global then do otherwise you can skip these step and ``move magic.sh file to your project location ``** 

ok, so 
First you go to the Download page( Where you download this file ) and
open your terminal and type 
```
sudo cp magic.sh /usr/local/bin
```
OK !! now you can use it anywhere by using 
```
bash magic.sh 
```
##### Step-3
**Before going to step-3, those are skip the Installation of development environment setup, only one thing you do that your fabric-dev-server folder move to ``home/host_name/`` or if you have better understand the shell script then before using it you can edit your folder location into the magic.sh**
 
Ok in step-3, first you understand what is in the .sh file
* you can easily start your server first open your terminal and type ``` bash magic.sh startServer ``` ( magic.sh automatically go to fabric-dev-server folder and start the fabric ) 
* for deleting your composer-card ``bash magic.sh composerCard``  
* for create your PeerAdmin ``bash magic.sh createPeer`` ( magic.sh automatically go to fabric-dev-server folder and create your PeerAdmin card ) 

* for create your Admin card and import it ``bash magic.sh createAdmin``
* for upgrade your network ``bash magic.sh upgradeNetwork`` ( Don't forgot to update your package.json file )
* for temporary stop your network ``bash magic.sh tempStop`` 

### Thank u!!
