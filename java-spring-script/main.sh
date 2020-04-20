#!/bin/sh
# print helper message for users
display_help(){
    echo "Usage: [-escrf] [-o outfile]"
    echo ;
    echo "   -e,--entity create new entity";
    echo "   -s,--service create new service";
    echo "   -c,--controller create new controller";
    echo "   -r,--repository create new repository";
    echo "   -f,--backEnd create all backEnd folder";
    echo "        [model,controller,services,repository,exception,handler";
    echo "   -o outfile specifiy output file output";
    echo ;
    echo "Usage NameSpace [repository,entity,service]";
    echo "repository ,--name,-n name of the repository "
    echo "           ,--type,-t type of the repository [by defult jbaRepository"
    echo "           ,<T1,T2> type of first genric,second"
    exit
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
 "--h") display_help ;;
 #case3
 "--e") echo "--name here";;
 esac



