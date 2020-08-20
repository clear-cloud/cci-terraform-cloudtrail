#
# s3 bucket to hold logs
#
resource "aws_s3_bucket" "s3" {
  bucket_prefix = "${var.name}-${var.environment}-securitytrail-"

  versioning {
    enabled = true
  }

    server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        #kms_master_key_id = "${aws_kms_key.htmapps3kmskeydev.arn}"
        sse_algorithm = "AES256"
      }
    }
  }
}
