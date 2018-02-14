#!/bin/bash
#Owner-Nikhil
red="\033[31;40m"
blink="\033[5m"
none="\033[0m"
echo "\n"
echo  $blink"Swap Space Generator"
echo "======================================"
echo  $none"Current Swap Space::"
free_swap=$(free -m |grep Swap | awk '{print $2}')
echo $free_swap" MB"
echo "======================================"
echo "Enter the Swap Space"
echo "Example::\t 0.5G \t 1G \t 2G \t"
echo "======================================"
read -p " Swap Space:: " swap
echo $swap "Space will be created "
sudo fallocate -l $swap /mnt/$swap.swap
sudo chmod 600 /mnt/$swap.swap 
sudo mkswap /mnt/$swap.swap
sudo swapon /mnt/$swap.swap
echo "/mnt/"$swap".swap	none	swap	sw	0	0" >> /etc/fstab
echo "Swap Space After Creation::"
free_swap2=$(free -m |grep Swap | awk '{print $2}')

echo  $free_swap2" MB"

