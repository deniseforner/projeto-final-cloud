\# Setup do Ambiente



Este guia explica como preparar o ambiente para executar o projeto.



\## Pré-requisitos



\- \*\*Git\*\* – para clonar o repositório

\- \*\*Terraform\*\* (>= 1.9) – para criar a infraestrutura na AWS

\- \*\*AWS CLI\*\* – para autenticar e executar comandos AWS

\- \*\*Docker\*\* – para correr os containers localmente

\- \*\*JDK 21\*\* – para compilar os microsserviços (se necessário)



\## Clonar o repositório



git clone https://github.com/deniseforner/projeto-final-cloud.git

cd projeto-final-cloud



\## Credenciais AWS

Criar um perfil chamado projeto:

aws configure --profile projeto

(Escolher a região us-east-1.)



\## Segredos no GitHub

No repositório, em Settings → Secrets and variables → Actions, e adiciona-os



\## Criar a infraestrutura na AWS

cd infrastructure/terraform/environments/dev

terraform init

terraform apply -auto-approve

(Quando pedir a password da base de dados, usar Week7Password123!.)



\## Ligar à EC2 (se estiver em execução)

ssh -i projeto-key ec2-user@<IP\_PUBLICO\_EC2>



\## Testar os serviços localmente (sem AWS)

docker-compose up





