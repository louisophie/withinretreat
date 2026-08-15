https://louisophie.github.io/withinretreat/DrBersteinDiabetesSolution/02.html

https://lichtspektrum.github.io/liang-intensity-calibrator/ <!-- use repo's name as the home-page -->

https://withinretreat.louisophie-gitlab.workers.dev

[ #star as split-line
`<p style="text-align:center">* * * * * * * * * </p>`{=html}
```{=latex}
\vspace{1em}
\begin{center}
\textbf{* * * * * * * * *}
\end{center}
\vspace{1em}
```
]
[ #spaces
```{=html}
<div style="height: 1em;"></div>
```
```{=latex}
\vspace{4em}
```
]

`/usr/lib/zettlr/resources/pandoc \
  --defaults ~/.config/Zettlr/defaults/HTML_DrBernsteinDiebetesSolution.yaml \
  ./0000_intro.md \
  ./000_2.md \
  -o ./test.html`

`
/usr/lib/zettlr/resources/pandoc \
--defaults ~/.config/Zettlr/defaults/HTML_DrBernsteinDiebetesSolution.yaml \
./0000_intro.md ./000_1.md | \
perl -0777 -pe '
my @titles = /<h2[^>]*>(.+?)<\/h2>/sg;
if (@titles) {
my $combined = join("、", @titles);
s/第四版選譯/第四版選譯 $combined/g;
s/0000_intro/$combined/g;
}
' > test.html
` #<!-- for 000_x.md -->

`
/usr/lib/zettlr/resources/pandoc \
--defaults ~/.config/Zettlr/defaults/HTML_DrBernsteinDiebetesSolution.yaml \
./0000_intro.md ./01.md | \
perl -0777 -pe '
my ($title1,$title2) = /<h2[^>]*>(.+?)<\/h2>\s*<p style="[^"]*">\s*(.+?)\s*<\/p>/s;
if (defined $title1) {
s/第四版選譯/第四版選譯 $title1$title2/g; 
s/0000_intro/$title1$title2/g;
}
' > test.html
` #<!-- for 01~.md -->

`<sup>¹</sup>`{=html}`\footnote{xxxxxxx}`{=latex}
`<div class="inline-note">¹xxxxxx</div>`{=html}

`\Huge
\huge
\LARGE
\Large
\large
\normalsize
\small
\footnotesize
\scriptsize
\tiny`{=latex}

### 書籍簡介／作者簡介
腸泌素類似物(incretin mimetics)
胰島素阻抗
胃輕癱（gastroparesis）
Mamaroneck（馬馬羅內克）
The American College of Nutrition → 美國營養學會
The American College of Endocrinology → 美國內分泌學會
The American College of Certified Wound Specialists → 美國認證傷口專科人員學會
Albert Einstein College of Medicine（阿爾伯特·愛因斯坦醫學院）

Jean Martin Charcot
Heinz I. Lippmann
Ephraim FriedmanSamuel M. Rosen

## 我的糖尿病人生,000_3.md
三酸甘油酯
體系
恢復
連絡→聯絡
糖分
水分
内→內

## 鳴謝
Drugs that can affect blood glucose levels〈影響血糖之藥物〉