package L;

use strict;
use warnings;

use List::Util qw(max min shuffle);
use bignum;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(sum max min shuffle percentile mean median q1 q3 uniq sd zscore);

# $sum = sum @lst
sub sum {
    return List::Util::sum0(@_);
}

# $mean = mean @lst
sub mean {
    my $count = @_;
    return 0 if not $count;
    my $total = sum(@_);
    return $total / $count;
}

# $percentile = percentile @lst,$p
sub percentile {
    my @list = @_;
    my $q = pop @list;
    my @sorted_list = sort { $a <=> $b } @list;
    return $sorted_list[sprintf("%.0f", ($q * $#sorted_list / 100))];
}

# $median = median @lst
sub median {
    return percentile(@_, 50);
}

# $q1 = q1 @lst
sub q1 {
    return percentile(@_, 25);
}

# $q3 = q3 @lst
sub q3 {
    return percentile(@_, 75);
}

# @uniq = uniq @lst
sub uniq {
    my %seen;
    return grep { !$seen{$_}++ } @_;
}

# $sd = std @lst
sub sd {
    my $mean = mean(@_);
    my $total = 0;
    $total += ($_ - $mean)**2 for @_;
    return sqrt($total / $#_);
}

# @zscore = zscore @lst
sub zscore {
    my $mean = mean(@_);
    my $sd = sd(@_);
    return map {($_ - $mean)/$sd} @_;
}

1;
