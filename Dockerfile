# Use official Go image
FROM golang:1.20-alpine

WORKDIR /app

# Copy Go module files and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the source code and build the application
COPY myapp .
RUN go build -o server ./cmd/server

# Expose the port and start the server
EXPOSE 8080
CMD ["./server"]
