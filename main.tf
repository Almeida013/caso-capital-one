# Define qual provedor vamos usar (AWS) e a região
# As chaves são fictícias só pra simular. NÃO USAR EM PRODUÇÃO.
provider "aws" {
  region     = "us-east-1"
  access_key = "FAKE"
  secret_key = "FAKE"
}

# Simulação de falha: bucket com acesso público habilitado
resource "aws_s3_bucket" "inseguro" {
  bucket = "infrasafe-validator-teste"
  acl    = "public-read"  # 💥 ACL insegura: permite leitura pública
}

# ❌ Não colocamos aws_s3_bucket_public_access_block aqui de propósito
# para simular a falha da Capital One (falta de proteção de acesso público)
