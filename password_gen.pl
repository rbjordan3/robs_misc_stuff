#!/usr/bin/env perl

use strict;
use warnings;
use List::Util qw(first max maxstr min minstr reduce shuffle sum);

my @words;
my $length = shift(@ARGV);
my $change = shift(@ARGV);

my $wordlist = '/usr/share/dict/words';
my (@symbols) = ("!", "#", "\$", "%", "^", "&", "*", "(", ")", "-", "+", "=", "_", "/", "?" );

open my $WORDS, '<', $wordlist or die "Cannot open $wordlist:$!";

while (my $word = <$WORDS>) {
    chomp($word);
    push @words, $word if (length($word) == $length);
}

close WORDS;

my @shuffled_words = shuffle(@words);

my $word1 =  $shuffled_words[int(rand(10)*100)];
my $word2 =  $shuffled_words[int(rand(10)*100)];
my $number =  int(rand(10)*10);
my $symbol = $symbols[rand(10)*10 % 11];

printf "%s%2d%s%s\n", $word1, int(rand(10)*10),  $word2, $symbols[rand(10)*10 % 11];

if ($change) {
    $word1 =~ s/[iI]/1/g;
    $word2 =~ s/[iI]/1/g;

    $word1 =~ s/[oO]/0/g;
    $word2 =~ s/[oO]/0/g;

    $word1 =~ s/[sS]/\$/g;
    $word2 =~ s/[sS]/\$/g;

#    $word1 =~ tr/^[a-z]*/[A-Z]/;
#    $word2 =~ tr/^[a-z]*/[A-Z]/;
}



print "Possible Passwords:\n";
printf "%s%02d%s%s\n", $word1, $number,  $word2, $symbol;
printf "%2d%s%s%s\n", $number, $word1,  $word2, $symbol;
printf "%s%02d%s%s\n", $word1, $number, $symbol, $word2;
printf "%s%s%s%02d\n", $word1, $symbol, $word2, $number;
