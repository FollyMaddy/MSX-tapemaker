
Warning :

While making these scripts my sony cassette-recorder tcm-828 broke.

So the equations for "WINDING TIME" in the BASIC menu can be wrong and are not fully tested.

Only 8kb roms can be used. (equations for 16kb roms are "off" in the menu-maker script)

So for now these scripts are "as is", without any support.



These scripts are for making a cassette tape for MSX containing :

- A BASIC menu

- Game 1 / Program 1

- Game 2 / Program 2

- etc.

After recording the tape you can run the menu on the MSX with :

run"cas:",r

After that you pick your choice.

Then follow the instructions to wind to the game or program of your choice.

After that press PLAY and ENTER

If all goes well, your program wll be loaded


The actual scripts depend op java, msx2cas and sox

After download, extract the zip.

(your directory becomes : /home/"USER"/Downloads/MSX-tapemaker-master/ )


run install_dependancies.sh 

(msx2cas-binary(probably only x86) and sox are installed in this directory)

(also YOUR_COMPILATION directory is made)


Place your 8kb rom files in /home/"USER"/Downloads/MSX-tapemaker-master/YOUR_COMPILATION/

first run menu-maker.sh

(a BASIC menu => 0menu8.bas is created)

then run wav-maker.sh

(all files in /YOUR_COMPILATION/ will be converted to WAV files)

(then the all WAV files are combined to 1 WAV file (99output.wav)

Record 99output.wav to tape (these settings should work) :

Record to cassette volume VLC 100% and Computer 94% 

Record to cassette volume Audacity 0,97 en Computer 94% 
