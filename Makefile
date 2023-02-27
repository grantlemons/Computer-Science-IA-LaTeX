.DEFAULT_GOAL := auto_build
.PHONY: all auto_build build bib clean

COMPILER = xelatex
OUTPUT = build
FILENAME = advisory-ia
OUTPUT_NAME = "Grant Lemons Computer Science IA"
OPTIONS = -shell-escape -output-directory=${OUTPUT}

all: build bib build clean

auto_build:
	@${make_build_dir}
	@echo "Running latexmk"
	@latexmk -${COMPILER} ${OPTIONS} ${FILENAME}
	@${copy_pdf}

remote:
	@ssh desktop 'rm -r /tmp/latex/${FILENAME}/ ; mkdir -p /tmp/latex/${FILENAME}/'
	@scp -r ./* desktop:/tmp/latex/${FILENAME}
	@ssh desktop 'cd /tmp/latex/${FILENAME} && make'
	@scp desktop:/tmp/latex/${FILENAME}/${FILENAME}.pdf ./${OUTPUT_NAME}.pdf

build:
	@echo "Compiling document"
	@${make_build_dir}
	@${COMPILER} ${OPTIONS} ${FILENAME}
	@${copy_pdf}

bib:
	@echo "Building bibliography"
	@${make_build_dir}
	@biber --output-directory ${OUTPUT} ${FILENAME}

clean:
	@${copy_pdf}
	@echo "Cleaning up..."
	@rm -r build || true
	@rm ${FILENAME}.{aux,bbl,bcf,blg,fdb_latexmk,fls,log,out,run.xml,xdv} xelatex* x.log || true

gitclean:
	@echo "Cleaning up ignored files..."
	@git clean -fXd

define copy_pdf
	echo "Copying PDF"
	cp build/${FILENAME}.pdf ./${OUTPUT_NAME}.pdf || echo "Copying failed :("
endef

define make_build_dir
	echo "Making build dir"
	mkdir ./build || true
endef
