#!/bin/bash

fruits=("mango", "banana", "apple", "grapes", "dragon")

echo "the value of fruits is ${fruits[0]}"
echo "the value of fruits is ${fruits[1]}"
echo "the value of fruits is ${fruits[@]}"
echo "the value of fruits is ${fruits[#]}"