
 for i in {1..9};
 do
     for ((j=1;j<=i;j++))
     do
         result=$(( ${i} * ${j} ))
         echo -en  "${i}x${j}=${result} \t"
     done
     echo
 done
 echo
