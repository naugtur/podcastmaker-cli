# filelist=`ls *.wav`;

# for i in $filelist; do
#         BN=`basename $i .wav`
#         echo "norming $i with factor $FOO ..."
#         sox $i ${BN}.norm.wav norm
# done 


i=tt.wav
BN=`basename $i .wav`
j=${BN}.n.wav
set -v

### experiments
# sox --norm=-3 $i $j
# sox $j ${BN}.nc1.wav compand 0.3,1 6:-70,-60,-20 -5 -90 0.2
# sox $j ${BN}.nc2.wav compand 0.3,1 6:-70,-60,-20 -5 -90
# sox $j ${BN}.nc3.wav compand 0.01,1 -90,-90,-70,-70,-60,-20,0,0 -5
# sox $j ${BN}.nc4.wav contrast 0
# sox $j ${BN}.nc5.wav contrast 75


# for file in *.wav; do sox "$file" "$file-compresssed.wav" compand 0.3,1 6:-70,-60,-20 -5 -90 0.2 ; done

### try all together
sox --norm=-3 $i ${BN}.z.wav compand .1,.2 -inf,-50.1,-inf,-50,-50 0 -90 .1 bass 1 compand 0.01,1 -90,-90,-70,-70,-60,-20,0,0 -5 contrast 0 