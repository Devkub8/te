provider "aws" {
  access_key = "AKIATGFR2GGED7XD4MV6"
  secret_key = "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"
  region     = "us-east-1"
}
 
 resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "myvpc"
  }
}

resource "aws_subnet" "mysub" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
}

 resource "aws_instance" "mynew" {
  ami           = "ami-005f9685cb30f234b"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.mysub.id 
    key_name = "TF_key"
    tags = {
    Name = "HelloWorld"
  }
}

resource "aws_key_pair" "TF_key" {
  key_name   = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "TF-key" {
    content  = tls_private_key.rsa.private_key_pem
    filename = "tfkey"
}
