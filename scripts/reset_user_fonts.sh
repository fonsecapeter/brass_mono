echo
echo "uninstalling user BrassMono"
removed=$(rm -rfv ~/.fonts/BrassMonoFonts/)
tput setaf 2
echo "deleted:"
tput bold
echo $removed
tput sgr0

tput setaf 2
echo "installing BrassMonoFonts"
cp -r BrassMono/ ~/.fonts
tput bold
tree ~/.fonts
tput sgr0
echo
