resource "aws_instance" "test-instance" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id     = aws_subnet.public_us_east_1a.id
    vpc_security_group_ids = [aws_security_group.sg-instance.id]

    count = 3

    tags = {
        Name = "Test server ${count.index + 1}: ${timestamp()}"
    }

    user_data   = <<-EOF
              #!/bin/bash
              echo "Server ${count.index + 1}" > index.html
              python3 -m http.server 8080 &
              EOF
  
}