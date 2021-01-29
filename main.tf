
module "vps"  {
   for_each = var.devs
  name_usr = each.key
  name_dev = each.value
  source    = "./module"
   owner = var.owner
#   ssh_key = hcloud_ssh_key.negoda.id

}

/*
resource "hcloud_ssh_key" "negoda" {
  name       = "neg_ssh"
  public_key = file("/home/negoda/.ssh/id_rsa.pub")
  labels     =  var.owner
}

*/
