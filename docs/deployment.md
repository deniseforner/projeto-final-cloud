\# Deployment



\## Como é feito o deploy



O deploy é automatizado pelo GitHub Actions. Sempre que há um push na branch `main`, os seguintes workflows são executados:



1\. \*\*CI\*\* – compila e testa o código

2\. \*\*Build \& Push Image\*\* – constrói as imagens Docker e envia para o Docker Hub

3\. \*\*Terraform\*\* – aplica a infraestrutura na AWS (VPC, EC2, RDS, etc.)

4\. \*\*Deploy to Production\*\* – pede aprovação manual e depois executa o deploy (neste projeto, apenas simulado)



\## Fluxo detalhado



\### CI (`.github/workflows/ci.yml`)

\- Corre em cada push ou pull request

\- Valida o POM, compila e corre os testes unitários



\### Build \& Push Image (`.github/workflows/image.yml`)

\- Constrói a imagem Docker do `product-service`

\- Envia para o Docker Hub com as tags `latest` e o hash do commit



\### Terraform (`.github/workflows/terraform.yml`)

\- Corre `terraform plan` em pull requests

\- Corre `terraform apply` quando há push na `main` (cria/atualiza a infraestrutura)



\### Deploy to Production (`.github/workflows/deploy-prod.yml`)

\- Requer aprovação manual (ambiente `production` configurado no GitHub)

\- Depois de aprovado, executa os passos de deploy (neste projeto, apenas um exemplo simbólico)



\## Segurança

\- As credenciais AWS são geridas via OIDC (não há chaves guardadas no GitHub)

\- Os segredos (Docker Hub, password da base de dados) estão guardados nos \*\*Actions secrets\*\* do repositório



\## Como verificar o estado



\- Aceder à tab \*\*Actions\*\* do repositório GitHub

\- Clicar em cada workflow para ver os logs detalhados



