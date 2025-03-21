output "url_sap_build_code" {
  value       = btp_subaccount_subscription.build_code.subscription_url
  description = "URL of the SAP Build Code subscription"
}

output "url_sap_biz_app_studio" {
  value       = btp_subaccount_subscription.biz_app_studio.subscription_url
  description = "URL of the SAP Business Application Studio subscription"
}
