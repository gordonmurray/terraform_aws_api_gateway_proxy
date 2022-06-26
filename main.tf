terraform {

  required_version = "1.2.3"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "4.20.0"

    }
  }

}

# Configure the AWS Provider
provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "gordonmurray"
}
