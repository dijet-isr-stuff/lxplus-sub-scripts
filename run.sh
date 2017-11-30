#!/usr/bin/env bash

set -eu

echo "HERE: $PWD"

INPUT=${LS_SUBCWD-.}/$1/*.root
OUTPUT=${1##*/}.h5
echo "inputs: $INPUT"
echo "output: $OUTPUT"

ttree2hdf5 $INPUT -o $OUTPUT -t outTree -l 4 -r '(jet_(pt|eta|phi|E$|JvtPass)|weight)' -v

RETURN_DIR=${LS_SUBCWD-.}/output_files
mkdir -p $RETURN_DIR
cp $OUTPUT $RETURN_DIR
