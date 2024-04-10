load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")

def clickhouse_dependencies(repo_reference=""):
  reference_index = ""
  if repo_reference:
      reference_index = "@{}".format(repo_reference)

  if "com_github_clickhouse" not in native.existing_rules():
    http_archive(
      name = "com_github_clickhouse",
      build_file = "%s//bazel:clickhouse.BUILD" % reference_index,
      sha256 = "8942fc702eca1f656e59c680c7e464205bffea038b62c1a0ad1f794ee01e7266",
      strip_prefix = "clickhouse-cpp-2.5.1",
      urls = [
        "https://primihub.oss-cn-beijing.aliyuncs.com/repository_deps/clickhouse-cpp-2.5.1.tar.gz",
        "https://github.com/ClickHouse/clickhouse-cpp/archive/refs/tags/v2.5.1.tar.gz"
      ],
    )

  if "com_github_lz4" not in native.existing_rules():
    http_archive(
      name = "com_github_lz4",
      build_file = "%s//bazel:lz4.BUILD" % reference_index,
      patch_cmds = [
        """sed -i.bak 's/__attribute__ ((__visibility__ ("default")))//g' lib/lz4frame.h """,
      ],
      sha256 = "658ba6191fa44c92280d4aa2c271b0f4fbc0e34d249578dd05e50e76d0e5efcc",
      strip_prefix = "lz4-1.9.2",
      urls = [
        "https://primihub.oss-cn-beijing.aliyuncs.com/lz4-1.9.2.tar.gz"
      ],
    )

  if "com_github_absl" not in native.existing_rules():
    _ABSL_COMMIT = "278e0a071885a22dcd2fd1b5576cc44757299343"
    http_archive(
      name = "com_github_absl",
      sha256 = "1764491a199eb9325b177126547f03d244f86b4ff28f16f206c7b3e7e4f777ec",
      strip_prefix = "abseil-cpp-%s" % _ABSL_COMMIT,
      urls = [
        "https://primihub.oss-cn-beijing.aliyuncs.com/repository_deps/google_absl_%s.tar.gz" % _ABSL_COMMIT,
        "https://storage.googleapis.com/grpc-bazel-mirror/github.com/abseil/abseil-cpp/archive/%s.tar.gz" % _ABSL_COMMIT,
        "https://github.com/abseil/abseil-cpp/archive/%s.tar.gz" % _ABSL_COMMIT,
      ],
    )

  if "com_github_cityhash" not in native.existing_rules():
    git_repository(
      name = "com_github_cityhash",
      commit = "adb5e125065dfefbf06d61439c14405745a0c81a",
      # branch = "main",
      remote = "https://gitee.com/primihub/cityhash.git",
    )