variable "key_algorithm" {
  description = "This is the key algorithm"
  default = "RSA"
}
variable "rsa_bits_size" {
  default = 2048
}
variable "the_key_name" {

}
variable "pem_file_name" {
  
}
variable "pem_file_permission" {
  default = 400
}

/*
the qa team is creating an app called utc go in the qa environment 
create a utc.tf file and called to jeypair module for the qa key creation
it should be called qakeytest and qakeytest.pem
*/