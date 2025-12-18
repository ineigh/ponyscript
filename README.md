-- PONYSCRIPT BY Z --

With this simple bash script, you can create a music pack for Mario Kart Wii in no time!

This script grabs a single audio file and creates a normal and final lap BRSTMs with the appropriate filenames so that they're instantly recognized by the game!

For tracks that use multi channel BRSTMs, this script will create 4 channel BRSTMs for files inside the tf, ddr, mh and wgm folders and 8 channel BRSTMs for files inside the kc and bcw folders.

-- DEPENDENCIES --

This script relies on the following packages to function: openrevolution, ffmpeg and jq.
Packages such as find and wc are also needed but you should already have these if you use GNU utilities.

-- HOW TO USE --

Simply copy the file containing the song you want to the folder with the acronym corresponding to the track you want to use it for.

For example, if you have a song.mp3 file that you want to use for Bowser's Castle, simply copy it to the bcw folder!

You don't need to copy a file into each of the 32 folders, if you just want to create BRSTMs for Waluigi Stadium, Toad's Factory and Koopa Cape, copy the corresponding files to the rWS, tf and kc folders while the rest remain empty.

Once you've copied the files you want, you can right click the file ponyscript.sh and execute it if your file explorer allows for that, otherwise follow these steps inside a terminal:

cd into the ponyscript/ directory
$ cd ponyscript/

Execute the script
$ ./ponyscript.sh

Simply wait until the script finishes converting all your files into BRSTMs, you'll see a cute pony when it does, afterwards you'll be asked if you want to clean all the folders for every track, I recommend doing this as the script will create the files "onetwo.wav" and "final.wav", so if you don't delete them first you will not be able to create a BRSTM for that track!

Finally, all of your BRSTMs will be waiting for you inside the "output" folder, you may copy and paste them into your My Stuff folder without having to rename them!

-- CONSIDERATIONS --

This script expects ONE FILE inside each folder, if there's 2 or more files (or no files at all) the script will ignore that folder entirely.

Please, only use audio files (.mp3, .ogg, .flac, .opus, something ffmpeg can convert into .wav), if you use .wav files from the get-go the script will be faster as ffmpeg will not try to convert them to .wav

This script does NOT normalize audio volume, so make sure your files are loud enough.

This script relies on the names.json file for the filenames, don't delete it.

Depending on your CPU and the number of files to convert this script may take some time.

If for some reason the ponyscript.sh file is not executable, simply execute:

$ chmod +x ponyscript.sh

-- ACRONYMS --

lcmc: Luigi and Mario Circuit (they use the same file)
mmm: Moo Moo Meadows
mg: Mushroom Gorge
tf: Toad's Factory

cm: Coconut Mall
dks: DK Summit / DK's Snowboard Cross
wgm: Wario's Gold Mine

dc: Daisy Circuit
kc: Koopa Cape
mt: Maple Treeway
gv: Grumble Volcano

ddr: Dry Dry Ruins
mh: Moonview Highway
bcw: Bowser's Castle
rr: Rainbow Road

rPB: GCN Peach Beach
rYF: DS Yoshi Falls
gv2: SNES Ghost Valley 2
rMR: N64 Mario Raceway

rSL: N64 Sherbet Land
rSGB: GBA Shy Guy Beach
dsds: DS Delfino Square
rWS: GCN Waluigi Stadium

rDH: DS Desert Hills
bc3: GBA Bowser Castle 3
dkjp: N64 DK's Jungle Parkway
rMC: GCN Mario Circuit

mc3: SNES Mario Circuit 3
rPB: DS Peach Gardens
dkm: GCN DK Mountain
rBC: N64 Bowser's Castle
