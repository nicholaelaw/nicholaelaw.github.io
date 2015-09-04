#!/bin/sh

FOO=1; BAR=3
echo "Try this command: `echo $FOO + "$(expr $BAR + 1)"`"