variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
    default = "eu-west-2"
}

variable availability_zone {}
variable address_space_vpc {}
variable address_space_management {}

variable public_key_file_candidate {}
variable public_key_file_management {}
variable private_key_file_management {}

variable "attacker_ip" {
    default = ["0.0.0.0/0"]
}

variable "managment_server_network_id" {}
variable "management_server_private_ip" {
    default = "10.1.254.10"
}

variable "systems" {
    type = list(object({
        module=string,
        size=string,
        network_id=string,
        private_ip=string,
        class=string,
        id=string,
        features=list(string),
        attributes=list(object({
            name=string,
            value=list(object({
                name=string,
                value=string
            }))
        }))
    }))
    default = [{
        module      = "microsoft_windows_server_2016"
        size        = "t2.small"
        network_id  = "001"
        private_ip  = null
        class       = "DC"
        id          = "001"
        features    = []
        attributes  = []
    }]
}

variable "networks"{
  type = list(object({network_id=string, network_tier=string,network_name=string,address_space=string,public_ip=bool}))
  default = [{
        network_id    = "000"
        network_tier  = "T0"
        network_name  = "T0_Net"
        address_space = "10.1.1.0/24"
        public_ip     = false
    }]
}