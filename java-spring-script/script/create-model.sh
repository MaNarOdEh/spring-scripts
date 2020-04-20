# !/bin/bash
#This scripts is reposonsible to create an entity
#necessary varaibels
entity_name=$1;
attribute_number=$2;

entity_name=$(tr a-z A-Z <<< ${entity_name:0:1})${entity_name:1};

mkdir -p model
test -f model/${entity_name}.java || touch model/${entity_name}.java;
file_name=model/${entity_name}.java;

helper_file_name=model/helper.text;
rm -f $helper_file_name;
touch $helper_file_name;

echo "import java.io.Serializable;" >> $file_name;
echo "import java.util.UUID;"  >> $file_name;

echo "import javax.persistence.Entity;"  >> $file_name;
echo "import javax.persistence.Table;"  >> $file_name;
echo "import javax.persistence.Column;" >> $file_name;
echo "import javax.persistence.Id;" >> $file_name;

echo  >> $file_name;

echo "@Entity" >> $file_name;

echo "@Table(name = \"movie\", schema = \"public\")" >> $file_name;


echo "public class $(tr a-z A-Z <<< ${entity_name:0:1})${entity_name:1} implements Serializable {"  >> $file_name;
echo >> $file_name;

index=0;
shift 2;

while [ $index != $attribute_number ]
do
    echo "  @Column(name = \"${2}\")" >> $file_name;
    echo "  @NotBlank" >> $file_name;
    
    echo "  private ${1} ${2};" >> $file_name;
    
    echo "  public ${1} get$(tr a-z A-Z <<< ${2:0:1})${2:1}() {" >> $helper_file_name;
    echo "      return this.${2};" >> $helper_file_name;
    echo "  }" >> $helper_file_name;
    
    echo "  public void set$(tr a-z A-Z <<< ${2:0:1})${2:1}(${1} ${2}){" >> $helper_file_name;
    echo "      this.${2} = ${2};" >> $helper_file_name;
    echo "  }" >> $helper_file_name;
    index=$((index+1));
    shift 2;
done

cat $helper_file_name >> $file_name;
rm -f $helper_file_name;

echo "}" >> $file_name;



