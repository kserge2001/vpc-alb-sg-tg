provider "aws" {
  region = "us-east-1"
}

import {
  to = aws_instance.web
  id = "i-0808bb57a6c245842"
}

