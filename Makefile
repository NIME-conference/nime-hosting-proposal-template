TEMPLATE  = proposal-template
BUILD_DIR = build
HTML      = $(BUILD_DIR)/$(TEMPLATE).html
DOCX      = $(BUILD_DIR)/$(TEMPLATE).docx

.PHONY: all html docx clean

all: html docx

html: $(HTML)

docx: $(DOCX)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(HTML): $(TEMPLATE).md | $(BUILD_DIR)
	pandoc $< -o $@ --standalone

$(DOCX): $(TEMPLATE).md | $(BUILD_DIR)
	pandoc $< -o $@

clean:
	rm -rf $(BUILD_DIR)
