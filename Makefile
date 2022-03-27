all: dist dist/index.html dist/style.css

dist:
	mkdir -p dist

dist/index.html: src/index.html
	cp $^ $@

dist/style.css: src/input.css src/index.html
	npx tailwindcss -i $< -o $@ --minify
