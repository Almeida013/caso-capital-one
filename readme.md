Em 2019, um dos maiores bancos digitais dos EUA, a Capital One, sofreu um vazamento massivo de dados por causa de uma falha básica: um bucket S3 mal configurado e uma porta aberta na nuvem.
Essa brecha custou centenas de milhões de dólares em prejuízo, multas e reputação.

A pergunta que fica é:
como ninguém viu isso antes de ir pro ar?

Foi aí que surgiu a ideia de criar o InfraSafe Validator — um projeto de simulação + automação que mostra na prática como detectar esse tipo de falha antes que vire notícia.

🎯 Objetivo
Esse projeto simula um cenário real de erro de infraestrutura insegura em cloud e, em cima disso, constrói um pipeline DevSecOps que:

Detecta falhas automaticamente no momento do push

Bloqueia deploys inseguros

Ensina a mentalidade de segurança desde o código

Mostra como aplicar ferramentas reais como tfsec, checkov e validação com Python

⚙️ O que esse projeto cobre
Um main.tf com um bucket S3 configurado como público (public-read)

Um security_group.tf com a porta SSH (22) aberta pro mundo (0.0.0.0/0)

Um CI/CD no GitHub Actions que roda:

✅ tfsec

✅ checkov

Um script em Python (scanner_infra.py) que escaneia localmente seus .tf e acusa padrões perigosos

🧪 Como testar
Clone o repositório:

bash
Copiar
Editar
git clone https://github.com/seuusuario/infrasafe-validator.git
cd infrasafe-validator
Rode o scanner Python local:

bash
Copiar
Editar
python scanner_infra.py
Faça um push pro GitHub
→ Vá na aba Actions
→ Você verá a pipeline falhar com mensagens como:

pgsql
Copiar
Editar
❌ aws_s3_bucket.inseguro: Bucket ACL should not allow public access
❌ security_group.inseguro: ingress rule allows unrestricted SSH access
🧠 Por que isso importa?
Segurança em nuvem não é só firewall e antivírus.
Ela começa no código da infra.
Todo commit pode ser um risco se não for verificado com cuidado.

Esse projeto mostra como construir um escudo automatizado que age assim que alguém faz um push.
É um DevSecOps raiz: simples, eficaz e direto ao ponto.

🔍 Tecnologias usadas
🛠️ Terraform (IaC)

🚨 tfsec (auditoria de segurança no código)

🛡️ Checkov (validação de políticas e boas práticas)

🧪 Python (scanner customizado)

⚙️ GitHub Actions (pipeline CI/CD)

🤖 E se fosse produção?
Se esse código fosse aplicado numa conta real da AWS, o bucket estaria acessível pra qualquer um com um navegador.
A porta SSH estaria aberta pra ataques automatizados.
O risco seria real.
Mas com o InfraSafe Validator, isso nem chegaria a ser aplicado.