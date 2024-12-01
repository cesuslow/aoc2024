#/usr/bin/perl

use strict;
use warnings;

#my $inputfile = 'input';
#open (my $fh, '<:encoding(UTF-8)', $inputfile)
#	or die "Could not open file '$inputfile' $!";

my @a0;
my @a1;

# Get numbers from input file
while (<>) {
	my @tmp = split(' ', $_);
	push @a0, $tmp[0];
	push @a1, $tmp[1];
}

# sort numerically
@a0 = sort {$a <=> $b} @a0;
@a1 = sort {$a <=> $b} @a1;

#print join("\n", @a1);

# get distances
my @d;

for my $i (0 .. $#a0) {
	push @d, abs($a0[$i] - $a1[$i]);
}

#print "$a0[0], $a1[0], $d[0]\n";
#print join("\n", @d);

# compute and print total
my $total = 0;
map { $total += $_ } @d;
print "$total\n";
