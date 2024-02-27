terraform {
  required_version = ">=1.7.0" #constrains

  backend "s3" {
    region = "us-east-1"               #where the bucket is
    bucket = "backendvedro"            #bucket name
    key    = "tf-handson2-1-statefile" #how to name state file
    #dynamodb_table = "b11-tf-lesson-two"    #name of the table #comment out to not destroy dynamodb
  }
}