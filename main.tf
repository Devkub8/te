provider "aws" {
  access_key = "AKIATGFR2GGEHFECVU5U"
  secret_key = "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"
  region     = "ap-south-1"
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


# resource "aws_instance" "myec2" {
  # ami           = "ami-0f8ca728008ff5af4"
  # instance_type = "t2.micro"
  # subnet_id     = aws_subnet.mysub.id
  # // key_name = data.aws_key_pair.mykey.key_name
  # associate_public_ip_address= true 
  #  key_name = "mykey"
   
  # tags= {
  #   Name="honey"
  # }
# }
 
resource "aws_instance" "wen" {
    ami = "ami-0d81306eddc614a45"
    instance_type = "t2.micro"
    tags = {
      name = "myinstance"
    }
  
}
 