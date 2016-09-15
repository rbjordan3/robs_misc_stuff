#!/usr/bin/env perl

# Copyright 2016 Rob Jordan - Blazedog Computer Consulting
#                http://www.blazedog.com

# This software is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with the carbcalc. If not, see http://www.gnu.org/licenses/.



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
