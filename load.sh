#!/bin/bash

url="http://localhost:8080/api/v1/names/random"

for ((i=1; i<=500; i++))
do
    echo "Request $i"
    curl -sS "$url"
    echo
done




