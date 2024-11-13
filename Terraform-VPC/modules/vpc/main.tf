# VPC
resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"

    tags = {
      "Name" = "my_vpc"
    }
}

resource "aws_subnet" "subnets" {
  count = length(var.subnet_cidrs)  # Create subnets based on a list of CIDR blocks

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidrs[count.index]
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true
}

# You could also output the subnet IDs like this
output "subnet_ids" {
  description = "List of subnet IDs"
  value       = aws_subnet.subnets.*.id
}
