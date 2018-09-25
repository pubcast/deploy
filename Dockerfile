FROM golang

# Download and install the latest release of dep
ADD https://github.com/golang/dep/releases/download/v0.5.0/dep-linux-amd64 /usr/bin/dep
RUN chmod +x /usr/bin/dep

# Download source code
RUN go get -u github.com/metapods/metapods
WORKDIR /go/src/github.com/metapods/metapods

# Install dependencies
RUN dep ensure
RUN go get ./

RUN go test $(go list ./... | grep -v vendor)
RUN go build

EXPOSE 8080

# Run binary
ENTRYPOINT [ "./metapods" ]

