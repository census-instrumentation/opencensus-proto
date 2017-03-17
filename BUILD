# Copyright 2016, Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Description:
#   Open source Census protos.

package(default_visibility = ["//visibility:public"])

proto_library(
    name = "stats_census_proto",
    srcs = ["stats/census.proto"],
)

proto_library(
    name = "stats_context_proto",
    srcs = ["stats/stats_context.proto"],
)

java_proto_library(
    name = "census-proto-java",
    deps = ["stats_census_proto"],
)

java_proto_library(
    name = "stats_context-proto-java",
    deps = ["stats_context_proto"],
)
