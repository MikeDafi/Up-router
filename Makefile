# Project variables
APP_NAME=myapp
BUILD_DIR=cmd/server
BINARY_NAME=server

# Build the Go application
build:
\t@echo "Building the Go application..."
\tgo build -o $(BUILD_DIR)/$(BINARY_NAME) ./cmd/server

# Run the Go application
run: build
\t@echo "Running the application..."
\t$(BUILD_DIR)/$(BINARY_NAME)

# Run tests
test:
\t@echo "Running tests..."
\tgo test ./...

# Clean up binaries
clean:
\t@echo "Cleaning up..."
\trm -f $(BUILD_DIR)/$(BINARY_NAME)

# Docker build
docker-build:
\t@echo "Building Docker image..."
\tdocker build -t $(APP_NAME):latest .

# Docker run
docker-run:
\t@echo "Running Docker container..."
\tdocker run -p 8080:8080 $(APP_NAME):latest

# Setup database
db-setup:
\t@echo "Setting up database..."
\tbash scripts/setup_db.sh
