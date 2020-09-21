read -p "Input yes/y to continue, input no/s to qiut." choice

case ${choice} in
[Yy][Ee][Ss]|[Yy])
    echo "Continue"
    ;;
[Nn][Oo]|[Nn])
    echo "Quit"
    ;;
*)
    echo "Useage $0 <Yes/y|No/n>"
    ;;
esac