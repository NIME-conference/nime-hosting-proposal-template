TEMPLATE  = proposal-template
BUILD_DIR = build
HTML      = $(BUILD_DIR)/$(TEMPLATE).html
DOCX      = $(BUILD_DIR)/$(TEMPLATE).docx
PDF       = $(BUILD_DIR)/$(TEMPLATE).pdf

.PHONY: all html docx pdf clean

all: html docx

html: $(HTML)

docx: $(DOCX)

pdf: $(PDF)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(HTML): $(TEMPLATE).md | $(BUILD_DIR)
	pandoc $< -o $@ --standalone

$(DOCX): $(TEMPLATE).md | $(BUILD_DIR)
	pandoc $< -o $@

$(PDF): $(TEMPLATE).md | $(BUILD_DIR)
	pandoc $< -o $@ --pdf-engine=xelatex

clean:
	rm -rf $(BUILD_DIR)
