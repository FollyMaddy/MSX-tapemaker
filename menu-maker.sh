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
# file has to have 6 letters before .bas otherwise there is a faulty load with the converted wav
basfile=$HOME/Downloads/MSX-tapemaker-master/YOUR_COMPILATION/0menu8.bas
rm $basfile
rm $basfile.wav
c=1
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
# set me
FILES=$(ls $HOME/Downloads/MSX-tapemaker-master/YOUR_COMPILATION)
touch $basfile

echo "1 KEY OFF:COLOR 5,1:CLS" | sed -e 's/$/\r/' > $basfile
echo "2 H\$=\"------------Cassette menu----------- ---Use a datarecorder with REMOTE--- -Use < > for pages, Enter for input- ------------------------------------\"" | sed -e 's/$/\r/' >> $basfile
echo "5 DIM P\$(45)" | sed -e 's/$/\r/' >> $basfile
for f in $FILES
do
  #s/$/\r/ => insert \r before \n (newline) # check bas file with => od -c file.bas
  #sed based on good-msx1 files
  echo "$(($c*10)) P\$($c)=\"$f\"" | sed -e 's/\.rom// ; s/(J)// ; s/(198.)// ; s/\s-\s/_/ ; s/\s\s(/_/ ; s/)\s// ; s/$/\r/' >> $basfile
  c=$(($c+1))
done
# restore $IFS
IFS=$SAVEIFS

echo "$(($c*10)) CLS : PRINT H\$" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) FOR I=1 TO 15" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) PRINTI;P\$(I)" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) NEXTI" | sed -e 's/$/\r/' >> $basfile  ; c=$(($c+1))
echo "$(($c*10)) A\$=INKEY\$" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) IF A\$=CHR\$(28) THEN $(($c*10+30)) ELSE $(($c*10+10))" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) IF A\$=CHR\$(13) THEN $(($c*10+180)) ELSE $(($c*10-20))" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) GOTO $(($c*10-70))" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) CLS : PRINT H\$" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) FOR I=16 TO 30" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) PRINTI;P\$(I)" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) NEXTI" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) A\$=INKEY\$" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) IF A\$=CHR\$(28) THEN $(($c*10+40)) ELSE $(($c*10+10))" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) IF A\$=CHR\$(29) THEN $(($c*10-140)) ELSE $(($c*10+10))" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) IF A\$=CHR\$(13) THEN $(($c*10+90)) ELSE $(($c*10-30))" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) GOTO $(($c*10-80))" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) CLS : PRINT H\$" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) FOR I=31 TO 45" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) PRINTI;P\$(I)" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) NEXTI" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) A\$=INKEY\$" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) IF A\$=CHR\$(29) THEN $(($c*10-140)) ELSE $(($c*10+10))" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) IF A\$=CHR\$(13) THEN $(($c*10+10)) ELSE $(($c*10-20))" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) INPUT\"Press <FF>, your choice\";C" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
#(C*40/67) based upon 16k roms converted to 67 seconds 3600baud wav, 8k roms are 40 seconds
#rest of function is calculated on  :
#https://www.symbolab.com/solver/functions-graphing-calculator/line%20%5Cleft(18%2C%203.885%5Cright)%2C%20%5Cleft(26%2C%203.545%5Cright) 
#position program 18=>(18-1)*3.885*600 , position program 26=>(26-1)*3.545*600
#tape was 38 minutes per side
#with 16k roms use W=-.0425*C+4.65
echo "$(($c*10)) W=-.0425*(C*40/67)+4.65" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
#with 16k roms use (C-1)*W*600
echo "$(($c*10)) FOR I=0 TO ((C*40/67)-(40/67))*W*600:MOTOR ON:NEXT" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) MOTOR OFF" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) INPUT\"Press <PLAY> and press enter\";P" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))
echo "$(($c*10)) BLOAD\"cas:\",R" | sed -e 's/$/\r/' >> $basfile ; c=$(($c+1))