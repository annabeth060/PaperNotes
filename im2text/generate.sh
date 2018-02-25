#!/bin/bash
cp -rf im2text.md.head im2text.md
UpdateTime=`date '+%d/%m/%Y_%H:%M:%S'`
echo "<center> Update: $UpdateTime</center>"$'\n' >> g.md
echo "  	" >> g.md

echo "  	" >> g.md
rm -rf *.html
rm -rf *.txt
build_section (){
    echo "  	" >> $1.md
    echo "# "$3"  	" >> $1.md
    var=1
    for f in `ls ~/Dropbox/PaperNotes/$1/$2/*.md | sort -r`;
    do
        md_filename=${f##*[/|\\]}
        html_filename="$PWD/$md_filename.html"
        md_filename_space="${md_filename%%.*}"
        md_filename_space=${md_filename_space//_/ }
        data=${md_filename:0:8}
        md_str="$var. $data | [${md_filename_space:8}](https://rawgit.com/elbayadm/PaperNotes/master/$1/$md_filename.html) "$'\n'
        echo "Processing for file - $html_filename"
        pandoc $f -t html -F pandoc-mermaid -s -o $html_filename --mathjax=https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML
        var=$((var+1))
        echo $md_str >> g.md
    done
}
build_section "im2text" "image" "Image captioning"
build_section "im2text" "video" "Video captioning"
build_section "im2text" "vqa" "VQA"
pandoc g.md -t html -F pandoc-mermaid -s -o im2text.html --mathjax=https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML
