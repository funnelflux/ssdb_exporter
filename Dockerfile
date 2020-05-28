FROM golang:1.14.3-alpine as builder
ADD ./ssdb_exporter /build
WORKDIR /build
RUN go build -o ssdb-exporter ./...

FROM alpine:latest
COPY --from=builder /build/ssdb-exporter /usr/local/bin/
ENTRYPOINT ["ssdb-exporter"]
