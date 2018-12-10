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
      if [ $? -eq 0 ]; then      
       echo "ok"
       echo "Do you want to start again?(only yes/no)"
       read value 
       if [ $value == "yes" ];then
        ./startFabric.sh
       else
        echo "I couldn't make it!! Sorry"
       fi

      else
            echo "Bye!! See you soon..."
      fi
;;
composerCard)
      echo "Do you want to see your card list?(only yes/no)"
      read value
      if [ $value == "yes" ];then
            composer card list
      else
            echo "Salute!! your memory is so strong!!"
      fi
      echo "Do you want DELETE your PeerAdmin Card?(only yes/no)"
      read value 
      if [ $value == "yes" ];then
            composer card delete -c PeerAdmin@hlfv1 
      else
            echo "Ok!!"
      fi
      echo "Do you want to DELETE your Admin card ?(only yes/no)"
      read value 
      if [ $value == "yes" ];then
            echo "Enter your BNA file name"
            read user_input
            composer card delete -c admin@$user_input
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
      
      if [ $? -eq 0 ]; then      
       echo "Ok"
       echo "Do you want to create directory called dist?(only yes/no)"
       read value
       if [ $value == "yes" ];then
             mkdir dist
             cd dist
       else
             cd dist
             echo "U did great job!!" 
       fi
       composer archive create -t dir -n ../
        if [ $? -eq 0 ]; then      
          echo "Ok"          
          echo "Enter your BNA file name"
          read user_input
          echo -n "Enter your package version "
          read value
          composer network install -c PeerAdmin@hlfv1 -a $user_input@$value.bna && composer network start -c PeerAdmin@hlfv1 -n $user_input -V $value -A admin -S adminpw && composer card import -f admin@$user_input.card
          if [ $? -eq 0 ]; then      
            echo "Ok" 
            echo "Do you want to start REST-SERVER?(only yes/no)"
            read value
            if [ $value == "yes" ];then
                  composer-rest-server -c admin@$user_input -n never
            else
               echo "Fail Upgrade Network!!"
            fi
          else 
            echo "Fail Upgrade Network!!"
          fi
        else
            echo "Fail to create BNA file!!"
        fi

      else
        echo "I couldn't make it!! Sorry"
      fi
      
      echo "Bye!! See you soon..."

;;
upgradeNetwork)
      cd ~
      echo "Enter your project location!!"
      read value
      cd $value
      echo "are you already in dist folder?(only yes/no)"
      read value
      if [ $value == "yes" ];then
            echo "WOW!! you are so smart!!"
      else
            cd dist
      fi
     
      composer archive create -t dir -n ../
      if [ $? -eq 0 ]; then      
          echo "Enter your BNA file name"
          read user_input
          echo -n "Enter your package version "
          read value
          composer network install -c PeerAdmin@hlfv1 -a $user_input@$value.bna && composer network upgrade -c PeerAdmin@hlfv1 -n $user_input -V $value
          if [ $? -eq 0 ]; then      
            echo "Ok"
            echo "Do you want to start REST-SERVER?(only yes/no)"
            read value
            if [ $value == "yes" ];then
                  echo "Ok"                  
                  composer-rest-server -c admin@$user_input -n never
            else 
                  echo "Really Don't Want!!"
            fi
          else
            echo "Fail Upgrade Network!!"
          fi
      else
            echo "Fail to create BNA file!!"
      fi
      echo "Bye!! See you soon..."
;;
esac
