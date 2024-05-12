variable "cidr_ipv4" {} 


variable "instance_names"{
    
        type=list(string)
        default = [ "web-instance", "devops-instance" ]
}

variable "instance_types" {
    type = list(string)
    default = ["t2.micro" , "t2.nano"]
}


#datatypes....
#number
# variable port-1{
#     description = "Enter a number: "
#     type=number
# }
# #string
# variable "sg_name" {
#     description = "Enter a name for sg group"
#     type = string
  
# }
#list
variable "sg_list"{
    description = "Enter 4 port numbers"
    type = list(number)
}
#maps
variable "sg_maps"{
    description= "Enter instance type"
    type = map(string)
    default = {
        web = "t2.nano"
        db = "t2.small"
    }
}


