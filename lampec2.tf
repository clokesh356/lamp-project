resource "aws_security_group" "lamp" {
  name        = "lamp"
  description = "Allow  lamp enduser"
  vpc_id      = "vpc-03a5eff0afffbbce9"


  ingress {
    description = "ssh for admin"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
   ingress {
    description = "http for enduser"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name      = "lamp-sg"
    Terraform = "true"
  }
}

resource "aws_instance" "lamp" {
  ami           = "ami-094bbd9e922dc515d"
  instance_type = "c5.2xlarge"
  #   vpc_id =aws_vpc.vpc.id
  subnet_id              = "subnet-0dfd31840b6df123e"
  vpc_security_group_ids = [aws_security_group.lamp.id]
  key_name               = aws_key_pair.lamp.id
 
  tags = {
    Name = "Lamp"
  }
}

