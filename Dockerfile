FROM golang:1.18-alpine

WORKDIR /app

# Copy go.mod and go.sum files
COPY api/go.mod .
COPY api/go.sum .

RUN go mod download

# Copy the rest of the application code
COPY api .

RUN go build -o /household_accounting_server

EXPOSE 8080

CMD ["/household_accounting_server"]
