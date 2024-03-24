data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "edwiki-dpt6-terraform-state"
    key    = "edwiki/vpc/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "dpt6_table"
  }
}

data "aws_ami" "myami" {
  most_recent      = true
  owners           = ["576341600583"]

  filter {
    name   = "name"
    values = ["edwiki-web-*"]
  }
} 