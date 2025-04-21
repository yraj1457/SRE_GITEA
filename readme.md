This SRE task sets up a self-hosted environment using Docker to deploy:

- Gitea for Git repository management  
- Grafana for monitoring and visualization  
- Authelia for Single Sign-On (SSO) authentication  
- Nginx as a reverse proxy to securely route and protect access to services  

# Follow the step by step setup:

1. Clone the repository
git clone <repo-url>
cd SRE_GITEA

2. Create required directories
mkdir -p nginx/conf.d authelia grafana gitea

3. Add local domains to your /etc/hosts file
sudo nano /etc/hosts

4. Add the following line at the end of the file:
127.0.0.1 git.localhost grafana.localhost authelia.localhost

5. Generate a password hash for Authelia
docker run authelia/authelia authelia hash-password '<Password>'

6. Copy the generated hash and update authelia/users_database.yml like so:
# (Create this file if it doesn't exist)

7. authelia/users_database.yml
users:
  admin:
    password: "<Password>"
    displayname: "Administrator"
    email: "admin@localhost"

8. Start all services
docker-compose up -d
