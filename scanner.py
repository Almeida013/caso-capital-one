import os
import re

# Padrões perigosos pra buscar
PADROES_SENSIVEIS = {
    "0.0.0.0/0": "⚠️ Porta aberta para o mundo (acesso irrestrito)",
    "public-read": "⚠️ Bucket S3 público (ACL: public-read)",
    "aws_access_key": "🔑 Chave de acesso AWS encontrada",
    "aws_secret_key": "🔑 Chave secreta AWS encontrada",
}

def escanear_arquivo(path):
    try:
        with open(path, "r", encoding="utf-8") as f:
            conteudo = f.read()
            for padrao, descricao in PADROES_SENSIVEIS.items():
                if re.search(re.escape(padrao), conteudo, re.IGNORECASE):
                    print(f"🚨 {descricao} → {path}")
    except Exception as e:
        print(f"Erro ao ler {path}: {e}")

def escanear_pasta(diretorio):
    print(f"🔍 Escaneando '{diretorio}' por configurações perigosas...\n")
    for root, _, files in os.walk(diretorio):
        for file in files:
            if file.endswith(".tf"):
                caminho_completo = os.path.join(root, file)
                escanear_arquivo(caminho_completo)

if __name__ == "__main__":
    escanear_pasta(".")
