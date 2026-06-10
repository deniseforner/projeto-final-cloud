# main.tf - Configuração principal do Terraform

# Configure AWS Provider
provider "aws" {
  region  = var.aws_region
  profile = "cli-user"

  default_tags {
    tags = {
      Project   = "CloudComputing"
      Week      = "7"
      ManagedBy = "Terraform"
    }
  }
}