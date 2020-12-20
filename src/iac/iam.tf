resource "aws_iam_policy" "s3_full_access_policy" {
  name = "redshift_s3_policy"
  description = "Redshift"
policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::redshift-hackathon-20201216-source-aligned/*"
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

resource "aws_iam_role_policy_attachment" "redshift" {
  role     = aws_iam_role.redshift_role.name
  policy_arn     = aws_iam_policy.s3_full_access_policy.arn
} 

resource "aws_iam_role_policy_attachment" "lambda" {
  role     = aws_iam_role.hackathon_lambda.name
  policy_arn     = aws_iam_policy.hackathon_lambda_execution_policy.arn
} 

resource "aws_iam_role" "hackathon_lambda" {
  name = "HackathonLambdaExecutionROle"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "lambda.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
  tags     = var.tags
}

resource "aws_iam_policy" "hackathon_lambda_execution_policy" {
  name        = "HackathonLambdaExecutionPolicy"
  description = "Lambda Execution Policy For hackathon"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "ec2:CreateNetworkInterface",
                "logs:CreateLogStream",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DeleteNetworkInterface",
                "logs:CreateLogGroup",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor3",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::redshift-hackathon-20201216/*"
        }
    ]
}
EOF
}

resource "aws_iam_role" "redshift_spectrum_role" {
  name = "RedshiftSpecturmRole_YadiManual"
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

resource "aws_iam_policy" "redshift_spectrum_execution_policy" {
  name        = "RedshiftSpectrumPolicy"
  description = "Redshift Spectrum Policy For hackathon"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "redshift.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::435298438412:role/redshift_role",
        "Service": "redshift.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "redshift.amazonaws.com"
      },
      "Action": "sts:AssumeRole",
      "Condition": {
        "StringEquals": {
          "sts:ExternalId": "arn:aws:redshift:ap-southeast-2:435298438412:dbuser:hackathon-cluster/redshift"
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "spectrum" {
  role     = aws_iam_role.redshift_spectrum_role.name
  policy_arn     = aws_iam_policy.redshift_spectrum_execution_policy.arn
}