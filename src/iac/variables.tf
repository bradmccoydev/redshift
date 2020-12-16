variable "application_name" {
  description = "Application Name"
}

variable "aws_account_id" {
  description = "Aws Account ID"
}

variable "aws_region" {
  description = "Aws Region"
}

variable "environment" {
  description = "Environment Name"
}

variable "environment_lower" {
  description = "Environment Name Lower"
}

variable "cidr_block" {
  description = "VPC Cidr block"
}

variable "public_subnet_cidr_block_1" {
  description = "public subnet 1 CIDR block"
}

variable "public_subnet_cidr_block_2" {
  description = "public subnet 2 CIDR block"
}


variable "private_subnet_cidr_block_1" {
  description = "private subnet 1 CIDR block"
}

variable "private_subnet_cidr_block_2" {
  description = "private subnet 2 CIDR block"
}

variable "availability_zone_1" {
  description = "Availability zone 1"
}

variable "availability_zone_2" {
  description = "Availability zone 2"
}

variable "redshift_s3_bucket" {
  description = "AWS Redshift S3 Bucket"
}

variable "ssl_cert" {
  description = "SSL Cert ARN"
}

variable "rs_cluster_identifier" {
  description = "Redshift Cluster Identifier"
 }

variable "rs_database_name" {
  description = "Redshift Database Name"
 }

variable "rs_master_username" {
  description = "Redshift Master Username"
 }

variable "rs_master_pass" { 
  description = "Redshift Master Password"
}

variable "rs_nodetype" { 
  description = "Redshift Node Type"
}

variable "rs_cluster_type" {
  description = "Redshift cluster Type"
 }
