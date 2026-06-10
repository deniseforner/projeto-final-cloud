# Projeto Final – Cloud Computing

## Visão Geral

Este projeto implementa uma arquitetura de microsserviços na AWS, com todo o ciclo de vida automatizado: infraestrutura como código (Terraform), CI/CD (GitHub Actions), containerização (Docker), configuração (Ansible) e comunicação assíncrona (SQS).

## Tecnologias Utilizadas

- **AWS**: VPC, EC2, RDS (PostgreSQL), SQS, S3, DynamoDB
- **Terraform**: gestão da infraestrutura (remote state, módulos)
- **GitHub Actions**: CI/CD (testes, build de imagens, deploy)
- **Docker**: empacotamento dos microsserviços
- **Ansible**: configuração do Docker na EC2
- **Java 21 + Spring Boot**: microsserviços (user, product, order, gateway)

## Arquitetura

- VPC com subnets públicas e privadas
- EC2 (subnet pública) + RDS (subnets privadas)
- Microsserviços em containers Docker
- SQS para comunicação assíncrona (producer: product-service, consumer: order-service)
- CI/CD com aprovação manual para o ambiente `production`

## Como começar

### Pré-requisitos

- Git, Terraform, AWS CLI, Docker, JDK 21

### Configuração

1. Clonar o repositório
2. Configurar perfil AWS (`projeto`)
3. Adicionar os segredos no GitHub (ver `docs/setup.md`)
4. Executar Terraform para criar a infraestrutura

### Documentação adicional

- [`docs/setup.md`](docs/setup.md) – configuração do ambiente
- [`docs/deployment.md`](docs/deployment.md) – como funciona o CI/CD
- [`docs/architecture.md`](docs/architecture.md) – detalhes da arquitetura
