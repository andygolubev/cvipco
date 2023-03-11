output "instance-public-address" {
  value = aws_instance.test-instance.*.public_ip
}  