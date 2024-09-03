mock_provider "btp" {}

override_module {
  target = module.build_code
}

variables {
  globalaccount = "test"
}

run "validate_project_subaccount_domain" {
  command = apply

  variables {
    build_code_admins        = ["test.tester@test.com"]
    build_code_developers    = ["test.tester@test.com"]
    stage                    = "DEV"
    subaccount_domain_prefix = "My-test_preFix"
  }

  assert {
    condition     = can(regex("^[^A-Z]*$", local.subaccount_domain))
    error_message = "Invlaid format of subaccount subdomain."
  }

  assert {
    condition     = can(regex("^${lower(var.stage)}-", local.subaccount_domain))
    error_message = "Local variable subaccount_domain does start with the stage."
  }

}
