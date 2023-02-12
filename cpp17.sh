#!/bin/bash
extension="$(echo $1 | sed 's/^.*\.\([^\.]*\)$/\1/')"

if [ $# != 1 ]; then
    echo "Error: require file name (main.cpp)"
    exit 1
elif [ "$extension" != "cpp" ]; then
    echo "Error: extension is not .cpp"
    exit 1
elif [ ! -s $1 ]; then
    echo "Error: file empty"
    exit 1
fi
function build () {
    g++ -std=c++17 -Wall -O2 -o out $1
}
function run () {
    ./out < input.txt
}
build $1
run
rm out