provider "aws" {
  region = "us-east-1"
}

module "keypair" {
  source = "../modules/keypair"
  pem_file_name = "qakeytest.pem"
  the_key_name = "qakeytest"
 // pem_file_permission = 600
}
