#!/bin/bash

files=$(ls -la) > output.text
echo "Printed all the files including hidden $files"
