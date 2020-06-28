HTMLFILES=$(wildcard src/*.html)
IMGFILES=$(wildcard src/images/*)
SLICKFILES=$(wildcard src/slick/slick/*)
BUILTHTMLFILES=$(patsubst src/%.html,public/%.html,$(HTMLFILES))
BUILTIMGFILES=$(patsubst src/images/%,public/images/%,$(IMGFILES))
BUILTSLICKFILES=$(patsubst src/slick/slick/%,public/slick/%,$(SLICKFILES))

all: $(BUILTHTMLFILES) $(BUILTIMGFILES) $(BUILTSLICKFILES) public/styles.css public/script.js

public:
	mkdir -p public

public/images: | public
	mkdir -p public/images

public/slick: | public
	mkdir -p public/slick

public/%.html: src/%.html | public
	html-minifier \
	    --collapse-boolean-attributes \
	    --collapse-whitespace \
	    --decode-entities \
	    --minify-css \
	    --minify-js \
	    --remove-attribute-quotes \
	    --remove-comments \
	    --remove-empty-attributes \
	    --remove-optional-tags \
	    --remove-redundant-attributes \
	    --remove-script-type-attributes \
	    --remove-style-link-type-attributes \
	    --remove-tag-whitespace \
	    --sort-attributes \
	    --sort-class-name \
	    -o $@ $<

public/styles.css: src/styles.scss | public
	sass src/styles.scss public/styles.css

public/script.js: src/script.js | public
	uglifyjs $< > $@

public/slick/%: src/slick/slick/% | public/slick
	cp -r $< $@

public/images/%: src/images/% | public/images
	cp -r $< $@

public/favicon: src/images/% | public/images
	cp $< $@

clean:
	rm -rf public

.PHONY: all clean
