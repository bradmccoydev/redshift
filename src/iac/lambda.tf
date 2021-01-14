resource "aws_lambda_function" "CopyCommand" {
   function_name = "RedshiftHackathonCopyCommand"
   description = "Redshift Hackathon Copy Command"
   role          = aws_iam_role.hackathon_lambda.arn
   handler       = "build/lambda/RedshiftCopyCommand/main"
   runtime       = "go1.x"
   s3_bucket = "redshift-hackathon-20201216-source-aligned"
   s3_key = "build/lambda/RedshiftCopyCommand/main.zip"
   memory_size = 512
   timeout = 300
   source_code_hash = "${base64encode(sha256("~/src/lambda/main.zip"))}"
   environment {
     variables = {
       CLUSTER_ENDPOINT = aws_redshift_cluster.default.endpoint
       USER_NAME = var.rs_master_username
       PORT = aws_redshift_cluster.default.port
       BUCKET = "redshift-hackathon-20201216-source-aligned"
       PASSWORD = random_password.password.result
     }
   }

   vpc_config {
       subnet_ids = [aws_subnet.private_1.id,aws_subnet.private_2.id]
       security_group_ids = [aws_security_group.vpc-sg.id]
     }

   }