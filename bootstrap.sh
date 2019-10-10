#!/bin/bash
S3_BUCKET=guesonex-databackup
#git clone https://github.com/JustinGuese/wordpress-docker-compose.git
# used to pull current files into machine before starting docker - set up ec2 IAM roles or ~/.aws/ credentials if hosti
# pulling wp-content
aws s3 sync s3://$S3_BUCKET/gusonex-wp/wp-content/ ./wp-app/wp-content/
# pulliing sql
aws s3 cp s3://$S3_BUCKET/gusonex-wp/data.sql ./wp-data/