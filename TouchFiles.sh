[ -d /haowan ] mkdir /haowan
for filename in up-{1..10};
do
    touch /haowan/${filename}
done
echo "Job done!"

for num in {1..10};
do
    
    mv /haowan/up-${num} /haowan/down-${num}
    
done
echo "Replace done."