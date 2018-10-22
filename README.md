# podcastmaker-cli
a pile of bash tricks for unattended audio editing

## tools

```
sudo apt-get install normalize-audio sox
```


## research

```
for file in ~/gpodder-downloads/*/*.mp3; do sox "$file" "$file-compresssed.mp3" compand 0.3,1 6:-70,-60,-20 -5 -90 0.2 ; rm "$file" ; done
```

https://forum.doom9.org/showthread.php?t=165807

```
speech:
compand 0.02,0.20 5:-60,-40,-10 -5 -90 0.1
source: http://www.benmcdowell.com/blog/2012/01/29/batch-processing-audio-file-cleanup-with-sox/

voice/music:
compand 0.1,0.3 -60,-60,-30,-15,-20,-12,-4,-8,-2,-7 -2
source: http://www.dzone.com/snippets/sox-audio-editor-settings
and
source: http://forums.joe.to/viewtopic.php?f=149&t=57817

voice/radio:
compand 0.01,1 -90,-90,-70,-70,-60,-20,0,0 -5
source: http://icecast.imux.net/viewtopic.php?t=3462

audio books:
compand 0.3,5 6:-70,-60,-20 -10 -6 0.2
source: http://www.ericphelps.com/batch/samples/MP3_Recode.txt

podcast:
compand 0.3,1 6:-70,-60,-20 -5 -90
source: https://dissectionbydavid.wordpress.com/2010/10/01/using-sox-via-php-to-cleanup-podcasts/
````


```
#!/bin/sh
#normalize everything

for i in `ls *wav`; do
        FOO=`sox $i -e stat -v 2>&1`
        BN=`basename $i .wav`
        echo "norming $i with factor $FOO ..."
        sox -v $FOO $i -t wav ${BN}.norm.wav
done 
```