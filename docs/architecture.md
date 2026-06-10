\# Arquitetura do Projeto



\## O que foi feito

Este projeto implementa uma arquitetura de microsserviços na AWS, com automação total usando Terraform, GitHub Actions e Ansible.



\## Tecnologias usadas

\- \*\*AWS\*\*: VPC, EC2, RDS (PostgreSQL), SQS, S3 (estado do Terraform), DynamoDB (locking)

\- \*\*Terraform\*\*: para criar toda a infraestrutura (rede, servidores, base de dados)

\- \*\*Docker\*\*: para empacotar os serviços

\- \*\*GitHub Actions\*\*: para CI/CD (testes, build de imagens, deploy)

\- \*\*Ansible\*\*: para instalar o Docker na EC2

\- \*\*Microsserviços\*\*: user-service, product-service, order-service, api-gateway



\## Como a rede está organizada

\- Uma VPC com uma subnet pública (para a EC2) e duas subnets privadas (para a RDS)

\- Internet Gateway para a EC2 ter acesso à internet

\- A base de dados RDS fica em subnets privadas (mais segura)



\## Como funciona o CI/CD

\- Quando alguém faz push ou abre um PR, o GitHub Actions corre testes e validações

\- Quando é feito merge na branch `main`, o workflow `Build \& Push Image` constrói as imagens Docker e envia para o Docker Hub

\- O workflow `Terraform` cria ou atualiza a infraestrutura na AWS

\- O workflow `Deploy to Production` pede aprovação manual antes de executar



\## Porquê algumas escolhas

\- \*\*Estado remoto do Terraform\*\* (S3 + DynamoDB) para não perder o estado e evitar conflitos

\- \*\*OIDC\*\* em vez de guardar chaves AWS nos segredos do GitHub (mais seguro)

\- \*\*Ansible\*\* para automatizar a instalação do Docker na EC2



\## Limitações

\- A instância EC2 `t3.micro` (1 GB RAM) é demasiado pequena para correr todos os serviços em simultâneo. Para funcionar corretamente, seria necessário uma instância com mais memória, ou distribuir os serviços por várias instâncias.

