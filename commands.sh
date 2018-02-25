#!/bin/bash

md2html () {
pandoc $1 -t html -F pandoc-mermaid -s -o $2 --mathjax=https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML --css pandoc.css
}
build_section (){
    echo "  	" >> $1.md
    echo "# "$3"  	" >> $1.md
    var=1
    for f in `ls ~/Dropbox/PaperNotes/$1/$2/*.md | sort -r`;
    do
        md_filename=${f##*[/|\\]}
        html_filename="$PWD/$md_filename.html"
        md_filename_space="${md_filename%%.*}"
        conf=$(echo $md_filename_space | cut -f1 -d_)
        title=$(echo $md_filename_space | cut -f2 -d_)
        #echo $data
        md_str="$var. $conf | [$title](https://rawgit.com/elbayadm/PaperNotes/master/$1/$md_filename.html) "$'\n'
        #echo $md_str
        echo "Processing for file - $html_filename"
        md2html $f $html_filename
        var=$((var+1))
        echo $md_str >> $1.md
    done
}

