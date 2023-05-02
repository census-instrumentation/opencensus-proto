FROM otel/build-protobuf:0.17.0 as go-builder

RUN --mount=type=bind,source=.,target=/opencensus-proto,rw \
    protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --go_out=plugins=grpc:/opencensus-proto/gen-go opencensus/proto/agent/common/v1/common.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --go_out=plugins=grpc:/opencensus-proto/gen-go opencensus/proto/resource/v1/resource.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --go_out=plugins=grpc:/opencensus-proto/gen-go opencensus/proto/metrics/v1/metrics.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --go_out=plugins=grpc:/opencensus-proto/gen-go opencensus/proto/stats/v1/stats.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --go_out=plugins=grpc:/opencensus-proto/gen-go opencensus/proto/trace/v1/trace.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --go_out=plugins=grpc:/opencensus-proto/gen-go opencensus/proto/trace/v1/trace_config.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --go_out=plugins=grpc:/opencensus-proto/gen-go opencensus/proto/agent/common/v1/common.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --go_out=plugins=grpc:/opencensus-proto/gen-go opencensus/proto/agent/metrics/v1/metrics_service.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --go_out=plugins=grpc:/opencensus-proto/gen-go opencensus/proto/agent/trace/v1/trace_service.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src  --grpc-gateway_out=logtostderr=true,grpc_api_configuration=/opencensus-proto/src/opencensus/proto/agent/trace/v1/trace_service_http.yaml:/opencensus-proto/gen-go opencensus/proto/agent/trace/v1/trace_service.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src  --grpc-gateway_out=logtostderr=true,grpc_api_configuration=/opencensus-proto/src/opencensus/proto/agent/metrics/v1/metrics_service_http.yaml:/opencensus-proto/gen-go opencensus/proto/agent/metrics/v1/metrics_service.proto \
    && /bin/mv /opencensus-proto/gen-go/github.com/census-instrumentation/opencensus-proto/gen-go gen-go


FROM otel/build-protobuf:0.17.0 as python-builder

RUN --mount=type=bind,source=.,target=/opencensus-proto,rw \
    /bin/mkdir /gen-python \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --python_out=/gen-python opencensus/proto/agent/common/v1/common.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --python_out=/gen-python opencensus/proto/resource/v1/resource.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --python_out=/gen-python opencensus/proto/metrics/v1/metrics.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --python_out=/gen-python opencensus/proto/stats/v1/stats.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --python_out=/gen-python opencensus/proto/trace/v1/trace.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --python_out=/gen-python opencensus/proto/trace/v1/trace_config.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --python_out=/gen-python opencensus/proto/agent/common/v1/common.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --python_out=/gen-python --grpc-python_out=/gen-python opencensus/proto/agent/metrics/v1/metrics_service.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --python_out=/gen-python --grpc-python_out=/gen-python opencensus/proto/agent/trace/v1/trace_service.proto


FROM otel/build-protobuf:0.17.0 as ruby-builder

RUN --mount=type=bind,source=.,target=/opencensus-proto,rw \
    /bin/mkdir /gen-ruby \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --ruby_out=/gen-ruby opencensus/proto/agent/common/v1/common.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --ruby_out=/gen-ruby opencensus/proto/resource/v1/resource.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --ruby_out=/gen-ruby opencensus/proto/metrics/v1/metrics.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --ruby_out=/gen-ruby opencensus/proto/stats/v1/stats.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --ruby_out=/gen-ruby opencensus/proto/trace/v1/trace.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --ruby_out=/gen-ruby opencensus/proto/trace/v1/trace_config.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --ruby_out=/gen-ruby opencensus/proto/agent/common/v1/common.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --ruby_out=/gen-ruby --grpc-ruby_out=/gen-ruby opencensus/proto/agent/metrics/v1/metrics_service.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --ruby_out=/gen-ruby --grpc-ruby_out=/gen-ruby opencensus/proto/agent/trace/v1/trace_service.proto


FROM otel/build-protobuf:0.17.0 as openapi-builder

RUN --mount=type=bind,source=.,target=/opencensus-proto,rw \
    /bin/mkdir /gen-openapi \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --openapiv2_out=logtostderr=true,grpc_api_configuration=/opencensus-proto/src/opencensus/proto/agent/trace/v1/trace_service_http.yaml:/gen-openapi opencensus/proto/agent/trace/v1/trace_service.proto \
    && protoc-wrapper -I/usr/include --proto_path=/opencensus-proto/src --openapiv2_out=logtostderr=true,grpc_api_configuration=/opencensus-proto/src/opencensus/proto/agent/metrics/v1/metrics_service_http.yaml:/gen-openapi opencensus/proto/agent/metrics/v1/metrics_service.proto


FROM scratch as go
COPY --from=go-builder /gen-go /gen-go


FROM scratch as python
COPY --from=python-builder /gen-python /gen-python


FROM scratch as ruby
COPY --from=ruby-builder /gen-ruby /gen-ruby


FROM scratch as openapi
COPY --from=openapi-builder /gen-openapi /gen-openapi


FROM scratch as all
COPY --from=go-builder /gen-go /gen-go
COPY --from=python-builder /gen-python /gen-python
COPY --from=ruby-builder /gen-ruby /gen-ruby
COPY --from=openapi-builder /gen-openapi /gen-openapi
