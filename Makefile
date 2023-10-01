test-container:
	docker build -t godot4 .

run-tests:
	docker run -v .:/app godot4

.PHONY: test
