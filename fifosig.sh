#!/bin/bash

sig=sha1sum

src=$1
dst=$2

rm -rf $dst
mkfifo $dst
cat $1 | tee $dst | sha1sum | cut -d ' ' -f 1
