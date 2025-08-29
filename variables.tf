variable "aws_region" {
    default= "ap-south-1"
}

variable "instance_type"{
    default= "t2.micro"
}

variable "key_name" {
    description= "devops-key"
}

variable "ami_id" {
    default= "ami-0f58b397bc5c1f2e8"
}