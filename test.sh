#!/bin/bash

testSum () {
    sum=`perl -ML -e '@a=(1..5);print sum @a'`
    assertEquals $sum 15
}

testMax () {
    max=`perl -ML -e '@a=(1..5);print max @a'`
    assertEquals $max 5
}

testMin () {
    min=`perl -ML -e '@a=(1..5);print min @a'`
    assertEquals $min 1
}

testPercentile () {
    percentile1=`perl -ML -e '@a=(0..100);print percentile @a,30'`
    assertEquals $percentile1 30
    percentile1=`perl -ML -e '@a=(0..100);print percentile @a,60'`
    assertEquals $percentile1 60
}

testMean () {
    mean=`perl -ML -e '@a=(1,2,3,3,4,5,6,7,14);print mean @a'`
    assertEquals $mean 5
}

testMedian () {
    median=`perl -ML -e '@a=(1,2,3,3,4,5,6,7,14);print median @a'`
    assertEquals $median 4
}

testQ1 (){
    q1=`perl -ML -e '@a=(0..100);print q1 @a'`
    assertEquals $q1 25
}

testQ3 (){
    q3=`perl -ML -e '@a=(0..100);print q3 @a'`
    assertEquals $q3 75
}

testUniq () {
    uniq1=`perl -ML -e '@a=(1,2,3,3,4);print uniq @a'`
    assertEquals $uniq1 1234
    uniq2=`perl -ML -e '@a=(1,3,3,4,1,2);print uniq @a'`
    assertEquals $uniq2 1342
}

testSd () {
    sd=`perl -ML -e '@a=(1..10);printf( "%.3f", sd @a )'`
    assertEquals $sd 3.028
}

. shunit2-source/2.1.6/src/shunit2
