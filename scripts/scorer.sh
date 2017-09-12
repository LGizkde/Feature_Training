#!/usr/bin/bash
RUN_DIR=../rule_processing
DUMP_DIR="$RUN_DIR"/dumped
FILTER_DIR="$RUN_DIR"/dev-grammar

rm -rf $FILTER_DIR
mkdir $FILTER_DIR

#SENT_FILE=../../concept_id/dev_sents/dev.lemma
SENT_FILE=dev.tok
python ../../decoder/scorer.py --unfiltered="$DUMP_DIR"/extract.0001 --filter_file="$SENT_FILE" --filtered="$FILTER_DIR"/baseline.hiero.dev.gr --max_type=6 --filter_maxlen=150

