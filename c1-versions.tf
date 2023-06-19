# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "eks-proyecto"
    key    = "dev/eks-cluster" #key    = "dev/eks-cluster/terraform.tfstate" 
    region = "us-east-1" 
 
   # For State Locking
    dynamodb_table = "terraform-state"    
  } 
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
} 
