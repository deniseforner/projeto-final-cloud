terraform {
  backend "s3" {
    bucket         = "projeto-tf-state-253170388828"
    key            = "projeto-final-cloud/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "projeto-tf-locks"
    encrypt        = true
  }
}