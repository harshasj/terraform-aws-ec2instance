output "ip_address" {
  value = tostring(aws_instance.web.public_ip)
  //value = toset([for ip in aws_instance.web : ip.public_ip])
}
