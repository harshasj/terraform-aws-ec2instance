provider "aws" {
  default_tags {
    tags = {
      Environment  = "Test"
      Project_Name = "poc"
    }
  }
}
