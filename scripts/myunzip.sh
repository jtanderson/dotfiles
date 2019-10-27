#/bin/bash

rename "s/ //g" *.zip

for i in $(ls)
do
  name=`echo $i | cut -d "_" -f 1`
  unzip -d $name $i
done

ls
