PKG = github.com/anthonynsimon/usewebhook-cli

deps:
	go get ./...

install:
	go install

test: deps
	go test ./... -timeout 60s -v

cover: deps
	go test ./... -race -v -timeout 15s -coverprofile=coverage.out
	go tool cover -html=coverage.out

fmt:
	go fmt ./...

bench: deps
	go test -benchmem -bench=. -benchtime=5s ./...

race: deps
	go test ./... -v -race -timeout 15s

release: release-amd64 release-darwin

ensure-dist: deps
	mkdir -p dist

release-amd64: ensure-dist
	GOOS=linux GOARCH=amd64 go build -o dist/usewebhook && cd dist && tar -czf usewebhook_amd64.tar.gz usewebhook && rm usewebhook

release-darwin: ensure-dist
	go build -o dist/usewebhook && cd dist && tar -czf usewebhook_darwin.tar.gz usewebhook && rm usewebhook