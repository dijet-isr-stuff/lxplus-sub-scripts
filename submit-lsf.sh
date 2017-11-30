for f in $(cat allfiles.txt)
do
    bsub -q 1nd run.sh $f
done
