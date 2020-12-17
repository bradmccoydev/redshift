#!/bin/sh

echo "Building GoLang Artifacts"

GOOS=linux go build -o main main.go
zip -r main.zip main
aws --region ap-southeast-2 s3 cp main.zip s3://redshift-hackathon-20201216-source-aligned/build/lambda/RedshiftCopyCommand/main.zip

echo "Artifacts Built and pushed"