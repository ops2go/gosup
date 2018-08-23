
FROM golang as builder

RUN CGO_ENABLED=0 GOOS=linux go get -u github.com/pressly/sup/cmd/sup

FROM alpine:3.7

WORKDIR gosup

COPY --from=builder /go/bin/  .

COPY . .

ENTRYPOINT [ "sup" ]
