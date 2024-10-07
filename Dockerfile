# Golang base image
FROM golang:1.20-alpine

# working dir
WORKDIR /app

# copy go mod files
COPY go.mod go.sum ./

# download all the dependencies
RUN go mod download

# copy the source code into the container
COPY ./cmd/app ./cmd/app

# Build the go app
RUN go build -o main ./cmd/app/main.go

# expose port 8080 to host machine
EXPOSE 8080

# start the go app
CMD [ "./main" ]