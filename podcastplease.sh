#!/bin/bash
filelist=$@

echo "joining $filelist into a podcast"

sox --norm=-3 $filelist out1.wav \
  loudness \
  compand .1,.2 -inf,-50.1,-inf,-50,-50 0 -90 .1 \
  bass 1 \
  compand 0.01,1 -90,-90,-70,-70,-60,-20,0,0 -5 \
  contrast 0 \
  earwax

sox --norm=-1 --combine concatenate ./samples/intro.wav out1.wav ready.mp3 splice -q 16,3
mp3tag -a "naugtur / Zbyszek Tenerowicz" ready.mp3
mp3val ready.mp3 -f -nb
rm out1.wav

sox ready.mp3 -n spectrogram

echo "ready.mp3 written"


