hello () {
    c=$1
    b="default"
    a=${c:-$b}
    echo "hello,$a"
}
hello $1
