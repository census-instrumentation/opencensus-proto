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
    sha256 = "826425182ee43990731217b917c5c3ea7190cfda141af4869e6d4ad9085a740f",
    strip_prefix = "protobuf-3.5.1",
    urls = ["https://github.com/google/protobuf/archive/v3.5.1.tar.gz"],
)

http_archive(
    name = "com_google_protobuf_cc",
    sha256 = "826425182ee43990731217b917c5c3ea7190cfda141af4869e6d4ad9085a740f",
    strip_prefix = "protobuf-3.5.1",
    urls = ["https://github.com/google/protobuf/archive/v3.5.1.tar.gz"],
)

# java_proto_library rules implicitly depend on @com_google_protobuf_java//:java_toolchain,
# which is the Java proto runtime (base classes and common utilities).
http_archive(
    name = "com_google_protobuf_java",
    sha256 = "826425182ee43990731217b917c5c3ea7190cfda141af4869e6d4ad9085a740f",
    strip_prefix = "protobuf-3.5.1",
    urls = ["https://github.com/google/protobuf/archive/v3.5.1.tar.gz"],
)

http_archive(
    name = "io_bazel_rules_go",
    url = "https://github.com/bazelbuild/rules_go/releases/download/0.12.0/rules_go-0.12.0.tar.gz",
    sha256 = "c1f52b8789218bb1542ed362c4f7de7052abcf254d865d96fb7ba6d44bc15ee3",
)

http_archive(
    name = "bazel_gazelle",
    url = "https://github.com/bazelbuild/bazel-gazelle/releases/download/0.12.0/bazel-gazelle-0.12.0.tar.gz",
    sha256 = "ddedc7aaeb61f2654d7d7d4fd7940052ea992ccdb031b8f9797ed143ac7e8d43",
)

load("@io_bazel_rules_go//go:def.bzl",
    "go_download_sdk",
    "go_register_toolchains",
    "go_rules_dependencies",
)

go_rules_dependencies()


go_download_sdk(
    name = "go_sdk",
    sdks = {
        "darwin_amd64": ("go1.10beta1.darwin-amd64.tar.gz", "8c2a4743359f4b14bcfaf27f12567e3cbfafc809ed5825a2238c0ba45db3a8b4"),
        "linux_amd64":  ("go1.10beta1.linux-amd64.tar.gz", "ec7a10b5bf147a8e06cf64e27384ff3c6d065c74ebd8fdd31f572714f74a1055"),
    },
)

go_register_toolchains()
