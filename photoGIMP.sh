installation=$(which flatpak)



if [ -z "$installation" ];then
    echo -e "\e[31mCould not locate FlatPak"
    echo -e "\e[31mExecute the script after installing FlatPak...."
else
    echo "Searching for GIMP in list of FlatPak installation"

    isInstalled=$(flatpak list | grep GIMP)
    if [ -z "$isInstalled" ];then
        echo -e "\e[31m GIMP is not installed"
        echo 
        echo -e "\e[32mInstalling GIMP via FlatPak..."
        flatpak install flathub org.gimp.GIMP
    fi
    echo
    echo "Downloading config files.."
    curl -L "https://github.com/Diolinux/PhotoGIMP/releases/download/1.0/PhotoGIMP.by.Diolinux.v2020.for.Flatpak.zip" -o ~/Downloads/PhotoGIMP.by.Diolinux.v2020.for.Flatpak.zip
    unzip ~/Downloads/PhotoGIMP.by.Diolinux.v2020.for.Flatpak.zip -d ~/Downloads
    echo
    echo "Creating a Backup.."
    mv /home/$USER/.config/GIMP/2.10/ /home/$USER/.config/GIMP/2.10.old
    echo "Backup Created."
    echo
    echo "Applying Pathes.."
    sudo cp -R ~/Downloads/PhotoGIMP\ by\ Diolinux\ v2020\ for\ Flatpak/.var/app/org.gimp.GIMP/config/GIMP/2.10/ /home/$USER/.config/GIMP
    echo "Done!"
    rm ~/Downloads/PhotoGIMP.by.Diolinux.v2020.for.Flatpak.zip

fi

