#!/usr/bin/perl
use warnings;
use strict;
use Bio::Phylo::IO;
use Bio::Phylo::Treedrawer;
open( SVG, ">", 'tree2.svg') or die $!;
open( NEWICK, "<", 'writemyosin.fasta.tree');
my $newickString = '';
while (<NEWICK>) {
chomp;
$newickString .= $_;
}
$newickString .= ';';
my $forest = Bio::Phylo::IO->parse(
-format => 'newick',
-string => $newickString
);
my $tree = $forest->first;
my $treedrawer = Bio::Phylo::Treedrawer->new(
-width => 1920,
-height => 1280,
-shape => 'CURVY',
-mode => 'PHYLO',
-format => 'SVG'
);
$treedrawer->set_scale_options(
-width => '100%',
-major => '10',
-minor => '2%',
-label => 'MYA',
);
$treedrawer->set_tree($tree);
print SVG $treedrawer->draw;
