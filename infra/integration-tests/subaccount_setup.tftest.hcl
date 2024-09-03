run "test_successful_subaccount_creation" {
  command = apply

  variables {
    build_code_admins     = ["test.tester@test.com"]
    build_code_developers = ["test.tester@test.com"]
  }

  assert {
    condition     = resource.btp_subaccount.sa_build.state == "OK"
    error_message = "The subaccount was not created in the expected state."
  }

  assert {
    condition     =  length(module.build_code.url_sap_biz_app_studio) > 0
    error_message = "The URL of SAP Business Application Studio is empty."
  }

  assert {
    condition     =  length(module.build_code.url_sap_build_code) > 0
    error_message = "The URL of SAP Build Code is empty."
  }
}
