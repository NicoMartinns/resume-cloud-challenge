# ☁️ Cloud Resume Challenge - Portfólio de Nicolas Martins

Este repositório contém meu portfólio pessoal desenvolvido como parte do [**The Cloud Resume Challenge**](https://cloudresumechallenge.dev/), uma iniciativa voltada para profissionais de Cloud que desejam demonstrar habilidades técnicas em um projeto do mundo real.

> Todo o meu portfólio está estruturado como um projeto completo de infraestrutura em nuvem e CI/CD, aplicando conceitos de DevOps, IaC e boas práticas de versionamento.

---

## Desafios do Projeto

O desafio proposto consiste em completar uma série de etapas práticas que envolvem:

- ✅ Criação de um site estático para portfólio pessoal  
- ✅ Armazenamento do site em um bucket S3 com versionamento  
- ✅ Configuração de domínio customizado com HTTPS via Route 53 e ACM  
- ✅ Distribuição via CloudFront  
- ✅ Infraestrutura como código com Terraform  
- ✅ Versionamento com Git e GitHub  
- ✅ Pipeline de CI/CD com GitHub Actions  
- ✅ Uso de backend remoto no Terraform (S3)  
- ⏳ Integração com Lambda/API Gateway + contador de visitas (em progresso)  

---

## Tecnologias e Ferramentas

| Categoria           | Ferramentas Utilizadas                              |
|---------------------|-----------------------------------------------------|
| Infraestrutura      | AWS S3, CloudFront, Route 53, ACM, IAM              |
| IaC                 | Terraform                                           |
| CI/CD               | GitHub Actions                                      |
| Frontend            | HTML, CSS, JavaScript (estático)                    |
| Versionamento       | Git + GitHub                                        |
| Autenticação AWS    | AWS SSO + Perfis CLI                                |
| Backend (em breve)  | AWS Lambda + API Gateway + DynamoDB                 |

---

## Estrutura do Projeto
```shell
    $ tree
.
├── README.md
├── site
│   ├── img
│   ├── index.html
│   └── styles.css
└── terraform
    ├── main.tf
    ├── modules
    │   ├── acm
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   ├── terraform.tfvars
    │   │   └── variable.tf
    │   ├── cloudfront
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   ├── terraform.tfvars
    │   │   └── variable.tf
    │   ├── route53
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   ├── terraform.tfvars
    │   │   └── variables.tf
    │   └── s3
    │       ├── main.tf
    │       ├── output.tf
    │       ├── terraform.tfvars
    │       └── variable.tf
    ├── terraform.tfvars
    └── variable.tf               
```  
          
