provider "aws" {
region = "ap-south-1"
  default_tags {
    tags = {
      Environment  = "Test"
      Project_Name = "poc"
    }
  }
}
