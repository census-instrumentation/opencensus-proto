# Copyright 2016-17, OpenCensus Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

workspace(name = "opencensus_proto")

# proto_library rules implicitly depend on @com_google_protobuf//:protoc,
# which is the proto-compiler.
# This statement defines the @com_google_protobuf repo.
http_archive(
    name = "com_google_protobuf",
    sha256 = "db3f5880be46c3809eef108c218765d49f1329d3fd89db3a5939e2ba5b132a08",
    strip_prefix = "protobuf-699c0eb9cf6573f3a00b4db61f60aff92dc3dd7a",
    urls = ["https://github.com/google/protobuf/archive/699c0eb9cf6573f3a00b4db61f60aff92dc3dd7a.zip"],
)

# java_proto_library rules implicitly depend on @com_google_protobuf_java//:java_toolchain,
# which is the Java proto runtime (base classes and common utilities).
http_archive(
    name = "com_google_protobuf_java",
    sha256 = "db3f5880be46c3809eef108c218765d49f1329d3fd89db3a5939e2ba5b132a08",
    strip_prefix = "protobuf-699c0eb9cf6573f3a00b4db61f60aff92dc3dd7a",
    urls = ["https://github.com/google/protobuf/archive/699c0eb9cf6573f3a00b4db61f60aff92dc3dd7a.zip"],
)
