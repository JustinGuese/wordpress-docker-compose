#!/bin/bash
S3_BUCKET=guesonex-databackup
# backs up current wp-content and soon produced .sql file to s3
./export.sh
aws s3 cp ./wp-data/data.sql s3://$S3_BUCKET/gusonex-wp/data.sql
aws s3 sync ./wp-app/wp-content/ s3://$S3_BUCKET/gusonex-wp/wp-content/
