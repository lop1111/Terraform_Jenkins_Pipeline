variable "cidr" {

    description = "CIDR range for the VPC"
    default = "10.0.0.0/16"
  
}

variable "public_subnet_01_IP" {

    description = "CIDR range for the public subnet"
    default = "10.0.0.0/24"
  
}

variable "public_subnet_02_IP" {

    description = "CIDR range for the public subnet"
    default = "10.0.1.0/24"
  
}


