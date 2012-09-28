MUSTACHE = ./vendor/mustache/mustache.js
ASSETS_DIR = ./assets
HANDLEBARSJS = handlebars-1.0.rc.js
DATE=$(shell date +%I:%M%p)
CHECK=\033[32m✔\033[39m
HR=\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#



#
# BUILD DOCS
#

handlebars:	clean
	mkdir -p build/js
	mkdir -p build/css
	uglifyjs ${MUSTACHE} > build/js/mustache.min.js
	uglifyjs ${ASSETS_DIR}/js/${HANDLEBARSJS} > build/js/handlebars.min.js
	uglifyjs ${ASSETS_DIR}/js/underscore.js > build/js/underscore.min.js 
	uglifyjs ${ASSETS_DIR}/js/json2.js > build/js/json2.min.js
	cat build/js/json2.min.js > build/js/kit.js
	echo "\n" >> build/js/kit.js
	cat build/js/underscore.min.js >> build/js/kit.js
	echo "\n" >> build/js/kit.js
	cat build/js/handlebars.min.js >> build/js/kit.js

	echo "Combined JS to build/js/kit.js ...\n"

#
# CLEANS THE ROOT DIRECTORY OF PRIOR BUILDS
#

clean:
	rm -rf build/*
	touch build/EMPTY
  