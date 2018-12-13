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
##### AND 
#### 2. For non-destructive restarts of dev environment
```sh
curl -O https://github.com/acloudfan/HLF-Windows-Fabric-Tool/blob/master/fabricUtil.sh
chmod 755 fabricUtil.sh
```
**First time launch:**
```sh
./startFabric.sh
```
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
