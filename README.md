# pl -- Perl One Liners

[![Build Status](https://travis-ci.org/kepbod/pl.svg?branch=master)](https://travis-ci.org/kepbod/pl)

*A perl package useful for perl one liners*

```
alias pl="perl -ML"
```

If you love pl, welcome to [buy me a cup of coffee :coffee:](https://www.paypal.me/kepbod). Thx!!!


## Install

```
git clone https://github.com/kepbod/pl.git $HOME/pl
cd $HOME/pl
bash install.sh
```

## Document

1 Calculate the sum of a list.
```
pl -e '@a=(1..5);print sum @a'
# out => 15
```

2 Calculate the maximum of a list.
```
pl -e '@a=(1..5);print max @a'
# out => 5
```

3 Calculate the minimum of a list.
```
pl -e '@a=(1..5);print min @a'
# out => 1
```

4 Calculate the percentile of a list.
```
pl -e '@a=(0..100);print percentile @a,30'
# out => 30
```

5 Calculate the mean of a list.
```
pl -e '@a=(1,2,3,3,4,5,6,7,14);print mean @a'
# out => 5
```

6 Calculate the median of a list.
```
pl -e '@a=(1,2,3,3,4,5,6,7,14);print median @a'
# out => 4
```

7 Calculate the Q1 of a list.
```
pl -e '@a=(0..100);print q1 @a'
# out => 25
```

8 Calculate the Q3 of a list.
```
pl -e '@a=(0..100);print q3 @a'
# out => 75
```

9 Fetch unique entries from a list.
```
pl -e '@a=(1,2,3,3,4);@b=uniq @a;$,="\t";print @b'
# out => 1 2 3 4
```

10 Calculate the standard deviation of a list.
```
pl -e '@a=(1..10);printf("%.3f",sd @a)'
# out => 3.028
```

11 Calculate the coefficient of variation of a list.
```
pl -e '@a=(-5,-4,7.5,8.7,3.4,9.4,0.8,1.5,2.6,0.9,0.6,9.4,8.4,6.6,9.4);printf("%.3f", cv @a)'
# out => 1.215
```

12 Calculate the standard score (Z score) of a list.
```
pl -e '@a=(-5,-4,-2,-1,-1,0,2,2,3,3,4);@z=zscore @a;printf "%0.3f",$z[0]'
# out => -1.707
```

13 Calculate the pearson correlation coefficient between two lists.
```
pl -e '@a=(100,82,89,0);@b=(26,10,5,1);printf "%0.3f", cor(\@a,\@b)'
# out => 0.677
```

## Useful resources for perl one liners

### [Useful options](http://perldoc.perl.org/perlrun.html)

* `-a`: turns on autosplit mode (split command to the `@F` array) when used with a `-n` or `-p`
* `-l`: enables automatic line-ending processing (1. chomps `$/` for each line; 2. assigns `$\` after each `print`)
* `-n`: reads each line from your file(s) via a loop
* `-e`: enters one line of program

* `-p`: reads each line and print `$_` from your file(s) via a loop
* `-F`: specifies the pattern to split on for `-a`
* `-i`: processes file(s) in-place

### [Useful variables](http://perldoc.perl.org/perlvar.html)

* `$_`: default input and pattern-searching space
* `$"`: list separator in double-quoted context
* `$.` or `$NR`: current line number
* `$,` or `$OFS`: output field separator for the print operator
* `$/` or `$RS`: input record separator, newline by default
* `$\` or `$ORS`: output record separator for the print operator
* `$ARGV`: the name of the current file

### [Useful blocks](http://perldoc.perl.org/perlmod.html#BEGIN%2c-UNITCHECK%2c-CHECK%2c-INIT-and-END)

* `BEGIN{}`: A `BEGIN` code block is executed as soon as possible, that is, the moment it is completely defined.
* `END{}`: An `END` code block is executed as late as possible, that is, after perl has finished running the program and just before the interpreter is being exited.

### [Quiz of perl oneliner](https://github.com/kepbod/perl-oneliner-quiz)

## License
Copyright (C) 2016-2017 Xiao-Ou Zhang. See the [LICENSE](https://github.com/kepbod/pl/blob/master/LICENSE) file for license rights and limitations (MIT).
