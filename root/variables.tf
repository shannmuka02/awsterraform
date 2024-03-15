variable "project_name" {
    description = "MAK-Technologies Cloud Migration Project"
    type = string
}
variable "region" {
  type = string
}
variable "vpc_cidr" {
    type = string
}
variable "pub_sub_1a_cidr" {
    type = string
}
variable "pub_sub_2b_cidr" {
    type = string
}
variable "pri_sub_3a_cidr" {
    type = string
}
variable "pri_sub_4b_cidr" {
    type = string
}
variable "pri_sub_5a_cidr" {
    type = string
}
variable "pri_sub_6b_cidr" {
    type = string
}
variable "db_username" {
    type = string
}
variable "db_password" {
    type = string
}
variable "certificate_domain_name" {
    type = string
}
variable "additional_domain_name" {
    type = string
}

#nat variables
variable "pub_sub_1a_id" {
  
}
variable "igw_id" {
  
}
variable "pub_sub_2b_id" {
  
}
variable "vpc_id" {
  
}
variable "pri_sub_3a_id" {
  
}
variable "pri_sub_4b_id" {
  
}
variable "pri_sub_5a_id" {
  
}
variable "pri_sub_6b_id" {
  
}






