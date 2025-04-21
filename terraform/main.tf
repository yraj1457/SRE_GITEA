provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "gitea_host" {
  ami           = "ami-0c02fb55956c7d316" # Ubuntu
  instance_type = "t2.micro"
  key_name      = var.key_name

  user_data = file("${path.module}/user-data.sh")

  tags = {
    Name = "gitea-authelia-instance"
  }

  provisioner "file" {
    source      = "${path.module}/../docker-compose.yml"
    destination = "/home/ubuntu/docker-compose.yml"
  }

  provisioner "file" {
    source      = "${path.module}/../authelia"
    destination = "/home/ubuntu/authelia"
  }

  # Repeat for nginx/, grafana/, gitea/

  provisioner "remote-exec" {
    inline = [
      "sudo docker-compose -f /home/ubuntu/docker-compose.yml up -d"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }
}
