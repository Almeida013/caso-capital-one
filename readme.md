<h1 align="center">🛡️ Uma  pipeline</h1>
<h3 align="center">O projeto que teria evitado o vazamento da Capital One</h3>

<p align="center">
  <strong>IaC + CI/CD + Segurança contínua</strong><br/>
  Um case real de falha transformado em aprendizado prático de DevSecOps.
</p>

---

## 🚨 O caso real: Capital One

Em 2019, a Capital One — um dos maiores bancos dos EUA — sofreu um dos maiores vazamentos de dados da década.  
Mais de **100 milhões de dados** foram expostos por causa de:

- Um **bucket S3** mal configurado (acesso público indevido)
- Uma **porta SSH** aberta pra qualquer IP (0.0.0.0/0)
- Falta de políticas de **validação contínua de segurança**

Ou seja: a infraestrutura estava moderna, mas **não validada**. E isso custou caro.

---

## 💡 O que este projeto faz?

Este repositório simula exatamente esse tipo de cenário inseguro, **mas com um diferencial**:

> ⚙️ Um pipeline automatizado que detecta e bloqueia essas falhas **antes mesmo do deploy** acontecer.

### Tecnologias usadas:

- 🧱 **Terraform** – IaC (Infrastructure as Code)
- 🤖 **GitHub Actions** – CI/CD automatizado
- 🔎 **tfsec** – scanner de segurança focado em Terraform
- 🔐 **Checkov** – ferramenta de compliance e validação de políticas

---

## 📁 Estrutura do projeto


📦 caso-capital-one

├── main.tf                 # Bucket S3 com ACL insegura

├── security_group.tf       # Porta 22 aberta pra todo mundo

├── .github/

│   └── workflows/

│       └── validate.yml    # CI com tfsec + checkov

├── teste.py                # Script auxiliar


---

## ✅ O que é validado automaticamente?

| Validação                              | Status      |
|----------------------------------------|-------------|
| Bucket S3 com `public-read`            | 🚫 Bloqueia |
| Falta de criptografia no bucket        | 🚫 Bloqueia |
| Porta 22 aberta (`0.0.0.0/0`)          | 🚫 Bloqueia |
| Falta de bloqueio de acesso público    | 🚫 Bloqueia |
| Sem versionamento ou logging           | 🚫 Bloqueia |
| Falta de descrição nas regras de SG    | 🚫 Bloqueia |


## 📚 O que aprendi com esse projeto?
O quão perigosas são permissões mal configuradas

Como CI/CD pode funcionar como escudo preventivo

Como ferramentas como tfsec e checkov são poderosas na prática

Como pensar como DevSecOps desde o primeiro .tf

Que segurança deve ser pensada no commit, não no incidente

## 🙋‍♂️ Sobre mim

Sou o Kaike Almeida, em transição de carreira pro mundo Cloud e DevSecOps.
Esse projeto é parte do meu aprendizado prático: em vez de só estudar teoria, eu simulo falhas reais que já causaram grandes vazamentos — como o da Capital One — e aplico na prática ferramentas que poderiam ter evitado tudo.
A ideia é aprender com casos reais, criar um portfólio sólido e compartilhar soluções simples que fazem diferença na segurança.
Mais projetos virão.


