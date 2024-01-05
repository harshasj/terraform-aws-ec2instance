terraform {
  cloud {
    organization = "infra_demo"
    ## Required for Terraform Enterprise; Defaults to app.terraform.io for Terraform Cloud
    hostname = "app.terraform.io"

    workspaces {
      name = "ec2instance"
    }
  }
}
