
FROM golang:1.24-alpine AS builder
WORKDIR /usr/src/app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -o /app/app

FROM scratch
COPY --from=builder /app/app /app
EXPOSE 8080
CMD ["/app"]