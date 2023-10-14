# declare variables
variable "region" {
  default = "eu-west-2"

}

# declare variable cidr_block
variable "cidr_block" {
  default = "172.16.0.0/16"
}


# declare variable enable_dns_support
variable "enable_dns_support" {
  default = true
}

# declare variable enable_dns_hostnames
variable "enable_dns_hostnames" {
  default = true
}

variable "number_of_public_subnets" {
  default = 2
}