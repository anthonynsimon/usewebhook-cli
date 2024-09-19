PKG = github.com/anthonynsimon/usewebhook-cli
VERSION ?= dev
LDFLAGS = -ldflags "-X $(PKG)/main.Version=$(VERSION) -extldflags \"-static\""
MAC_LDFLAGS = -ldflags "-X $(PKG)/main.Version=$(VERSION)"

deps:
	go get ./...

install:
	go install $(MAC_LDFLAGS)

test: deps
	go test ./... -timeout 60s $(LDFLAGS) -v

cover: deps
	go test ./... -race -v -timeout 15s -coverprofile=coverage.out
	go tool cover -html=coverage.out

fmt:
	go fmt ./...

bench: deps
	go test $(LDFLAGS) -benchmem -bench=. -benchtime=5s ./...

race: deps
	go test ./... -v -race -timeout 15s

release: release-x64 release-x86 release-mac

ensure-dist: deps
	mkdir -p dist

release-bin: ensure-dist
	GOOS=linux GOARCH=amd64 go build -o dist/usewebhook $(LDFLAGS)

release-x64: ensure-dist
	GOOS=linux GOARCH=amd64 go build -o dist/usewebhook $(LDFLAGS) && cd dist && tar -czf usewebhook_$(VERSION)_x64.tar.gz usewebhook && rm usewebhook

release-x86: ensure-dist
	GOOS=linux GOARCH=386 go build -o dist/usewebhook $(LDFLAGS) && cd dist && tar -czf usewebhook_$(VERSION)_x86.tar.gz usewebhook && rm usewebhook

release-mac: ensure-dist
	go build $(MAC_LDFLAGS) -o dist/usewebhook && cd dist && tar -czf usewebhook_$(VERSION)_mac.tar.gz usewebhook && rm usewebhook