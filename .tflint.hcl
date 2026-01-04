config {
  module = true
  force = false
}

# Staff Move: Enforce Azure best practices
plugin "azurerm" {
    enabled = true
    version = "0.25.0"
    source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

# Ensure all resources have tags (critical for FinOps/Cost tracking)
rule "terraform_module_pinned_source" {
  enabled = true
}
