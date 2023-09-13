FROM golang as builder
WORKDIR /app
COPY *.go /app
RUN go build -ldflags "-s -w" hello_world.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/hello_world /app/hello_world
CMD [ "/app/hello_world" ]
