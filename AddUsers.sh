for num in {01..10};
do
    useradd user${num} &> /dev/null
    echo pass${num}|passwd --stdin user${num } &> /dev/null
done