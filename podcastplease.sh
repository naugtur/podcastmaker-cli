#!/bin/bash
filelist=$@

echo "joining $filelist into a podcast"

sox --norm=-3 $filelist out1.wav \
  loudness -20\
  compand 0.3,1 6:-70,-60,-20 -5 -90 0.2 \
  bass 1 \
  contrast 0 \
  earwax

sox --norm=-1 --combine concatenate ./samples/intro.wav out1.wav ready.mp3 splice -q 16,3
mp3tag -a "naugtur / Zbyszek Tenerowicz" ready.mp3
mp3val ready.mp3 -f -nb
rm out1.wav

sox ready.mp3 -n spectrogram

echo "ready.mp3 written"


