provider "aws" {
  alias  = "account1"
  region = "us-east-1"
  # Assuming you have set up an AWS profile for Account 1
  profile = "account1-profile"
}

provider "aws" {
  alias  = "account2"
  region = "us-east-1"
  # Assuming you have set up an AWS profile for Account 2
  profile = "account2-profile"
}
