########################################   variables ############################33


variable "devs" {
     type = map
     default =	     {
        nagoda = "server"
        zaycev = "test"
      }
 
}

variable "owner" {
      type = map
  default     = {
           "email" : " ********* "
           "specialty": "devops"
      }
}
