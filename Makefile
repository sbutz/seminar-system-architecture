# Makefile for building expose.tex

TEX = pdflatex
BIB = bibtex
#TEXFILE = expose
TEXFILE = paper
OUTDIR = out

all: $(TEXFILE).pdf

$(TEXFILE).pdf: $(TEXFILE).tex
	@mkdir -p $(OUTDIR)
	$(TEX) -shell-escape -output-directory=$(OUTDIR) $(TEXFILE).tex
	$(BIB) $(OUTDIR)/$(TEXFILE)
	$(TEX) -shell-escape -output-directory=$(OUTDIR) $(TEXFILE).tex
	$(TEX) -shell-escape -output-directory=$(OUTDIR) $(TEXFILE).tex

wordcount: $(TEXFILE).pdf
	@echo "Word count: "
	@pdftotext $(OUTDIR)/$(TEXFILE).pdf - | wc -w

clean:
	rm -rf $(OUTDIR)

.PHONY: all clean