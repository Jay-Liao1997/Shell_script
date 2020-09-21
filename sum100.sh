sum=0
for num in {1..100};
do
    sum=$(( ${sum}+${num} ))
done
echo "1-100 sum is ${sum}"