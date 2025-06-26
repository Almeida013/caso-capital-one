# security_group.tf

resource "aws_security_group" "inseguro" {
  name        = "sg_inseguro"
  description = "Regra insegura que permite tudo de qualquer lugar"
  vpc_id      = "vpc-123456"  # Pode ser fictício, o Terraform nem vai aplicar

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # ISSO É O ERRO — porta SSH aberta pra todo mundo
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Sai pra qualquer lugar também
  }
}
