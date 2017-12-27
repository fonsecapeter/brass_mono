# run from root dir

echo
./scripts/clean.sh

echo "forging Brass Mono Regular..."
echo
./scripts/forge.pe regular.svg

tput setaf 2
echo "fonts forged:"
tput bold
tree BrassMono
tput sgr0
echo

echo "compressing fonts..."
zip -r BrassMono.zip BrassMono
tput setaf 2
echo "fonts compressed in BrassMono.zip"
echo
tput sgr0
