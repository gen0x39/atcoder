#!/bin/bash
DIR=`pwd`

function build () {
    g++ -std=c++17 -Wall -O2 -o out $1
}
function run () {
    ./out < $1
}

if [ $# != 3 ]; then
    echo "Error: argument is regured contest name, number and file name (abc 001 a)"
    exit 1
elif [ ! -d $DIR"/"$1"/"$2 ]; then
    echo "Error: directory $DIR"/"$1"/"$2 doesn't exist"
    exit 1
elif [ ! -e $DIR"/"$1"/"$2"/"$3".cpp" ]; then
    echo "Error: file $DIR"/"$1"/"$2"/"$3".cpp" doesn't exist "
    exit 1
fi

target=$DIR"/"$1"/"$2"/"$3".cpp"
input=$DIR"/"$1"/"$2"/input.txt"

build $target
run $input
rm out