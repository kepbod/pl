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
pl -e '@a=(1..10);printf("%.3f", sd @a)'
# out => 3.028
```

## Useful resources for perl one liners

### Useful options (http://perldoc.perl.org/perlrun.html)

* `-a`: turns on autosplit mode (split command to the `@F` array) when used with a `-n` or `-p`
* `-l`: enables automatic line-ending processing (1. chomps `$/` for each line; 2. assigns `$\\` after each `print`)
* `-n`: reads each line from your file(s) via a loop
* `-e`: enters one line of program

* `-p`: reads each line and print `$_` from your file(s) via a loop
* `-F`: specifies the pattern to split on for `-a`
* `-i`: processes file(s) in-place

### Useful variables (http://perldoc.perl.org/perlvar.html)

* `$"`: list separator in double-quoted context
* `$.`: current line number
* `$,`: output field separator for the print operator
* `$ARGV`: the name of the current file

## License
Copyright (C) 2016 Xiao-Ou Zhang. See the [LICENSE](https://github.com/kepbod/pl/blob/master/LICENSE) file for license rights and limitations (MIT).
