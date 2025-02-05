/*
count = 2
depends_on = 
for_each
lifecycle 
*/

/*
resource "aws_instance" "s1" {
  count = 1
  ami = "ami-045269a1f5c90a6a0"
  instance_type = "t2.micro"

  tags = {
    Name = "dev-server${count.index +1}"
  }
}
resource "aws_iam_user" "us1" {
  name = "cloudadmin"
  depends_on = [ aws_instance.s1] // list
}


output "ip" {
  value = aws_instance.s1[*].public_ip
}
*/
/*
resource "aws_instance" "s2" {
  for_each = toset(var.typeofinstance) 
  ami = "ami-045269a1f5c90a6a0"
  instance_type = each.key
}

variable "typeofinstance" {
 type =list(string)
 default = ["t2.micro", "t3.small"]
}

variable "info" {
    type = map(object({
        ami = string
        instance = string
    }))
    default = {  
    dev ={ami: "ami-045269a1f5c90a6a0", instance: "t2.micro"}
    qa = {ami: "ami-045269a1f5c90a6ahjghdfc", instance: "t2.micro"}
}
}

resource "aws_instance" "s2" {
  for_each = var.info 
  ami = each.value.ami
  instance_type = each.value.instance

  tags = {
    Name = each.key
  }
}

provider "aws" {
    region = var.region
  
}
variable "region" {
  description = "value of region"
  type = string
  sensitive = true
  //default = "us-east-1"
}

provider "aws" {
    region = "us-east-1"
    alias = "us1" 
}
provider "aws" {
    region = "us-west-1"
    alias = "usw1"  
}

resource "aws_instance" "server1" {
    provider = aws.us1
    ami = "ami-045269a1f5c90a6a0"
    instance_type = "t2.micro"
}
*/ 

provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "name" {
  ami = "ami-0c614dee691cbbf37"
  instance_type = "t2.micro"
  lifecycle {
  //  create_before_destroy = true
      prevent_destroy = false
  }
}


 
