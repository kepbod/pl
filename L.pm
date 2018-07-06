package L;

use strict;
use warnings;

use List::Util qw(max min shuffle);

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(sum max min shuffle percentile mean median q1 q3 uniq sd cv zscore cor);

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

# $cv = cv @lst
sub cv {
    my $mean = mean(@_);
    my $sd = sd(@_);
    return $sd / $mean
}

# @zscore = zscore @lst
sub zscore {
    my $mean = mean(@_);
    my $sd = sd(@_);
    return map {($_ - $mean)/$sd} @_;
}

# $cor=cor \@lst1,\@lst2
sub cor {
    my @lst1 = @{$_[0]};
    my @lst2 = @{$_[1]};
    my $mean1 = mean(@lst1);
    my $mean2 = mean(@lst2);
    my ($cov_xy, $cov_x, $cov_y) = (0, 0, 0);
    for my $num (0..$#lst1) {
        $cov_xy += ($lst1[$num] - $mean1) * ($lst2[$num] - $mean2);
        $cov_x += ($lst1[$num] - $mean1) ** 2;
        $cov_y += ($lst2[$num] - $mean2) ** 2;
    }
    return $cov_xy / (sqrt($cov_x) * sqrt($cov_y))
}

1;
