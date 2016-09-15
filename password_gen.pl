#!/usr/bin/env perl

# Copyright 2016 Rob Jordan - Blazedog Computer Consulting
#                http://www.blazedog.com

# This software is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this software. If not, see http://www.gnu.org/licenses/.

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

close $WORDS;

my @shuffled_words = shuffle(@words);

my $random1 = int(rand(10)*100);
do 
{
    $random1 = int(rand(10)*100);
}
until ( $random1 < @shuffled_words ) ;

my $random2 = int(rand(10)*100);
do 
{ 
    $random2 = int(rand(10)*100);
}
until ( $random2 < @shuffled_words );



my $word1 =  $shuffled_words[$random1];
my $word2 =  $shuffled_words[$random2];
my $number =  int(rand(10)*10);
my $symbol = $symbols[rand(10)*10 % 11];
print "Inputs\n";
printf "%s%02d%s%s\n", $word1, $number,  $word2, $symbol;

if ($change) {
    $word1 =~ s/[iI]/1/g;
    $word2 =~ s/[iI]/1/g;

    $word1 =~ s/[oO]/0/g;
    $word2 =~ s/[oO]/0/g;

    $word1 =~ s/[sS]/\$/g;
    $word2 =~ s/[sS]/\$/g;

    $word1  =~ s/\b(\w)/uc($1)/eg;
    $word2  =~ s/\b(\w)/uc($1)/eg;
}



print "Possible Passwords:\n";
printf "%s%02d%s%s\n", $word1, $number,  $word2, $symbol;
printf "%2d%s%s%s\n", $number, $word1,  $word2, $symbol;
printf "%s%02d%s%s\n", $word1, $number, $symbol, $word2;
printf "%s%s%s%02d\n", $word1, $symbol, $word2, $number;
