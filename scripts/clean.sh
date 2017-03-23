# run from root dir

echo "removing sfds"
sfds=$(rm -v forge/*.sfd 2>&1)
tput setaf 2
echo "deleted:"
tput bold
echo $sfds
tput sgr0

echo "removing otfs"
otfs=$(rm -v PeterMonoFonts/*.otf 2>&1)
tput setaf 2
echo "deleted:"
tput bold
echo $otfs
tput sgr0
