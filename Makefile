DEFAULT_GOAL := all

# Generate gRPC/Protobuf implementation for Go.
.PHONY: gen-go
gen-go:
	@rm -rf gen-go/*
	docker build -t opencensus-proto-gen . --output . --target go

# Generate gRPC/Protobuf implementation for Python.
.PHONY: gen-python
gen-python:
	docker build -t opencensus-proto-gen . --output . --target python

# Generate gRPC/Protobuf implementation for Ruby.
.PHONY: gen-ruby
gen-ruby:
	@rm -rf gen-ruby/*
	docker build -t opencensus-proto-gen . --output . --target ruby

# Generate OpenApi (Swagger) documentation file for grpc-gateway endpoints.
.PHONY: gen-openapi
gen-openapi:
	@rm -rf gen-openapi/*
	docker build -t opencensus-proto-gen . --output . --target openapi

# Generate all gRPC/Protobuf implementations.
.PHONY: all
all:
	@rm -rf gen-go/*
	@rm -rf gen-ruby/*
	@rm -rf gen-openapi/*
	docker build -t opencensus-proto-gen . --output . --target all
