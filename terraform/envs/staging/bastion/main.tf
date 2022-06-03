locals {
  raymond_key = "ssh-key"
  project     = "lisadaly"
  tags = {
    Name = local.project
  }
}

resource "aws_key_pair" "ssh-key" {
  key_name   = local.raymond_key
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCdHCU5aOgHxVOwwrJzOJ0NZxk9wy//BPlFp63sfNO4pFfkhoRJqVOSD+oQ/OxBl1+9aVAIzNiFGVwBXrRrYzyQZ1N5/3DxEC3mlN+JugMGJIPm+MfLBb1CWVXCaSAuJjWfgUNq8K1d0YIxbZmg6cJJ/7h83HD6xi3qXwOUsmKDeNebrp01i2Ef8168zBYqjethnzjbqyGHEIppCCGJxrEKpqMNvSK9kpGNTx6wkseeH/30Evofp9DbBLucx1K+HWALWLxUrL4wQ46qnZo8ViEE/Aif4Y1Z0oz6WStXw1S9PD5UQHDiF7p/I5CbMOW+yV5aGZiBbE4aDRhTRFMLqgaqn5ZV4jokvSHBn+AL89yEP2UbGcXAKrK/GlYjEgBYRTRFQzesPl5FdJe+oK6e/sOD5noqrryzEDmv+TwZOg/gKv0bdBAvDt19VP5lK/s3SILmWWGdoYhrtUnH1G2GUqCSSJf0V5pdp/dLiOo5XbnUfmXESS+kcR+JHNd+Aysx2pU= rsusbal@Raymonds-iMac-2.local"

  tags = local.tags
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_network_interface" "foo" {
  subnet_id       = data.terraform_remote_state.vpc.outputs.subnet_ids[0]
  security_groups = [aws_security_group.bastion.id]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "bastion_host" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = local.raymond_key

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

  user_data = <<EOF
#!/bin/bash
sudo apt update; sudo apt -y upgrade
sudo apt install tree postgresql-client-common
EOF

  tags = local.tags
}
