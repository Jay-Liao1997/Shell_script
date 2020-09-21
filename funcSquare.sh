function add(){
        echo ${num}^2|bc
}
read -p "Input your number: " num
expr $num + 1 &>/dev/null
[ `echo $?` -eq 0 ] && add || echo "You must give me a integer."


function add(){
        echo ${x}^${y}|bc
}
read -p "Input your number(x): " x
read -p "Input your number(y): " y

expr $x + $y &>/dev/null
[ `echo $?` -eq 0 ] && add || echo "You must give me  integers."


