# generate keypair
resource "tls_private_key" "tls" {
  algorithm = var.key_algorithm
  rsa_bits  = var.rsa_bits_size
}
resource "aws_key_pair" "key" {
  key_name   = var.the_key_name
  public_key = tls_private_key.tls.public_key_openssh
}
resource "local_file" "key1" {
  filename        = var.pem_file_name
  content         = tls_private_key.tls.private_key_pem
  file_permission = var.pem_file_permission
}