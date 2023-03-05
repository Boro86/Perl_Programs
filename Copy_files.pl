
#!/usr/bin/perl

# Utworzył Bartłomiej Borowik
# dnia 10.02.2022


use strict;
use warnings;
use File::Copy;


print "podaj scieżke katalogu zródłowygo:\n";
my $src_dir = <STDIN> ;
chomp $src_dir;

opendir(my $dh, $src_dir) || die "nie moge otworzyc katalogu źródłowego - sprawdź czy katalog istnieje lub czy scieżka jest dobra: $!";


print "podaj wyrażenie regularne:\n";
my $reg_exp = <STDIN>;
chomp $reg_exp;

my @files = grep { /$reg_exp/ } readdir($dh);

closedir $dh;

print "podaj scieżke katalogu wyjściowego:\n";
my $dst_dir = <STDIN>;
chomp $dst_dir;


my $count = 0;
foreach my $file (@files) {
    copy("$src_dir/$file", "$dst_dir/$file") or die "nie moge otworzyc katalogu wyjściowego - sprawdź czy katalog istnieje lub czy scieżka jest dobra: $!";
    $count++;
}

print "$count files copied successfully.\n";--_mixed 004C36FFC1258958_Content-Type: text/plain; name"merge_files_beta.txt"
Content-Disposition: attachment; filename"merge_files_beta.txt"
Content-Transfer-Encoding: quoted-printable

#!/usr/bin/perl

use strict;
use warnings;

# Prompt user to enter the directory path where the input files are located
print "Enter the directory path where the input files are located: ";
my $dir = <STDIN>;
chomp $dir;

# Prompt user to enter the path and filename for the output file
print "Enter the path and filename for the output file: ";
my $output_file = <STDIN>;
chomp $output_file;

# Open the output file for writing
open my $out, ">", $output_file or die "Can't open output file: $!";

# Loop through the files in the directory
opendir(my $dh, $dir) or die "Can't open directory: $!";
while (my $file = readdir($dh)) {
  next unless ($file =~ /^MP.*\.txt$/); # Only process files that start with MP and end with .txt

  # Open the input file for reading
  open my $in, "<", "$dir/$file" or die "Can't open input file: $!";

  # Read the contents of the input file and write them to the output file
  while (my $line = <$in>) {
    print $out $line;
  }

  # Close the input file
  close $in;
}

# Close the output file
close $out;

print "All files merged successfully into $output_file\n";--_mixed 004C36FFC1258958_Content-Type: text/plain; name"copy_files_beta.txt"
Content-Disposition: attachment; filename"copy_files_beta.txt"
Content-Transfer-Encoding: quoted-printable

use strict;
use warnings;
use File::Copy;

my $src_dir = "/home/u05253/cwicz";
my $dst_dir = "/home/u05253/robocze";

opendir(my $dh, $src_dir) || die "Can't open directory: $!";
my @files = grep { /^MP.*\.txt$/ } readdir($dh);
closedir $dh;

my $count = 0;
foreach my $file (@files) {
    copy("$src_dir/$file", "$dst_dir/$file") or die "Copy failed: $!";
    $count++;
}

print "$count files copied successfully.\n";