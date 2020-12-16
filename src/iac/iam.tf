resource "aws_iam_role_policy" "s3_full_access_policy" {
  name = "redshift_s3_policy"
  role = "${aws_iam_role.redshift_role.id}"
policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::redshift-hackathon-20201216/*"
        }
    ]
}
EOF
}

resource "aws_iam_role" "redshift_role" {
  name = "redshift_role"
assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "redshift.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
tags = var.tags
}