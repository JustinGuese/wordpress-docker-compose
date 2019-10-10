#!/bin/bash


#S3_BUCKET=guesonex-databackup  # < shoud work with source .env
# git setup
yum install git -y
# docker setup
yum install docker -y
yum install -y yum-utils device-mapper-persistent-data lvm2
usermod -aG docker ec2-user  #  $(whoami)
systemctl enable docker.service
systemctl start docker.service
# docker compose install
yum install -y python-pip
pip install docker-compose
yum upgrade python* -y
git clone https://github.com/JustinGuese/wordpress-docker-compose.git
cd wordpress-docker-compose
source .env
# used to pull current files into machine before starting docker - set up ec2 IAM roles or ~/.aws/ credentials if hosti
# pulling wp-content
aws s3 sync s3://$S3_BUCKET/gusonex-wp/wp-content/ ./wp-app/wp-content/
# pulliing sql
aws s3 cp s3://$S3_BUCKET/gusonex-wp/data.sql ./wp-data/
docker-compose up -d
