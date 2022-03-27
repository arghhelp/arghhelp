all: dist/index.html dist/style.css dist/favicon.ico

dist:
	mkdir -p dist

dist/index.html: src/index.html rules.txt | dist
	cp $< $@
	sed -f replace.sed -i $@

dist/style.css: src/input.css src/index.html | dist dist/index.html
	npx tailwindcss@3.0.23 -i $< -o $@ --minify

dist/favicon.ico: src/favicon.ico | dist
	cp $^ $@

rules.txt: rules.js replace.sed
	node rules.js > $@

.PHONY: all clean

clean:
	rm -rf dist
	rm -f rules.txt
