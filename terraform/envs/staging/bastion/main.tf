resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCdHCU5aOgHxVOwwrJzOJ0NZxk9wy//BPlFp63sfNO4pFfkhoRJqVOSD+oQ/OxBl1+9aVAIzNiFGVwBXrRrYzyQZ1N5/3DxEC3mlN+JugMGJIPm+MfLBb1CWVXCaSAuJjWfgUNq8K1d0YIxbZmg6cJJ/7h83HD6xi3qXwOUsmKDeNebrp01i2Ef8168zBYqjethnzjbqyGHEIppCCGJxrEKpqMNvSK9kpGNTx6wkseeH/30Evofp9DbBLucx1K+HWALWLxUrL4wQ46qnZo8ViEE/Aif4Y1Z0oz6WStXw1S9PD5UQHDiF7p/I5CbMOW+yV5aGZiBbE4aDRhTRFMLqgaqn5ZV4jokvSHBn+AL89yEP2UbGcXAKrK/GlYjEgBYRTRFQzesPl5FdJe+oK6e/sOD5noqrryzEDmv+TwZOg/gKv0bdBAvDt19VP5lK/s3SILmWWGdoYhrtUnH1G2GUqCSSJf0V5pdp/dLiOo5XbnUfmXESS+kcR+JHNd+Aysx2pU= rsusbal@Raymonds-iMac-2.local"

  tags = {
    Name = "lisadaly"
  }
}

module "bastion" {
  source  = "umotif-public/bastion/aws"
  version = "~> 2.1.0"

  name_prefix = "lisadaly"

  vpc_id         = data.terraform_remote_state.vpc.outputs.vpc_id
  public_subnets = data.terraform_remote_state.vpc.outputs.subnet_ids
  region         = "ap-southeast-1"

  ssh_key_name = aws_key_pair.ssh-key.key_name

  tags = {
    Name = "lisadaly"
  }
}
