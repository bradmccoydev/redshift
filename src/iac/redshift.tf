resource "aws_redshift_cluster" "default" {
  cluster_identifier = var.rs_cluster_identifier
  database_name      = var.rs_database_name
  master_username    = var.rs_master_username
  master_password    = var.rs_master_pass
  node_type          = var.rs_nodetype
  cluster_type       = var.rs_cluster_type
  cluster_subnet_group_name = aws_redshift_subnet_group.redshift_subnet_group.id
  skip_final_snapshot = true
  iam_roles = [aws_iam_role.redshift_role.arn]
}

//resource "aws_redshift_parameter_group" "group" {
//  name   = "redshift-parameter-group"
//  family = "redshift-1.0"

//  parameter {
//    name  = "require_ssl"
//    value = "true"
//  }
//}