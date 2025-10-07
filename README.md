# Hello World Go Web Application

A simple HTTP web server written in Go that returns "Hello World!" and runs on port 3000.

## Description

This is a minimal Go web application demonstrating:
- Basic HTTP server setup using Go's standard library
- Handling HTTP requests and responses
- Containerization with Docker
- Multi-stage Docker builds for optimized image size

## Prerequisites

Before running this application, ensure you have one of the following installed:

### Option 1: Running Locally
- Go 1.21 or higher

### Option 2: Running with Docker
- Docker installed on your system

## Installation

### Local Installation

1. Clone the repository:
```bash
git clone https://github.com/navedux/hello-world-go-web.git
cd hello-world-go-web
```

2. Install dependencies (if any):
```bash
go mod download
```

3. Build the application:
```bash
go build -o hello-world-go-web
```

## Usage

### Running Locally

1. Start the server:
```bash
go run main.go
```

Or run the built binary:
```bash
./hello-world-go-web
```

2. Access the application:
Open your browser and navigate to:
```
http://localhost:3000
```

You should see: `Hello World!`

### Running with Docker

1. Build the Docker image:
```bash
docker build -t hello-world-go-web .
```

2. Run the container:
```bash
docker run -p 3000:3000 hello-world-go-web
```

3. Access the application:
Open your browser and navigate to:
```
http://localhost:3000
```

## Deployment

### Docker Deployment

The application includes a multi-stage Dockerfile for optimized production deployment:

1. **Build Stage**: Uses `golang:1.21-alpine` to build the application
2. **Run Stage**: Uses `alpine:latest` for a minimal runtime environment

This approach results in a smaller final image size and improved security.

### Deployment to Cloud Platforms

#### Deploy to Docker Hub

1. Tag your image:
```bash
docker tag hello-world-go-web username/hello-world-go-web:latest
```

2. Push to Docker Hub:
```bash
docker push username/hello-world-go-web:latest
```

#### Deploy to Kubernetes

Create a deployment and service:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-world-go-web
spec:
  replicas: 3
  selector:
    matchLabels:
      app: hello-world-go-web
  template:
    metadata:
      labels:
        app: hello-world-go-web
    spec:
      containers:
      - name: hello-world-go-web
        image: username/hello-world-go-web:latest
        ports:
        - containerPort: 3000
---
apiVersion: v1
kind: Service
metadata:
  name: hello-world-go-web
spec:
  selector:
    app: hello-world-go-web
  ports:
    - protocol: TCP
      port: 80
      targetPort: 3000
  type: LoadBalancer
```

#### Deploy to Cloud Run (GCP)

```bash
gcloud run deploy hello-world-go-web \
  --source . \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated
```

## Project Structure

```
hello-world-go-web/
├── main.go          # Main application file with HTTP server
├── go.mod           # Go module definition
├── Dockerfile       # Docker configuration for containerization
└── README.md        # Project documentation
```

## Technical Details

- **Language**: Go 1.21
- **Framework**: Standard library (`net/http`)
- **Port**: 3000
- **Response**: Plain text "Hello World!"

## Development

To modify the application:

1. Edit `main.go` to change the response or add new routes
2. Rebuild and run:
```bash
go run main.go
```

## License

MIT License

## Author

navedux
