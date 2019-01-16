#!/usr/bin/perl
use warnings;
use strict;
use diagnostics;
#open fasta file for reading.
open( REFASTA, "<", 'myosin.fasta' ) or die $!;    #open or die
#open fasta file for writing.
open(WRITEFASTA, ">", 'writemyosin.fasta' )or die $!;
#read one sequence at a time
local $/=">";
#read fasta file line by line.
while (<REFASTA>){
#get rid of end of line characters
	chomp;
#writing regex to get header and sequence out.
	if ($_ =~ /^(.*?)$(.*)$/ms){
#assigning sequence to scalar.
		my $sequence = $2;
#assigning header to a scalar.
		my $header = $1;
#split header by pipe.
		my @pipesplit = split(/\|/,$header);
#assigning column 5 to a scalar
		my $column= $pipesplit[4];
#writing a regex to get species name.
		if($column =~ /^(\w*)/){
#assigning it to a scalar.
			my $name = "$1";
#print to a filehandle.
			print WRITEFASTA ">$name","$sequence";}
	}}
