#!/usr/bin/perl
use strict;
use warnings;
use File::stat;

my $directory = 'C:\Users\frank\OneDrive\Documents\Progress Journal\2023\2023 Automation'; # replace this with your directory path

opendir(my $dir, $directory) or die "Could not open '$directory' for reading: $!\n";

while (my $file = readdir $dir) {
    next if ($file eq '.' or $file eq '..'); # skip special directories . and ..
    
    my $filepath = "$directory/$file";
    my $sb = stat($filepath);

    if($sb) {
        my $modified_time = scalar localtime $sb->mtime;
        print "File: $file, Last modified: $modified_time\n";
    }
}

closedir $dir;
