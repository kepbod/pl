package L;

use List::Util qw(max min all any shuffle);
use bignum;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(sum max min all any shuffle mean median);

sub sum {
    return List::Util::sum0(@_);
}

sub mean {
    my $count = @_;
    return 0 if not $count;
    $sum = sum(@_);
    return $sum / $count;
}

sub median {
    my $count = @_;
    my @list = sort { $a <=> $b } @_;
    if ($count == 0) {
        return 0;
    }
    elsif ($count % 2 == 1) {
        return $list[($count - 1) / 2];
    }
    else {
        return ($list[$count / 2 - 1] + $list[$count / 2]) / 2;
    }
}

1;
