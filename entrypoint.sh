#!/bin/sh

PATH="$1"
PASSWORD="$2"
OUTPUT="$3"

echo $PASSWORD | ./unpack.sh $PATH $OUTPUT