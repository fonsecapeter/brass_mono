# run from root dir

echo
./delete_output.sh

echo "building Peter Mono Regular..."
echo
./build.pe regular.svg

tput setaf 2
echo "fonts built:"
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
