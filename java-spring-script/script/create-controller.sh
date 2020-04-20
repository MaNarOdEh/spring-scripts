#!/bin/bash
controller_name=$1;
controller_name=$(tr a-z A-Z <<< ${controller_name:0:1})${controller_name:1};
mkdir -p controller;
cotroller_path_file=controller/${controller_name}Controller.java;
test -f $cotroller_path_file || touch $cotroller_path_file;


echo "import java.util.List;" >> $cotroller_path_file;
echo "import java.util.UUID;" >> $cotroller_path_file;
echo "import com.example.demo.model.${controller_name};" >> $cotroller_path_file;
echo "import com.example.demo.services.${controller_name}ServiceImp;" >> $cotroller_path_file;




echo "import org.springframework.web.bind.annotation.RequestMapping;" >> $cotroller_path_file;

echo "import org.springframework.web.bind.annotation.RestController;" >> $cotroller_path_file;


echo "@RestController" >> $cotroller_path_file;
echo "@RequestMapping(\"/api/${controller_name}\")" >> $cotroller_path_file;
echo "public class ${controller_name}Controller {" >> $cotroller_path_file;


echo "@Autowired" >> $cotroller_path_file;

echo "private MovieServicesImp $(tr A-Z a-z <<< ${controller_name:0:1})${controller_name:1}ServiceImp;" >> $cotroller_path_file;

echo "}" >> $cotroller_path_file;

