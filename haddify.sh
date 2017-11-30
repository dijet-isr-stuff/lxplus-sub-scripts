#!/usr/bin/env bash

set -eu

OUT_DIR=hists
mkdir -p $OUT_DIR

for DIR in gang/*
do
    if [[ ! -d $DIR ]]; then
        continue
    fi
    
    OUT_NAME=${OUT_DIR}/${DIR##*/}
    echo $OUT_NAME
    if stat -t $DIR/*.root* &> /dev/null
    then
        hadd -T $OUT_NAME $DIR/*.root* > /dev/null
    else
        echo "no files in $DIR"
    fi
done
