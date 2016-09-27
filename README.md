# pl -- Perl One Liners

*A perl package useful for perl one liners*

```
alias pl="perl -ML"
```

## Install

```
git clone https://github.com/kepbod/pl.git $HOME/pl
cd $HOME/pl
bash install.sh
```

## Useful resources for perl one liners

### Useful options (http://perldoc.perl.org/perlrun.html)

* `-a`: turns on autosplit mode (split command to the `@F` array) when used with a `-n` or `-p`.
* `-l`: enables automatic line-ending processing (1. chomps `$/` for each line; 2. assigns `$\\` after each `print`).
* `-n`: reads each line from your file(s) via a loop.
* `-e`: enters one line of program.

* `-p`: reads each line and print `$_` from your file(s) via a loop.
* `-F`: specifies the pattern to split on for `-a`.
* `-i`: processes file(s) in-place.

### Useful variables (http://perldoc.perl.org/perlvar.html)

* `$"`: list separator in double-quoted context
* `$.`: current line number
* `$ARGV`: the name of the current file

## License
Copyright (C) 2016 Xiao-Ou Zhang. See the [LICENSE](https://github.com/kepbod/pl/blob/master/LICENSE) file for license rights and limitations (MIT).
