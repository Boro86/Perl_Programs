#!/usr/bin/perl

use strict;
use warnings;

# Poproś użytkownika o podanie ścieżki katalogu, w którym znajdują się pliki wejściowe
print "Wprowadź ścieżkę katalogu, w którym znajdują się pliki wejściowe: ";
my $dir = <STDIN>;
chomp $dir;

# Poproś użytkownika o podanie wyrażenia regularnego
print "podaj wyrażenie regularne: ";
my $reg_exp = <STDIN>;
chomp $reg_exp;

# Poproś użytkownika o podanie ścieżki i nazwy pliku wyjściowego
print "Wprowadź ścieżkę i nazwę pliku wyjściowego: ";
my $output_file = <STDIN>;
chomp $output_file;

# Otwórz plik wyjściowy do zapisu
open my $out, ">", $output_file or die "Nie można otworzyć pliku wyjściowego: $!";

# Inicjuj licznik plików
my $count = 0;

# Przejrzyj pliki w katalogu
opendir(my $dh, $dir) or die "Nie można otworzyć katalogu wejściowego: $!";
while (my $file = readdir($dh)) {
  next unless ($file =~ $reg_exp); # Przetwarzaj tylko pliki, które zaczynają się wedłóg wzorca

  # Otwórz plik wejściowy do odczytu
  open my $in, "<", "$dir/$file" or die "Nie można otworzyć pliku wejściowego: $!";

  # Odczytaj zawartość pliku wejściowego i zapisz ją w pliku wyjściowym
  while (my $line = <$in>) {
    print $out $line;
  }

  # Zamknij plik wejściowy
  close $in;

  # Zwiększ licznik plików
  $count++;
}

# Zamknij plik wyjściowy
close $out;

# Wyświetl informację o liczbie połączonych plików
print "Pomyślnie połączono $count pliki do pliku $output_file.\n";