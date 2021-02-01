#!/usr/bin/env bash

# Run this script in the project root

# This script can be used to automatically run experiments for
# multiple numbers of gates (10 iterations each)

ITERATIONS=10

fileprefix="perf_`date +'%Y-%m-%d-%H%M'`_GEN_"
echo "$fileprefix"

for g in 1000 10000 100000
do
	echo "Running with g = $g gates"
	for i in $(seq $ITERATIONS)
	do
                # edit the next line to run on a different servers
                # example: bin/millionaire_prob_test -r $r -g $g -a 10.10.10.10 >> $fileprefix$g
		build/UC -random $g >> $fileprefix$g
		# bin/millionaire_prob_test -r $r -g $g >> $fileprefix$g
		echo -n "[$i] "
	done
	echo ""

	# parsing performance outputs
	# time_total=`cat $fileprefix$g | grep Total\ = | awk '{ sum += $3} END { print sum/10}'`
	# echo "Runtime (averaged): $time_total"

done
