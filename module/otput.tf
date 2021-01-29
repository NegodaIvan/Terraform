# Выведем некоторей данные о созданных VPS


output "hcloud_ip_adress_negoda" {
 value = hcloud_server.server.ipv4_address
}

output "aws_route53_record_neg_record_dns" {
 value = aws_route53_record.neg_record_dns.name
}

output "random_password" {
 value = random_password.password.result
}
