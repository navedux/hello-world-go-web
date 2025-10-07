# Build stage
FROM golang:1.21-alpine AS builder

WORKDIR /app

# Copy go mod files
COPY go.mod ./

# Copy source code
COPY main.go ./

# Build the application
RUN go build -o hello-world-go-web .

# Run stage
FROM alpine:latest

WORKDIR /root/

# Copy the binary from builder
COPY --from=builder /app/hello-world-go-web .

# Expose port 3000
EXPOSE 3000

# Run the binary
CMD ["./hello-world-go-web"]
