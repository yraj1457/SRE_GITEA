This SRE task sets up a self-hosted environment using Docker to deploy:

- Terraform manages the entire infrastructure on an EC2
- Gitea for Git repository management  
- Grafana for monitoring and visualization  
- Authelia for Single Sign-On (SSO) authentication  
- Nginx as a reverse proxy to securely route and protect access to services  

# Follow the step by step setup:

1. Clone the repository
git clone <repo-url>
cd SRE_GITEA

2. Make sure you create a terraform.tfvars file for the variable values

3. Run Terraform: 
terraform init
terraform plan
terraform apply

Note: Terraform provisions the infrastructure and runs the shell script to setup docker with Gitea, Grafan, Authelia and Nginx
