build: 
	docker build -t metapods:latest .

.PHONY: run
run: build
	docker run --rm -p 8080:8080 metapods:latest
