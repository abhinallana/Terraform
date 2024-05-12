terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.10.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {

}

resource "aws_instance" "web" {
  ami           = "ami-013e83f579886baeb"
  instance_type = var.instance_types[count.index]
  tags = {
    Name = var.instance_names[count.index]
    
  }
  count = 2
}



variable "message" {
  default = "Hi!! from Terraform. Created an EC2 instance."
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4 =          var.cidr_ipv4
  from_port         = var.sg_list[0]
  ip_protocol       = "tcp"
  to_port           = var.sg_list[2]
  
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}





