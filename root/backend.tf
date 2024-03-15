terraform {
  backend "s3" {
    bucket = "s3-fortfstate-makcloudmigration"
    key = "backend/tfstatefileformakcloudmigration.tfstate"
    region = "us-west-1"
    dynamodb_table = "remote-backend"  
  }
}