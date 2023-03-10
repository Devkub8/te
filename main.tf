provider "aws" {
  access_key = "AKIATGFR2GGEFP55AFV2"
  secret_key = "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"
  region     = "us-east-1"
}
 
 resource "aws_instance" "mynew" {
  ami           = "ami-005f9685cb30f234b"
  instance_type = "t2.micro"

    tags = {
    Name = "HelloWorld"
  }
}