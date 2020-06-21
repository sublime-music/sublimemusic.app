HTMLFILES=$(wildcard src/*.html)
BUILTHTMLFILES=$(patsubst src/%.html,public/%.html,$(HTMLFILES))

all: $(BUILTHTMLFILES)

public:
	mkdir -p public

public/%.html: src/index.html | public
	cp $< $@
