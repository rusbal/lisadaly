output "bastion_ip_addr" {
  value = aws_instance.bastion.public_ip
}
