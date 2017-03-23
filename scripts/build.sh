# run from root dir

echo
./scripts/clean.sh

echo "forging Peter Mono Regular..."
echo
./scripts/forge.pe regular.svg

tput setaf 2
echo "fonts forged:"
tput bold
tree PeterMonoFonts
tput sgr0
echo

echo "compressing fonts..."
zip -r PeterMono.zip PeterMonoFonts
tput setaf 2
echo "fonts compressed in PeterMono.zip"
echo
tput sgr0
