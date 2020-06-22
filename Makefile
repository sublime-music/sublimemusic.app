HTMLFILES=$(wildcard src/*.html)
IMGFILES=$(wildcard src/images/*)
BUILTHTMLFILES=$(patsubst src/%.html,public/%.html,$(HTMLFILES))
BUILTIMGFILES=$(patsubst src/images/%,public/images/%,$(IMGFILES))

all: $(BUILTHTMLFILES) $(BUILTIMGFILES) public/styles.css

public:
	mkdir -p public

public/images: | public
	mkdir -p public/images

public/%.html: src/index.html | public
	htmlmin -cs $< $@

public/styles.css: src/styles.scss | public
	sass src/styles.scss public/styles.css

public/images/%: src/images/% | public/images
	cp $< $@

public/favicon: src/images/% | public/images
	cp $< $@

clean:
	rm -rf public

.PHONY: all clean
