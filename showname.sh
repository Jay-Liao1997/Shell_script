#!/bin/bash
#Program:
#User inputs his first name and last name.Program shows his full nam.
#History:
#2020/07/21 Lioazhengjie First Release
#tel:13428166619
date
read -p "Please input your first name: " firstname
read -p "Please input your last name: " lastname
echo -e "\n Your full name is ${firstname}${lastname}"
