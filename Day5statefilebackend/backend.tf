terraform {
  backend "s3" {
    bucket = "rk233072025"
    key    = "terraform.tfstae"
    region = "us-east-1"
  }
}
