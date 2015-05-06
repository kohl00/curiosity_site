require "refile/backend/s3"

aws = {
  access_key_id: Rails.application.secrets.access_key_id,
  secret_access_key: Rails.application.secrets.secret_access_key,
  bucket: Rails.application.secrets.bucket
}
Refile.cache = Refile::Backend::S3.new(prefix: "cache", **aws)
Refile.store = Refile::Backend::S3.new(prefix: "store", **aws)