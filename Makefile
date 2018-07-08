LATEX = pdflatex
LATEXFLAGS = -shell-escape
BIBTEX = bibtex
REPORT = main
TEMPS = toc bbl blg log out lof lot lol aux pyg
SUBDIRS = fb

.PHONY: clean remake purge twoside

all: $(REPORT).pdf

%.pdf:
	$(LATEX) $(LATEXFLAGS) $*.tex
	$(BIBTEX) $*.aux
	$(LATEX) $(LATEXFLAGS) $*.tex
	$(LATEX) $(LATEXFLAGS) $*.tex

clean:
	for s in $(TEMPS); do rm -f $(REPORT).$$s $(TWOSIDE).$$s; done
	for dir in $(SUBDIRS); do $(MAKE) -C $$dir clean; done

purge: clean
	-rm -f $(REPORT).pdf
	-rm -f $(TWOSIDE).pdf

remake:
	-rm -f $(REPORT).pdf
	$(MAKE) all
