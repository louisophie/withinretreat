/usr/lib/zettlr/resources/pandoc \
--defaults ~/.config/Zettlr/defaults/HTML_DrBernsteinDiebetesSolution.yaml \
./0000_intro.md ./000_1.md ./000_4.md| \
perl -0777 -pe '
my @titles = /<h2[^>]*>(.+?)<\/h2>/sg;
if (@titles) {
my $combined = join("及", @titles);
s/第四版選譯/第四版選譯 $combined/g;        
s/0000_intro/$combined/g;     
}
' > 0001_0004.html

/usr/lib/zettlr/resources/pandoc \
--defaults ~/.config/Zettlr/defaults/HTML_DrBernsteinDiebetesSolution.yaml \
./0000_intro.md ./000_2.md | \          
perl -0777 -pe '
my @titles = /<h2[^>]*>(.+?)<\/h2>/sg;
if (@titles) {
my $combined = join("及", @titles);
s/第四版選譯/第四版選譯 $combined/g;        
s/0000_intro/$combined/g;     
}
' > 000_2.html

/usr/lib/zettlr/resources/pandoc \
--defaults ~/.config/Zettlr/defaults/HTML_DrBernsteinDiebetesSolution.yaml \
./0000_intro.md ./000_3.md | \
perl -0777 -pe '
my ($title1,$title2) = /<h2[^>]*>(.+?)<\/h2>\s*<p style="[^"]*">\s*(.+?)\s*<\/p>/s;
if (defined $title1) {
s/第四版選譯/第四版選譯<br>$title1$title2/g;
s/0000_intro/$title1$title2/g;
}
' > test.html