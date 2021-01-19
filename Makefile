TMPL_FOLDER = .template

PDFS = paper.pdf

all: $(PDFS)

.PHONY: all clean %.md

$(TMPL_FOLDER)/ieee_bib.csl:
	curl --fail -o $@ -L https://raw.githubusercontent.com/citation-style-language/styles/master/ieee.csl

$(TMPL_FOLDER)/IEEEtran.cls:
	curl --fail -o $@ -L http://mirrors.ctan.org/macros/latex/contrib/IEEEtran/IEEEtran.cls

# This cutsom file is currently not supported for dynamic download and needs to
# be imported by hand.
$(TMPL_FOLDER)/ieee_template.latex: $(TMPL_FOLDER)/IEEEtran.cls
#		curl -o $@ <download the custom ieee_template.latex file>

%.pdf: %.md bib.bib layout.yml $(TMPL_FOLDER)/ieee_bib.csl $(TMPL_FOLDER)/ieee_template.latex
	# Count the words in the markdown
	@echo -n $<
	@echo -n ': '
	@pandoc --lua-filter $(TMPL_FOLDER)/wordcount.lua $<
	@echo

	pandoc -o $@ --csl=$(TMPL_FOLDER)/ieee_bib.csl --bibliography=bib.bib \
		-s --template=$(TMPL_FOLDER)/ieee_template.latex layout.yml $<

clean:
	rm -f $(PDFS)
