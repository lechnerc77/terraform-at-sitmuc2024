globals "terraform" "providers" "btp" {
  version     = "~> 1.7.0"
  version_dev = "~> 1.7.0"
}

globals "terraform" "modules" "btp_buildcode_module" {
  source = "../../../modules/build_code/"
}
