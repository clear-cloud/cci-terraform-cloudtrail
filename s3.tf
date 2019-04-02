#
# s3 bucket to hold logs
#
resource "aws_s3_bucket" "s3" {
  bucket_prefix = "${var.name}-${var.environment}-securitytrail-"

    versioning {
    enabled = true
  }
}
