.PHONY: run build test vet fmt bench pg pg-stop up

run:
	go run ./cmd/keel

build:
	go build -o bin/keel ./cmd/keel

test:
	go test ./... -race -count=1

vet:
	go vet ./...

fmt:
	gofmt -w .

bench:
	go run ./cmd/bench

pg:
	docker run -d --rm --name df-pg -e POSTGRES_PASSWORD=keel -e POSTGRES_USER=keel -e POSTGRES_DB=keel -p 55432:5432 postgres:16

pg-stop:
	docker rm -f df-pg

up:
	docker compose up --build
