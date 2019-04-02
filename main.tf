#
# Create Cloudtrail
#
resource "aws_cloudtrail" "trail" {
  depends_on                    = ["aws_s3_bucket.s3"]
  name                          = "${var.name}-${var.environment}-trail"
  s3_bucket_name                = "${aws_s3_bucket.s3.id}"
  include_global_service_events = "${var.include_global_service_events}"
}
