#! /usr/bin/perl -w

################################################################################
# Replacement updater script for AUR package
################################################################################
use strict;
use Getopt::Long;

my $installer = "";

GetOptions("installer=s" => \$installer);

die "\033[1;31mNo AUR package available for this update.\033[0m"
	unless $installer =~ /(OnlineFotoservice|Mein_CEWE_FOTOBUCH|Mon_LIVRE_PHOTO_CEWE)/;

my $pkgName = $1 eq 'Mein_CEWE_FOTOBUCH' ? 'cewe-fotobuch' : 'cewe-fotoservice' : 'cewe-monlivrephoto';

chdir('/tmp');
system("wget https://aur.archlinux.org/cgit/aur.git/snapshot/$pkgName.tar.gz -O $pkgName.tar.gz");
system("tar -xvf $pkgName.tar.gz");

chdir($pkgName);
system("mv '$installer' ./");
system('_UPDATING=1 makepkg --install --clean --skipchecksums');

print "\nNow you can close this window\n";
