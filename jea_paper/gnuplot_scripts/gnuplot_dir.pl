#!/usr/bin/perl -w
use Getopt::Std;

my %options=();
getopts("h",\%options);

if (defined($options{"h"}))
{
die("gnuplot_dir - runs gnuplot on each file in the directory. Errors are spewed");
}

opendir(THIS_DIR, "./") || die("can't opendir : './'\n");
@files = readdir(THIS_DIR);
@files = grep { !/gnuplot_dir/} @files;
@files = grep { !/^\./} @files;
closedir THIS_DIR;

foreach $file (@files)
{
@output = `gnuplot $file`;
foreach $line (@output)
{
print $line."\n";
}
}
