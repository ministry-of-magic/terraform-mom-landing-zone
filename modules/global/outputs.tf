locals {
  github = {
    organization = "ministry-of-magic"
  }
  terraform = {
    organization   = "ministry-of-magic"
    oauth_token_id = "ot-5q4YcnqqChBvJEcg"
  }
}

output "github" {
  value = local.github
}

output "terraform" {
  value = local.terraform
}
