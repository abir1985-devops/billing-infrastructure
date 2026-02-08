output "public_ip" {
  value = aws_instance.server.public_ip
}

output "ssh_command" {
  value = "ssh -i ~/.ssh/abir-free-tier-key ubuntu@${aws_instance.server.public_ip}"
}
