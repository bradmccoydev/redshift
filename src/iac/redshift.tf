resource "random_password" "password" {
  length = 9
  special = true
  override_special = "_%@"
}

resource "aws_redshift_cluster" "default" {
  cluster_identifier = var.rs_cluster_identifier
  database_name      = var.rs_database_name
  master_username    = var.rs_master_username
  master_password    = random_password.password.result
  node_type          = var.rs_nodetype
  cluster_type       = var.rs_cluster_type
  cluster_subnet_group_name = aws_redshift_subnet_group.redshift_subnet_group.id
  skip_final_snapshot = true
  iam_roles = [aws_iam_role.redshift_role.arn]
}