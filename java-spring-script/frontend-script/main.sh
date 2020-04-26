#!/bin/sh
# print helper message for users
display_help(){

    echo "Usage: [-are] [-o outfile]"
    echo ;
    echo "   -h,--help display the current helper message";
    echo "";
    
    echo "Usage NameSpace [repository,entity,service]";
    echo "action,a:    --name,-n name of the action";
    echo "              list of all action type as type name";
    echo "";
    
    echo "reducer,r:    --name,-n name of the action";
    echo "              list of all action type as type name";
    echo "";

    echo "effect,e:    --name,-n name of the action";
    echo "";
    
    echo "all,a:     create action,reducer,effect";
    echo "          --name,-n name of the action";
    echo "          list of all action type as type name";
    echo "";
    echo ;
    exit 1
}
create_action(){
    if [ -z "${1}" -o "$1" != "--name" -a "${1}" != "-n" ]
    then
       echo "Error!";
       display_help
       
    fi
    
    if [ -z "$2" ]
    then
        echo "No passing argument";
        display_help
    fi
    
    shift 1;
    ./create-action.sh $1 "$@";
    
}
create_reducer(){
    if [ -z "${1}" -o "$1" != "--name" -a "${1}" != "-n" ]
    then
       echo "Error!";
       display_help
       
    fi
    
    if [ -z "$2" ]
    then
        echo "No passing argument";
        display_help
    fi
    
    shift 1;
    ./create-reducer.sh $1 "$@";
    
}
create_effects(){
    if [ -z "${1}" -o "$1" != "--name" -a "${1}" != "-n" ]
    then
       echo "Error!";
       display_help
       
    fi
    
    if [ -z "$2" ]
    then
        echo "No passing argument";
        display_help
    fi
    
    shift 1;
    ./create-effect.sh $1 "$@";
    
}

commands=$1;
case "$commands" in
 #case 1
 "--help") display_help ;;
 #case 2
 "-h") display_help ;;
 #case 3
 "action") shift 1; create_action "$@";;
 #case 4
 "a") shift 1; create_action "$@";;
 #case 5
 "r") shift 1; create_reducer "$@";;
 #case 6
 "reducer") shift 1; create_reducer "$@";;
 #case 7
 "effect") shift 1; create_effects "$@";;
 #case 8
 "e") shift 1; create_effects "$@";;
 #case 9
 "all") shift 1; create_action "$@"; create_reducer "$@"; create_effects "$@";;
 #case 10
 "a") shift 1; create_action "$@"; create_reducer "$@"; create_effects "$@";;
esac
