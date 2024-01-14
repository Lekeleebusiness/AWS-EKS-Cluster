terraform {
  backend "s3" {
    bucket = "testing-remote-backend"
    key    = "newfile.tfstate"
    region = "us-east-1"
    #For state locking
    dynamodb_table = "testing-state-lock"
  }
}