#!/usr/bin/perl
use warnings;
use strict;
use Bio::DB::EUtilities;
use Bio::SeqIO;
use Getopt::Long;
use Pod::Usage;
my $file ='';
my $usage ="\n\n$0 [options] \n
Options:
-ile
-help
\n";
GetOptions(
'file=s' => \$file,
help     => sub { pod2usage($usage); },)
or pod2usage(2);
my $factory = Bio::DB::EUtilities->new(-eutil  =>'efetch',
                                       -db     =>'protein',
                                       -rettype=>'fasta',
                                       -email  =>'chintalapudi.h@husky.neu.edu',
                                       -id     => "$file");
my $fileout = $file.'.fasta';
$factory->get_Response(-file => $fileout);


