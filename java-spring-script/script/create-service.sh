
#!/bin/bash

service_name=$1;
mkdir -p services
service_name=$(tr a-z A-Z <<< ${service_name:0:1})${service_name:1};
file_dir=services/${service_name}Service.java;
file_dir_imp=services/${service_name}ServiceImp.java;
test -f ${file_dir} || touch ${file_dir};
test -f ${file_dir_imp} || touch ${file_dir_imp};

echo "public interface ${service_name}Service { } " >> $file_dir;


echo "import org.springframework.beans.factory.annotation.Autowired;" >> $file_dir_imp;

echo "import com.example.demo.repository.${service_name}Repository;" >> $file_dir_imp;
echo "import com.example.demo.services.${service_name}Service;" >> $file_dir_imp;

echo >> $file_dir_imp;
echo "@Service" >> $file_dir_imp;
echo "public class ${service_name}ServiceImp implements ${service_name}Service {" >> $file_dir_imp;
echo "@Autowired" >> $file_dir_imp;
echo "private ${service_name}Repository $(tr A-Z a-z <<< ${service_name:0:1})${service_name:1}Repository;" >> $file_dir_imp;
echo >> $file_dir_imp;
echo "}" >> $file_dir_imp;

