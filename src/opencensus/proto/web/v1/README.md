# OpenCensus Web protos

These protos are designed specifically for browser clients to write user
interaction measurements to the Open Census agent via HTTP-JSON. The JSON will
be converted to proto form via protobuf [JSON Mapping](https://developers.google.com/protocol-buffers/docs/proto3#json).

The proto is designed to make it easy for browser clients to send user
interaction measurement and browser performance timing data in relatively raw
form, that will then be processed by the OpenCensus agent into full
spans/metrics. That allows more logic to live in the agent and thus will enable
the browser client code to be smaller, which makes it more efficient given that
JavaScript must be sent over the network and parsed by end user clients.

These protos are intentionally web specific because of the specific W3C specs
for browser performance data, and the value of enabling web clients to send data
over HTTP-JSON. There is some support for grpc on the web, see [grpc-web](https://github.com/grpc/grpc-web),
but it requires additional client side JS for encoding/decoding messages and so
increases JS size.
