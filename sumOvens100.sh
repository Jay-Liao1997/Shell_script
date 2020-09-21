sum=0
for num in {1..100};
do
    result=$(( ${num}%2 ))
    [ ${result} -eq 0 ] && sum=$(( ${sum}+${num} ))
done
echo "1-100 sum is ${sum}"