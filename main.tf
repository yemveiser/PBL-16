  
provider "aws" {
  profile  = "terraform" 
  region = var.region

}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block                     = var.cidr_block
  enable_dns_support             = var.enable_dns_support
  enable_dns_hostnames           = var.enable_dns_hostnames
 }

# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}

 # Create public subnet 1
 resource "aws_subnet" "public-yemveiser-1" {
  vpc_id = aws_vpc.main.id
  count = var.number_of_public_subnets == null ? length(data.aws_availability_zones.available.names) : var.number_of_public_subnets
  cidr_block = cidrsubnet(var.cidr_block, 4, count.index)
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names [count.index]

  tags = {
    name = "Public-subnet"
  }

 }
 

