#!/bin/bash
DIR=`pwd`
function cp_tmplete() {
    cnum=$2
    declare -a contest1to125=(
    a
    b
    c
    d
    )
    declare -a contest126to211=(
    e
    f
    )
    declare -a contest212to232=(
    g
    h
    )
    declare -a contest233to=(
    g
    ex
    )
    filenames=()
    if [ $(( cnum )) -le 125 ]; then
    echo '<=125'
    filenames=(${filenames[@]} ${contest1to125[@]})
    elif [ $(( cnum )) -ge 126 ] && [ $(( cnum )) -le 211 ]; then
    echo '126 <= a <= 211'
    filenames=(${filenames[@]} ${contest1to125[@]})
    filenames=(${filenames[@]} ${contest126to211[@]})
    elif [ $(( cnum )) -ge 212 ] && [ $(( cnum )) -le 232 ]; then
    echo '212 <= a <= 232'
    filenames=(${filenames[@]} ${contest1to125[@]})
    filenames=(${filenames[@]} ${contest126to211[@]})
    filenames=(${filenames[@]} ${contest212to232[@]})
    elif [ $(( cnum )) -ge 233 ]; then
    echo '233 <= a'
    filenames=(${filenames[@]} ${contest1to125[@]})
    filenames=(${filenames[@]} ${contest126to211[@]})
    filenames=(${filenames[@]} ${contest233to[@]})
    fi

    for I in "${filenames[@]}"; do
        echo "${I}"
    done
    for fn in "${filenames[@]}"
    do
        echo $"$DIR"/"$1"/"$2"/""$fn".cpp"
        cp template.cpp "$DIR"/"$1"/"$2"/""$fn".cpp"
    done
}

if [ $# != 2 ]; then
    echo "Error: require contest name and number (abc 001)"
    exit 1
elif [ "$1" != "abc" ] && [ "$1" != "arc" ] && [ "$1" != "agc" ]; then
    echo "Error: contest name is required \"abc\" or \"arc\" or \"agc\""
    exit 1
elif [ ${#2} != 3 ]; then
    echo "Error: contest number length is required 3"
    exit 1
elif [ -d $DIR"/"$1"/"$2 ]; then
    echo "Error: directory $DIR'/'$1'/'$2 is already exists"
    exit 1
fi

mkdir $DIR"/"$1"/"$2
cp_tmplete $1 $2
touch $DIR"/"$1"/"$2"/"input.txt