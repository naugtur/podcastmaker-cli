## the file with experiments

filelist=`ls ZOO*`;

# echo pipeline1

# sox --norm=-3 $filelist out1.wav \
#   highpass 100 \
#   bass 1 \
#   compand 0.05,0.2 6:-54,-90,-36,-36,-24,-24,0,-12 0 -90 0.1 \
#   contrast 0 \
#   earwax


echo pipeline2
sox --norm=-3 $filelist out2.wav \
  loudness \
  compand .1,.2 -inf,-50.1,-inf,-50,-50 0 -90 .1 \
  bass 1 \
  compand 0.01,1 -90,-90,-70,-70,-60,-20,0,0 -5 \
  contrast 0 \
  earwax

echo pipeline3
sox --norm=-3 $filelist out3.wav \
  loudness -20\
  compand 0.3,1 6:-70,-60,-20 -5 -90 0.2 \
  bass 1 \
  contrast 0 \
  earwax

# sox --norm=-3 --combine concatenate intro.wav out1.mp3 full.mp3 splice -q 16,3
# mp3val full.mp3 -f -nb

