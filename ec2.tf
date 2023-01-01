resource "aws_instance" "netcat" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  key_name = aws_key_pair.deployer.key_name
  user_data = <<EOF
  #!/bin/bash
  nc -l 8080

  EOF
  
  network_interface {
    network_interface_id = aws_network_interface.public.id
    device_index         = 0
  }

  tags = {
    Name = "unubntu-dev"
  }

  depends_on = [ aws_security_group.ubuntu-dev-sg ]
}

resource "aws_network_interface" "public" {
  subnet_id   = module.vpc.public_subnets[0]
  security_groups = [
    aws_security_group.ubuntu-dev-sg.id
  ] 
  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_eip" "external-eip" {
  vpc = true

  instance                  = aws_instance.netcat.id
}

