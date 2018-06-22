%.pdf: %.tex
	xelatex -halt-on-error $< && \
		echo =================== && \
		xelatex -halt-on-error $<
	
clean:
	rm -rf *.aux *.dvi *.log *.toc

zip:
	zip -r `date +%Y%m%d%H%M%S`.zip \
		00.tex \
		def.tex \
		fonts \
		footer.tex \
		layout.tex \
		logo/wordtype.pdf \
		logo/whitelogo.eps

.PHONY: clean zip
