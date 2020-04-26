#!/bin/bash

#varaibels

action_name=$1;
action_type_count=$2;
#create store folder
mkdir -p store

#change first char from capital to small
action_name=$(tr A-Z a-z <<< ${action_name:0:1})${action_name:1};
action_dir=store/${action_name}.action.ts;
test -f ${action_dir} || touch ${action_dir};
action_name=$(tr a-z A-Z <<< ${action_name:0:1})${action_name:1};

#necessary import statement
echo 'import { Action } from "@ngrx/store";' >> $action_dir;

#create EnumTypes
echo "export enum E${action_name}Types {"  >> $action_dir;
shift 2;
for var in "$@"
do
    echo "  \"${var}\" = \"[${var} Page] ${var}\", ">> $action_dir;
done
echo "}"  >> $action_dir;


for var in "$@"
do
    echo "export class ${var} implements Action {" >> $action_dir;
    echo "  readonly type = E${action_name}Types.${var};"  >> $action_dir;
    echo "};"  >> $action_dir;
done



#create type action from this action
type_action="export type action =";
for var in "$@"
do
    type_action="$type_action ${var} |";
done
echo "${type_action:0:${#type_action}-1};"  >> $action_dir;
