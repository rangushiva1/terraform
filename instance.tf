resource "aws_instance" "web" {
  ami                         = "ami-09e67e426f25ce0d7" #Ubuntu 20.04 LTS Free Tier Image
  instance_type               = "t2.micro"
  key_name                    = "shiva_demo"
  subnet_id                   = aws_subnet.publicsubnet01block.id
  vpc_security_group_ids      = [aws_security_group.allow_http_ssh.id]
  user_data                   = file("jenkins-install.sh")
  availability_zone           = "us-east-1a"
  associate_public_ip_address = true

  tags = {
    "Name" = "jenkins-terraform"
  }
}
