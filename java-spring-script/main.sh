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
    echo "repository,r: --name,-n name of the repository ";
    echo "              --type,-t type of the repository [by default jbaRepository";
    echo "              <T1,T2> type of first genric,second";
    echo "                [ by default <name,UUID] >";
    echo "";
    echo "entity,e:    --name,-n name of the entity";
    echo "             --parameter_number,-c number of parameter";
    echo "             list all your parameter as type name";
    echo "";
    echo "controller,c:  --name,-n name of the controller";
    echo "";
    echo "services,s:    --name,-n name of the service";
    echo;
    exit 1
}
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
 "repository") echo "--name here" ;;
 #case 5
 "r") echo "repoistory name space" ;;
 
 esac

#./script/create-controller.sh movie

#./script/create-controller.sh user
