
DOCUMENT_NAME = presenation
OUTPUT_DIR    = output
REVAL_DIR     = lib/reveal.js
CUSTOM_STYLE  = style/custom.css

# full build process
all: outputdir build

# Remove output directory.
clean:
	rm -rf $(OUTPUT_DIR)

# create output directory.
outputdir:
	$(shell mkdir $(OUTPUT_DIR) 2>/dev/null)

# generate presentation
build:
	# build main document
	./gen_struct.rb >  $(OUTPUT_DIR)/$(DOCUMENT_NAME).html
	# copy lib 
	cp -r $(CUSTOM_STYLE) $(REVAL_DIR)/lib $(REVAL_DIR)/css $(REVAL_DIR)/js $(OUTPUT_DIR)/

# Open the document
open:
	open $(OUTPUT_DIR)/$(DOCUMENT_NAME).html
