resource "aws_security_group" "bastion" {
  name        = "Bastion host of ${local.project}"
  description = "Allow SSH access to bastion host and outbound internet access"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Project = local.project
  }
}

resource "aws_security_group_rule" "ssh" {
  protocol          = "TCP"
  from_port         = 22
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion.id
}

#resource "aws_security_group_rule" "internet" {
#  protocol          = "-1"
#  from_port         = 0
#  to_port           = 0
#  type              = "egress"
#  cidr_blocks       = ["0.0.0.0/0"]
#  security_group_id = aws_security_group.bastion.id
#}

resource "aws_security_group_rule" "intranet" {
  protocol  = "-1"
  from_port = 0
  to_port   = 0
  type      = "egress"
  #cidr_blocks       = [data.terraform_remote_state.vpc.local.vpc_cidr]
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion.id
}
