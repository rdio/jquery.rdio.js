# A Makefile for building various versions of jquery.rdio.js

# where's the YUI compressor?
YUICOMPRESSOR=~/rdio/rdio/config/yuicompressor-2.4.6.jar

# build the uncompressed and compressed versions
all: jquery.rdio.js jquery.rdio.min.js

# combine jquery.rdio and swfobject into one js file
jquery.rdio.js: jquery.rdio.partial.js swfobject.js
	(echo "(function(){" ; cat swfobject.js jquery.rdio.partial.js ; echo "})();") > jquery.rdio.js

# run the YUI compressor
jquery.rdio.min.js: jquery.rdio.js
	java -jar $(YUICOMPRESSOR) jquery.rdio.js > jquery.rdio.min.js
