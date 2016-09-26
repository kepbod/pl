package L;

use strict;
use warnings;

use List::Util qw(max min shuffle);
use bignum;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(sum max min shuffle percentile mean median q1 q3 uniq);

sub sum {
    return List::Util::sum0(@_);
}

sub mean {
    my $count = @_;
    return 0 if not $count;
    my $total = sum(@_);
    return $total / $count;
}

sub percentile {
    my @list = @_;
    my $q = pop @list;
    my @sorted_list = sort { $a <=> $b } @list;
    return $sorted_list[sprintf("%.0f", ($q * $#sorted_list / 100))];
}

sub median {
    return percentile(@_, 50);
}

sub q1 {
    return percentile(@_, 25);
}

sub q3 {
    return percentile(@_, 75);
}

sub uniq {
    my %seen;
    return grep { !$seen{$_}++ } @_;
}

1;
