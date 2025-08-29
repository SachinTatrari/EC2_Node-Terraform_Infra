output "instance_public_ip" {
    value = aws_instance.node_app.public_ip
}

output "app_url"{
    value = "http://${aws_instance.node_app.public_ip}:3000"
}