all: dist dist/index.html dist/style.css

dist:
	mkdir -p dist

dist/index.html: src/index.html | dist
	cp $^ $@

dist/style.css: src/input.css src/index.html | dist
	npx tailwindcss@3.0.23 -i $< -o $@ --minify

.PHONY: all
