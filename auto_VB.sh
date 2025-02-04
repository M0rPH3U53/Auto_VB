#!/bin/bash

# Menu
show_menu () {

    echo "============================="
    echo "          VirtualBox"
    echo "============================="
    echo "1) List VM"
    echo "2) Boot"
    echo "3) Reboot"
    echo "4) PowerOff"
    echo "5) List VM active"
    echo "6) Quitter"
    echo "============================="
}

boot_menu () {

    echo "============================="
    echo "          Boot"
    echo "============================="
    echo "1) GUI"
    echo "2) No GUI"
    echo "3) Quitter"
    echo "============================="
}

reboot_menu () {

    echo "============================="
    echo "          Reboot"
    echo "============================="
    echo "1) Reboot"
    echo "2) Quitter"
    echo "============================="
}


poweroff_menu () {

    echo "============================="
    echo "          Poweroff"
    echo "============================="
    echo "1) Direct"
    echo "2) OS"
    echo "3) Quitter"
    echo "============================="
}

list_vm_menu () {

    echo "============================="
    echo "          Liste VM"
    echo "============================="
    echo "1) List VM"
    echo "2) Quitter"
    echo "============================="
}

vm_enable_menu () {

    echo "============================="
    echo "          VM enable"
    echo "============================="
    echo "1) List VM enable"
    echo "2) Quitter"
    echo "============================="

}

vm_enable () {

    echo "============================="
    VBoxManage list active vms
    echo "============================="
    
}

# Affiche la liste des VM
list_vm () {

    echo "============================="
    VBoxManage list vms
    echo "============================="

}

# Boot sans affichage
start_vm_no_gui () {

    read -p "Entrer le nom d'une VM: " VM
    VBoxManage startvm ${VM} --type headless

}

# Boot avec Affichage
start_vm_gui () {

    read -p "Entrer le nom d'une VM: " VM
    VBoxManage startvm ${VM} --type gui

}
# Reboot la VM
rebbot_no_gui () {

    read -p "Entrer le nom de la VM a redemarrer: " VM
    VBoxManage controlvm ${VM} reset
}


# Stopper la VM 
vm_poweroff () {

    read -p "Entrer le nom de la VM a arreter: " VM
    VBoxManage controlvm ${VM} poweroff
}

# Stopper la VM proprement
vm_poweroff_os () {

    read -p "Entrer le nom de la VM a arreter: " VM
    VBoxManage controlvm ${VM} acpipowerbutton

}


# Menu
while true; do
    show_menu
    read -p "Choisir une option (1-3) : " vulnchoice

    case $vulnchoice in
    1)  list_vm_menu
        read -p "Choix: " tool_choice
        case $tool_choice in
        1) list_vm ;;
        *)
            echo "Choix invalide."
            ;;
        esac
        ;;
    
    2)  boot_menu
        read -p "Choix: " tool_choice
        case $tool_choice in
        1) start_vm_gui ;;
        2) start_vm_no_gui ;;
        *)
            echo "Choix invalide."
            ;;
        esac
        ;;
    
    3)  reboot_menu
        read -p "Choix: " tool_choice
        case $tool_choice in
        1) rebbot_no_gui ;;
        *)
            echo "Choix invalide."
            ;;
        esac
        ;;


    4)  poweroff_menu
        read -p "Choix: " tool_choice
        case $tool_choice in
        1) vm_poweroff ;;
        2) vm_poweroff_os ;;
        *)
            echo "Choix invalide."
            ;;
        esac
        ;;
    
    5)  vm_enable_menu
        read -p "Choix: " tool_choice
        case $tool_choice in
        1) vm_enable ;;
        *)
            echo "Choix invalide."
            ;;
        esac
        ;;


    6)
        echo "Quitter..."
        exit 0
        ;;
    *)
        echo "Option invalide. Choisir une option entre 1 et 6."
        ;;
    esac
done
