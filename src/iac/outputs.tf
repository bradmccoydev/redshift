output "cluster_endpoint" {
  value = aws_redshift_cluster.default.endpoint
}

output "password" {
  value = aws_redshift_cluster.default.master_password
}