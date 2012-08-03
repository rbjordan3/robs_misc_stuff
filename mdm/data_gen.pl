#!/usr/bin/env perl

use strict;
use warnings;
use List::Util qw(first max maxstr min minstr reduce shuffle sum);

my $num_to_create = shift(@ARGV);

my @words;
my $length = 5;
my $wordlist = '/usr/share/dict/words';


my @list_countries = ( "US", "GB", "CA", "MX", "BB", "BT", "BW", "GD", "GM", "it", "PK", "PL", "VA", "UZ", "UA", "YE" );

open my $WORDS, '<', $wordlist or die "Cannot open $wordlist:$!";

while (my $word = <$WORDS>) {
    chomp($word);
    push @words, $word if (length($word) >= $length);
}

close WORDS;

my @shuffled_words = shuffle(@words);

print "Category,UOM,Minimum Order Qty,Description,Long Description,Country of Origin,Mfg Name,Mfg Part Num,UNSPSC,TYPE,SIZE,MATERIAL,STANDARDS\n";


my $counter = 0;
my $co_count = 0;
for ( my $num = 0; $num <= $num_to_create; $num++) {
    if ( $co_count >= @list_countries ) {
	$co_count = 0;
    }
    print ("\"$shuffled_words[$counter++]\",EA,0,\"$shuffled_words[$counter++]\",\"$shuffled_words[$counter++]\",$list_countries[$co_count++],FISHER CONTROLS INTERNATIONAL," . int(rand(10)*10000000) . ",,PACKING,,,\n");


}
