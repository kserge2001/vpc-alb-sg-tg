resource "aws_instance" "server1" {
  availability_zone = "us-east-1a"
  ami = "ami-045269a1f5c90a6a0"
  #associate_public_ip_address = false
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.ws.id ]
  user_data = file("code.sh")
  subnet_id = aws_subnet.priv1.id
  tags = {
    Name = "Webserver-1"
  }
depends_on = [ aws_nat_gateway.nat1 ]
}
resource "aws_instance" "server2" {
  availability_zone = "us-east-1b"
  ami = "ami-045269a1f5c90a6a0"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.ws.id ]
  user_data = file("code.sh")
  subnet_id = aws_subnet.priv2.id
  tags = {
    Name = "Webserver-2"
  }
  depends_on = [ aws_nat_gateway.nat1 ]
}