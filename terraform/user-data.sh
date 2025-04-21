#!/bin/bash
apt-get update -y
apt-get install -y docker.io docker-compose
usermod -aG docker ubuntu
