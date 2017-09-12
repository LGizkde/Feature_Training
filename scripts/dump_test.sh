#!/bin/bash
declare -a iters=(000 010 020 030 040 050 060 070)
for iternum in ${iters[@]}
do
  file="$file type_base_result/iter-0$iternum"
  #echo $file
done
cat $file | grep -vP '(^$)|(^#)' | python decoder/rule_dumper.py --rule_dump=nontype_0070-dump 
