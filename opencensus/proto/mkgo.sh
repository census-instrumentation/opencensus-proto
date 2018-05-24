#!/usr/bin/env bash

# Run this if opencensus-proto is checked in the GOPATH.
# go get -d github.com/census-instrumentation/opencensus-proto
# to check in the repo to the GOAPTH.

OUTDIR="$(go env GOPATH)/src"

protoc --go_out=plugins=grpc:$OUTDIR stats/stats.proto \
    && protoc --go_out=plugins=grpc:$OUTDIR stats/metrics/metrics.proto \
    && protoc --go_out=plugins=grpc:$OUTDIR trace/trace.proto \
    && protoc -I=. --go_out=plugins=grpc:$OUTDIR export/export.proto
