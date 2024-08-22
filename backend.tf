terraform {
  backend "s3" {
    bucket = "haseebterraformbackend"
    key = "main"
    region = "eu-west-1"
    dynamodb_table = "haseeb-table"
  }
}
