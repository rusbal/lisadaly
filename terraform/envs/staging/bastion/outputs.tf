output "bastion_ip_addr" {
  value = aws_instance.bastion_host.public_ip
}
