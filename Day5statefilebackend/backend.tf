terraform {
  backend "s3" {
    bucket = "rk233072025"
    key    = "terraform.tfstae"
    region = "us-east-1"
    use_lockfile = true
    #dynamodb_table = "Rayees"
    #encrypt = true
  }
}
