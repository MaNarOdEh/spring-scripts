#!/bin/sh
# print helper message for users
display_help(){
    echo "Usage: [-escrf] [-o outfile]"
    echo ;
    echo "   -h,--help display the current helper message";
    echo "   -all,--create_all,  --name,-n name to create";
    echo "                      model,repository,service,"
    echo "                      controller";
    echo ;
    echo "Usage NameSpace [repository,entity,service]";
    echo "entity,e:    --name,-n name of the entity";
    echo "             --parameter_number,-c number of parameter";
    echo "             list all your parameter as type name";
    echo "";
    echo "repository,r: --name,-n name of the repository ";
    echo "              --type,-t type of the repository [by default jbaRepository";
    echo "              --T1,--T2 <T1,T2> type of first genric,second";
    echo "                [ by default <name,UUID] >";
    echo "";
    echo "controller,c:  --name,-n name of the controller";
    echo "";
    echo "services,s:    --name,-n name of the service";
    echo;
    exit 1
}
#this method recieve two arguments
#the first one represent the parameters name
#the second is represent the name
#this methods will create entity,repository,service,controller
create_all(){
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
    ./script/create-model.sh $2 0
    ./script/create-repository.sh $2
    ./script/create-controller.sh $2
    ./script/create-service.sh $2
    exit 1;
}
create_entity(){
    if [ -z "${1}" -o "$1" != "--name" -a "${1}" != "-n" ]
    then
       echo "Error! ";
       display_help
       
    fi
    
    if [ -z "$2" ]
    then
        echo "No passing argument";
        display_help
    fi
    
    if [ -z "$3"  -o "$3" != "--parameter_number" -a "${3}" != "-c" ]
    then
        echo "Error!";
        display_help
    fi
    
    if [ -z "$4" ]
    then
        echo "No passing argument";
        display_help
    fi
    name=$2;
    count=$4;
    shift 4;
    ./script/create-model.sh $name $count "$@";
    exit 1;
}
create_repository(){
    if [ -z "${1}" -o "$1" != "--name" -a "${1}" != "-n" ]
    then
       echo "Error! ";
       display_help
       
    fi

    if [ -z "$2" ]
    then
        echo "No passing argument";
        display_help
    fi
    name=$2;
    t=$4;
    t_first=$6;
    t_second=$7;
    ./script/create-repository.sh $name $t $t_first $t_second;
    exit 1;
}
create_controller(){
    if [ -z "${1}" -o "$1" != "--name" -a "${1}" != "-n" ]
    then
       echo "Error! ";
       display_help
       
    fi

    if [ -z "$2" ]
    then
        echo "No passing argument";
        display_help
    fi
    ./script/create-controller.sh $2

    exit 1;
}
# print help messages
CONTROLLER_FOLDER="controller";
REPOSITORY_FOLDER="repository";
SERVICES_FOLDER="services";
SERVICE_FOLDER="services/serviceImp";
SECURITY_FOLDER="security";
MODEL_FOLDER="model";

commands=$1;
case "$commands" in
 #case 1
 "--help") display_help ;;
 #case 2
 "-h") display_help ;;
 #case 3
 "-all") create_all $2 $3 ;;
 "--create_all") create_all $2 $3 ;;
 #case 4
 "entity") shift 1; create_entity "$@" ;;
 #case 5
 "e") shift 1 ;create_entity "$@" ;;
 #case 6
 "repository") shift 1; create_repository "$@";;
 #case 7
 "r" ) shift 1; create_repository "$@" ;;
 #case 8
 "controller") create_controller $2 $3;;
 #case 9
 "c") create_controller $2 $3;;
 #case 10
 "service") echo "service";;
 #case 11
 "s") echo "ss";;
 esac

#./script/create-controller.sh movie

#./script/create-controller.sh user
