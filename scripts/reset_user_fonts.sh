echo
echo "uninstalling user PeterMono"
removed=$(rm -rfv ~/.fonts/PeterMonoFonts/)
tput setaf 2
echo "deleted:"
tput bold
echo $removed
tput sgr0

tput setaf 2
echo "installing PeterMonoFonts"
cp -r PeterMono/ ~/.fonts
tput bold
tree ~/.fonts
tput sgr0
echo
