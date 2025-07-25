#!/bin/bash

fruits=("mango" "banana" "apple" "grapes" "dragon")

echo "Script name is $0"

echo "the value of fruits is ${fruits[0]}"
echo "the value of fruits is ${fruits[1]}"
echo "the value of fruits is ${fruits[@]}"