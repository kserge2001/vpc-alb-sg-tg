provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "user1" {
  name = "terraform-user"
}