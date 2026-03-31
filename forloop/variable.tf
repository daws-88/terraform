variable "instances" {
    default = {
        mongodb ="t3.micro"
        redis = "t3.micro"
        mysql = "t3.micro"
        rabbitmq = "t3.micro"
    }
}

variable "zone_id" {
    default = "Z04408301YE1UN4Q5BR1X" 
}

variable "domain_name" {
    default = "daws88s.fun"
}