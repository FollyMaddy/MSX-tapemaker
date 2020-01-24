#!/bin/bash

# Version : 1
#
# Author : Folkert van der Meulen
# Date   : 24/01/2020
#
# Copyright 2020 Folkert van der Meulen
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#--------------------------------------


##https://www.cyberciti.biz/tips/handling-filenames-with-spaces-in-bash.html
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
# set me
FILES=$HOME/Downloads/MSX-tapemaker-master/YOUR_COMPILATION/*
for f in $FILES
do
  #echo "$f"
  java -jar $HOME/Downloads/MSX-tapemaker-master/msx2cas-3.1/msx2cas.jar -i -w "$f.wav" 3600 "$f"
done
# restore $IFS
IFS=$SAVEIFS
sox $HOME/Downloads/MSX-tapemaker-master/YOUR_COMPILATION/*.wav $HOME/Downloads/MSX-tapemaker-master/YOUR_COMPILATION/99output.wav