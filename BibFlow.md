## Initialization:
- Get my library from Arxiv-Sanity:
    - var papers = json from the html.
- run arxiv-sanity/parse.py to retrive titles and arxiv-links

- Run arxiv-sanity/getbib.py to download the pdfs, add them to papis and get the arxiv bitex

# Useful commands:
- Search Google-Scholar for bibtex, output copied to clipboard
    > bibtex-search -s google "Title"
- Same but bibtex is printed ie easily redirected, (caveat: mostly arxiv papers)
    > title2bib "Title"
- Same with up-to-date bibtex | in little doses!
    > gscholar "Title" 

### Not so good!
- Clean up bib file: check if arxiv paper are published, abreaviate conf names, add DOI if possible:
    > bibcure -i input.bib -o output.bib
