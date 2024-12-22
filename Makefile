# Makefile for building expose.tex

TEX = pdflatex
BIB = bibtex
TEXFILE = expose
OUTDIR = out

all: $(TEXFILE).pdf

$(TEXFILE).pdf: $(TEXFILE).tex
	@mkdir -p $(OUTDIR)
	$(TEX) -output-directory=$(OUTDIR) $(TEXFILE).tex
	$(BIB) $(OUTDIR)/$(TEXFILE)
	$(TEX) -output-directory=$(OUTDIR) $(TEXFILE).tex
	$(TEX) -output-directory=$(OUTDIR) $(TEXFILE).tex

clean:
	rm -rf $(OUTDIR)

.PHONY: all clean