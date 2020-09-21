array=({a..z})
filename=
for i in {0..9}
do
    num=$(( $RANDOM*25 / 32767 ))  #也可以写为 $[RANDOM%26]
    filename=${filename}${array[num]}
done
touch /tmp/${filename}.txt
