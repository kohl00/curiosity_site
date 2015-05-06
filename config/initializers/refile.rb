require "refile/backend/s3"

aws = {
  access_key_id: ENV["access_key_id"],
  secret_access_key: ENV["secret_access_key"],
  bucket: ENV["bucket"]
}
Refile.cache = Refile::Backend::S3.new(prefix: "cache", **aws)
Refile.store = Refile::Backend::S3.new(prefix: "store", **aws)