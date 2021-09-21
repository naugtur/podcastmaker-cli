#!/bin/bash
filelist=$@

echo "joining $filelist into a podcast"
rm tmp_1.wav

sox --norm=-0.1 $filelist tmp_1.wav \
  loudness -20\
  compand 0.3,1 6:-70,-60,-20 -5 -90 0.2 \
  bass 1 \
  contrast 0 \
  earwax

sox --norm=-0.1 ./samples/intro.wav tmp_0.wav \
  loudness -20

sox --combine concatenate tmp_0.wav tmp_1.wav ready.mp3 splice -q 16,3

mp3tag -a "naugtur / Zbyszek Tenerowicz" ready.mp3
mp3val ready.mp3 -f -nb

# cleanup
rm tmp_?.wav
# preview
sox ready.mp3 -n spectrogram

echo "ready.mp3 written"


