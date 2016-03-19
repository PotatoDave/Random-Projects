#!/bin/bash

##This is Version 1 adn will only fully work with systems using the APT-GET package manager###

#Variables.

tab="######################################################################"
tabs="#########################"
lsblks="lsblk -o KNAME,MOUNTPOINT,SIZE"
apgt="apt-get install"
move="--move=/home/MovedVirus"
#Variables End.
####################
#Code
####################

####Install Apps####
$apgt pv
$apgt clamav
$apgt clamav-daemon
$apgt libclamunrar6
####################

#Check If Script Is Being Run As Root
if [[ $(id -u) -ne 0 ]]; then
	clear
	echo $tab
	echo $tabs Please Run As Root $tabs
	echo $tab
	exit 1
fi


	clear
#Makeing quarrentened File Aera
	mkdir /home/MovedVirus

#Updateing Database.
	echo $tabs Updateing DB $tabs
	freshclam | pv > /dev/null
	clear
	echo $tabs Updateing Compleated $tabs
	sleep 2
	clear
#Done Updateing Data Base


#Displaying All Selectiable Drives
	echo $tab
echo "Devices Listed Below Can Be Selected For Scanning."
echo "To Scan The Home HDD\SSD Please Use /"
	echo 
	$lsblks
	echo 
	echo $tab
	echo
#Asking User To Select A Drive
	read -p "Enter Drive: " drive1
	echo
	echo $tab
	sleep 1
	clear

#Ask if More drives Are Required
#Question 1
echo $tab
read -r -p "Do You Want To Add A Second Drive? [Y\n] " adddrive2
echo $tab
clear

case $adddrive2 in
    [yY][eE][sS]|[yY]) 
	echo $tab
	echo
	$lsblks
	echo
	echo $tab
	echo
	read -p "Enter A Second Drive: " drive2 
	echo
	echo $tab
	clear
#Question 1 End
		
		#Question 2
		read -r -p "Do You Want To Add A Third Drive? [Y\n] " adddrive3
		case $adddrive3 in
    		[yY][eE][sS]|[yY]) 
        		echo $tab
			echo
			$lsblks
			echo
			echo $tab
			echo
			read -p "Enter A Third Drive: " drive3
			echo
			echo $tab
        		clear
			#Question 2 End
#######################################################################################
				#question 3
				read -r -p "Do You Want To Add A Fourth Drive? [Y\n] " adddrive3
				case $adddrive4 in
    				[yY][eE][sS]|[yY]) 
        				echo $tab
					echo
					$lsblks
					echo
					echo $tab
					echo
					read -p "Enter A Third Drive: " drive3
					echo
					echo $tab
        				clear
					#Question 3 End
					sleep 2
						#Scanning Aera For Drive 1, 2 And 3.
						clear
						echo $tabs Beginning Scan On $drive1 $drive2 $drive3 And $drive4 $tabs
						sleep 2
						clear
						echo $tabs Scanning $drive1 $drive2 $drive3 And $drive4 $tabs
						echo $tabs Please Wait This Can Take Some Time $tabs
						clamscan -r -i -o --bell $move $drive1
						echo $tabs $drive1 Scan Compleated $tabs
						clamscan -r -i -o --bell $move $drive2
						echo $tabs $drive2 Scan Compleated $tabs
						clamscan -r -i -o --bell $move $drive3
						echo $tabs $drive3 Scan Compleated $tabs
						clamscan -r -i -o --bell $move $drive4
						echo $tabs $drive4 Scan Compleated $tabs
				
				;;
    			*)


###########################################################################################################

				#Scanning Aera For Drive 1, 2 And 3.
				clear
				echo $tabs Beginning Scan On $drive1 $drive2 And $drive3 $tabs
				sleep 2
				clear
				echo $tabs Scanning $drive1 $drive2 and $drive3 $tabs
				echo $tabs Please Wait This Can Take Some Time $tabs
				clamscan -r -i -o --bell $move $drive1
				echo $tabs $drive1 Scan Compleated $tabs
				clamscan -r -i -o --bell $move $drive2
				echo $tabs $drive2 Scan Compleated $tabs
				clamscan -r -i -o --bell $move $drive3
				echo $tabs $drive3 Scan Compleated $tabs
				
			;;
    		*)
			#Scanning Aera For Drive 1 And 2 Only.
        		clear
			echo $tabs Beginning Scan On $drive1 And $drive2 $tabs
			sleep 2
			clear
			echo $tabs Scanning $drive1 And $drive2
			echo $tabs Please Wait This Can Take Some Time! $tabs
			clamscan -r -i -o --bell $move $drive1
			echo $tabs $drive1 Scan Compleated $tabs
			clamscan -r -i -o --bell $move $drive2
			echo $tabs $drive2 Scan Compleated $tabs

        		;;
		esac
		#Question Segment End 2
	;;
   *)
	#Scanning Aera Drive 1 Only.
	clear
	echo $tabs Beginning Scan On $drive1 $tabs
	sleep 2
	clear
	echo $tabs Scanning $drive1 $tabs
	echo $tabs Please Wait This Can Take Some Time! $tabs
	clamscan -r -i -o --bell $move $drive1

	#clamscan $drive1 |pv > /dev/null

	echo $tabs $drive1 Scan Compleated $tabs

	;;
esac
#Question Segment end 1
