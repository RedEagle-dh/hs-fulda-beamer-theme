.PHONY: example watch clean

# Build the example deck: build/example.pdf
example:
	latexmk example.tex

# Rebuild on every change (open the PDF in your own viewer)
watch:
	latexmk -pvc -view=none example.tex

clean:
	rm -rf build
