TEMPLATE  = proposal-template
BUILD_DIR = build
PDF       = $(BUILD_DIR)/$(TEMPLATE).pdf
DOCX      = $(BUILD_DIR)/$(TEMPLATE).docx

.PHONY: all pdf docx clean

all: pdf docx

pdf: $(PDF)

docx: $(DOCX)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(PDF): $(TEMPLATE).md | $(BUILD_DIR)
	pandoc $< -o $@ --pdf-engine=xelatex

$(DOCX): $(TEMPLATE).md | $(BUILD_DIR)
	pandoc $< -o $@

clean:
	rm -rf $(BUILD_DIR)
