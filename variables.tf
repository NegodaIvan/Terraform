########################################   variables ############################33


variable "devs" {
     type = map
     default =	     {
        nagod = "serve"
        zayce = "tes"
      }
 
}

variable "owner" {
      type = map
  default     = {
           "email" : " ********* "
           "specialty": "devops"
      }
}
