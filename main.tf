data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

data "aws_vpc" "default" {

default = true

}
resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t3.nano"

  tags = {
    Name = "HelloWorld"
    Created_by = "Jalees"
  }
}

resource "aws_instance" "app" {
  ami = data.aws_ami.app_ami.id
  instance_type = "t2.nano"
  
  tags = {
    Name = "Hello World App"
  }
}


resource "net_sg" "sg1" {
  source                   = "terraform-aws-modules/security-group/aws"
  version                  = "5.1.2"
  name                     = "blog_new"
  vpc                      = data.aws_vpc.default.id
  ingress_rules            = ["https-443-tcp"]
}