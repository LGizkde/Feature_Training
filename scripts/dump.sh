#!/bin/bash
#file=../grammars/new-filtered.gr
file=../grammars/full.filtered.gr
run_dir=../rule_processing
mkdir -p $run_dir
cat $file | grep -vP '(^$)|(^#)' | python ../../decoder/rule_dumper.py --rule_dump=$run_dir/dumped
echo 'finished dumping'
