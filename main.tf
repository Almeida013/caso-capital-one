# Define qual provedor vamos usar (AWS) e a região
# as chaves são fictícias só pra simular. NÃO USAR EM PRODUÇÃO.
provider "aws" {
  region     = "us-east-1"         # Região padrão, você pode mudar depois
  access_key = "FAKE"              # Chave falsa, só pra rodar localmente
  secret_key = "FAKE"              # Idem
}

# Esse recurso cria um bucket S3 (baldinho de arquivos na AWS)
# ACL 'public-read' deixa TODO MUNDO na internet acessar. Isso é perigoso!
resource "aws_s3_bucket" "inseguro" {
  bucket = "infrasafe-validator-teste"  # Nome único do bucket
  acl    = "private"                # AQUI TÁ O ERRO que o tfsec vai pegar
}

resource "aws_s3_bucket_public_access_block" "bloqueio_publico" {
  bucket = aws_s3_bucket.inseguro.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
