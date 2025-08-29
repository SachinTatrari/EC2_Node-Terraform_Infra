terraform{
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "node_app" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name

    user_data = file("${path.module}/userdata.sh")

    tags = {
        Name = "nodeAppServer"
    }

    vpc_security_group_ids = [aws_security_group.node_sg.id]

}

resource "aws_security_group" "node_sg" {
    name = "node_sg"
    description = "Allow HTTP and SSH"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]   
        
    }
}
