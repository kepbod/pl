#!/usr/bin/perl
#
use strict;
use warnings;

package Numcal;
require Exporter;

our @ISA=qw(Exporter);
our @EXPORT=qw(sum average mid diff max min fold std zscore pearson lm);
our @VERSION=1.00;


#################usage####################
#sum    average	   mid    diff    fold    std	   zscore    pearson#
#$sum=sum(@array)                       # sum of the array
#$average=average(@array)               # average num of the array
#$mid=mid(@array)                       # middle num of the array
#$diff=diff(@array)                     # maxnum-minnum
#$fold=fold(@array)                     # maxnum/minnum
#$min=min(@array)                       # min
#$max=max(@array)                       # max
#$std=std(@array)                       # standard deviation of the array
#@zscore=zscore(@array)                 # transform to zscore
#$pearson=pearson(\@array1,\@array2)    # pearson correlation of array1 and array2, be sure the input is pointer format
#$one=one(@array)						# one of the element match the condition
#$all=all(@array)						# all of the element match the condition
#@lm=lm(\@array1,\@array2)    		# lm
#################usage####################

#$sum=sum(@array)                       # sum of the array
sub sum{
	my $sum=0;
	$sum+=$_ for @_;
    $sum;
}

#$average=average(@array)  #average num of the array
sub average{
	my $sum=0;
	$sum+=$_ for @_;
	my $count=@_;
    my $average=$sum/$count;
	$average;
}

#$mid=mid(@array)          # middle num of the array
sub mid{
	my @list=sort {$a<=>$b} @_;
	my $count=@list;
	my $mid;
	if($count==0){
		return 0;
		die "Kidding me?";
	}
	if ($count%2==1){
		$mid=$list[($count-1)/2];
	}
	elsif ($count%2==0){
		$mid=($list[$count/2-1]+$list[$count/2])/2;
	}
	$mid;
}

#$diff=diff(@array)         # maxnum-minnum
sub diff{
	my @list;
	for my $num(@_){
		next if $num=~/NULL/;
		push @list,$num;
	}
	my @sort_list=sort{$a<=>$b} @list;
	my $diff=$sort_list[-1]-$sort_list[0];
	$diff;
}

#$fold=fold(@array)         # maxnum/minnum
sub fold{
	my @sort_list=sort {$a<=>$b} @_;
	my $fold=($sort_list[-1]+1)/($sort_list[0]+1);
	$fold;
}

sub max{
	my @sort_list=sort {$a<=>$b} @_;
	my $max=$sort_list[-1];
	$max;
}

sub min{
	my @sort_list=sort {$a<=>$b} @_;
	my $min=$sort_list[0];
	$min;
}

#$std=std(@array)           # standard deviation of the array
sub std{
	my $average=average(@_);
	my $up=0;
	$up+=($_-$average)**2 for (@_);
	my $std=sqrt($up/($#_));
	return $std;
}

#@zscore=zscore(@array)     # transform to zscore
sub zscore{
	my $average=average(@_);
	my $up=0;
	$up+=($_-$average)**2 for (@_);
	my $std=sqrt($up/($#_));
	my @zscore;
	for (@_){
		my $zscore=($_-$average)/$std;
		push @zscore,$zscore;
	}
	return @zscore;
}

#$pearson=pearson(\@array1,\@array2)   # pearson correlation of array1 and array2, be sure the input is pointer format
sub pearson{
	my @a=(@_);
	my @array1=@{$a[0]};
	my @array2=@{$a[1]};
	my $avr1=average(@array1);
	my $avr2=average(@array2);
	my $up=0;
	my $down1=0;
	my $down2=0;
	for my $num(0..$#array1){
		$up+=($array1[$num]-$avr1)*($array2[$num]-$avr2);
		$down1+=($array1[$num]-$avr1)**2;
		$down2+=($array2[$num]-$avr2)**2;
	}
	my $pearson=$up/(sqrt($down1)*sqrt($down2));
	return $pearson;
}

sub lm{
	my @a=(@_);
	my @array1=@{$a[0]};
	my @array2=@{$a[1]};
	my $avr1=average(@array1);
	my $avr2=average(@array2);
	my $slope=0;
	my $intercept=0;
	for my $num (0..$#array1) {
		$slope+=($array1[$num]-$avr1)*($array2[$num]-$avr2);
		$intercept+=($array1[$num]-$avr1)**2;
	}
	$slope/=$intercept;
	$intercept=$avr2-$slope*$avr1;
	my @lm=($slope,$intercept);
	return @lm;
}
1;
