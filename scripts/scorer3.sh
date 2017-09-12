#!/bin/bash
#declare -a iters=(000 010 020 030 040)
#declare -a bi_iters=(050 060 070 080 090)
declare -a tri_iters=(120 130 140 150 160)
declare -a files=(/p/mt2/users/chung/cl14-data/dev/dev.chi /p/mt2/users/chung/cl14-data/test/test.chi)
for iternum in ${tri_iters[@]}
do
  #mkdir "0$iternum"-dev-grammar
  python ../decoder/scorer.py --unfiltered="0$iternum"-dump/extract.0001,"0$iternum"-dump/extract.0002,"0$iternum"-dump/extract.0003 --filter_file=$DATA/dev/dev.chi --filtered="0$iternum"-dev-grammar/baseline.hiero.dev.gr 
  #mkdir "0$iternum"-test-grammar
  python ../decoder/scorer.py --unfiltered="0$iternum"-dump/extract.0001,"0$iternum"-dump/extract.0002,"0$iternum"-dump/extract.0003 --filter_file=$DATA/test/test.chi --filtered="0$iternum"-test-grammar/baseline.hiero.test.gr 
done
#python decoder/scorer.py --unfiltered=0-70-iter-dump/extract.0001,0-70-iter-dump/extract.0002 --filter_file=$DATA/dev/dev.chi --filtered=0-70-iter-grammar/baseline.hiero.dev.gr
