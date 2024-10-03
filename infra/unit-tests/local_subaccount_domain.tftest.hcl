mock_provider "btp" {
  mock_resource "btp_subaccount" {
    defaults = {
      id = "3643fadf-b04c-43f2-9345-a1f18cf7d902"
    }
  }
}


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
    error_message = "Invalid format of subaccount subdomain."
  }

  assert {
    condition     = can(regex("^${lower(var.stage)}-", local.subaccount_domain))
    error_message = "Local variable subaccount_domain does start with the stage."
  }

}
