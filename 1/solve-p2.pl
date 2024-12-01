#/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

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

# Convert to hash
my %sim;

foreach my $k (@a0) {
	$sim{$k} = 0;
}

#print Dumper(\%sim);

# Get similarity multiples
foreach my $i ( @a1 ) {
	if (exists $sim{$i}) {
		$sim{$i}++;
	}
}

# Get similarity score
my $score = 0;

keys %sim; # reset internal iterator
while(my($k, $v) = each %sim) {
	#print "$k -> $v\n";
	$score += $k * $v;
}

print "$score\n";

