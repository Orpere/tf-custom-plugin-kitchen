output "public_dns" {
  value = "${aws_instance.example.public_dns}"
}

output "external_ip" {
  value = "${data.extip.external_ip.ipaddress}"
}
