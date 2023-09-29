UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Darwin)
	# Commands to run on macOS for testing
	TEST_COMMAND := /Applications/Godot.app/Contents/MacOS/Godot -d -s --path ./ addons/gut/gut_cmdln.gd
else ifeq ($(UNAME_S),Linux)
	# Commands to run on Linux for testing
	# TODO: Support non-Flatpak Godot installations
	TEST_COMMAND := flatpak run org.godotengine.Godot -d -s --path ./ addons/gut/gut_cmdln.gd
else
	$(error Unsupported operating system: $(UNAME_S))
endif

run-tests:
	@$(TEST_COMMAND)

.PHONY: test
