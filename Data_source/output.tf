output "instance_arn" {
  value = aws_instance.web.arn
}
output "instance_state" {
  value = aws_instance.web.instance_state
}
output "public_dns" {
  value = aws_instance.web.public_dns
}
output "public_ip" {
  value = aws_instance.web.public_ip
}