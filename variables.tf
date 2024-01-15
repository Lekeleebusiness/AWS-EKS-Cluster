variable "region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "lekelee"
}

variable "environment" {
  default = "development"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_az1_cidr" {
  default = "10.0.1.0/24"
}

variable "public_subnet_az2_cidr" {
  default = "10.0.2.0/24"
}

variable "private_app_subnet_az1_cidr" {
  default = "10.0.11.0/24"
}

variable "private_app_subnet_az2_cidr" {
  default = "10.0.12.0/24"
}

variable "private_data_subnet_az1_cidr" {
  default = "10.0.20.0/24"
}

variable "private_data_subnet_az2_cidr" {
  default = "10.0.21.0/24"
}

variable "bastion_key_name" {
  default = "bastion-key"
}