#!/bin/bash

#varaibels
reducer_name=$1;
#create store folder
mkdir -p store
#change first char from capital to small
reducer_name=$(tr A-Z a-z <<< ${reducer_name:0:1})${reducer_name:1};
reducer_dir=store/${reducer_name}.reducer.ts;
test -f ${reducer_dir} || touch ${reducer_dir};

echo 'import { State } from "@ngrx/store";' >> ${reducer_dir};
echo "import * as ${reducer_name}Action from \"./action/${reducer_name}.action\"" >> ${reducer_dir};

echo "export interface ${reducer_name}State {" >> ${reducer_dir};
echo "};" >> ${reducer_dir};

echo "export const  ${reducer_name}InitialState:  ${reducer_name}State = {" >> ${reducer_dir};
echo "};">>${reducer_dir};

shift 1;
echo "export function reducer(" >> ${reducer_dir};
echo "  state = ${reducer_name}InitialState," >> ${reducer_dir};
echo "  action: ${reducer_name}Action.action" >> ${reducer_dir};
echo "): ${reducer_name}State {" >> ${reducer_dir};
echo "  switch (action.type) {" >> ${reducer_dir};
for var in "$@"
do
    echo "      case ${reducer_name}Action.${reducer_name}Types.${var}: { ">> ${reducer_dir};
    echo "          return {" >> ${reducer_dir};
    echo "           ...state," >> ${reducer_dir};
    echo "           };" >> ${reducer_dir};
    echo "      }" >> ${reducer_dir};
done
echo "      default: {" >> ${reducer_dir};
echo "             return ${reducer_name}InitialState;" >> ${reducer_dir};
echo "        }" >> ${reducer_dir};
echo "      }" >> ${reducer_dir};
echo "}" >> ${reducer_dir};
