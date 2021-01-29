#  переменная описвает сколько будем создавать VPS

variable "name_usr" {}
variable "name_dev" { }
#variable "ssh_key" {}


variable "owner" {
     type = map
     default = {
           "email" : " ******* "
           "specialty": "devops"
      }         
}
