variable "ami_id" {
    type = string
     #default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
     type = string
     default = "t3.micro"
}

variable "ec2_tags" {
    type = map
    default = {
        Name = "terraform"
        terraform = "true"
        environment = "dev"
        project = "joindevopsd"
    }
}

variable "sg_name" {
    type = string
    default = "allow-"
}

variable "cidir" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "ingress_from_port"{
    default = 0
}

variable "ingress_to_port"{
    default = 0
}

variable "egress_from_port"{
    default = 0
}

variable "egress_to_port"{
    default = 0
}

variable "protocol" {
    type = string
    default = "-1"
}