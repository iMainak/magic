#!/bin/sh
case $1 in
startServer)
      cd ~/fabric-dev-servers/
      ./teardownAllDocker.sh
      ./startFabric.sh
;;
tempStop)
      cd ~/fabric-dev-servers/
      ./fabricUtil.sh stop
      echo "Do you want to start again? "
      read value 
      if [ $value == "yes" ];then
      ./fabricUtil.sh start
      else
            echo "Bye!! See you soon..."
      fi
;;
composerCard)
      echo "Do you want to see your card list?"
      read value
      if [ $value == "yes" ];then
            composer card list
      else
            echo "Salute your is memory so strong!!"
      fi
      echo "Do you want DELETE your PeerAdmin Card?"
      read value 
      if [ $value == "yes" ];then
            composer card delete -c PeerAdmin@hlfv1 
      else
            " Ok!! "
      fi
      echo "Do you want to DELETE your Admin card ?"
      read value 
      if [ $value == "yes" ];then
            composer card delete -c admin@pms
      else
            echo "Good job !"
      fi 
      echo "Bye!! See you soon..."
;;

createPeer)
      cd ~/fabric-dev-servers/
      ./createPeerAdminCard.sh
      echo "Bye!! See you soon..."
;;
createAdmin)
      cd ~
      echo "Enter your project location!!"
      read value
      cd $value
      echo "Do you want to create directory called dist ?"
      read value
      if [ $value == "yes" ];then
            mkdir dist
            cd dist
      else
            cd dist
            echo "U did great job!!" 
      fi
      composer archive create -t dir -n ../
      echo -n "Enter your package version "
      read value
      composer network install -c PeerAdmin@hlfv1 -a pms@$value.bna && composer network start -c PeerAdmin@hlfv1 -n pms -V $value -A admin -S adminpw && composer card import -f admin@pms.card
      echo "Do you want to start REST-SERVER?"
      read value
      if [ $value == "yes" ];then
            composer-rest-server -c admin@pms -n never
      fi
      echo "Bye!! See you soon..."

;;
upgradeNetwork)
      cd ~
      echo "Enter your project location!!"
      read value
      cd $value
      composer archive create -t dir -n ../
      echo -n "Enter your package version "
      read value      
      composer network install -c PeerAdmin@hlfv1 -a pms@$value.bna && composer network upgrade -c PeerAdmin@hlfv1 -n pms -V $value
      echo "Do you want to start REST-SERVER?"
      read value
      if [ $value == "yes" ];then
            composer-rest-server -c admin@pms -n never
      fi
      echo "Bye!! See you soon..."

esac