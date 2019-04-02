#
# Create Cloudtrail
#
resource "aws_cloudtrail" "trail" {
  depends_on                    = ["aws_s3_bucket.s3"]
  name                          = "${var.name}-${var.environment}-trail"
  s3_bucket_name                = "${aws_s3_bucket.s3.id}"
  include_global_service_events = "${var.include_global_service_events}"
  is_multi_region_trail         = "${var.is_multi_region_trail}"
  enable_logging                = "true"                                 #ensure logging is always on
  enable_log_file_validation    = "${var.enable_log_file_validation}"
}
