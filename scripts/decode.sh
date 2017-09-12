#!/bin/bash
declare -a indexes=(0)
declare -a ports=(8993 8994 8995 8996 8997 8998 8999 9050 9001 9016 9017 9018 9019 9024 9026 9027 9028 9029 9030 9031 9032 9033)
declare -a test_ports=(9004 9005 9006 9007 9008 9009 9010 9011 9012 9053 9054 9055 9020 9021 9022 9023 9025 9034 9035 9036 9037 9038 9039 9040)
declare -a iters=(100)
BASE_DIR="/home/vax6/p43/mt-scratch2/tmeng3/hrg-sample/supervised_decoding"
DECODER=$BASE_DIR/decoder
SCRIPT_DIR="$BASE_DIR"/scripts
GRAMMAR_DIR=$BASE_DIR/grammars
RUN_DIR=$BASE_DIR/run_dir
RESULT_DIR=$BASE_DIR/results
FLAG_DIR=$BASE_DIR/flags
DATA_DIR=$BASE_DIR/data

glue_grammar=$GRAMMAR_DIR/mert_unalign.gr,$GRAMMAR_DIR/mert_glue_5.gr
flagfile=$FLAG_DIR/baseline1.flag
nonlexical_grammar=$GRAMMAR_DIR/dev-grammar/baseline.hiero.dev.gr 
for index in ${indexes[@]}
do
  iternum=${iters[$index]}
  port=${ports[$index]}
  runDir=$RUN_DIR/dev_first10_generative
  mkdir -p $runDir
  outputFile=dev.first10.generative.amr
  inputFile=$DATA_DIR/dev/dev10
  python $DECODER/decoder.py --flagfile=$flagfile --parallel=False --output="$outputFile" --port="$port" --run_dir="$runDir" --grammars="$nonlexical_grammar","$glue_grammar" --input=$inputFile
done
