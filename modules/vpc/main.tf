# create vpc
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# create the internet gateway and attach to the vpc
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

#using data source to fetch the availability zones within our region (us-west-1)
data "aws_availability_zones" "available_zones" {}

#creating public subnet pub_sub_1a
resource "aws_subnet" "pub_sub_1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pub_sub_1a_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "pub_sub_1a"
  }
}

#creating public subnet pub_sub_2b
resource "aws_subnet" "pub_sub_2b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pub_sub_2b_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "pub_sub_2b"
  }
}

#creating the route table and adding public route
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "public-routetable"
  }
}

#associating public subnet pub_sub_1a with the public routetable
resource "aws_route_table_association" "pub_sub_1a_route_table_association" {
  subnet_id      = aws_subnet.pub_sub_1a.id
  route_table_id = aws_route_table.public_route_table.id
}

#associating public subnet pub_sub_2b with the public routetable
resource "aws_route_table_association" "pub_sub_2b_route_table_association" {
  subnet_id      = aws_subnet.pub_sub_2b.id
  route_table_id = aws_route_table.public_route_table.id  
}

#creating the private subnet pri_sub_3a
resource "aws_subnet" "pri_sub_3a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pri_sub_3a_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "pri_sub_3a"
  }
}

#creating the private subnet pri_sub_4b
resource "aws_subnet" "pri_sub_4b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pri_sub_4b_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "pri_sub_4b"
  }
}

#creating the private subnet pri_sub_5a
resource "aws_subnet" "pri_sub_5a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pri_sub_5a_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "pri_sub_5a"
  }
}

#creating the private subnet pri_sub_6b
resource "aws_subnet" "pri_sub_6b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pri_sub_6b_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "pri_sub_6b"
  }
}
