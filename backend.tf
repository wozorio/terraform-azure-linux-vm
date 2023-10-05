terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "wozorio"

    workspaces {
      name = "playground"
    }
  }
}
