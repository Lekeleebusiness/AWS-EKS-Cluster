terraform {
  backend "s3" {
    bucket = "testing-remote-backend"
    key    = "testing.tfstate"
    region = "us-east-1"
    #For state locking
    dynamodb_table = "testing-state-lock"
  }
}