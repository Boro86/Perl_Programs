
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

print "$count files copied successfully.\n";
