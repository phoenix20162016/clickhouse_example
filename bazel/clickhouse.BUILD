
cc_library(
  name = "clickhouse",
  hdrs = glob([
    "clickhouse/*.h",
    "clickhouse/*/*.h",
  ]),
  srcs = glob([
    "clickhouse/*.cpp",
    "clickhouse/*/*.cpp",
  ]),
  deps = [
    "@com_github_lz4//:lz4",
    "@com_github_cityhash//:cityhash",
    "@com_github_absl//absl/base",
    "@com_github_absl//absl/numeric:int128",
    "@com_github_absl//absl/algorithm"

  ],
  includes = ["."],
  visibility = ["//visibility:public"],
)