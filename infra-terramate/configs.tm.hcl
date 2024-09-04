globals "terraform" "providers" "btp" {
  version     = "~> 1.5.0"
  version_dev = "~> 1.6.0"
}

globals "terraform" "modules" "btp_buildcode_module" {
  source = "../../modules/build_code/"
}
