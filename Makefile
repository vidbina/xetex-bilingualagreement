%.pdf: %.tex
	xelatex -halt-on-error $< && \
		echo =================== && \
		xelatex -halt-on-error $<
	
clean:
	rm -rf *.aux *.dvi *.log *.out *.toc

zip:
	zip -r `date +%Y%m%d%H%M%S`.zip \
		00.tex \
		def.tex \
		fonts \
		footer.tex \
		layout.tex \
		logo/wordtype.pdf \
		logo/whitelogo.eps

DOCKER_TAG=bilingualagreement-builder
DOCKER_WORKDIR=/tmp/build

docker-image:
	docker build -t ${DOCKER_TAG} .

docker-shell:
	docker run --rm -v ${PWD}:${DOCKER_WORKDIR} -it ${DOCKER_TAG} bash

.PHONY: clean zip
