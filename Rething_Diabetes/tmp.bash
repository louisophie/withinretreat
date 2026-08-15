cd ~/Downloads/github/withinretreat/Rething_Diabetes/
git add tmp.md
git commit -m "$(date +%Y%m%d%a%H:%M)_x99"
git push

sshfs louis@169.254.100.1: ~/AcerSFTPmount
cp -v ~/Downloads/github/withinretreat/Rething_Diabetes/tmp.md /media/louisophie/Ventoy/Rething_Diabetes/
cp -v ~/Downloads/github/withinretreat/Rething_Diabetes/tmp.md ~/AcerSFTPmount/downloads/github/Rething_Diabetes