echo
echo "uninstalling user PeterMonoFonts"
removed=$(rm -rfv ~/.fonts/PeterMonoFonts/)
tput setaf 2
echo "deleted:"
tput bold
echo $removed
tput sgr0

tput setaf 2
echo "installing PeterMonoFonts"
cp -r PeterMonoFonts/ ~/.fonts
tput bold
tree ~/.fonts
tput sgr0
echo
