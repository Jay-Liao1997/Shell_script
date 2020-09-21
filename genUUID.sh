elements=0123456789abcdef
catch=
function genUUID() {
    for i in $(seq 1 $1)
    do
        num=$[ $RANDOM%15 ]
        catch=${catch}$(echo ${elements:${num}:1})
    done
    echo -n "$catch"
    catch=
}

for i in 8 4 4 4 12
do
    genUUID $i
    [ $i -ne 12 ] && echo -n "-"
done

#第二段也可以写为
# result=
# for i in 8 4 4 4 12
# do
#     result=${result}$(genUUID $i)"-"
# done
# echo ${result::-1}
