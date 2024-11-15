resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key-${var.environment}"
  public_key = var.ssh_public_key
}