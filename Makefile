.PHONY: build clean deploy

build:
	env GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o bin/hello ./handlers/hello/main.go
	env GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o bin/world ./handlers/world/main.go

clean:
	rm -rf ./bin

deploy: clean build
	sls deploy --verbose --stage local --force
