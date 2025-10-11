terraform {
  backend "s3" {
    bucket         = "sara-terraform-state"
    key            = "network/terraform.tfstate"
    region         = "ca-central-1"
    dynamodb_table = "terraform-lock"
  }
}

