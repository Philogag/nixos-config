#!/bin/sh

function help() {
    echo "Usage: $0 <host>"
    echo "Please select a host from:"
    ls ./hosts -1
    exit -1
}

if [[ -z $1 ]]; then
    help
fi
if [[ ! -d ./hosts/$1 ]]; then
    help
fi

nix --experimental-features "nix-command flakes" \
    run github:nix-community/disko/latest \
     --option substituters  "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" \
     -- --mode destroy,format,mount ./hosts/$1/disko-config.nix