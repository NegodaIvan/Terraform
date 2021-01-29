#
# генерируем пароли
#

resource "random_password" "password" {
  length  = 7
  special = true
  override_special = "_%@"
}


#
#  Создаем vpc-ы на hcloud
#

resource "hcloud_server" "server" {
  name        = "${var.name_usr}-${var.name_dev}"
  image       = "ubuntu-18.04"
  server_type = "cx11"
  backups     = "true"
  labels     =  var.owner
  ssh_keys    = [ data.hcloud_ssh_key.negoda.id  ] 
    provisioner  "remote-exec" { 
     inline = [
        " /usr/sbin/useradd -m -G 4,24,27 -s /bin/bash  ${var.name_usr} ",
        "/bin/echo -e \"${random_password.password.result}\n${random_password.password.result}\" | /usr/bin/passwd  ${var.name_usr} " , 
        ]
      connection {
      type        = "ssh"
      user        = "root"
      private_key = file("/home/negoda/.ssh/id_rsa")
      host        = self.ipv4_address 
      } 
     }

}

data "hcloud_ssh_key" "negoda" {
  name      = " ******* "
}



#
# AWS  создадим DNS  записи и привяжем к созданным VPS_hcloud
#

data "aws_route53_zone" "name_zone" {
  name      = "  ********   "
}	

resource "aws_route53_record" "neg_record_dns" {
  name      = "${var.name_usr}-${var.name_dev}.${data.aws_route53_zone.name_zone.name}"
  ttl       = 300
  type      = "A"
  zone_id   = data.aws_route53_zone.name_zone.zone_id

  records   = [hcloud_server.server.ipv4_address] 
    provisioner "local-exec" {
           command = "echo \" ${self.name}  ${hcloud_server.server.ipv4_address} ${var.name_usr} ${random_password.password.result} \n \" >> total.txt"
  }
}
