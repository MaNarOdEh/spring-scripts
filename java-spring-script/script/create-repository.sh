#!/bin/sh

#This scripts will create a repository
#define necessary variabels
repository_name=$1;
repositroy_type=$2;
repository_t1=$3;
repository_t2=$4;


#create repository folder if it's not exists
mkdir -p repository;
repository_name=$(tr a-z A-Z <<< ${repository_name:0:1})${repository_name:1};

if [ -z "$repositroy_type" ]
then
    repositroy_type="JbaRepository";
fi

if [ -z "$repository_t1" ]
then
    repository_t1=${repository_name};
fi

if [ -z "$repository_t2" ]
then
    repository_t2="UUID";
fi

test -f repository/${repository_name}Repository.ts || touch repository/${repository_name}Repository.ts
file_name=repository/${repository_name}Repository.ts;
echo "import org.springframework.data.jpa.repository.JpaRepository;" >> $file_name;
echo "public interface ${repository_name}Repository extends ${repositroy_type}<${repository_t1},${repository_t2}> { }" >> $file_name;
 
