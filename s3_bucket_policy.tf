resource "aws_s3_bucket_policy" "s3policy" {
  depends_on = ["aws_s3_bucket.s3"]
  bucket     = "${aws_s3_bucket.s3.id}"

  policy = <<POLICY
{
"Version": "2012-10-17",
"Statement":[{
"Sid": "AWSCloudTrail",
"Effect": "Allow",
"Principal":{
"Service": "cloudtrail.amazonaws.com"
},
"Action": "s3:GetBucketAcl",
"Resource":"${aws_s3_bucket.s3.arn}"
},{
"Sid": "AWSCloudTrailWrite",
"Effect": "Allow",
"Principal":{
"Service":"cloudtrail.amazonaws.com"
},
"Action": "s3:PutObject",
"Resource": "${aws_s3_bucket.s3.arn}/*",
"Condition": {
"StringEquals": {
"s3:x-amz-acl": "bucket-owner-full-control"
}
}
}
]
}
POLICY
}
