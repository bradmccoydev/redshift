# AWS Redshift
Code For Spinning up a Redshift cluster

# Requirements
In the main.tf file you must have already setup terraform state so therefore you need to create a dynamodb table and an S3 bucket

In this example there is a dynamodb table called "terraform_redshift_locks" and an s3 bucket called 

Once you have set those up you can uncomment the terraform backend s3 resource in the main.tf file.

# Password
In the redshift.tf we generate a random password and then pass it through to the Redshift Cluster module.  This is one of the outputs so for production use you would change this to protect passwords

Also the password is an environment variable that is plain text so you would want to change this also

# IAC
This code is using terraform to provision infrastructure. Version: v0.14.2
# Deployement instruction

# verify if you have woring version of terraform and run below commands from terminal
terraform -version
cd src/iac
terraform init
terraform plan
terraform apply
terrafrom destroy