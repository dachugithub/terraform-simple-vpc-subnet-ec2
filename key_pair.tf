resource "aws_key_pair" "deployer" {
  key_name   = "tomasz-ubuntu-dev-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEWAzs5UsPw09qnvn5DVnEGY0mehTLQgS96RaFdX1yQ+ dachu111@wp.pl"
}
